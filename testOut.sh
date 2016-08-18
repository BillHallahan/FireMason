 
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
iptables -A bad-ports -p 6 --tcp-flags SYN,ACK SYN -p 7 -j ACCEPT
iptables -A bad-ports -p 6 --sport 10 -p 87 -j ACCEPT
iptables -A bad-ports -p 17 --sport 10 -p 87 -j ACCEPT
iptables -A bad-ports -p 6 --sport 10 -p 88 -j ACCEPT
iptables -A bad-ports -p 17 --sport 10 -p 88 -j ACCEPT
iptables -A bad-ports -p 6 --dport 10 -p 87 -j ACCEPT
iptables -A bad-ports -p 17 --dport 10 -p 87 -j ACCEPT
iptables -A bad-ports -p 6 --dport 10 -p 88 -j ACCEPT
iptables -A bad-ports -p 17 --dport 10 -p 88 -j ACCEPT
iptables -A bad-ports -p 6 --dport 9 -j ACCEPT
iptables -A bad-ports -p 17 --dport 9 -j ACCEPT
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
iptables -A second -p 6 --dport 100 -j ACCEPT
iptables -A second -p 17 --dport 100 -j ACCEPT
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

iptables -A INPUT -p 6 --dport 78 -j DROP
iptables -A INPUT -p 17 --dport 78 -j DROP
iptables -A INPUT -p 17 --dport 4 -j ACCEPT
iptables -A INPUT -p 17 --dport 89 -j ACCEPT
iptables -A INPUT -p 6 --tcp-flags ACK,SYN ACK -j ACCEPT
iptables -A INPUT -p 6 --tcp-flags SYN,ACK NONE -j DROP
$IPTABLES -A INPUT -j ret
$IPTABLES -A INPUT -j ret2
$IPTABLES -A INPUT -j bad-ports
iptables -A INPUT -p 17 --sport 96 -j ACCEPT
iptables -A INPUT -p 37 -p 6 --sport 97 -j ACCEPT
iptables -A INPUT -p 37 -p 17 --sport 97 -j ACCEPT
iptables -A INPUT -p 1 -p 6 --dport 45 ! --sport 90  -j ACCEPT
iptables -A INPUT -p 1 -p 17 --dport 45 ! --sport 90  -j ACCEPT
iptables -A INPUT -p 6 --dport 4 -j ACCEPT
iptables -A INPUT -p 6 --dport 89 -j ACCEPT
$IPTABLES -A INPUT -p udp --sport 98 -j ACCEPT
$IPTABLES -A INPUT -j end

iptables -A OUTPUT ! -p 4  -j DROP
$IPTABLES -A OUTPUT -j second
$IPTABLES -A OUTPUT -j check
$IPTABLES -A OUTPUT -j end

$IPTABLES -A FORWARD -p udp -m multiport --sport 87,88,89,99,199,291,3422 -j ACCEPT
$IPTABLES -A FORWARD -p udp -m multiport --sport 230:240,4500,4555,6432,6462,7889,8990,12305 --dport 8000,8001,8002,8003,8004,8005 -j ACCEPT
iptables -A FORWARD -p 6 --tcp-flags SYN,ACK SYN,ACK -j DROP
iptables -A FORWARD -p 9 -j ACCEPT
iptables -A FORWARD -p 10 -j ACCEPT
iptables -A FORWARD -p 22 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -m multiport --dport 90,95:1110 -j ACCEPT
$IPTABLES -A FORWARD -p udp -j DROP
$IPTABLES -A FORWARD -p tcp --tcp-flags SYN,ACK SYN -j forward_jump
$IPTABLES -A FORWARD -p tcp --tcp-flags RST NONE -j forward_jump
$IPTABLES -A FORWARD -j end
