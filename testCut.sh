 
#!/bin/sh
############################
# IPTABLES SCRIPT #
# by Taka John Brunkhorst #
# Feel Free to Copyleft #
############################

#where your iptables is
IPTABLES=/sbin/iptables



$IPTABLES -N end
$IPTABLES -F end
$IPTABLES -A end -p tcp --sport 100 --dport 200 -j DROP


$IPTABLES -A INPUT -j end


$IPTABLES -A FORWARD -j end