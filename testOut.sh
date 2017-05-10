#!/bin/sh

IPTABLES=/sbin/iptables

$IPTABLES -N protocols-chain
$IPTABLES -F protocols-chain
$IPTABLES -A protocols-chain -p 17 -j ACCEPT
$IPTABLES -A protocols-chain -p tcp -j ACCEPT
##$IPTABLES -A protocols-chain -p udp -j ACCEPT


$IPTABLES -A INPUT -p tcp --tcp-flags SYN,ACK SYN -j DROP
$IPTABLES -A INPUT -j protocols-chain
iptables -A INPUT -p 10 -j DROP
#$IPTABLES -A INPUT -p tcp --tcp-flags URG URG -j DROP

$IPTABLES -A OUTPUT -p tcp --dport 45 -j ACCEPT
#$IPTABLES -A OUTPUT -j protocols-chain
$IPTABLES -A OUTPUT -p 124 -j ACCEPT
$IPTABLES -A OUTPUT -d 4.5.0.0/16 -j ACCEPT
#$IPTABLES -A OUTPUT -p 8 -d 4.5.6.7 -j ACCEPT

#$IPTABLES -A FORWARD -p 124 -j ACCEPT
$IPTABLES -A FORWARD -j protocols-chain
#$IPTABLES -A FORWARD -p udp --dport 109 -j ACCEPT