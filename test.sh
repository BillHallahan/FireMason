 
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
$IPTABLES -p 0 -j DROP  -A bad-ports
$IPTABLES -A bad-ports -p 22 -j DROP
$IPTABLES -A bad-ports -p tcp --sport 6
$IPTABLES -A bad-ports -p tcp --sport 4 --tcp-flags ALL NONE --dport 32 -j DROP
$IPTABLES -A bad-ports -p tcp --sport 4 --tcp-flags SYN,ACK NONE --dport 32 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 5 -j second
$IPTABLES -A bad-ports -p tcp --sport 4:8 -j ACCEPT
$IPTABLES -A bad-ports -p tcp --sport 4 ! --tcp-flags SYN,ACK,FIN SYN --dport 5 -j second



$IPTABLES -N check
$IPTABLES -F check
$IPTABLES -p 0 -j DROP  -A check



$IPTABLES -N second
$IPTABLES -F second
$IPTABLES -A second -p tcp -m multiport --port 7,8 -j DROP

$IPTABLES -N ret
$IPTABLES -F ret
#$IPTABLES -A ret -p udp --sport 96 -j RETURN
$IPTABLES -A ret -p udp -j DROP

$IPTABLES -A INPUT -j ret
$IPTABLES -A INPUT -j bad-ports
$IPTABLES -A INPUT -p udp --sport 98 -j ACCEPT

$IPTABLES -A OUTPUT -j second
$IPTABLES -A OUTPUT -j check