iptables -N test1
iptables -N test2
iptables -N test3
iptables -A test1 -m limit --limit 79 --limit-burst 197 -j DROP
iptables -A OUTPUT -p 17 -m limit --limit 70 --limit-burst 80 -s 181.0.0.0.0/8 --sport 5233 --dport 9946 -j test3
iptables -A INPUT -p 17 --sport 40371 --dport 16715 -m limit --limit 42 --limit-burst 115 -d 152.0.0.0.0/8 -j ACCEPT
iptables -A test3 -p 140 -j ACCEPT
iptables -A test3 -p 17 -s 228.142.66.230 --sport 13223 -m limit --limit 34 --limit-burst 182 -d 159.58.49.240 -j DROP
iptables -A OUTPUT -d 90.0.0.0.0/8 -p 242 -m limit --limit 54 --limit-burst 132 -j ACCEPT
iptables -A FORWARD -p 6 -d 232.219.210.233 -s 231.0.0.0.0/8 --dport 51765 --sport 56923 -j ACCEPT
iptables -A test3 -p 6 -s 237.0.0.0.0/8 --dport 3318 -j ACCEPT
iptables -A test3 -p 6 -s 68.57.202.17 --dport 30315 -m limit --limit 34 --limit-burst 67 --sport 23697 -j DROP
iptables -A FORWARD -p 17 -s 180.97.95.133 --dport 36451 -j ACCEPT
iptables -A test2 -p 17 --sport 44606 -d 22.232.87.33 -j ACCEPT
iptables -A FORWARD -p 17 -d 65.248.32.133 -m limit --limit 4 --limit-burst 128 -s 81.0.0.0.0/8 --dport 62897 -j ACCEPT
iptables -A test3 -p 17 --sport 59710 -s 215.137.0.0.0/16 -m limit --limit 73 --limit-burst 111 -d 40.128.27.0.0/24 -j DROP
iptables -A FORWARD -p 6 -m limit --limit 53 --limit-burst 183 -s 30.235.251.128 --dport 58829 -d 208.116.102.73 --sport 941 -j ACCEPT
iptables -A INPUT -m limit --limit 40 --limit-burst 163 -s 167.89.0.0.0/16 -d 227.181.185.105 -j ACCEPT
iptables -A test2 -p 17 -m limit --limit 34 --limit-burst 117 -d 140.215.186.65 --dport 4290 -s 225.0.0.0.0/8 -j DROP
iptables -A test3 -m limit --limit 9 --limit-burst 123 -j ACCEPT
iptables -A test1 -p 6 -s 97.10.0.0.0/16 --dport 28736 -m limit --limit 47 --limit-burst 135 -d 196.164.13.33 -j ACCEPT
iptables -A INPUT -p 6 --sport 49502 -m limit --limit 13 --limit-burst 145 -s 11.187.197.59 -d 181.47.16.81 -j DROP
iptables -A OUTPUT -p 6 -s 232.118.0.0.0/16 -m limit --limit 23 --limit-burst 54 -d 108.22.0.0.0/16 --sport 26741 -j test3
iptables -A FORWARD -s 248.81.211.19 -m limit --limit 57 --limit-burst 137 -d 242.84.115.37 -j ACCEPT
iptables -A test1 -p 17 -d 176.0.0.0.0/8 --sport 54499 -s 210.191.171.138 -j ACCEPT
iptables -A INPUT -p 17 --sport 54653 -j test2
iptables -A INPUT -p 17 -m limit --limit 18 --limit-burst 91 --sport 56206 --dport 39512 -j DROP
iptables -A OUTPUT -p 6 --sport 13386 -m limit --limit 63 --limit-burst 174 -d 192.182.17.0.0/24 -s 86.245.94.82 -j test2
iptables -A INPUT -p 17 --sport 64893 -m limit --limit 17 --limit-burst 64 -d 35.0.0.0.0/8 -j DROP
iptables -A INPUT -s 128.0.0.0.0/8 -j test3
iptables -A OUTPUT -p 17 --sport 60463 -j test2
iptables -A INPUT -p 6 -m limit --limit 53 --limit-burst 110 -s 1.0.0.0.0/8 --sport 57513 --dport 6014 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 49201 -j ACCEPT
iptables -A FORWARD -p 17 -m limit --limit 34 --limit-burst 98 --dport 58360 -j ACCEPT
iptables -A test3 -p 6 -m limit --limit 44 --limit-burst 184 -d 116.86.240.0.0/24 -s 7.0.0.0.0/8 --dport 18891 -j ACCEPT
iptables -A test2 -p 17 -d 196.0.149.69 --sport 27637 -j DROP
iptables -A test1 -p 17 -s 28.0.0.0.0/8 --sport 56410 -j ACCEPT
iptables -A test2 -p 6 --sport 1360 -d 158.248.0.0.0/16 --dport 46216 -s 27.178.193.183 -j DROP
iptables -A test2 -p 6 --sport 55674 --dport 48894 -j ACCEPT
iptables -A test2 -p 17 -s 179.0.0.0.0/8 -d 227.108.97.139 --sport 27886 -j DROP
iptables -A test1 -p 6 -s 128.148.125.93 --sport 45561 -m limit --limit 23 --limit-burst 67 --dport 45973 -j DROP
iptables -A FORWARD -p 6 -d 84.3.150.146 --dport 40975 --sport 49928 -j test2
iptables -A OUTPUT -p 6 --dport 12025 -m limit --limit 50 --limit-burst 99 -d 241.147.16.55 -s 97.31.0.0.0/16 --sport 61001 -j ACCEPT
iptables -A test3 -p 6 -s 250.0.0.0.0/8 --dport 29526 -m limit --limit 64 --limit-burst 73 -j DROP
iptables -A OUTPUT -p 17 -m limit --limit 62 --limit-burst 84 -d 191.29.78.75 --sport 12905 -s 46.91.0.0.0/16 -j DROP
iptables -A INPUT -p 17 -m limit --limit 1 --limit-burst 110 -s 65.158.247.0.0/24 --sport 9978 -j ACCEPT
iptables -A FORWARD -s 170.51.2.63 -j ACCEPT
iptables -A test3 -p 6 --dport 13283 -d 147.142.0.0.0/16 -s 162.174.0.0.0/16 -j ACCEPT
iptables -A test3 -p 243 -m limit --limit 7 --limit-burst 10 -j ACCEPT
iptables -A FORWARD -p 6 --sport 2598 -d 39.0.0.0.0/8 -j test1
iptables -A test1 -p 6 --dport 57850 -d 219.243.0.0.0/16 --sport 34074 -s 109.19.10.0.0/24 -j DROP
iptables -A OUTPUT -p 17 --dport 28826 -m limit --limit 49 --limit-burst 107 --sport 30942 -j test2
iptables -A test3 -p 6 -m limit --limit 56 --limit-burst 149 --sport 6768 --dport 26746 -j ACCEPT