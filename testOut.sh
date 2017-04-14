#!/bin/sh

IPTABLES=/sbin/iptables

$IPTABLES -N protocols-chain
$IPTABLES -F protocols-chain
$IPTABLES -A protocols-chain -p 117 -j ACCEPT
$IPTABLES -A protocols-chain -p tcp -j ACCEPT
$IPTABLES -A protocols-chain -p udp -j ACCEPT


iptables -A INPUT -p 6 --dport 48 -j DROP
iptables -A INPUT -p 17 --dport 48 -j DROP
iptables -A INPUT -p 6 --dport 49 -j DROP
iptables -A INPUT -p 17 --dport 49 -j DROP
iptables -A INPUT -p 6 --tcp-flags RST RST -j DROP
iptables -A INPUT -p 124 -j ACCEPT
$IPTABLES -A INPUT -p tcp --tcp-flags SYN,ACK SYN -j DROP
$IPTABLES -A INPUT -j protocols-chain
#$IPTABLES -A INPUT -p tcp --tcp-flags URG URG -j DROP

iptables -A OUTPUT -p 2 -d 4.5.6.0/24 -j DROP
iptables -A OUTPUT -s 7.8.9.10/32 -j DROP
$IPTABLES -A OUTPUT -p tcp --dport 45 -j ACCEPT
#$IPTABLES -A OUTPUT -j protocols-chain
$IPTABLES -A OUTPUT -p 124 -j ACCEPT
$IPTABLES -A OUTPUT -d 4.5.0.0/16 -j ACCEPT
#$IPTABLES -A OUTPUT -p 8 -d 4.5.6.7 -j ACCEPT

#$IPTABLES -A FORWARD -p 124 -j ACCEPT
iptables -A FORWARD -p 6 --dport 110 -j DROP
$IPTABLES -A FORWARD -j protocols-chain
#$IPTABLES -A FORWARD -p udp --dport 109 -j ACCEPT