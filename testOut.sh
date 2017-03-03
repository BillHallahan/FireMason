 
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
$IPTABLES -A bad-ports -p tcp --sport 7 -j DROP



$IPTABLES -A INPUT -p tcp -m limit -m multiport --sport 3,4,5,6 --limit 20/second --limit-burst 60 -j DROP
iptables -A INPUT -p 16 -s 40.9.0.0/16 -j ACCEPT
iptables -A INPUT -p 16 -j DROP
$IPTABLES -A INPUT -p tcp -m limit --limit 20/second -m multiport --dport 3,4  --limit-burst 60 -j DROP


$IPTABLES -A OUTPUT -j bad-ports
