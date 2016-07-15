 
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
$IPTABLES -A bad-ports -p 22 -j DROP
$IPTABLES -A bad-ports -p tcp -m multiport --dport 3049,1999,4329,1,2,13,98,111,901,902 -j DROP
$IPTABLES -A bad-ports -p udp -m multiport --dport 3049,1999,4329,1,2,13,98,111,901,902 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 12345 -j DROP
$IPTABLES -A bad-ports -p udp --dport 12345 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 1524 -j DROP
$IPTABLES -A bad-ports -p udp --dport 1524 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 2049 -j DROP
$IPTABLES -A bad-ports -p udp --dport 2049 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 27444 -j DROP
$IPTABLES -A bad-ports -p udp --dport 27444 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 31335 -j DROP
$IPTABLES -A bad-ports -p udp --dport 31335 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 27665 -j DROP
$IPTABLES -A bad-ports -p udp --dport 27665 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 31337 -j DROP
$IPTABLES -A bad-ports -p udp --dport 31337 -j DROP
$IPTABLES -A bad-ports -p tcp --dport 65535 -j DROP
$IPTABLES -A bad-ports ! -p udp --dport 65535 -j DROP
$IPTABLES -A bad-ports -p udp ! --sport 31337 -j DROP
$IPTABLES -A bad-ports -p tcp --sport 65535 -j DROP


$IPTABLES -I bad-ports -p udp -m multiport --dport 3:4 -j DROP
$IPTABLES -I bad-ports 9 -p udp -m multiport --dport 1:2 -j DROP
$IPTABLES -I bad-ports 9 -p tcp -m multiport --dport 19282: -j DROP
$IPTABLES -I bad-ports 9 -p udp -m multiport --dport :6 -j DROP
$IPTABLES -I bad-ports 9 -p udp -m multiport ! --dport 19282:,7,432,:76,2 -j DROP

$IPTABLES -A bad-ports -p tcp -m multiport --sport 23:4567,10091:,65535 -j second-chain
$IPTABLES -A bad-ports -p tcp -m multiport --port 567,689:12345,45432: -j DROP

$IPTABLES -I bad-ports -p udp -m multiport --dport 12 -j DROP


$IPTABLES -N second-chain
$IPTABLES -F second-chain
$IPTABLES -A second-chain -p udp --dport 2 -j ACCEPT
$IPTABLES -A second-chain -p udp -m multiport --port 4354,6788 -j ACCEPT
$IPTABLES -A second-chain -p udp --sport 3423 -j ACCEPT

##END of Define process.###############
##Now Modify "INPUT RULE" "OUTPUT RULE" "FORWARD RULE" below###


#FILTERS



$IPTABLES -A INPUT -j bad-ports

#$IPTABLES -A OUTPUT -j bad-ports

#$IPTABLES -A FORWARD -j bad-ports
IPTABLES2=/sbin/iptables