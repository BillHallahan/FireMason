 
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
$IPTABLES -A bad-ports -p 22 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 5
$IPTABLES -A bad-ports -p tcp --dport 5 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 902:8999 -j DROP
$IPTABLES -A bad-ports -p tcp --sport 4 -j DROP
$IPTABLES -A bad-ports -p udp --sport 100 -j DROP
$IPTABLES -A bad-ports -p tcp --sport 4  --dport 5 -j DROP




$IPTABLES -A INPUT -j bad-ports