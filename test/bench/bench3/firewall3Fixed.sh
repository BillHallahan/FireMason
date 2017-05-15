

# Loopback interface
iptables -A INPUT -m limit --limit 3/minute --limit-burst 4 -p 22 -j ACCEPT
iptables -A INPUT -p 22 -j DROP
iptables -A INPUT -i lo -j ACCEPT

# ICMP traffic
iptables -A INPUT -p icmp --icmp-type any -j ACCEPT

# Already established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# SSH
iptables -A INPUT -p tcp --dport 2020 -m state --state NEW -m recent --set --name SSH
iptables -A INPUT -p tcp --dport 2020 -m state --state NEW -m recent --update --seconds 120 --hitcount 8 --rttl --name SSH -j DROP

# Web services
iptables -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 8088 -m state --state NEW -j ACCEPT

# Reject everything else
iptables -A INPUT -j REJECT --reject-with icmp-host-prohibited
