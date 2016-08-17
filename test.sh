 
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
$IPTABLES -A check -p tcp --tcp-flags SYN SYN -j ACCEPT

$IPTABLES -N end
$IPTABLES -F end
$IPTABLES -A end -p tcp -m multiport --sport 100,200,300,400,500,600,700,800,900,1000 --dport 100,200,300,400,500,600,700,800,900,1000 -j DROP

$IPTABLES -N forward_jump
$IPTABLES -F forward_jump
$IPTABLES -A forward_jump -p tcp -m muliport --sport 11,12,13,14,15,16,17,18 --dport 11,12,17,18,19,20,21,25 -j DROP
$IPTABLES -A forward_jump -p tcp -j DROP

$IPTABLES -N second
$IPTABLES -F second
$IPTABLES -A second -p tcp -m multiport --port 7,8 -j DROP

$IPTABLES -N ret3
$IPTABLES -F ret3
$IPTABLES -A ret3 -p udp --sport 96 -j RETURN
$IPTABLES -A ret3 -p udp -j DROP

$IPTABLES -N ret2
$IPTABLES -F ret2
$IPTABLES -A ret2 -p udp --sport 96 -g ret3
$IPTABLES -A ret2 -p udp -j DROP

$IPTABLES -N ret
$IPTABLES -F ret
$IPTABLES -A ret -p udp --sport 96 -g ret2
$IPTABLES -A ret -p udp -j DROP

$IPTABLES -A INPUT -j ret
$IPTABLES -A INPUT -j ret2
$IPTABLES -A INPUT -j bad-ports
$IPTABLES -A INPUT -p udp --sport 98 -j ACCEPT
$IPTABLES -A INPUT -j end

$IPTABLES -A OUTPUT -j second
$IPTABLES -A OUTPUT -j check
$IPTABLES -A OUTPUT -j end

$IPTABLES -A FORWARD -p udp -m multiport --sport 87,88,89,99,199,291,3422 -j ACCEPT
$IPTABLES -A FORWARD -p udp -m multiport --sport 230:240,4500,4555,6432,6462,7889,8990,12305 --dport 8000,8001,8002,8003,8004,8005 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -m multiport --dport 90,95:1110 -j ACCEPT
$IPTABLES -A FORWARD -p udp -j DROP
$IPTABLES -A FORWARD -p tcp --tcp-flags SYN,ACK SYN -j forward_jump
$IPTABLES -A FORWARD -p tcp --tcp-flags RST NONE -j forward_jump
$IPTABLES -A FORWARD -j end