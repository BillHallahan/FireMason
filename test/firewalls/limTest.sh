#!/bin/sh

IPTABLES=/sbin/iptables


$IPTABLES -A INPUT -p tcp -j ACCEPT
