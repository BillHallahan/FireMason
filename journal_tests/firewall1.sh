#!/bin/sh


# All TCP sessions should begin with SYN
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
iptables -A INPUT -j DROP