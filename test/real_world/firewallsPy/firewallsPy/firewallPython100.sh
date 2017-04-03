iptables -N test1
iptables -N test2
iptables -N test3
iptables -A OUTPUT -p 17 --dport 42710 -d 9.121.30.251 --sport 35879 -j DROP
iptables -A INPUT -d 24.0.0.0/8 -j DROP
iptables -A test2 -d 241.5.131.0/24 -j ACCEPT
iptables -A test2 -p 17 --dport 45938 -s 92.139.200.0/24 -j ACCEPT
iptables -A INPUT -p 17 -s 254.0.0.0/8 --sport 38243 -j test2
iptables -A OUTPUT -p 6 --dport 19945 -j DROP
iptables -A INPUT -d 53.14.35.184 -j ACCEPT
iptables -A test3 -d 240.237.110.146 -j ACCEPT
iptables -A FORWARD -p 17 -d 84.177.49.176 --dport 65016 --sport 10878 -j ACCEPT
iptables -A test2 -p 17 -d 136.197.127.185 --sport 40747 -j DROP
iptables -A test1 -s 250.0.0.0/8 -d 209.0.0.0/8 -j ACCEPT
iptables -A test2 -d 175.91.10.19 -p 93 -j ACCEPT
iptables -A test2 -s 124.32.253.231 -j ACCEPT
iptables -A OUTPUT -p 6 -s 4.37.163.243 -d 52.252.0.0/16 --sport 8497 -j DROP
iptables -A INPUT -p 113 -d 187.137.251.0/24 -j DROP
iptables -A OUTPUT -p 17 --sport 55797 -s 243.68.177.232 -j ACCEPT
iptables -A test2 -p 17 --dport 2756 --sport 41985 -d 206.21.224.247 -j ACCEPT
iptables -A FORWARD -s 73.65.67.0/24 -p 234 -j ACCEPT
iptables -A test3 -p 17 --sport 64802 -d 238.166.243.0/24 -s 192.172.0.0/16 -j DROP
iptables -A test3 -p 6 --sport 9105 -d 138.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --dport 8140 -d 162.28.80.232 -j DROP
iptables -A OUTPUT -p 6 -s 93.234.102.208 -d 115.210.148.91 --dport 45976 -j DROP
iptables -A INPUT -p 17 -s 135.188.109.146 --dport 15887 --sport 19378 -j DROP
iptables -A INPUT -p 6 -s 53.191.9.51 --sport 63384 -d 36.31.189.88 -j ACCEPT
iptables -A test2 -p 17 --sport 56658 --dport 17261 -s 15.151.189.130 -j DROP
iptables -A FORWARD -s 176.126.225.0/24 -d 35.254.153.123 -p 112 -j test1
iptables -A test2 -p 6 -s 198.216.234.51 --dport 50378 -j ACCEPT
iptables -A FORWARD -p 191 -j test3
iptables -A test3 -d 70.0.99.203 -j ACCEPT
iptables -A FORWARD -p 6 -d 38.140.0.0/16 --dport 10368 -j DROP
iptables -A FORWARD -s 24.111.0.0/16 -p 138 -j DROP
iptables -A OUTPUT -p 6 --sport 25552 -s 241.168.0.0/16 -d 70.41.102.22 -j DROP
iptables -A test2 -p 8 -j DROP
iptables -A test2 -p 17 -d 175.139.252.213 --dport 58173 --sport 33120 -j ACCEPT
iptables -A test1 -p 6 --dport 20991 -j ACCEPT
iptables -A OUTPUT -p 17 -s 163.79.0.0/16 --dport 65452 -j test2
iptables -A test1 -p 17 --sport 534 -j ACCEPT
iptables -A INPUT -p 159 -j DROP
iptables -A test1 -s 171.0.0.0/8 -d 130.38.51.42 -j DROP
iptables -A FORWARD -p 6 --sport 15372 -j ACCEPT
iptables -A test3 -p 6 --dport 32240 -d 110.115.157.148 -j DROP
iptables -A INPUT -d 124.0.0.0/8 -s 189.186.0.0/16 -j DROP
iptables -A test2 -p 6 --sport 63497 -d 227.124.239.160 -s 98.77.230.0/24 -j ACCEPT
iptables -A INPUT -p 17 --dport 30895 --sport 20300 -j ACCEPT
iptables -A test3 -s 200.37.207.184 -p 16 -d 128.0.0.0/8 -j ACCEPT
iptables -A FORWARD -d 112.165.97.249 -j ACCEPT
iptables -A INPUT -p 6 --sport 50158 --dport 54477 -j ACCEPT
iptables -A test1 -s 148.172.11.156 -d 20.103.254.93 -p 177 -j DROP
iptables -A test3 -p 26 -d 115.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --sport 20911 -j DROP
iptables -A test3 -p 6 --dport 41453 -d 82.113.210.93 --sport 28277 -j ACCEPT
iptables -A test2 -p 6 --sport 41458 --dport 63067 -d 234.136.123.244 -j DROP
iptables -A test1 -p 17 -s 41.100.207.174 --dport 34488 -d 156.98.96.154 --sport 64221 -j DROP
iptables -A OUTPUT -p 6 -s 129.52.136.159 --sport 2740 -j DROP
iptables -A FORWARD -s 254.218.225.108 -j ACCEPT
iptables -A test1 -p 17 -s 128.149.7.144 -d 198.222.78.164 --sport 6066 -j DROP
iptables -A INPUT -p 6 --dport 56581 -s 198.223.170.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 58736 -d 182.112.61.0/24 --sport 48074 -j DROP
iptables -A OUTPUT -p 17 --dport 28077 -s 44.205.162.0/24 --sport 48590 -d 103.59.80.0/24 -j ACCEPT
iptables -A test3 -p 17 -s 129.60.133.229 --dport 9947 --sport 29474 -d 123.50.27.0/24 -j ACCEPT
iptables -A test2 -p 6 -d 65.65.229.0/24 -s 152.167.0.0/16 --sport 60362 -j DROP
iptables -A OUTPUT -d 169.225.26.100 -p 63 -j DROP
iptables -A test3 -p 6 -d 225.21.0.0/16 --sport 56894 -s 89.228.227.0/24 -j ACCEPT
iptables -A test3 -d 5.120.170.102 -p 24 -j DROP
iptables -A test1 -p 6 --sport 48687 --dport 14439 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 31555 -d 233.111.169.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 27687 -j ACCEPT
iptables -A OUTPUT -p 6 -d 67.59.1.65 --dport 33130 -j DROP
iptables -A INPUT -p 17 --dport 18584 -s 188.193.0.0/16 -j DROP
iptables -A OUTPUT -p 17 -s 180.205.18.186 --sport 59036 -j DROP
iptables -A OUTPUT -p 17 --sport 16298 -s 24.131.88.11 --dport 27885 -j test1
iptables -A test2 -d 56.241.38.244 -j ACCEPT
iptables -A test1 -p 6 -s 235.136.144.144 -d 58.141.50.192 --dport 16033 -j ACCEPT
iptables -A test1 -p 17 --dport 58922 -j ACCEPT
iptables -A test3 -p 6 --sport 63318 --dport 51408 -d 47.189.101.8 -j ACCEPT
iptables -A test3 -p 17 --sport 56657 --dport 43068 -j ACCEPT
iptables -A test1 -p 6 --sport 49375 -d 20.0.0.0/8 -j DROP
iptables -A INPUT -p 231 -j ACCEPT
iptables -A test2 -s 148.68.11.120 -j DROP
iptables -A test3 -d 174.0.0.0/8 -s 121.64.0.0/16 -p 211 -j ACCEPT
iptables -A test3 -p 6 --dport 42661 -d 38.179.73.0/24 -j DROP
iptables -A test1 -p 17 -d 175.0.0.0/8 --dport 64260 -s 120.184.140.113 -j ACCEPT
iptables -A test2 -d 87.182.141.0/24 -j DROP
iptables -A test1 -p 17 --dport 34928 -j DROP
iptables -A FORWARD -p 6 -s 224.114.0.0/16 --sport 37520 --dport 46731 -j ACCEPT
iptables -A test3 -p 6 --dport 44676 -d 79.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 -d 185.180.145.230 --sport 23661 --dport 34771 -j ACCEPT
iptables -A FORWARD -p 17 -s 230.95.0.0/16 -d 192.209.188.42 --sport 65384 -j ACCEPT
iptables -A test2 -p 17 -s 202.156.0.0/16 -d 120.91.35.179 --sport 58112 -j DROP
iptables -A OUTPUT -s 30.128.112.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 37424 -s 25.150.190.195 -d 6.58.210.212 -j DROP
iptables -A FORWARD -p 6 --sport 38454 -s 26.179.190.0/24 -j test1
iptables -A INPUT -p 6 -s 15.193.200.188 --dport 36330 --sport 10697 -j ACCEPT
iptables -A FORWARD -d 13.68.0.0/16 -j DROP
iptables -A test1 -p 6 -s 32.144.135.196 -d 28.1.150.123 --sport 26868 -j DROP
iptables -A FORWARD -p 17 --dport 9383 -j ACCEPT
iptables -A OUTPUT -s 11.0.0.0/8 -p 183 -j ACCEPT
iptables -A test2 -p 6 --dport 38987 -d 47.160.0.0/16 -j DROP
iptables -A test2 -p 149 -j ACCEPT
iptables -A test2 -p 17 --sport 43518 -d 197.112.0.0/16 -j DROP