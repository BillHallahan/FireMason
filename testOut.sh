 
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
iptables -A bad-ports --dport 9 -j ACCEPT
$IPTABLES -p 0 -j DROP  -A bad-ports
$IPTABLES -A bad-ports -p 22 -j DROP
$IPTABLES -A bad-ports -p tcp --sport 6
$IPTABLES -A bad-ports -p tcp --sport 4 --tcp-flags ALL NONE --dport 32 -j DROP
$IPTABLES -A bad-ports -p tcp --sport 4 --tcp-flags SYN,ACK NONE --dport 32 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 5 -j second
iptables -A bad-ports --tcp-flags SYN,ACK SYN -p 7 -j ACCEPT
iptables -A bad-ports --sport 10 -p 87 -j ACCEPT
iptables -A bad-ports --sport 10 -p 88 -j ACCEPT
iptables -A bad-ports --dport 10 -p 87 -j ACCEPT
iptables -A bad-ports --dport 10 -p 88 -j ACCEPT
$IPTABLES -A bad-ports -p tcp --sport 4:8 -j ACCEPT
$IPTABLES -A bad-ports -p tcp --sport 4 ! --tcp-flags SYN,ACK,FIN SYN --dport 5 -j second



$IPTABLES -N check
$IPTABLES -F check
$IPTABLES -p 0 -j DROP  -A check
$IPTABLES -A check -p tcp --tcp-flags SYN SYN -j ACCEPT



$IPTABLES -N second
$IPTABLES -F second
iptables -A second --dport 100 -j ACCEPT
$IPTABLES -A second -p tcp -m multiport --port 7,8 -j DROP

$IPTABLES -N ret2
$IPTABLES -F ret2
$IPTABLES -A -p udp --sport 96 -j RETURN
$IPTABLES -A ret -p udp -j DROP

$IPTABLES -N ret
$IPTABLES -F ret
$IPTABLES -A ret -p udp --sport 96 -g ret2
$IPTABLES -A ret -p udp -j DROP

iptables -A INPUT --dport 78 -j DROP
iptables -A INPUT -p 37 --sport 97 -j ACCEPT
iptables -A INPUT --dport 4 -j ACCEPT
iptables -A INPUT --dport 89 -j ACCEPT
iptables -A INPUT --tcp-flags ACK,SYN ACK -j ACCEPT
iptables -A INPUT --tcp-flags SYN,ACK NONE -j DROP
$IPTABLES -A INPUT -j ret
$IPTABLES -A INPUT -j ret2
$IPTABLES -A INPUT -j bad-ports
iptables -A INPUT -p 17 --sport 96 -j ACCEPT
iptables -A INPUT -p 1 --dport 45 ! --sport 90  -j ACCEPT
$IPTABLES -A INPUT -p udp --sport 98 -j ACCEPT

iptables -A OUTPUT ! -p 4  -j DROP
$IPTABLES -A OUTPUT -j second
$IPTABLES -A OUTPUT -j check
