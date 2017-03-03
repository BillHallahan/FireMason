#!/bin/sh

IPTABLES=/sbin/iptables


$IPTABLES -A INPUT -p tcp --tcp-flags SYN,ACK SYN -j DROP
