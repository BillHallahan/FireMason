#!/bin/sh


# All TCP sessions should begin with SYN
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# Accept inbound TCP packets
iptables -A INPUT -m state –-state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 81 -m state --state NEW -j ACCEPT

# Block IP address
iptables -A INPUT -s 172.168.14.6 -j DROP
