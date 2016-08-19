#!/bin/sh

IPTABLES=/sbin/iptables

$IPTABLES -N protocols-chain
$IPTABLES -F protocols-chain
$IPTABLES -A protocols-chain -p 117 -j ACCEPT
$IPTABLES -A protocols-chain -p tcp -j ACCEPT
$IPTABLES -A protocols-chain -p udp -j ACCEPT


$IPTABLES -A INPUT -p tcp --tcp-flags SYN,ACK SYN -j DROP
$IPTABLES -A INPUT -p tcp --sport 37 -j DROP
$IPTABLES -A INPUT -p udp -m multiport --dport 46,47 -j DROP
$IPTABLES -A INPUT -j protocols-chain
$IPTABLES -A INPUT -p tcp --tcp-flags URG URG -j DROP

$IPTABLES -A OUTPUT -p tcp --dport 45 -j ACCEPT
#$IPTABLES -A OUTPUT -j protocols-chain
$IPTABLES -A OUTPUT -p 124 -j ACCEPT

#$IPTABLES -A FORWARD -p 124 -j ACCEPT
$IPTABLES -A FORWARD -j protocols-chain
$IPTABLES -A FORWARD -p udp --dport 109 -j ACCEPT
