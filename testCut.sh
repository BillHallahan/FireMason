 
#!/bin/sh
############################
# IPTABLES SCRIPT #
# by Taka John Brunkhorst #
# Feel Free to Copyleft #
############################

#where your iptables is
IPTABLES=/sbin/iptables

#BAD PORTS,TROJAN,BACKDOOR PORTS
$IPTABLES -N bad-ports
$IPTABLES -F bad-ports
$IPTABLES -A bad-ports -p 0 -j DROP
$IPTABLES -A bad-ports -p 22
$IPTABLES -A bad-ports -p tcp --sport 6
$IPTABLES -A bad-ports -p tcp --sport 4

$IPTABLES -A INPUT -p udp -j DROP
$IPTABLES -A INPUT -j bad-ports