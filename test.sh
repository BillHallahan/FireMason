 
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
$IPTABLES -A bad-ports -p 22 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 5
$IPTABLES -A bad-ports -p tcp --dport 5 -j DROP
$IPTABLES -A bad-ports -p tcp --sport 4:8 -j DROP
$IPTABLES -A bad-ports -p tcp --sport 4  --dport 5 -j DROP


$IPTABLES -N second
$IPTABLES -F second
$IPTABLES -A second -p tcp -j bad-ports
$IPTABLES -A second -p udp -j bad-ports
$IPTABLES -A second -p 34 -j bad-ports


$IPTABLES -A INPUT -j bad-ports
$IPTABLES -A OUTPUT -j second