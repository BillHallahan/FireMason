


# Allow outgoing traffic and disallow any passthroughs

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# Allow traffic already established to continue

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow ssh, ftp and web services

iptables -A INPUT -p tcp --dport 22 -i eth0 -j ACCEPT
iptables -A INPUT -p tcp --dport 21 -i eth0 -j ACCEPT
iptables -A INPUT -p udp --dport 21 -i eth0 -j ACCEPT
iptables -A INPUT -p tcp --dport 20 -i eth0 -j ACCEPT
iptables -A INPUT -p udp --dport 20 -i eth0 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -i eth0 -j ACCEPT

# Allow local loopback services

iptables -A INPUT -i lo -j ACCEPT

# Allow pings

iptables -I INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
iptables -I INPUT -p icmp --icmp-type source-quench -j ACCEPT
iptables -I INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -I INPUT 0 -p 22 -s 71.82.93.101/32 -j ACCEPT
iptables -I INPUT 0 -p 22 ! -s 71.82.93.101/32  -j DROP
