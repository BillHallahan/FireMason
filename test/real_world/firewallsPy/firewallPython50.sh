iptables -N test1
iptables -N test2
iptables -N test3
iptables -A test2 -p 17 --dport 10891 --sport 56676 -d 8.26.44.0/24 -j ACCEPT
iptables -A test1 -p 6 -s 166.0.0.0/8 -d 131.0.0.0/8 --sport 47515 -j DROP
iptables -A FORWARD -p 17 --dport 17292 -d 63.217.113.85 --sport 4749 -j ACCEPT
iptables -A test1 -s 83.0.0.0/8 -p 31 -d 254.214.46.59 -j ACCEPT
iptables -A test2 -p 6 -s 241.124.73.0/24 --sport 33731 -j ACCEPT
iptables -A OUTPUT -p 17 -s 177.178.66.18 --dport 29862 -j DROP
iptables -A INPUT -p 17 --sport 26491 -d 131.190.0.65 -j ACCEPT
iptables -A test3 -d 171.85.4.86 -j ACCEPT
iptables -A test3 -p 17 --dport 28588 -s 95.233.88.91 -d 228.142.195.104 -j ACCEPT
iptables -A OUTPUT -d 105.126.153.0/24 -j ACCEPT
iptables -A INPUT -d 95.134.0.0/16 -p 255 -s 76.131.157.178 -j DROP
iptables -A OUTPUT -p 6 --dport 36539 --sport 38955 -s 9.247.250.15 -j DROP
iptables -A OUTPUT -p 6 --sport 33083 -j DROP
iptables -A test2 -d 207.240.200.0/24 -s 146.30.245.224 -j DROP
iptables -A OUTPUT -p 6 --sport 33044 --dport 24706 -d 193.88.0.0/16 -j DROP
iptables -A INPUT -p 17 --sport 42840 -s 133.231.0.0/16 --dport 6460 -j ACCEPT
iptables -A FORWARD -p 6 --sport 46436 --dport 48836 -j ACCEPT
iptables -A test2 -p 6 --dport 64231 -s 93.18.90.0/24 -j ACCEPT
iptables -A INPUT -p 115 -j ACCEPT
iptables -A FORWARD -p 17 --sport 18868 --dport 1539 -s 210.71.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 63788 --sport 30924 -s 232.117.154.0/24 -j ACCEPT
iptables -A test3 -p 17 -s 164.134.0.0/16 --dport 34374 --sport 37820 -j ACCEPT
iptables -A FORWARD -p 6 --sport 26440 -d 41.0.0.0/8 -s 101.225.0.0/16 -j DROP
iptables -A test1 -d 64.126.68.84 -j ACCEPT
iptables -A INPUT -d 52.178.36.69 -j DROP
iptables -A INPUT -p 17 --dport 6768 -j DROP
iptables -A INPUT -p 6 -d 231.120.215.0/24 --sport 43005 -s 95.118.163.190 -j DROP
iptables -A OUTPUT -p 6 --sport 64179 --dport 26863 -j DROP
iptables -A INPUT -p 17 -d 229.203.81.192 -s 190.149.93.0/24 --sport 1809 -j DROP
iptables -A test3 -p 17 --sport 42478 -d 16.170.76.229 -j DROP
iptables -A test3 -p 6 --dport 15746 -d 13.185.39.68 -s 128.165.31.70 -j DROP
iptables -A INPUT -p 17 --dport 61489 --sport 25287 -j ACCEPT
iptables -A test1 -p 17 --dport 39753 -j DROP
iptables -A FORWARD -p 6 --dport 53286 -s 55.194.53.24 -d 187.124.91.0/24 -j ACCEPT
iptables -A test3 -p 17 --sport 60317 -j DROP
iptables -A FORWARD -p 17 --sport 38608 -d 251.29.209.83 -j DROP
iptables -A FORWARD -p 6 -d 150.0.0.0/8 --dport 9080 --sport 46972 -j DROP
iptables -A FORWARD -p 6 --dport 56511 -d 237.250.39.91 --sport 14655 -j DROP
iptables -A test2 -p 17 --dport 18545 -d 228.92.237.154 -s 193.60.130.246 -j DROP
iptables -A test3 -p 17 -s 82.218.157.148 --dport 28289 -j ACCEPT
iptables -A FORWARD -p 17 --dport 29083 -j ACCEPT
iptables -A test2 -s 133.30.202.134 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 18277 -s 170.11.229.240 -j ACCEPT
iptables -A test2 -p 6 --sport 4343 -d 229.241.7.105 -j ACCEPT
iptables -A FORWARD -p 17 --dport 5318 -j ACCEPT
iptables -A FORWARD -p 6 -d 62.194.124.156 --sport 38911 -j DROP
iptables -A INPUT -p 6 -d 179.88.118.181 --sport 63808 -s 3.10.54.66 -j ACCEPT
iptables -A FORWARD -s 191.148.0.0/16 -j DROP
iptables -A test1 -s 171.27.133.33 -p 42 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 26223 --dport 3085 -d 136.60.74.0/24 -j DROP