iptables -A INPUT -p 7 -j ACCEPT
iptables -A INPUT -s 1.2.3.4 -p 7 -j DROP
iptables -A INPUT -pd 2.3.4.5 -j DROP