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
#DNS1=221.200.216.219

#YOUR DNS SERVER on /etc/resolv.conf
#DNS2=221.200.217.162

#Flushing and cleaning old rules.
$IPTABLES -F
$IPTABLES -t nat -F
$IPTABLES -t mangle -F
$IPTABLES -X
$IPTABLES -t nat -X
$IPTABLES -t mangle -X

$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT

echo "0" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo "0" > /proc/sys/net/ipv4/conf/all/rp_filter
echo "0" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
echo "0" > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
echo "0" > /proc/sys/net/ipv4/conf/all/log_martians

