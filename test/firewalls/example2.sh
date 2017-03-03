#!/bin/sh

/sbin/modprobe ip_conntrack_ftp

CONNECTION_TRCKING="1"
ACCEPT_AUTH="0"

DHCP_SERVER="1"
IPT="/sbin/iptables"
DMZ_INTERFACE="eth0"
LAN_INTERFACE="eth1"
LOOPBACK_INTERFACE="lo"

DMZ_IPADDR="192.168.1.126"
GATEWAY_IPADDR="192.168.1.65"
DMZ_ADDRESSES="192.168.1.64/26"
DMZ_NETWORK="192.168.1.64"
DMZ_BROADCAST="192.168.1.127"
LAN_IPADDR="192.168.1.129"
LAN_ADDRESSES="192.168.1.128/26"
LAN_NETWORK="192.168.1.128"
LAN_BROADCAST="192.168.1.191"
LAN_NETMASK="255.255.255.192"

NAMESERVER="221.200.216.10"
POP_SERVER="221.200.216.113"					#pop服务的远程地址
MAIL_SERVER="221.200.216.114"					#mail服务的远程地址
NEWS_SERVER="221.200.216.115"					#news服务的远程地址
TIME_SERVER="221.200.216.116"					#time服务的远程地址
DHCP_SERVER="221.200.216.117"					#ISP dhcp服务的地址
SSH_CLIENT="221.200.216.118"
PRINTER_ADDRESS="221.200.216.119"

LOOPBACK="127.0.0.0/8"
CLASS_A="10.0.0.0/8"
CLASS_B="172.16.0.0/12"
CLASS_C="192.168.0.0/16"
CLASS_D_MULTICAST="224.0.0.0/4"
CLASS_E_RESERVED_NET="240.0.0.0/5"
BROADCAST_SRC="0.0.0.0"
BROADCAST_DEST="255.255.255.255"

PRIVPORTS="0:1023"
UNPRIVPORTS="1024:65535"

#######################################################################################

#Enable broadcast echo Protection

echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

#Disable Source Routed Packets

for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
	echo 0 > $f
done

#Enable TCP SYN Cookie Protection

echo 1 > /proc/sys/net/ipv4/tcp_syncookies

#Disable ICMP Redirect Acceptance

for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
	echo 0 > $f
done

#Don't send Redirect Messages
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do
	echo 0 > $f
done

#Drop Spoofed Packets coming in on an interface, which, if replied to,
#would result in the reply

for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
	echo 1 > $f
done

#Log packets with impossible addresses.
for f in /proc/sys/net/ipv4/conf/*/log_martians; do
	echo 1 > $f
done

#######################################################################################

#Remove any existing rules from all chains

$IPT --flush
$IPT -t nat --flush
$IPT -t mangle --flush
$IPT -X
$IPT -t nat -X
$IPT -t mangle -X

$IPT --policy INPUT ACCEPT
$IPT --policy OUTPUT ACCEPT
$IPT --policy FORWARD ACCEPT

$IPT -t nat --policy OUTPUT ACCEPT
$IPT -t nat --policy PREROUTING ACCEPT
$IPT -t nat --policy POSTROUTING ACCEPT
$IPT -t mangle --policy PREROUTING ACCEPT
$IPT -t mangle --policy OUTPUT ACCEPT

if [ "$1" = "stop" ]
then
echo "Firewall completely stopped! WARNING!."
exit 0
fi

#Unlimited traffic on the loopback interface

$IPT -A INPUT -i $LOOPBACK_INTERFACE -j ACCEPT
$IPT -A OUTPUT -o $LOOPBACK_INTERFACE -j ACCEPT

#Set the default policy to drop

$IPT --policy INPUT DROP
$IPT --policy OUTPUT DROP
$IPT --policy FORWARD DROP

#######################################################################################

#Stealch Scans and TCP State Flags

#All of the bits are cleared

$IPT -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
$IPT -A FORWARD -p tcp --tcp-flags ALL NONE -j DROP

#SYN and FIN are both set

$IPT -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
$IPT -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

#FIN and RST are both set

$IPT -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
$IPT -A FORWARD -p tcp --tcp-flags SYN,RST SYN,RST -j DROP

#FIN and RST are both set

$IPT -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
$IPT -A FORWARD -p tcp --tcp-flags FIN,RST FIN,RST -j DROP

#FIN is the only bit set, without the expected accompanying ACK

$IPT -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
$IPT -A FORWARD -p tcp --tcp-flags ACK,FIN FIN -j DROP

#FIN is the only bit set, without the expected accompanying ACK

$IPT -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
$IPT -A FORWARD -p tcp --tcp-flags ACK,PSH PSH -j DROP

#URG is the only bit set, without the expected accompanying ACK

$IPT -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP
$IPT -A FORWARD -p tcp --tcp-flags ACK,URG URG -j DROP

#######################################################################################

#Using Connection State to By-pass Rule Checking

#Using the state module alone, INVALID will break protocols that use
#bidirectional connections or multiple connections or exchanges
#
#

$IPT -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPT -A INPUT -m state --state INVALID -j LOG \
	--log-prefix "INVALID input: "
$IPT -A INPUT -m state --state INVALID -j DROP

$IPT -A OUTPUT -m state --state INVALID -j LOG \
	--log-prefix "INVALID output: "
$IPT -A OUTPUT -m state --state INVALID -j DROP

$IPT -A FORWARD -m state --state INVALID -j LOG \
	--log-prefix "INVALID FORWARD: "
$IPT -A FORWARD -m state --state INVALID -j DROP

#######################################################################################

#Source Address Spoofing and Other Bad Address

#Refuse spoofed packets pretending to be from you

$IPT -A INPUT -s $DMZ_IPADDR -j DROP
$IPT -A INPUT -s $LAN_IPADDR -j DROP

$IPT -A FORWARD -s $DMZ_IPADDR -j DROP
$IPT -A FORWARD -s $LAN_IPADDR -j DROP

$IPT -A INPUT -i $DMZ_INTERFACE \
	-s $LAN_ADDRESSES -j DROP
$IPT -A FORWARD -i $DMZ_INTERFACE \
	-s $LAN_ADDRESSES -j DROP

$IPT -A FORWARD -i $LAN_INTERFACE \
	-s ! $LAN_INTERFACE -j DROP

$IPT -A OUTPUT -o $DMZ_INTERFACE -s ! $DMZ_IPADDR -j DROP
$IPT -A OUTPUT -o $LAN_INTERFACE -s ! $DMZ_IPADDR -j DROP

if [ "DHCP_SERVER" = "1" ]; then
	$IPT -A OUTPUT -o $LAN_INTERFACE -p udp \
		-s $BROADCAST_SRC --sport 67 \
		-d $BROADCAST_DEST --dport 68 -j ACCEPT
fi

$IPT -A OUTPUT -o $LAN_INTERFACE -s ! $LAN_IPADDR -j DROP

#Refuse alformed broadcast packets

$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE \
	-d $BROADCAST_SRC -j DROP

#Don't forward directed broadcasts

$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE \
	-d $DMZ_NETWORK -j DROP
$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE \
	-d $DMZ_BROADCAST -j DROP

#Don't forward limited broadcasts in either direction

$IPT -A FORWARD -d $BROADCAST_DEST -j DROP

$IPT -A INPUT -p ! udp -d $CLASS_D_MULTICAST -j DROP
$IPT -A FORWARD -p ! udp -d $CLASS_D_MULTICAST -j DROP

#######################################################################################

#ICMP Control and Status Messages

#Log and drop initial ICMP fragments

$IPT -A INPUT --fragment -p icmp -j LOG \
	--log-prefix "Fragmented incoming ICMP: "
$IPT -A INPUT --fragment -p icmp -j DROP

$IPT -A OUTPUT --fragment -p icmp -j LOG \
	--log-prefix "Fragmented outgoing ICMP: "
$IPT -A OUTPUT --fragment -p icmp -j DROP

$IPT -A FORWARD --fragment -p icmp -j LOG \
	--log-prefix "Fragmented forwarded ICMP: "
$IPT -A FORWARD --fragment -p icmp -j DROP

$IPT -A INPUT -p icmp \
	--icmp-type source-quench -d $DMZ_IPADDR -j ACCEPT

$IPT -A OUTPUT -p icmp \
	--icmp-type source-quench -j ACCEPT
$IPT -A FORWARD -p icmp \
	--icmp-type source-quench -j ACCEPT

$IPT -A INPUT -p icmp \
	--icmp-type parameter-problem -j ACCEPT
$IPT -A OUTPUT -p icmp \
	--icmp-type parameter-problem -j ACCEPT
$IPT -A FORWARD -p icmp \
	--icmp-type parameter-problem -j ACCEPT

$IPT -A INPUT -p icmp \
	--icmp-type destination-unreachable -j ACCEPT
$IPT -A OUTPUT -o $LAN_INTERFACE -p icmp \
	--icmp-type destination-unreachable -d $LAN_ADDRESSES -j ACCEPT
$IPT -A FORWARD -o $LAN_INTERFACE -p icmp \
	--icmp-type destination-unreachable -d $LAN_ADDRESSES -j ACCEPT

$IPT -A OUTPUT -p icmp \
	--icmp-type fragmentation-needed -j ACCEPT
$IPT -A FORWARD -p icmp \
	--icmp-type fragmentation-needed -j ACCEPT

#Don't log dropped outing ICMP error messages

$IPT -A OUTPUT -p icmp \
	--icmp-type destination-unreachable -j DROP
$IPT -A FORWARD -o $DMZ_INTERFACE -p icmp \
	--icmp-type destination-unreachable -j DROP

#Intermediate traceroute responses

$IPT -A INPUT -p icmp \
	--icmp-type time-exceeded -j ACCEPT

$IPT -A FORWARD -o $LAN_INTERFACE -p icmp \
	--icmp-type time-exceeded -d $LAN_ADDRESSES -j ACCEPT

#allow outgoing pings to anywhere 
if [ "$CONNECTION_TRCKING" = "1" ]; then
	$IPT -A OUTPUT -p icmp \
		--icmp-type echo-request \
		-m state --state NEW -j ACCEPT
	$IPT -A FORWARD -o $DMZ_INTERFACE -p icmp \
		--icmp-type echo-request -s $LAN_ADDRESSES \
		-m state --state NEW -j ACCEPT
fi

#######################################################################################

#DNS Name Server

#DNS LAN clients to pribate sever

$IPT -A INPUT -i $LAN_INTERFACE -p udp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS \
	-d $LAN_IPADDR --dport 53 \
	-m state --state NEW -j ACCEPT

$IPT -A INPUT -i $LAN_INTERFACE -p tcp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS \
	-d $LAN_IPADDR --dport 53 \
	-m state --state NEW -j ACCEPT

$IPT -A INPUT -i $DMZ_INTERFACE -p udp \
	-s $DMZ_ADDRESSES --sport $UNPRIVPORTS \
	-d $DMZ_IPADDR --dport 53 \
	-m state --state NEW -j ACCEPT

#DNS caching & forwarding name server

$IPT -A OUTPUT -o $DMZ_INTERFACE -p udp \
	-s $DMZ_ADDRESSES --sport 53 \
	-d $NAMESERVER --dport 53 \
	-m state --state NEW -j ACCEPT

$IPT -A OUTPUT -o $DMZ_INTERFACE -p udp \
	-s $DMZ_IPADDR --sport $UNPRIVPORTS \
	-d $NAMESERVER --dport 53 \
	-m state --state NEW -j ACCEPT

$IPT -A OUTPUT -o $DMZ_INTERFACE -p tcp \
	-s $DMZ_IPADDR --sport $UNPRIVPORTS \
	-d $NAMESERVER --dport 53 \
	-m state --state NEW -j ACCEPT

#######################################################################################

#Filter the AYTH

$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE -p tcp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS --dport 113 \
	-m state --state NEW -j ACCEPT

$IPT -A FORWARD -i $DMZ_INTERFACE -o $LAN_INTERFACE -p tcp \
	--sport $UNPRIVPORTS -d $LAN_ADDRESSES --dport 113 \
	-m state --state NEW -j ACCEPT

$IPT -A INPUT -i $LAN_INTERFACE -p tcp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS -d $LAN_IPADDR --dport 113 \
	-m state --state NEW -j ACCEPT

$IPT -A INPUT -i $DMZ_INTERFACE -p tcp \
	-s $DMZ_ADDRESSES --sport $UNPRIVPORTS -d $DMZ_IPADDR --dport 113 \
	-m state --state NEW -j ACCEPT

#######################################################################################

#Sending Mail to the Mail Gateway Server 

$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE -p tcp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS \
	-d $MAIL_SERVER --dport 25 \
	-m state --state NEW -j ACCEPT

$IPT -A OUTPUT -o $DMZ_INTERFACE -p tcp \
	-s $DMZ_IPADDR --sport $UNPRIVPORTS \
	-d $MAIL_SERVER --dport 25 \
	-m state --state NEW -j ACCEPT

#######################################################################################

#Retriecing Mail as a POP Client 

$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE -p tcp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS \
	-d $POP_SERVER --dport 110 \
	-m state --state NEW -j ACCEPT

$IPT -A OUTPUT -o $DMZ_INTERFACE -p tcp \
	-s $DMZ_IPADDR --sport $UNPRIVPORTS \
	-d $POP_SERVER --dport 110 \
	-m state --state NEW -j ACCEPT

#######################################################################################

#ACCEPT Usenet News Services 

$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE -p tcp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS \
	-d $NEWS_SERVER --dport 119 \
	-m state --state NEW -j ACCEPT

#######################################################################################

#SSH

$IPT -A OUTPUT -o $DMZ_INTERFACE -p tcp \
	-s $DMZ_IPADDR --sport $UNPRIVPORTS \
	-d $DMZ_ADDRESSES --dport 22 \
	-m state --state NEW -j ACCEPT

$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE -p tcp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS --dport 22 \
	-m state --state NEW -j ACCEPT

$IPT -A FORWARD -i $DMZ_INTERFACE -o $LAN_INTERFACE -p tcp \
	-s $SSH_CLIENT --sport $UNPRIVPORTS \
	-d $SSH_CLIENT --dport 22 \
	-m state --state NEW -j ACCEPT

#######################################################################################

#ftp 

#Outgoing

$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE -p tcp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS --dport 21 \
	-m state --state NEW -j ACCEPT

$IPT -A OUTPUT -o $DMZ_INTERFACE -p tcp \
	-s $DMZ_IPADDR --sport $UNPRIVPORTS --dport 21 \
	-m state --state NEW -j ACCEPT

#######################################################################################

#HTTP

#Outgoing

$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE -p tcp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS --dport 80 \
	-m state --state NEW -j ACCEPT

$IPT -A OUTPUT -o $DMZ_INTERFACE -p tcp \
	-s $DMZ_IPADDR --sport $UNPRIVPORTS --dport 80 \
	-m state --state NEW -j ACCEPT

#######################################################################################

#SSL

#Outgoing

$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE -p tcp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS --dport 443 \
	-m state --state NEW -j ACCEPT

$IPT -A OUTPUT -o $DMZ_INTERFACE -p tcp \
	-s $DMZ_IPADDR --sport $UNPRIVPORTS --dport 443 \
	-m state --state NEW -j ACCEPT

#######################################################################################

#Whois

#Outgoing

$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE -p tcp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS --dport 43 \
	-m state --state NEW -j ACCEPT

$IPT -A OUTPUT -o $DMZ_INTERFACE -p tcp \
	-s $DMZ_IPADDR --sport $UNPRIVPORTS --dport 43 \
	-m state --state NEW -j ACCEPT

#######################################################################################

#Network Printer

$IPT -A OUTPUT -o $LAN_INTERFACE -p tcp \
	-s $LAN_IPADDR --sport $PRIVPORTS \
	-d $PRINTER_ADDRESS --dport 515 \
	-m state --state NEW -j ACCEPT

$IPT -A FORWARD -i $DMZ_INTERFACE -o $LAN_INTERFACE -p tcp \
	-s $DMZ_ADDRESSES --sport $UNPRIVPORTS \
	-d $PRINTER_ADDRESS --dport 515 \
 	-m state --state NEW -j ACCEPT

#######################################################################################

#Accessing Network Time Server
#
#

$IPT -A OUTPUT -o $DMZ_INTERFACE -p udp \
	-s $DMZ_IPADDR --sport $UNPRIVPORTS \
	-d $GATEWAY_IPADDR --dport 123 \
	-m state --state NEW -j ACCEPT

$IPT -A INPUT -i $LAN_INTERFACE -p udp \
	-s $LAN_ADDRESSES --sport $UNPRIVPORTS \
	-d $LAN_IPADDR --dport 123 \
	-m state --state NEW -j ACCEPT

$IPT -A INPUT -i $LAN_INTERFACE -p udp \
	-s $LAN_ADDRESSES --sport 123 \
	-d $LAN_IPADDR --dport 123 \
	-m state --state NEW -j ACCEPT

#######################################################################################

#

$IPT -A INPUT -i $LAN_INTERFACE -p udp \
	-s $BROADCAST_SRC --sport 68 \
	-d $BROADCAST_DEST --dport 67 -j ACCEPT

$IPT -A OUTPUT -o $LAN_INTERFACE -p udp \
	-s $BROADCAST_SRC --sport 67 \
	-d $BROADCAST_DEST --dport 68 -j ACCEPT

$IPT -A OUTPUT -o $LAN_INTERFACE -p udp \
	-s $LAN_IPADDR --sport 67 \
	-d $BROADCAST_DEST --dport 68 -j ACCEPT

$IPT -A INPUT -i $LAN_INTERFACE -p udp \
	-s $BROADCAST_SRC --sport 68 \
	-d $LAN_IPADDR --dport 67 -j ACCEPT

$IPT -A OUTPUT -o $LAN_INTERFACE -p udp \
	-s $LAN_IPADDR --sport 67 \
	-d $LAN_ADDRESSES --dport 68 -j ACCEPT

$IPT -A OUTPUT -o $LAN_INTERFACE -p udp \
 	-s $LAN_IPADDR --sport 67 \
	-d $LAN_ADDRESSES --dport 68 -j ACCEPT

$IPT -A INPUT -i $LAN_INTERFACE -p udp \
	-s $LAN_ADDRESSES --sport 68 \
	-d $LAN_IPADDR --dport 67 -j ACCEPT

$IPT -A OUTPUT -o $LAN_INTERFACE -j LOG

#######################################################################################

#

$IPT -A INPUT -i $LAN_INTERFACE -j LOG
$IPT -A OUTPUT -o $LAN_INTERFACE -j LOG
$IPT -A FORWARD -i $LAN_INTERFACE -o $DMZ_INTERFACE -j LOG
$IPT -A FORWARD -i $DMZ_INTERFACE -o $LAN_INTERFACE -j LOG

exit 0





















