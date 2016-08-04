 
#!/bin/sh
############################
# IPTABLES SCRIPT #
# by Taka John Brunkhorst #
# Feel Free to Copyleft #
############################

#where your iptables is
IPTABLES=/sbin/iptables


$IPTABLES -N first
$IPTABLES -F first
$IPTABLES -A first -p 11 -j DROP

$IPTABLES -N second
$IPTABLES -F second
$IPTABLES -A second -p tcp --dport 2
$IPTABLES -A second -p tcp --dport 3 -j DROP
$IPTABLES -A second -p tcp --dport 4 -j ACCEPT

$IPTABLES -N third
$IPTABLES -F third
$IPTABLES -A third -p 33 -j DROP


$IPTABLES -A OUTPUT -p tcp ! --dport 58 -j first
$IPTABLES -A OUTPUT -p 2 -j second
$IPTABLES -A OUTPUT -p 3 -j third
$IPTABLES -A OUTPUT -j DROP