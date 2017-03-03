iptables -N test1
iptables -N test2
iptables -N test3
iptables -A FORWARD -p 17 --dport 44044 -s 52.6.0.0/16 -j DROP
iptables -A test1 -p 17 --dport 31730 -d 230.69.56.160 -s 27.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 2375 -j DROP
iptables -A OUTPUT -s 33.0.0.0/8 -d 73.67.38.0/24 -j ACCEPT
iptables -A test2 -p 56 -j ACCEPT
iptables -A INPUT -p 6 --dport 61769 -d 95.225.0.0/16 -j ACCEPT
iptables -A test1 -p 120 -d 5.50.11.0/24 -j ACCEPT
iptables -A INPUT -p 17 --sport 18604 -s 158.194.178.0/24 -d 92.252.10.211 -j ACCEPT
iptables -A FORWARD -p 17 -d 244.5.0.0/16 --dport 6127 -j ACCEPT
iptables -A FORWARD -p 6 --dport 24470 -j ACCEPT
iptables -A OUTPUT -d 36.244.241.195 -p 159 -s 189.15.4.0/24 -j DROP
iptables -A test3 -p 6 -d 162.244.174.71 --dport 43591 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 33638 -s 120.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 -d 219.0.0.0/8 --dport 39432 -j DROP
iptables -A OUTPUT -p 216 -s 188.0.0.0/8 -j ACCEPT
iptables -A test1 -p 82 -d 57.93.205.128 -s 243.57.254.119 -j DROP
iptables -A test1 -p 17 --dport 26484 -d 233.109.212.155 -j DROP
iptables -A INPUT -p 6 -s 103.163.0.0/16 --dport 6451 -j ACCEPT
iptables -A INPUT -p 17 -s 237.212.0.0/16 -d 115.0.0.0/8 --sport 36249 -j ACCEPT
iptables -A INPUT -s 7.6.0.0/16 -j ACCEPT
iptables -A test2 -p 74 -d 219.135.69.142 -j ACCEPT
iptables -A test1 -d 204.105.161.0/24 -j ACCEPT
iptables -A test1 -p 17 -d 56.138.130.110 --dport 8704 -s 99.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 -d 6.100.92.135 --dport 24615 -s 232.240.45.20 -j ACCEPT
iptables -A test1 -p 6 -d 115.96.84.121 --sport 59062 --dport 2158 -j ACCEPT
iptables -A INPUT -p 6 --dport 58984 -s 239.0.0.0/8 --sport 49453 -j ACCEPT
iptables -A test2 -p 17 --dport 53265 --sport 166 -s 201.116.155.124 -j ACCEPT
iptables -A OUTPUT -p 17 -d 135.221.0.0/16 -s 73.53.224.185 --dport 52806 -j DROP
iptables -A test3 -p 6 -d 93.133.0.0/16 --dport 16468 -j ACCEPT
iptables -A FORWARD -p 6 -d 29.116.0.0/16 --dport 597 -s 249.114.38.217 -j DROP
iptables -A test1 -p 6 --sport 21855 --dport 21225 -j DROP
iptables -A OUTPUT -p 17 --dport 59758 -d 149.132.220.221 --sport 39847 -j DROP
iptables -A OUTPUT -s 218.63.0.0/16 -j DROP
iptables -A test3 -p 17 -d 227.237.142.19 --sport 11157 -j DROP
iptables -A test2 -p 6 --dport 50943 --sport 14355 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 55203 -d 248.22.134.249 -j ACCEPT
iptables -A INPUT -p 6 -s 124.246.12.177 -d 101.22.218.49 --sport 37270 -j DROP
iptables -A test1 -p 6 -d 161.58.76.3 --sport 33462 -s 194.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --sport 56415 -j ACCEPT
iptables -A test3 -p 17 --sport 44430 -j DROP
iptables -A OUTPUT -p 17 --dport 65212 --sport 44735 -j DROP
iptables -A FORWARD -p 17 -d 202.84.198.94 -j ACCEPT
iptables -A test3 -p 6 --sport 2261 -j ACCEPT
iptables -A INPUT -p 6 --dport 63924 -j ACCEPT
iptables -A test2 -p 6 --dport 49932 -j ACCEPT
iptables -A OUTPUT -s 52.223.198.69 -p 62 -d 161.176.124.162 -j test2
iptables -A test1 -p 6 -d 180.0.0.0/8 --sport 34746 -s 249.226.69.121 --dport 54635 -j ACCEPT
iptables -A INPUT -p 17 --sport 15322 --dport 63463 -s 87.25.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --dport 26865 --sport 60162 -d 59.103.45.20 -j ACCEPT
iptables -A INPUT -p 6 --dport 56802 --sport 50673 -j DROP
iptables -A FORWARD -p 6 -d 198.0.0.0/8 --dport 6068 -s 4.7.152.46 --sport 53495 -j ACCEPT
iptables -A test3 -p 6 --dport 19217 -s 47.168.240.39 --sport 45358 -j ACCEPT
iptables -A INPUT -p 150 -s 158.93.0.0/16 -d 172.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 184 -s 138.55.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --dport 10776 -s 190.1.41.171 --sport 64862 -j DROP
iptables -A INPUT -p 17 --sport 39151 -j DROP
iptables -A test1 -p 6 --sport 16868 -d 3.162.152.106 -s 97.193.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --sport 41208 -j ACCEPT
iptables -A FORWARD -p 6 --dport 39138 -s 55.181.234.15 -j ACCEPT
iptables -A test1 -p 17 --dport 19466 --sport 26222 -s 179.253.8.166 -j DROP
iptables -A test2 -p 17 --dport 65487 -s 41.0.0.0/8 --sport 8003 -j ACCEPT
iptables -A test2 -p 17 --dport 29727 -j ACCEPT
iptables -A test3 -p 17 --dport 16963 -j ACCEPT
iptables -A test2 -p 17 --sport 26175 --dport 57597 -s 236.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -d 241.143.111.0/24 --dport 49552 -j ACCEPT
iptables -A INPUT -p 6 --dport 3799 -j ACCEPT
iptables -A OUTPUT -d 247.51.60.58 -p 93 -s 212.187.13.32 -j DROP
iptables -A test1 -p 6 --sport 35600 --dport 43869 -s 20.173.154.202 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 55620 -j DROP
iptables -A test3 -p 6 -d 192.254.171.103 --sport 11320 --dport 38669 -j DROP
iptables -A OUTPUT -p 17 -d 208.218.62.0/24 --dport 13801 -j DROP
iptables -A test1 -p 17 --dport 17188 -j DROP
iptables -A OUTPUT -p 6 --dport 46162 -j DROP
iptables -A INPUT -p 17 --sport 19271 --dport 39758 -j DROP
iptables -A INPUT -s 131.131.178.148 -d 196.141.0.0/16 -j DROP
iptables -A test3 -p 17 -s 192.135.0.0/16 -d 147.193.9.22 --sport 39223 -j ACCEPT
iptables -A test1 -p 17 --dport 65490 -j DROP
iptables -A OUTPUT -p 6 --sport 6897 -d 7.140.236.1 -s 230.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --sport 31616 --dport 27916 -s 110.109.13.227 -j ACCEPT
iptables -A OUTPUT -p 6 -s 148.41.34.114 --sport 50433 -d 180.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 57482 -d 143.246.147.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 15263 -s 122.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -d 248.77.41.120 --dport 33763 -j ACCEPT
iptables -A test1 -p 6 --sport 9884 --dport 13513 -s 69.188.112.165 -j DROP
iptables -A OUTPUT -p 17 -s 113.187.27.130 --dport 28694 -d 157.185.166.0/24 -j ACCEPT
iptables -A test3 -p 104 -j ACCEPT
iptables -A OUTPUT -p 17 -d 146.50.207.37 --sport 35424 --dport 45223 -j DROP
iptables -A test3 -p 6 -s 225.249.161.25 --dport 7300 -j ACCEPT
iptables -A test2 -p 6 --sport 63466 -s 83.184.53.160 --dport 6318 -j ACCEPT
iptables -A test2 -p 6 -s 7.182.0.0/16 --dport 44886 -d 64.165.109.184 -j ACCEPT
iptables -A OUTPUT -d 189.0.0.0/8 -s 34.110.141.128 -j DROP
iptables -A test3 -p 17 -s 223.241.160.214 --dport 11649 --sport 19369 -j ACCEPT
iptables -A test2 -p 6 --dport 56363 -d 166.0.0.0/8 -s 200.97.0.0/16 -j DROP
iptables -A INPUT -p 17 --dport 38591 -j ACCEPT
iptables -A test2 -p 17 -d 83.133.194.0/24 -s 112.222.1.185 --dport 9369 -j ACCEPT
iptables -A test1 -s 38.87.0.0/16 -j DROP
iptables -A test3 -s 18.0.0.0/8 -j ACCEPT
iptables -A test2 -s 58.187.141.13 -d 49.127.132.170 -p 192 -j DROP
iptables -A test2 -p 17 --sport 51815 --dport 18124 -d 160.147.65.48 -j ACCEPT
iptables -A FORWARD -p 17 --sport 52814 -j ACCEPT