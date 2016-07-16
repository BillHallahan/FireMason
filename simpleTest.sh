 
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
$IPTABLES -A second -p 22 -j DROP

$IPTABLES -N third
$IPTABLES -F third
$IPTABLES -A third -p 33 -j DROP


$IPTABLES -A OUTPUT -p 1 -j first
$IPTABLES -A OUTPUT -p 2 -j second
$IPTABLES -A OUTPUT -p 3 -j third