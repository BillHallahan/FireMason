 
#!/bin/sh
############################
# IPTABLES SCRIPT #
# by Taka John Brunkhorst #
# Feel Free to Copyleft #
############################

#Basic Config

#where your iptables is
IPTABLES=/sbin/iptables

#your EXTERNAL Network interface.
EXT=eth0 

#your INTERNAL Network interface.
INT=eth1

#YOUR DNS SERVER on /etc/resolv.conf
DNS1=221.200.216.219

#YOUR DNS SERVER on /etc/resolv.conf
DNS2=221.200.217.162

#Flushing and cleaning old rules.
$IPTABLES -F
$IPTABLES -X

#returning something.
echo "iptables rules applied"

#Setting Everything to DROP.
#note: Setting OUTPUT or FORWARD are not friendly for network games which uses ramdom ports.
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

#NAT,To enable,comment out line below.
#$IPTABLES -t nat -A POSTROUTING -o $EXT -j MASQUERADE

#IPFORWARDING, To enable, comment out line below.
#$IPTABLES -t nat -A PREROUTING -i $EXT -p tcp --dport 10535 -j DNAT --to-destination 192.168.0.251:10535

#Uncomment below to allow ipforwarding
#echo "1" >; /proc/sys/net/ipv4/ip_forward


##Starting Define process.###############
##To enable these, Dont forget to modify "INPUT RULE" "OUTPUT RULE" "FORWARD RULE" at bottom of the script!###

#Allow ESTABLISHED connections
$IPTABLES -N allowed-connection
$IPTABLES -F allowed-connection
$IPTABLES -A allowed-connection -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A allowed-connection -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT


#ALLOW INCOMING SSHD REQUESTS.
$IPTABLES -N allow-ssh-input
$IPTABLES -F allow-ssh-input
$IPTABLES -A allow-ssh-input -m limit --limit 1/second -p tcp --tcp-flags ALL RST --dport 22 -j ACCEPT
$IPTABLES -A allow-ssh-input -m limit --limit 1/second -p tcp --tcp-flags ALL FIN --dport 22 -j ACCEPT
$IPTABLES -A allow-ssh-input -m limit --limit 1/second -p tcp --tcp-flags ALL SYN --dport 22 -j ACCEPT
$IPTABLES -A allow-ssh-input -m state --state ESTABLISHED,RELATED -p tcp --dport 22 -j ACCEPT

#ALLOW INCOMING FTPD REQUESTS.
#$IPTABLES -N allow-ftp-input
#$IPTABLES -F allow-ftp-input
#$IPTABLES -A allow-ftp-input -m limit --limit 1/second -p tcp --tcp-flags ALL RST --dport 21 -j ACCEPT
#$IPTABLES -A allow-ftp-input -m limit --limit 1/second -p tcp --tcp-flags ALL FIN --dport 21 -j ACCEPT
#$IPTABLES -A allow-ftp-input -m limit --limit 1/second -p tcp --tcp-flags ALL SYN --dport 21 -j ACCEPT
#$IPTABLES -A allow-ftp-input -m state --state ESTABLISHED,RELATED -p tcp --dport 21 -j ACCEPT

#ALLOW OUTGOING SSH CONNECTIONS
$IPTABLES -N allow-ssh-output
$IPTABLES -F allow-ssh-output
$IPTABLES -A allow-ssh-output -m state --state ESTABLISHED,RELATED -p tcp --dport 22 -j ACCEPT

#ALLOW OUTGOING FTP CONNECTIONS
$IPTABLES -N allow-ftp-output
$IPTABLES -F allow-ftp-output
$IPTABLES -A allow-ftp-output -m state --state ESTABLISHED,RELATED -p tcp --dport 21 -j ACCEPT

#ALLOW OUTGOING DNS REQUESTS
$IPTABLES -N allow-dns-output
$IPTABLES -F allow-dns-output
$IPTABLES -A allow-dns-output -p udp -d $DNS1 --dport domain -j ACCEPT
$IPTABLES -A allow-dns-output -p udp -d $DNS2 --dport domain -j ACCEPT

#ALLOW OUTGOING HTTP/HTTPS REQUESTS.
$IPTABLES -N allow-www-output
$IPTABLES -F allow-www-output
$IPTABLES -A allow-www-output -p tcp --dport www -j ACCEPT
$IPTABLES -A allow-www-output -p tcp --dport https -j ACCEPT

#ALLOW INCOMING SAMBA SERVER REQUESTS.
$IPTABLES -N allow-samba-input
$IPTABLES -F allow-samba-input
$IPTABLES -A allow-samba-input -i $INT -p tcp --dport 137 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p udp --dport 137 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p tcp --sport 137 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p udp --sport 137 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p tcp --dport 138 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p udp --dport 138 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p tcp --sport 138 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p udp --sport 138 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p tcp --dport 139 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p udp --dport 139 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p tcp --sport 139 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p udp --sport 139 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p tcp --dport 445 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p udp --dport 445 -j ACCEPT
$IPTABLES -A allow-samba-input -i $INT -p tcp --sport 445 -j ACCEPT
#$IPTABLES -A allow-samba-input -i $INT -p udp --sport 445 -j ACCEPT


#LOG and DROP Bad flags, block portscans, SYN floods. etc.
$IPTABLES -N bad-flags
$IPTABLES -F bad-flags
$IPTABLES -A bad-flags -p tcp --tcp-flags ALL FIN,URG,PSH -m limit --limit 3/minute -j LOG --log-level alert --log-prefix \
 "NMAP-XMAS:"
$IPTABLES -A bad-flags -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
$IPTABLES -A bad-flags -p tcp --tcp-flags ALL ALL -m limit --limit 3/minute -j LOG --log-level 1 --log-prefix "XMAS:"
$IPTABLES -A bad-flags -p tcp --tcp-flags ALL ALL -j DROP
$IPTABLES -A bad-flags -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -m limit --limit 3/minute -j LOG \
--log-level 1 --log-prefix "XMAS-PSH:"
$IPTABLES -A bad-flags -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
$IPTABLES -A bad-flags -p tcp --tcp-flags ALL NONE -m limit --limit 3/minute -j LOG --log-level 1 --log-prefix "NULL_SCAN:"
$IPTABLES -A bad-flags -p tcp --tcp-flags ALL NONE -j DROP
$IPTABLES -A bad-flags -p tcp --tcp-flags SYN,RST SYN,RST -m limit --limit 3/minute -j LOG --log-level 5 --log-prefix \ "SYN/RST:"
$IPTABLES -A bad-flags -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
$IPTABLES -A bad-flags -p tcp --tcp-flags SYN,FIN SYN,FIN -m limit --limit 3/minute -j LOG --log-level 5 --log-prefix \ "SYN/FIN:"

#BLOCK OS Fingerprint Detection
$IPTABLES -N os-fingerprint
$IPTABLES -F os-fingerprint
$IPTABLES -A os-fingerprint -p tcp --dport 0 -j DROP
$IPTABLES -A os-fingerprint -p udp --dport 0 -j DROP
$IPTABLES -A os-fingerprint -p tcp --sport 0 -j DROP
$IPTABLES -A os-fingerprint -p udp --sport 0 -j DROP
$IPTABLES -A os-fingerprint -p icmp --icmp-type address-mask-request -j DROP
$IPTABLES -A os-fingerprint -p icmp --icmp-type address-mask-reply -j DROP

#DROP INVALID PACKETS
$IPTABLES -N invalid-packets
$IPTABLES -F invalid-packets
$IPTABLES -A invalid-packets -m state --state INVALID -j DROP

#BAD PORTS,TROJAN,BACKDOOR PORTS
$IPTABLES -N bad-ports
$IPTABLES -F bad-ports
$IPTABLES -A bad-ports -p tcp -m multiport --dport 3049,1999,4329,1,2,13,98,111,901,902 -j DROP
$IPTABLES -A bad-ports -p udp -m multiport --dport 3049,1999,4329,1,2,13,98,111,901,902 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 12345 -j DROP
$IPTABLES -A bad-ports -p udp --dport 12345 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 1524 -j DROP
$IPTABLES -A bad-ports -p udp --dport 1524 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 2049 -j DROP
$IPTABLES -A bad-ports -p udp --dport 2049 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 27444 -j DROP
$IPTABLES -A bad-ports -p udp --dport 27444 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 31335 -j DROP
$IPTABLES -A bad-ports -p udp --dport 31335 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 27665 -j DROP
$IPTABLES -A bad-ports -p udp --dport 27665 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 31337 -j DROP
$IPTABLES -A bad-ports -p udp --dport 31337 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 65535 -j DROP
$IPTABLES -A bad-ports -p udp --dport 65535 -j DROP

##END of Define process.###############
##Now Modify "INPUT RULE" "OUTPUT RULE" "FORWARD RULE" below###


#FILTERS
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo "2" > /proc/sys/net/ipv4/conf/all/rp_filter
echo "1" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
echo "1" > /proc/sys/net/ipv4/conf/all/log_martians

####INPUT RULE####
#Packets coming to your box.

#DHCPD: Uncomment below if you are running DHCPD(SERVER)
#$IPTABLES -A INPUT -i $INT -p udp --dport 67:68 -j ACCEPT 

#Uncomment below to ALLOW samba server.
#$IPTABLES -A INPUT -j allow-samba-input

#Uncomment below to ALLOW SSH server.
#$IPTABLES -A INPUT -j allow-ssh-input

#Uncomment below to ALLOW server.
#$IPTABLES -A INPUT -j allow-ftp-input

$IPTABLES -A INPUT -j invalid-packets
$IPTABLES -A INPUT -j bad-flags
$IPTABLES -A INPUT -j os-fingerprint
$IPTABLES -A INPUT -j bad-ports
$IPTABLES -A INPUT -i lo -j ACCEPT

#Always allow "allowed-connection" last!
$IPTABLES -A INPUT -j allowed-connection



####OUTPUT RULE####
#Packets going out from your box.

#ALLOW OUTGOING FTP CONNECTIONS
$IPTABLES -A OUTPUT -j allow-ftp-output

#ALLOW OUTGOING SSH CONNECTIONS
$IPTABLES -A OUTPUT -j allow-ssh-output

#ALLOW OUTGOING HTTP.HTTPS CONNECTIONS
$IPTABLES -A OUTPUT -j allow-www-output

#ALLOW OUTGOING DNS REQUEST
$IPTABLES -A OUTPUT -j allow-dns-output

#Uncomment below to ALLOW Outgoing DHCPC requests(DHCPCD)
#$IPTABLES -A OUTPUT -o $INT -p udp --dport 67:68 -j ACCEPT

$IPTABLES -A OUTPUT -j invalid-packets
$IPTABLES -A OUTPUT -j bad-flags
$IPTABLES -A OUTPUT -j os-fingerprint
$IPTABLES -A OUTPUT -j bad-ports
$IPTABLES -A OUTPUT -o lo -j ACCEPT
$IPTABLES -A OUTPUT -j allowed-connection


####FORWARD RULE####
#packets coming from NAT Clients.

#ALLOW OUTGOING FTP CONNECTIONS
$IPTABLES -A FORWARD -j allow-ftp-output

#ALLOW OUTGOING HTTP.HTTPS CONNECTIONS
$IPTABLES -A FORWARD -j allow-www-output

#ALLOW OUTGOING DNS REQUEST
$IPTABLES -A FORWARD -j allow-dns-output

$IPTABLES -A FORWARD -j bad-flags
$IPTABLES -A FORWARD -j invalid-packets
$IPTABLES -A FORWARD -j os-fingerprint
$IPTABLES -A FORWARD -j bad-ports
$IPTABLES -A FORWARD -o lo -j ACCEPT
$IPTABLES -A FORWARD -j allowed-connection

exit 0