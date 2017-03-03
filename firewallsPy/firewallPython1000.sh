iptables -N test1
iptables -N test2
iptables -N test3
iptables -A test1 -s 163.0.0.0/8 -d 49.0.0.0/8 -j DROP
iptables -A test1 -d 31.62.167.60 -j DROP
iptables -A INPUT -p 6 --sport 22667 -s 164.195.119.249 -j ACCEPT
iptables -A FORWARD -d 212.219.0.31 -p 208 -s 39.118.140.154 -j ACCEPT
iptables -A FORWARD -p 6 --dport 25068 -d 105.94.0.0/16 -j ACCEPT
iptables -A test1 -d 14.11.186.0/24 -s 157.138.237.139 -j DROP
iptables -A INPUT -p 6 --sport 28748 -j ACCEPT
iptables -A test2 -p 17 --sport 40862 -j DROP
iptables -A test1 -p 6 --sport 2106 -d 36.39.1.0/24 --dport 9683 -s 9.243.47.168 -j DROP
iptables -A test3 -p 6 --sport 63726 -j ACCEPT
iptables -A test1 -p 6 --sport 64161 -s 242.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 -d 196.0.0.0/8 --sport 15665 -j ACCEPT
iptables -A INPUT -p 6 --dport 3164 -j ACCEPT
iptables -A test1 -p 17 --dport 33741 -s 241.218.0.0/16 -j ACCEPT
iptables -A INPUT -s 154.120.0.0/16 -j test2
iptables -A OUTPUT -d 173.150.171.109 -j ACCEPT
iptables -A test2 -p 17 --sport 21731 -s 47.232.231.157 -j DROP
iptables -A OUTPUT -p 17 --sport 10575 -j DROP
iptables -A test2 -p 6 --sport 42200 -d 135.152.233.0/24 -s 90.207.183.135 -j DROP
iptables -A test1 -p 6 --sport 22817 --dport 1818 -j DROP
iptables -A OUTPUT -p 88 -j ACCEPT
iptables -A FORWARD -p 17 -d 34.237.136.182 --dport 23741 --sport 62426 -j ACCEPT
iptables -A test1 -p 6 --dport 65005 --sport 24774 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 11448 -d 86.205.176.103 -s 64.88.23.157 -j DROP
iptables -A test2 -p 6 --dport 59331 -j ACCEPT
iptables -A FORWARD -d 172.0.0.0/8 -j DROP
iptables -A test2 -p 6 -d 56.24.115.96 --dport 36165 -j DROP
iptables -A test3 -d 86.234.217.96 -j ACCEPT
iptables -A INPUT -p 220 -j test3
iptables -A FORWARD -p 17 --dport 605 --sport 24267 -j DROP
iptables -A test3 -s 130.72.106.102 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 63061 -s 83.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 64 -s 41.242.231.240 -j DROP
iptables -A test1 -p 6 --sport 17996 -j ACCEPT
iptables -A FORWARD -p 6 --sport 50910 -s 89.142.246.80 -d 18.204.0.0/16 -j ACCEPT
iptables -A test1 -p 6 -d 206.37.51.96 --dport 57000 -j DROP
iptables -A INPUT -p 6 -s 188.0.0.0/8 --dport 17135 -j ACCEPT
iptables -A test2 -p 6 --dport 14733 -j DROP
iptables -A test2 -s 249.68.9.17 -j ACCEPT
iptables -A OUTPUT -p 6 -d 96.42.147.160 --dport 44591 -j DROP
iptables -A test1 -p 17 --dport 49301 -j DROP
iptables -A test2 -p 6 --dport 28159 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 10120 -d 13.247.0.0/16 -s 131.59.63.77 -j ACCEPT
iptables -A INPUT -p 6 -d 23.0.0.0/8 --sport 22197 -j DROP
iptables -A INPUT -s 189.216.0.0/16 -p 246 -j ACCEPT
iptables -A test1 -p 6 --sport 51035 -s 163.78.208.0/24 -j ACCEPT
iptables -A INPUT -p 6 -s 230.220.77.200 --dport 37997 --sport 58298 -j DROP
iptables -A test2 -p 6 -d 111.213.150.184 --sport 33961 -j ACCEPT
iptables -A OUTPUT -p 17 -s 42.189.0.0/16 --dport 27619 -j DROP
iptables -A OUTPUT -p 6 -s 205.91.243.234 --dport 59158 -j ACCEPT
iptables -A INPUT -p 6 --dport 29890 -j ACCEPT
iptables -A FORWARD -p 72 -d 42.5.254.89 -j ACCEPT
iptables -A test1 -p 17 -s 106.60.46.151 -d 78.156.137.55 --dport 24434 -j DROP
iptables -A FORWARD -p 17 -d 34.142.180.0/24 --dport 6468 -s 137.147.211.138 -j ACCEPT
iptables -A test2 -p 151 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 40997 -s 137.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -d 119.183.27.249 --dport 38314 -j ACCEPT
iptables -A FORWARD -p 17 --dport 45425 -j ACCEPT
iptables -A test3 -p 6 --sport 38818 -j DROP
iptables -A test3 -p 6 --sport 12190 -s 131.254.0.0/16 -j DROP
iptables -A FORWARD -d 114.61.246.197 -j DROP
iptables -A INPUT -p 6 --sport 65107 -s 116.124.133.33 -d 97.214.145.226 -j ACCEPT
iptables -A test3 -p 6 --dport 57775 -j ACCEPT
iptables -A test3 -p 17 -s 117.235.121.57 --sport 24850 -d 23.235.42.193 -j ACCEPT
iptables -A FORWARD -p 6 --sport 44367 -j DROP
iptables -A test2 -p 6 -s 236.0.0.0/8 --sport 43759 -d 144.0.0.0/8 -j DROP
iptables -A test2 -p 6 -s 102.71.117.187 -d 141.141.0.0/16 --dport 30129 -j DROP
iptables -A INPUT -p 6 -s 19.86.120.0/24 --sport 36213 --dport 21384 -j ACCEPT
iptables -A test1 -p 6 -s 91.202.187.0/24 --dport 44942 --sport 18171 -j ACCEPT
iptables -A test2 -p 6 --sport 30709 -d 196.102.60.159 --dport 4677 -j ACCEPT
iptables -A test2 -p 233 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 45340 -d 145.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 -d 77.3.78.41 -s 80.5.178.0/24 --sport 57534 -j DROP
iptables -A test1 -s 243.85.13.37 -p 136 -j ACCEPT
iptables -A test1 -p 17 --dport 51911 -s 56.0.0.0/8 --sport 9155 -d 42.105.0.0/16 -j ACCEPT
iptables -A test1 -p 6 -d 42.143.80.207 --dport 64825 --sport 29171 -j ACCEPT
iptables -A INPUT -s 21.193.163.202 -j ACCEPT
iptables -A INPUT -p 17 --dport 10057 -d 183.0.0.0/8 -j ACCEPT
iptables -A INPUT -d 32.88.0.0/16 -j ACCEPT
iptables -A test3 -p 17 -s 113.123.144.0/24 --sport 36886 --dport 16566 -j DROP
iptables -A INPUT -p 6 --dport 63423 --sport 42636 -j test2
iptables -A FORWARD -p 6 -d 219.206.63.0/24 -s 80.23.0.0/16 --dport 6264 -j DROP
iptables -A OUTPUT -s 210.147.217.37 -j DROP
iptables -A test1 -p 6 --sport 61871 -s 150.9.0.0/16 -d 65.174.0.0/16 -j DROP
iptables -A INPUT -p 6 --sport 7018 -j DROP
iptables -A test1 -p 6 --sport 33097 -j DROP
iptables -A INPUT -d 69.196.0.0/16 -s 52.237.154.166 -j test1
iptables -A test2 -p 6 --dport 54270 -j DROP
iptables -A test1 -d 103.151.130.0/24 -s 120.94.0.0/16 -j DROP
iptables -A FORWARD -p 6 --sport 5635 -j ACCEPT
iptables -A test2 -p 33 -j ACCEPT
iptables -A OUTPUT -p 101 -j ACCEPT
iptables -A test1 -p 17 -s 63.0.0.0/8 -d 76.157.250.247 --sport 38212 -j ACCEPT
iptables -A OUTPUT -s 22.55.47.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 39617 -s 14.224.97.141 -j ACCEPT
iptables -A test2 -p 6 --dport 41913 -j DROP
iptables -A OUTPUT -p 122 -d 241.39.216.22 -s 218.0.0.0/8 -j DROP
iptables -A OUTPUT -s 219.165.49.44 -d 45.33.0.0/16 -j DROP
iptables -A test2 -p 6 --sport 31623 -d 161.0.0.0/8 --dport 34043 -j ACCEPT
iptables -A test2 -d 223.45.233.212 -j DROP
iptables -A test1 -p 6 --dport 50469 --sport 10041 -d 230.26.0.0/16 -j DROP
iptables -A FORWARD -s 94.30.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --sport 28059 --dport 33988 -s 133.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --dport 42675 -d 11.124.136.0/24 -j DROP
iptables -A OUTPUT -p 17 -s 87.28.110.197 --dport 49245 -j DROP
iptables -A FORWARD -s 148.0.0.0/8 -j DROP
iptables -A test1 -p 6 -s 255.84.87.0/24 -d 85.60.142.50 --dport 33733 --sport 34967 -j DROP
iptables -A FORWARD -p 6 -s 208.213.0.0/16 --sport 7197 -d 182.78.180.84 -j ACCEPT
iptables -A test2 -p 162 -j ACCEPT
iptables -A test2 -p 17 --sport 23223 --dport 27273 -s 101.238.119.158 -j DROP
iptables -A test1 -p 6 --sport 55406 -d 105.36.0.0/16 -s 136.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 31742 -j ACCEPT
iptables -A test3 -p 17 -s 21.254.44.10 --sport 24468 -j DROP
iptables -A test2 -p 17 --dport 26608 -s 228.212.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 87 -j test1
iptables -A test3 -p 6 --dport 15453 --sport 48985 -d 25.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 98 -j ACCEPT
iptables -A test3 -p 6 -s 66.117.82.0/24 --sport 12587 -j ACCEPT
iptables -A test1 -p 17 -d 21.163.1.180 --dport 48321 -s 218.170.0.0/16 -j ACCEPT
iptables -A test1 -p 17 -d 141.159.232.181 --dport 49620 -j ACCEPT
iptables -A OUTPUT -p 6 -s 106.99.47.157 --dport 53433 -j ACCEPT
iptables -A test2 -p 6 --sport 3107 -j ACCEPT
iptables -A FORWARD -p 17 --dport 57391 -j ACCEPT
iptables -A test1 -d 177.146.93.147 -s 206.3.243.0/24 -j DROP
iptables -A INPUT -p 52 -j ACCEPT
iptables -A INPUT -s 126.70.117.253 -d 120.60.0.0/16 -p 3 -j DROP
iptables -A test2 -s 157.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 -d 125.70.0.0/16 -s 16.108.214.242 --dport 16507 -j ACCEPT
iptables -A test2 -p 17 --sport 4792 -j ACCEPT
iptables -A INPUT -p 17 --sport 6653 -s 177.27.188.218 -j ACCEPT
iptables -A test2 -p 6 -d 244.216.120.28 --sport 54998 -s 29.84.146.193 -j DROP
iptables -A OUTPUT -p 17 --dport 11855 -j ACCEPT
iptables -A OUTPUT -p 17 -s 83.245.56.56 -d 158.211.52.118 --sport 52327 -j ACCEPT
iptables -A test3 -p 17 --sport 27810 -d 124.99.82.71 --dport 58632 -j ACCEPT
iptables -A test2 -p 17 --dport 61688 -j ACCEPT
iptables -A test2 -p 17 --sport 33362 -s 233.177.181.14 --dport 24139 -j DROP
iptables -A test3 -p 17 -d 235.153.81.174 --dport 4992 --sport 31547 -j DROP
iptables -A test3 -p 17 -d 97.25.200.193 --dport 54015 --sport 8490 -s 195.10.246.242 -j DROP
iptables -A test2 -p 63 -j ACCEPT
iptables -A FORWARD -p 6 -d 117.138.105.73 -s 107.235.39.42 --sport 39314 -j DROP
iptables -A FORWARD -p 6 --dport 17771 -j DROP
iptables -A OUTPUT -p 30 -d 226.198.43.0/24 -s 225.168.66.139 -j DROP
iptables -A test2 -p 17 -d 149.59.214.0/24 --dport 51972 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 47168 -j ACCEPT
iptables -A test2 -p 101 -d 237.145.219.179 -s 61.112.0.0/16 -j ACCEPT
iptables -A test2 -p 106 -j DROP
iptables -A test3 -p 17 -d 127.0.0.0/8 --dport 10593 -s 56.0.0.0/8 --sport 37799 -j ACCEPT
iptables -A FORWARD -d 153.13.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --dport 51572 -j DROP
iptables -A test2 -p 6 --dport 15945 -d 90.0.0.0/8 -s 4.146.51.38 -j ACCEPT
iptables -A test2 -p 6 --sport 26117 --dport 35169 -j DROP
iptables -A INPUT -d 157.40.165.18 -j DROP
iptables -A test3 -p 63 -s 19.193.166.48 -d 80.161.122.139 -j DROP
iptables -A FORWARD -p 6 --sport 24731 -s 82.106.114.133 -j ACCEPT
iptables -A test2 -p 17 --dport 33517 -j ACCEPT
iptables -A FORWARD -p 17 --sport 53652 -j DROP
iptables -A test1 -p 17 --dport 18691 -d 98.211.4.94 -s 62.128.132.1 -j ACCEPT
iptables -A test1 -p 37 -j DROP
iptables -A test2 -p 17 --dport 9867 --sport 40100 -s 230.156.50.0/24 -j ACCEPT
iptables -A INPUT -p 6 -d 58.27.0.0/16 --sport 51350 -j DROP
iptables -A test1 -p 17 --sport 15723 -d 77.138.224.56 -j ACCEPT
iptables -A INPUT -d 86.75.79.236 -j DROP
iptables -A test1 -p 6 --sport 14400 -j DROP
iptables -A test2 -p 6 --sport 57849 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 29813 -j ACCEPT
iptables -A INPUT -p 142 -j ACCEPT
iptables -A OUTPUT -p 123 -d 107.178.100.39 -j ACCEPT
iptables -A FORWARD -p 39 -j ACCEPT
iptables -A test1 -p 44 -s 112.157.242.0/24 -j DROP
iptables -A FORWARD -p 17 -d 117.199.167.0/24 --dport 61242 -j ACCEPT
iptables -A FORWARD -p 6 --sport 33673 -j ACCEPT
iptables -A test1 -p 17 --sport 30038 -s 62.189.109.159 -j ACCEPT
iptables -A OUTPUT -s 48.61.131.171 -d 104.26.186.91 -p 165 -j ACCEPT
iptables -A test1 -p 17 -s 84.21.233.222 -d 224.115.0.0/16 --sport 34242 --dport 40020 -j DROP
iptables -A test1 -p 6 --sport 54213 -d 146.51.207.150 --dport 6894 -j DROP
iptables -A test2 -p 17 -s 224.184.85.107 -d 166.171.72.216 --sport 36215 -j ACCEPT
iptables -A FORWARD -p 6 --sport 20563 --dport 10735 -j DROP
iptables -A test2 -p 17 --dport 62196 -j ACCEPT
iptables -A test2 -p 17 -d 145.116.142.140 --sport 38247 --dport 64168 -j ACCEPT
iptables -A test3 -p 17 -d 55.114.183.0/24 -s 161.80.145.163 --dport 21776 --sport 51176 -j DROP
iptables -A FORWARD -p 17 -s 65.18.242.90 --dport 57342 -j ACCEPT
iptables -A test1 -p 199 -j DROP
iptables -A OUTPUT -p 17 --dport 41449 -d 79.61.74.0/24 -j DROP
iptables -A test2 -p 6 --dport 45311 --sport 51350 -j ACCEPT
iptables -A test2 -p 17 --sport 42513 --dport 10480 -s 149.9.9.109 -j ACCEPT
iptables -A test1 -p 17 --dport 48832 -j DROP
iptables -A FORWARD -p 17 -s 124.231.95.0/24 --dport 47390 -j ACCEPT
iptables -A test1 -p 17 --dport 21498 -j DROP
iptables -A test2 -p 8 -s 189.111.165.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --sport 20221 -d 152.0.0.0/8 -s 16.179.115.50 -j DROP
iptables -A test1 -p 6 --sport 39197 -s 13.182.104.58 -d 136.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 -d 148.11.42.247 --sport 27130 -s 253.140.0.0/16 -j ACCEPT
iptables -A test3 -d 94.123.241.113 -p 241 -s 68.188.0.0/16 -j ACCEPT
iptables -A test3 -d 38.33.27.180 -s 87.220.121.167 -p 176 -j ACCEPT
iptables -A test1 -p 6 -d 75.226.74.0/24 --dport 13282 -j DROP
iptables -A OUTPUT -p 17 --sport 21029 -d 66.173.200.43 --dport 37265 -j ACCEPT
iptables -A test3 -s 233.164.137.38 -d 179.128.184.95 -j ACCEPT
iptables -A test1 -p 17 --sport 39661 -d 50.80.51.0/24 -j DROP
iptables -A INPUT -p 6 --sport 29881 --dport 43012 -s 198.16.136.0/24 -j DROP
iptables -A OUTPUT -p 17 --sport 37904 -s 217.112.66.154 -j ACCEPT
iptables -A test1 -p 17 -s 129.26.210.146 -d 108.169.32.85 --dport 51737 --sport 31086 -j ACCEPT
iptables -A test2 -p 17 --sport 10789 -j DROP
iptables -A test3 -p 6 -d 101.214.0.0/16 --sport 52361 --dport 3273 -j ACCEPT
iptables -A INPUT -p 6 -d 171.59.173.13 -s 237.175.216.0/24 --dport 336 --sport 39483 -j ACCEPT
iptables -A INPUT -p 17 --sport 14139 -s 62.28.212.108 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 27383 -j DROP
iptables -A test2 -p 17 --dport 12148 --sport 22913 -j ACCEPT
iptables -A test3 -p 17 --sport 5773 --dport 44796 -j DROP
iptables -A test1 -p 17 --dport 49032 -s 60.0.0.0/8 --sport 25590 -j ACCEPT
iptables -A test1 -p 17 --sport 58155 -j ACCEPT
iptables -A test3 -p 6 --dport 9872 --sport 15566 -s 58.135.122.14 -d 247.41.105.131 -j ACCEPT
iptables -A FORWARD -p 6 -d 71.60.182.75 -s 180.167.239.218 --dport 1844 -j DROP
iptables -A OUTPUT -p 17 -s 238.0.0.0/8 --sport 7586 --dport 16296 -j test2
iptables -A test2 -p 17 --dport 19137 -d 82.219.15.222 -j DROP
iptables -A test2 -p 17 --sport 15442 -s 6.43.237.244 --dport 25172 -j ACCEPT
iptables -A test2 -p 6 -s 43.206.203.196 -d 209.0.0.0/8 --dport 52629 -j ACCEPT
iptables -A test1 -p 6 -d 148.219.132.238 -s 255.0.0.0/8 --dport 11223 -j ACCEPT
iptables -A FORWARD -p 6 --dport 65514 -s 73.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 -s 86.170.172.86 -d 45.218.116.129 --sport 31432 -j DROP
iptables -A test1 -p 17 --sport 38039 -d 64.106.98.0/24 -j DROP
iptables -A FORWARD -p 131 -j DROP
iptables -A FORWARD -p 6 -d 63.46.205.83 --sport 51279 -s 31.184.156.66 -j ACCEPT
iptables -A INPUT -s 162.228.62.147 -j DROP
iptables -A test1 -p 6 -s 199.219.0.0/16 --sport 61880 --dport 31304 -j ACCEPT
iptables -A test2 -s 226.28.212.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 -d 221.0.0.0/8 --sport 43791 --dport 32773 -j test3
iptables -A test2 -p 6 -d 104.192.253.243 -s 122.128.0.0/16 --dport 45316 -j ACCEPT
iptables -A INPUT -p 206 -j DROP
iptables -A test3 -p 6 --sport 32137 -s 216.28.224.0/24 --dport 39956 -j ACCEPT
iptables -A test1 -s 118.33.0.0/16 -j DROP
iptables -A FORWARD -s 115.145.132.132 -d 28.255.52.0/24 -j ACCEPT
iptables -A test3 -p 17 -d 198.27.75.0/24 -s 32.0.0.0/8 --sport 27752 -j DROP
iptables -A test3 -p 17 -s 229.18.16.80 --dport 26259 -j DROP
iptables -A test1 -p 17 --sport 20440 -d 97.59.206.124 -j ACCEPT
iptables -A test2 -p 6 -d 56.194.205.62 --dport 27524 -s 52.149.181.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 62407 --dport 11565 -j ACCEPT
iptables -A INPUT -p 17 -d 244.101.206.11 --sport 46594 -s 126.0.0.0/8 -j ACCEPT
iptables -A test2 -p 207 -j ACCEPT
iptables -A test1 -p 128 -s 123.16.0.0/16 -j DROP
iptables -A test3 -p 17 --dport 60412 --sport 11055 -d 209.95.202.163 -j ACCEPT
iptables -A test3 -p 17 -d 203.51.213.217 --dport 38094 -j DROP
iptables -A INPUT -p 6 --dport 2648 -s 5.140.0.0/16 -j DROP
iptables -A test1 -p 17 -s 129.99.0.0/16 --dport 39884 --sport 54530 -j DROP
iptables -A INPUT -p 6 --dport 63364 -j ACCEPT
iptables -A test1 -p 6 -s 148.61.0.0/16 --sport 34440 -j ACCEPT
iptables -A OUTPUT -d 67.180.97.0/24 -j DROP
iptables -A test3 -d 203.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --dport 53571 --sport 14325 -j ACCEPT
iptables -A FORWARD -p 6 --dport 20552 --sport 26094 -d 186.12.168.134 -j DROP
iptables -A test1 -d 75.104.8.3 -s 30.178.81.44 -j ACCEPT
iptables -A test1 -p 6 --sport 12337 -s 202.165.88.22 -j ACCEPT
iptables -A test3 -p 6 --dport 51066 --sport 41818 -j ACCEPT
iptables -A test3 -p 17 -s 205.87.250.223 -d 171.0.0.0/8 --dport 44972 --sport 40855 -j ACCEPT
iptables -A test2 -d 138.126.0.0/16 -j ACCEPT
iptables -A test1 -p 6 -d 133.168.148.179 --sport 57613 -s 117.115.192.236 -j ACCEPT
iptables -A test2 -p 123 -s 116.219.141.76 -j DROP
iptables -A test3 -p 205 -j DROP
iptables -A INPUT -p 6 --dport 46150 --sport 55490 -d 117.13.240.135 -j ACCEPT
iptables -A test1 -d 68.194.119.0/24 -p 116 -j ACCEPT
iptables -A INPUT -p 6 -d 15.18.209.0/24 --dport 56740 -j DROP
iptables -A OUTPUT -p 6 -s 228.66.8.0/24 --dport 61920 --sport 58018 -d 222.157.202.20 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 62126 -d 39.0.0.0/8 -s 47.0.0.0/8 -j test3
iptables -A OUTPUT -d 229.210.105.54 -p 65 -s 111.37.149.137 -j DROP
iptables -A FORWARD -p 6 --sport 58916 --dport 11105 -d 11.216.177.76 -j ACCEPT
iptables -A test1 -p 6 -s 210.31.146.0/24 --sport 30399 -j ACCEPT
iptables -A test3 -p 6 -s 7.223.11.77 -d 83.147.141.36 --dport 31059 -j DROP
iptables -A OUTPUT -p 17 -s 168.25.243.196 --dport 58431 -d 14.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -d 222.170.47.0/24 --sport 46133 -s 175.25.216.216 -j ACCEPT
iptables -A test3 -p 17 --dport 17234 -s 129.0.0.0/8 -j DROP
iptables -A INPUT -p 235 -s 218.64.151.0/24 -d 195.39.207.102 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 7991 -d 17.16.104.34 --dport 45639 -j test3
iptables -A test3 -p 17 -d 69.150.41.16 --dport 35994 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 28053 -j DROP
iptables -A test3 -p 6 -s 85.224.12.222 --dport 40721 -j DROP
iptables -A test2 -p 6 -s 74.0.0.0/8 --sport 60955 -d 162.99.0.0/16 -j DROP
iptables -A test1 -p 6 --sport 19796 -j DROP
iptables -A test1 -p 17 --dport 839 --sport 2780 -d 175.64.68.139 -s 104.188.167.0/24 -j DROP
iptables -A INPUT -p 17 --dport 20233 -j DROP
iptables -A test2 -p 157 -j DROP
iptables -A test3 -p 6 -d 59.175.0.0/16 --sport 59265 --dport 48434 -j DROP
iptables -A INPUT -p 17 --sport 13270 -j DROP
iptables -A OUTPUT -p 17 --sport 23781 --dport 7449 -d 77.163.213.31 -j DROP
iptables -A OUTPUT -p 17 -s 126.92.0.0/16 -d 223.0.0.0/8 --dport 20936 -j ACCEPT
iptables -A test1 -p 6 --sport 45895 -d 215.3.37.0/24 -s 208.136.0.0/16 -j ACCEPT
iptables -A test1 -p 17 -d 214.189.94.90 --sport 16121 -j DROP
iptables -A test1 -p 175 -j ACCEPT
iptables -A FORWARD -p 65 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 27608 -d 212.64.63.39 --dport 41101 -j DROP
iptables -A test1 -p 17 -d 255.122.0.0/16 -s 171.172.121.81 --sport 14830 -j ACCEPT
iptables -A FORWARD -p 6 --sport 38687 -j ACCEPT
iptables -A INPUT -d 4.127.0.0/16 -p 246 -s 124.210.0.0/16 -j DROP
iptables -A FORWARD -p 6 -d 15.225.123.236 --dport 39193 -j DROP
iptables -A OUTPUT -p 17 --sport 61297 -s 182.133.153.0/24 -j DROP
iptables -A INPUT -p 6 --sport 46411 -d 162.0.0.0/8 --dport 6732 -j ACCEPT
iptables -A test3 -p 17 -d 10.13.0.0/16 --dport 43700 -j DROP
iptables -A test2 -p 6 -d 224.133.64.0/24 --sport 40094 --dport 47292 -j ACCEPT
iptables -A test1 -p 6 --sport 57524 --dport 54010 -j ACCEPT
iptables -A test3 -p 6 --sport 56150 -j DROP
iptables -A FORWARD -p 17 --sport 34982 -d 171.0.0.0/8 --dport 61188 -j ACCEPT
iptables -A FORWARD -p 17 --sport 11319 -d 92.54.1.173 -s 131.0.0.0/8 -j DROP
iptables -A test3 -p 17 -d 169.121.47.59 -s 45.0.0.0/8 --dport 1307 -j ACCEPT
iptables -A test1 -p 17 -d 54.16.84.204 --sport 54283 -j ACCEPT
iptables -A INPUT -p 6 --dport 57887 -s 41.63.13.167 --sport 23259 -j DROP
iptables -A test3 -p 6 --sport 35324 -d 4.0.0.0/8 -j DROP
iptables -A test3 -p 6 --sport 20544 -d 80.70.48.22 --dport 6263 -j ACCEPT
iptables -A FORWARD -p 6 --dport 31282 -j DROP
iptables -A test1 -p 17 --dport 11185 -s 93.64.88.21 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 10193 -j test1
iptables -A test1 -p 249 -s 80.250.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -d 23.32.48.96 -s 28.214.210.105 --sport 57274 -j DROP
iptables -A FORWARD -d 87.228.214.0/24 -j ACCEPT
iptables -A test2 -p 6 -d 224.226.142.179 --sport 18745 -j DROP
iptables -A test1 -p 17 --dport 58104 -s 5.112.234.49 -j DROP
iptables -A test2 -p 6 --dport 46127 -j ACCEPT
iptables -A test2 -p 6 --sport 5028 -j ACCEPT
iptables -A INPUT -p 17 --dport 38291 -j DROP
iptables -A OUTPUT -p 17 --sport 44202 -j DROP
iptables -A FORWARD -p 6 -s 55.238.184.57 -d 104.186.0.0/16 --dport 408 -j DROP
iptables -A OUTPUT -p 6 --dport 38377 -d 118.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --sport 20166 --dport 5886 -j DROP
iptables -A FORWARD -p 17 -d 186.37.110.206 --sport 7604 -s 65.88.0.0/16 -j ACCEPT
iptables -A INPUT -s 184.89.161.4 -p 238 -d 158.171.165.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 38698 -d 85.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --dport 5595 -d 207.0.0.0/8 -s 48.153.0.0/16 -j DROP
iptables -A test3 -p 17 --sport 25037 --dport 24613 -j DROP
iptables -A test3 -p 6 --dport 7887 -j DROP
iptables -A FORWARD -p 6 --sport 2015 -j ACCEPT
iptables -A test3 -p 17 --dport 33978 -s 44.108.253.0/24 -j DROP
iptables -A test3 -p 6 -d 186.190.242.0/24 -s 78.145.124.147 --sport 54870 -j ACCEPT
iptables -A OUTPUT -p 6 -s 18.0.172.0/24 --dport 7140 -j ACCEPT
iptables -A test1 -p 6 -d 53.0.0.0/8 --dport 7353 -j DROP
iptables -A OUTPUT -p 193 -j DROP
iptables -A INPUT -s 190.187.48.100 -j DROP
iptables -A test1 -p 6 --dport 51352 -d 34.59.23.37 -j ACCEPT
iptables -A test1 -p 6 --sport 4454 -j DROP
iptables -A test1 -p 6 --dport 25968 -j DROP
iptables -A OUTPUT -p 6 --sport 39576 -j ACCEPT
iptables -A test2 -p 6 --sport 55362 -s 50.124.5.238 -j DROP
iptables -A FORWARD -p 6 --dport 61522 -d 23.61.221.80 -j DROP
iptables -A test1 -d 46.196.183.206 -j DROP
iptables -A test1 -p 17 -d 150.201.233.215 --sport 49204 --dport 61704 -j DROP
iptables -A INPUT -p 17 -d 113.247.110.89 --dport 32650 -j ACCEPT
iptables -A test3 -p 6 -d 198.0.0.0/8 --sport 11536 --dport 64776 -j DROP
iptables -A test1 -s 38.232.65.119 -j DROP
iptables -A OUTPUT -p 6 -s 47.0.0.0/8 --dport 29042 -j DROP
iptables -A OUTPUT -p 6 -s 97.192.173.25 --sport 54637 -j DROP
iptables -A test2 -p 17 -d 251.138.84.143 --dport 10736 -j ACCEPT
iptables -A OUTPUT -p 17 -s 221.146.105.199 --dport 49343 -d 21.44.157.242 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 62382 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 19063 -j ACCEPT
iptables -A FORWARD -p 6 --sport 16253 -d 80.99.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --dport 26315 -s 171.149.90.0/24 -d 6.246.52.64 -j DROP
iptables -A OUTPUT -p 6 -s 20.116.213.94 --sport 9812 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 5955 --sport 18100 -j ACCEPT
iptables -A test2 -p 6 --dport 31496 -s 122.143.182.103 --sport 50074 -d 25.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --sport 23695 -d 70.154.213.16 --dport 57647 -j test2
iptables -A FORWARD -p 17 -d 238.189.182.35 --sport 44348 -j DROP
iptables -A INPUT -p 17 --sport 2408 -j ACCEPT
iptables -A test3 -d 56.232.12.209 -j DROP
iptables -A test3 -p 134 -j DROP
iptables -A test3 -s 133.159.80.175 -p 96 -j ACCEPT
iptables -A INPUT -p 17 --dport 37654 -j DROP
iptables -A test1 -d 43.72.149.159 -j ACCEPT
iptables -A test3 -p 6 --dport 29417 -d 57.210.119.148 -j DROP
iptables -A test3 -p 17 --dport 55213 --sport 23014 -d 42.0.0.0/8 -j DROP
iptables -A test1 -s 197.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 -d 99.43.0.0/16 --dport 20600 -s 110.82.116.11 --sport 60499 -j DROP
iptables -A OUTPUT -p 17 --dport 64507 --sport 21107 -j DROP
iptables -A test1 -p 148 -j DROP
iptables -A test2 -p 6 -s 104.170.40.7 --sport 46328 --dport 49079 -d 72.108.211.244 -j ACCEPT
iptables -A test2 -p 6 --sport 59445 -d 154.118.0.0/16 -j DROP
iptables -A test3 -p 149 -j ACCEPT
iptables -A test2 -p 17 -d 156.166.155.182 --sport 55570 -j ACCEPT
iptables -A INPUT -p 6 -s 76.101.0.0/16 --dport 2776 --sport 34116 -j DROP
iptables -A FORWARD -p 17 --sport 47922 -j DROP
iptables -A test2 -p 6 --dport 10352 -d 95.105.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 46846 --dport 42665 -j DROP
iptables -A OUTPUT -p 17 -d 228.56.173.164 --dport 35353 --sport 23969 -j DROP
iptables -A OUTPUT -p 79 -j DROP
iptables -A test1 -p 17 --sport 47109 -s 208.153.35.71 --dport 52605 -j DROP
iptables -A test1 -p 6 --dport 53586 -d 149.170.55.40 --sport 42410 -j DROP
iptables -A INPUT -s 95.145.49.209 -j DROP
iptables -A INPUT -p 17 --dport 19995 -j ACCEPT
iptables -A FORWARD -p 17 -d 238.94.85.30 --sport 44820 -j test3
iptables -A test2 -p 6 -d 206.0.0.0/8 --sport 28569 -s 26.72.80.157 --dport 64293 -j ACCEPT
iptables -A test3 -p 17 --dport 50504 -j ACCEPT
iptables -A test3 -p 17 --dport 41671 -s 212.0.0.0/8 -j DROP
iptables -A test2 -p 17 --sport 18388 --dport 4967 -j DROP
iptables -A test1 -p 6 --dport 16873 -j DROP
iptables -A test3 -p 198 -j DROP
iptables -A test1 -d 156.249.234.254 -j DROP
iptables -A test1 -p 17 --sport 47146 -j DROP
iptables -A FORWARD -p 6 --sport 60808 -s 188.245.44.25 -j ACCEPT
iptables -A test3 -p 17 --sport 4514 -j DROP
iptables -A test2 -p 17 --dport 10277 -d 13.20.28.27 -s 113.232.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 47135 -j DROP
iptables -A test1 -p 17 --sport 24819 -j DROP
iptables -A FORWARD -p 6 -s 145.176.60.218 --dport 58323 -j ACCEPT
iptables -A OUTPUT -p 17 -s 180.108.7.142 --sport 42753 -j test3
iptables -A test1 -p 17 -d 109.32.111.202 --dport 8336 -s 194.109.193.0/24 -j DROP
iptables -A test1 -p 17 -s 151.254.189.206 --dport 26833 --sport 19192 -j DROP
iptables -A test2 -p 17 -s 190.97.228.136 -d 17.12.26.68 --dport 29560 --sport 24668 -j DROP
iptables -A test1 -p 17 --sport 25048 -d 125.9.191.137 --dport 55856 -j DROP
iptables -A OUTPUT -p 157 -j DROP
iptables -A test3 -p 17 -d 138.118.207.0/24 --dport 64957 --sport 6771 -j DROP
iptables -A OUTPUT -p 6 --dport 2667 -j test3
iptables -A INPUT -p 6 --dport 55513 -d 148.0.0.0/8 -j DROP
iptables -A test2 -p 6 --dport 12639 -d 184.158.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --sport 20343 --dport 12878 -d 35.194.227.0/24 -j DROP
iptables -A INPUT -p 17 -s 144.226.214.186 --sport 61438 -d 100.55.223.163 -j ACCEPT
iptables -A FORWARD -p 17 -d 226.209.141.195 -s 19.73.195.0/24 --dport 35046 -j DROP
iptables -A test2 -p 17 --dport 24828 -s 100.86.50.141 --sport 15610 -d 225.10.0.0/16 -j ACCEPT
iptables -A OUTPUT -s 113.26.56.150 -j DROP
iptables -A FORWARD -p 17 --dport 9316 -s 56.139.209.126 -d 104.0.75.252 -j test3
iptables -A test1 -p 6 --sport 63354 -s 0.254.130.90 -j ACCEPT
iptables -A OUTPUT -p 6 -s 52.207.155.135 --sport 53645 -d 128.250.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 63467 -d 186.0.0.0/8 -j DROP
iptables -A test1 -p 6 --dport 5532 -j ACCEPT
iptables -A INPUT -s 135.223.45.0/24 -j DROP
iptables -A OUTPUT -p 82 -j DROP
iptables -A test2 -p 17 -d 223.162.0.0/16 --sport 34054 -j ACCEPT
iptables -A FORWARD -s 157.134.3.177 -j DROP
iptables -A test3 -s 224.0.0.0/8 -d 246.222.0.0/16 -j DROP
iptables -A OUTPUT -d 52.117.235.232 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 39152 -s 45.122.215.205 -d 45.169.145.167 --dport 19128 -j test2
iptables -A test3 -p 17 -s 128.29.107.99 -d 40.254.85.190 --sport 51050 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 4309 -s 108.0.0.0/8 --dport 22855 -j ACCEPT
iptables -A test2 -d 35.148.132.226 -s 47.106.162.0/24 -j DROP
iptables -A INPUT -p 17 -d 147.0.0.0/8 --sport 4906 --dport 40647 -j DROP
iptables -A FORWARD -s 233.0.0.0/8 -p 152 -j DROP
iptables -A INPUT -p 6 --sport 49818 -j ACCEPT
iptables -A test1 -p 6 --dport 62456 -s 52.137.24.192 --sport 46837 -d 55.26.155.247 -j DROP
iptables -A OUTPUT -p 17 --dport 17036 -d 241.222.198.51 --sport 46937 -j DROP
iptables -A test3 -p 6 -s 196.38.0.0/16 --dport 61996 --sport 45745 -j DROP
iptables -A test1 -p 17 --sport 13246 -s 197.113.136.125 --dport 45296 -d 215.215.19.79 -j ACCEPT
iptables -A INPUT -p 17 --dport 13126 -s 28.245.3.0/24 --sport 6997 -j ACCEPT
iptables -A test2 -p 6 --sport 48813 -j DROP
iptables -A OUTPUT -p 17 --sport 4022 -s 20.103.130.223 -j DROP
iptables -A OUTPUT -p 6 -s 132.9.12.127 --sport 58845 -d 87.181.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 10485 -j test1
iptables -A test3 -s 38.159.102.120 -j DROP
iptables -A FORWARD -p 17 -s 218.54.0.0/16 --sport 27386 -j DROP
iptables -A INPUT -p 17 --sport 5794 -s 151.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 -s 69.166.166.0/24 --sport 14987 -d 4.156.229.170 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 31323 -j DROP
iptables -A OUTPUT -p 6 -d 9.31.150.112 --dport 8738 -j DROP
iptables -A test2 -p 17 -d 181.106.203.41 -s 241.254.46.232 --sport 30199 -j ACCEPT
iptables -A OUTPUT -d 239.163.3.203 -j ACCEPT
iptables -A test1 -p 77 -d 134.111.221.41 -s 195.177.0.0/16 -j DROP
iptables -A test2 -p 17 --sport 41407 -j ACCEPT
iptables -A FORWARD -p 17 -s 25.58.219.234 --dport 59072 --sport 13525 -j ACCEPT
iptables -A test3 -p 6 --sport 41279 -j ACCEPT
iptables -A test3 -p 6 --dport 25164 -j ACCEPT
iptables -A INPUT -p 6 --dport 1311 --sport 28296 -j test2
iptables -A test3 -p 17 -s 228.230.110.0/24 --sport 53753 -j DROP
iptables -A INPUT -p 6 -s 90.24.0.0/16 --sport 10353 --dport 43736 -j ACCEPT
iptables -A test3 -s 201.0.0.0/8 -j DROP
iptables -A test3 -p 6 --sport 7619 -d 64.249.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 -d 18.183.0.0/16 --dport 64099 -j ACCEPT
iptables -A test1 -p 17 --sport 8906 --dport 14557 -d 84.33.232.0/24 -j DROP
iptables -A OUTPUT -p 17 --sport 57370 -j test2
iptables -A OUTPUT -s 96.132.39.117 -j DROP
iptables -A OUTPUT -p 17 --sport 42804 -j ACCEPT
iptables -A test2 -p 6 --dport 36271 -s 241.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 -d 170.93.0.0/16 --sport 9050 -j DROP
iptables -A OUTPUT -p 69 -j DROP
iptables -A INPUT -p 6 -d 130.86.0.0/16 --dport 40295 -j ACCEPT
iptables -A INPUT -d 115.230.170.97 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 63991 --sport 4332 -s 46.188.111.213 -j ACCEPT
iptables -A test2 -p 17 --dport 58080 -d 61.212.224.186 --sport 38284 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 9302 -j DROP
iptables -A test3 -p 17 --dport 21229 --sport 23438 -d 65.223.110.1 -j ACCEPT
iptables -A INPUT -d 123.34.19.0/24 -j DROP
iptables -A INPUT -d 75.175.21.96 -p 202 -j ACCEPT
iptables -A test1 -p 17 --sport 57970 -j ACCEPT
iptables -A FORWARD -p 17 --dport 54787 -j DROP
iptables -A test3 -s 48.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 18742 -d 65.146.97.60 --sport 2693 -j ACCEPT
iptables -A test3 -p 91 -j DROP
iptables -A test1 -p 17 -s 206.89.174.23 --sport 20301 -j DROP
iptables -A OUTPUT -p 6 -d 161.75.101.39 --sport 42504 -j DROP
iptables -A INPUT -d 183.82.196.69 -j DROP
iptables -A test2 -p 6 --sport 7175 -d 166.222.2.112 -j DROP
iptables -A INPUT -p 6 -s 110.0.0.0/8 -d 213.0.0.0/8 --dport 21470 -j ACCEPT
iptables -A INPUT -s 34.102.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 22846 -s 109.248.95.182 -d 0.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 133 -j ACCEPT
iptables -A test2 -p 58 -d 106.207.20.34 -s 162.86.67.0/24 -j DROP
iptables -A OUTPUT -p 17 -s 168.114.23.227 --sport 60786 -j test3
iptables -A FORWARD -s 89.0.0.0/8 -d 238.30.9.28 -j DROP
iptables -A OUTPUT -p 17 --dport 14512 -d 60.225.114.159 -j ACCEPT
iptables -A INPUT -p 17 --dport 1734 -j DROP
iptables -A test3 -d 163.19.53.131 -j ACCEPT
iptables -A test1 -p 6 --dport 19784 -j DROP
iptables -A test2 -p 17 --dport 65045 -s 202.194.249.130 --sport 48965 -j DROP
iptables -A FORWARD -p 6 --sport 23334 --dport 20367 -d 85.182.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -d 76.109.226.140 --dport 27479 -j DROP
iptables -A FORWARD -p 6 --sport 48928 -j DROP
iptables -A test1 -p 17 -d 215.173.0.0/16 --sport 35785 --dport 51032 -j ACCEPT
iptables -A FORWARD -p 17 --sport 34002 -s 160.210.167.129 --dport 33650 -d 109.154.0.0/16 -j DROP
iptables -A INPUT -p 17 -s 208.227.216.58 --dport 49697 -d 9.42.74.156 --sport 1015 -j DROP
iptables -A test2 -p 17 --sport 26061 -d 165.198.176.13 -j ACCEPT
iptables -A test3 -p 17 --sport 34950 -j DROP
iptables -A test2 -p 6 --sport 58178 -j DROP
iptables -A test3 -p 6 -d 116.26.89.86 -s 9.182.127.0/24 --sport 64308 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 15354 -j ACCEPT
iptables -A OUTPUT -p 17 -d 0.238.219.245 --dport 61729 -j ACCEPT
iptables -A FORWARD -p 102 -d 172.155.180.0/24 -j test1
iptables -A test2 -p 187 -d 164.50.84.73 -j DROP
iptables -A test1 -p 6 -d 27.13.0.0/16 --sport 59425 -s 247.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 44015 -j DROP
iptables -A INPUT -p 6 --sport 28182 -s 227.137.177.239 --dport 10536 -j ACCEPT
iptables -A test3 -p 6 --sport 44319 -s 38.84.94.67 -d 60.35.0.0/16 --dport 52329 -j ACCEPT
iptables -A FORWARD -p 6 -d 32.192.242.81 --dport 34970 -j ACCEPT
iptables -A test2 -d 79.132.84.138 -j DROP
iptables -A test3 -p 17 -d 135.92.86.0/24 --dport 26658 --sport 4569 -j DROP
iptables -A test3 -p 6 -s 27.145.154.0/24 --dport 34239 -j ACCEPT
iptables -A test3 -p 6 --dport 34853 -s 4.20.134.87 --sport 56857 -d 152.1.179.91 -j DROP
iptables -A test2 -p 6 -s 232.26.0.0/16 --dport 34385 -j ACCEPT
iptables -A FORWARD -p 6 -d 161.170.98.0/24 --dport 36550 -s 202.36.160.240 -j DROP
iptables -A FORWARD -s 22.38.251.0/24 -d 99.195.47.114 -j ACCEPT
iptables -A test1 -p 6 -d 207.183.124.0/24 -s 148.176.169.0/24 --sport 1153 --dport 60458 -j ACCEPT
iptables -A test1 -p 17 -s 139.158.145.25 --dport 52532 -d 110.24.224.0/24 -j DROP
iptables -A test1 -p 17 -d 132.146.0.54 --dport 30163 --sport 2603 -j ACCEPT
iptables -A INPUT -p 6 --sport 44389 -d 159.202.116.142 --dport 8780 -j ACCEPT
iptables -A OUTPUT -p 6 -d 216.123.11.32 --dport 4099 -s 212.187.16.186 -j DROP
iptables -A test2 -p 6 -s 167.191.26.159 --dport 46589 -j DROP
iptables -A test3 -p 6 -s 0.179.0.0/16 --sport 61875 -j DROP
iptables -A test2 -p 6 --sport 4487 -d 45.143.94.127 -j DROP
iptables -A test2 -p 6 --sport 9310 -d 112.25.124.100 -j DROP
iptables -A test2 -p 17 --sport 65142 -d 102.214.225.59 -j ACCEPT
iptables -A test2 -p 6 --sport 37961 -d 14.110.241.44 --dport 26264 -j ACCEPT
iptables -A test1 -p 6 --dport 5287 -j DROP
iptables -A test1 -p 17 --dport 48056 -j ACCEPT
iptables -A test3 -p 6 --dport 46186 -j DROP
iptables -A test3 -d 70.162.237.0/24 -s 195.29.105.143 -j DROP
iptables -A INPUT -p 231 -s 158.177.16.242 -j ACCEPT
iptables -A test1 -p 6 --dport 37220 -d 20.213.243.153 --sport 57291 -j DROP
iptables -A test1 -p 6 -s 0.202.0.0/16 --sport 10117 --dport 14987 -j ACCEPT
iptables -A FORWARD -p 6 --dport 9141 -d 21.183.110.219 -j ACCEPT
iptables -A test2 -p 17 --dport 6377 --sport 13253 -d 86.168.0.0/16 -j DROP
iptables -A test2 -p 6 -s 232.215.139.7 --sport 35506 --dport 52408 -j DROP
iptables -A test1 -s 153.89.0.0/16 -d 190.108.152.40 -j DROP
iptables -A INPUT -d 200.103.0.0/16 -j DROP
iptables -A INPUT -p 17 --dport 27748 -s 255.214.230.0/24 -d 144.53.0.0/16 -j ACCEPT
iptables -A INPUT -s 42.0.0.0/8 -j DROP
iptables -A test2 -d 59.0.0.0/8 -j DROP
iptables -A test2 -p 17 --dport 50272 -s 81.0.0.0/8 -j DROP
iptables -A test2 -s 95.90.84.220 -j ACCEPT
iptables -A test1 -p 195 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 16056 -s 158.12.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 59807 --sport 42033 -d 62.3.252.201 -j ACCEPT
iptables -A INPUT -p 17 --dport 51610 -d 37.32.0.0/16 -j ACCEPT
iptables -A test1 -p 17 -d 128.0.0.0/8 --dport 62630 -s 111.127.0.0/16 -j DROP
iptables -A test3 -p 6 -d 162.153.203.142 --sport 27261 -s 152.208.127.82 -j DROP
iptables -A INPUT -p 17 --sport 3200 --dport 41732 -d 50.224.252.223 -j ACCEPT
iptables -A FORWARD -p 6 --sport 5506 -j DROP
iptables -A test3 -p 85 -j DROP
iptables -A test3 -p 6 -s 75.215.0.0/16 --sport 9718 -j ACCEPT
iptables -A INPUT -d 138.77.14.0/24 -s 29.61.124.160 -j test1
iptables -A test1 -p 6 -s 225.0.0.0/8 --dport 23853 -d 228.211.87.218 -j ACCEPT
iptables -A FORWARD -p 17 --dport 43470 --sport 60327 -s 215.125.95.166 -j DROP
iptables -A test1 -d 169.0.0.0/8 -j ACCEPT
iptables -A test2 -s 120.68.76.242 -d 153.198.108.148 -j DROP
iptables -A test1 -p 17 --dport 13490 -d 160.111.27.50 -s 185.196.231.168 -j DROP
iptables -A test1 -p 17 --dport 34804 --sport 13001 -j DROP
iptables -A INPUT -p 6 --sport 61738 --dport 54725 -s 223.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -d 135.249.218.32 --dport 12991 -s 48.19.199.183 --sport 58295 -j ACCEPT
iptables -A test2 -p 6 -s 133.80.245.205 --sport 26294 --dport 63650 -j ACCEPT
iptables -A INPUT -p 17 -d 55.32.145.187 --sport 8001 -j ACCEPT
iptables -A test3 -d 201.31.0.0/16 -s 62.202.164.88 -j ACCEPT
iptables -A INPUT -p 6 --dport 53013 --sport 59037 -j DROP
iptables -A OUTPUT -p 6 --dport 59130 -d 212.9.13.0/24 -j DROP
iptables -A test3 -s 127.72.37.67 -p 67 -d 38.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --sport 61075 -d 102.0.0.0/8 -s 16.109.138.88 -j ACCEPT
iptables -A FORWARD -p 6 --sport 601 --dport 18223 -j ACCEPT
iptables -A test2 -p 6 --sport 42760 -j ACCEPT
iptables -A INPUT -p 17 --sport 36341 -s 213.57.92.146 --dport 26023 -j DROP
iptables -A INPUT -p 6 --sport 20205 -d 156.180.252.0/24 -j ACCEPT
iptables -A test3 -p 6 -s 178.134.0.0/16 --sport 45520 -j DROP
iptables -A test1 -p 17 --sport 33075 -j ACCEPT
iptables -A test3 -s 195.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -d 39.201.146.237 --dport 46288 -j DROP
iptables -A OUTPUT -p 17 -s 2.177.242.129 --dport 18110 -d 228.0.0.0/8 -j DROP
iptables -A INPUT -d 232.147.77.94 -j DROP
iptables -A OUTPUT -s 76.196.135.244 -j DROP
iptables -A INPUT -s 169.97.97.193 -d 40.232.148.135 -p 21 -j DROP
iptables -A INPUT -p 17 --dport 21692 -s 181.76.152.203 -d 221.210.0.0/16 -j DROP
iptables -A test1 -p 6 --dport 29295 --sport 52245 -j ACCEPT
iptables -A test3 -p 17 --dport 10538 -j DROP
iptables -A test1 -p 6 --dport 53278 -d 23.140.73.169 --sport 30912 -s 214.156.240.100 -j DROP
iptables -A test1 -p 17 -s 12.198.212.234 -d 157.61.254.65 --dport 41794 -j DROP
iptables -A test3 -p 6 -s 79.21.141.0/24 --sport 3947 -j ACCEPT
iptables -A INPUT -p 17 --dport 49631 -s 41.84.33.102 -d 222.2.216.0/24 -j DROP
iptables -A test3 -p 6 --sport 55743 --dport 56704 -s 228.192.93.169 -j DROP
iptables -A INPUT -s 117.128.25.157 -p 85 -j ACCEPT
iptables -A INPUT -p 17 -d 127.63.101.30 --dport 40203 -j ACCEPT
iptables -A test3 -p 17 --sport 64870 -s 151.51.145.0/24 --dport 26125 -j DROP
iptables -A test2 -p 17 -d 90.184.0.0/16 -s 85.140.199.4 --sport 29247 --dport 12554 -j ACCEPT
iptables -A INPUT -p 17 -d 62.113.236.199 -s 186.45.42.21 --dport 63618 -j ACCEPT
iptables -A FORWARD -p 17 --dport 22109 -j DROP
iptables -A INPUT -d 57.172.146.146 -j DROP
iptables -A OUTPUT -p 17 --dport 36335 -d 206.0.0.0/8 -j DROP
iptables -A INPUT -d 207.0.0.0/8 -j test2
iptables -A test3 -p 17 -s 176.5.183.15 --dport 20409 -d 229.34.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --sport 19673 -j DROP
iptables -A test2 -p 17 --sport 36210 -j DROP
iptables -A test3 -p 17 --sport 55363 -s 5.153.26.0/24 --dport 31907 -j DROP
iptables -A test1 -p 17 --sport 49494 -j ACCEPT
iptables -A INPUT -p 17 --dport 32821 -j ACCEPT
iptables -A test2 -d 50.0.0.0/8 -p 79 -s 192.13.58.116 -j ACCEPT
iptables -A OUTPUT -p 17 -s 15.207.139.107 --dport 37172 -j DROP
iptables -A test1 -p 17 --sport 13170 -d 45.134.219.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 11723 --dport 20257 -s 196.71.245.47 -j ACCEPT
iptables -A test1 -p 6 -s 70.168.224.237 -d 222.23.18.83 -j ACCEPT
iptables -A test1 -p 6 -s 26.194.1.151 --sport 31011 -j ACCEPT
iptables -A FORWARD -p 6 --dport 20459 -j ACCEPT
iptables -A test2 -p 17 --dport 41589 --sport 34646 -s 109.125.185.77 -j DROP
iptables -A INPUT -p 6 --sport 59748 -j ACCEPT
iptables -A FORWARD -p 6 -s 139.160.43.80 --dport 15086 --sport 8272 -j DROP
iptables -A OUTPUT -d 48.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 1275 -s 78.41.127.166 --dport 12880 -j DROP
iptables -A OUTPUT -p 17 --dport 62411 -d 69.0.0.0/8 -j DROP
iptables -A test3 -p 17 --sport 31942 -d 54.13.218.113 -s 96.235.153.201 -j ACCEPT
iptables -A test1 -p 17 --dport 10568 --sport 5694 -d 219.90.72.0/24 -j DROP
iptables -A INPUT -s 38.224.153.0/24 -p 246 -j ACCEPT
iptables -A INPUT -p 17 --dport 38127 --sport 57713 -s 182.191.140.234 -d 194.86.155.160 -j test1
iptables -A OUTPUT -p 6 --dport 49959 --sport 22171 -s 201.124.160.113 -j ACCEPT
iptables -A OUTPUT -p 6 -s 209.96.175.0/24 --sport 447 --dport 4512 -j DROP
iptables -A test3 -p 173 -d 82.114.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 -s 192.100.0.0/16 --dport 46840 -j ACCEPT
iptables -A test2 -p 17 -s 186.10.80.0/24 -d 124.41.7.101 --dport 14855 --sport 61721 -j DROP
iptables -A test2 -p 6 --sport 22670 --dport 63490 -j DROP
iptables -A test1 -s 160.178.41.29 -j DROP
iptables -A test1 -p 17 -s 201.101.0.0/16 --sport 21963 --dport 6223 -j ACCEPT
iptables -A OUTPUT -p 6 -s 58.234.132.210 --dport 24255 -j DROP
iptables -A INPUT -p 6 --sport 28218 --dport 50738 -j ACCEPT
iptables -A test1 -p 17 -d 32.191.71.43 --sport 26360 --dport 50786 -j ACCEPT
iptables -A test3 -p 6 --sport 45974 -d 89.55.226.141 --dport 41177 -j ACCEPT
iptables -A FORWARD -p 185 -j DROP
iptables -A test2 -d 208.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 -d 97.215.227.3 -s 80.113.0.0/16 --dport 27846 -j DROP
iptables -A FORWARD -p 6 --dport 48214 -d 4.169.248.218 --sport 44324 -s 179.70.64.0/24 -j ACCEPT
iptables -A test3 -p 17 -s 225.194.12.172 --dport 15865 -d 185.189.0.0/16 --sport 26780 -j ACCEPT
iptables -A FORWARD -p 17 -d 188.0.0.0/8 -s 19.225.118.240 --sport 42803 -j DROP
iptables -A test2 -p 26 -d 79.233.166.114 -j DROP
iptables -A FORWARD -p 17 --sport 48278 -s 107.94.167.179 -d 100.237.233.4 -j ACCEPT
iptables -A test3 -p 17 -s 195.242.142.0/24 --sport 8293 -d 231.183.164.48 -j ACCEPT
iptables -A INPUT -d 250.78.86.95 -s 185.36.23.237 -p 173 -j DROP
iptables -A OUTPUT -p 17 -s 22.182.121.112 --dport 64232 -d 162.0.0.0/8 -j DROP
iptables -A FORWARD -d 30.156.0.0/16 -j DROP
iptables -A test2 -p 17 --sport 27001 -j DROP
iptables -A OUTPUT -p 17 --sport 7659 -d 33.156.224.217 -s 245.117.6.141 -j ACCEPT
iptables -A test2 -p 6 --dport 28563 -s 228.152.151.19 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 17611 --sport 11663 -j ACCEPT
iptables -A test3 -p 17 --sport 48269 --dport 21262 -s 210.0.0.0/8 -j DROP
iptables -A test2 -p 6 -s 224.103.193.0/24 --dport 20600 -j ACCEPT
iptables -A OUTPUT -d 29.118.11.72 -j DROP
iptables -A test2 -s 39.3.186.0/24 -j DROP
iptables -A test1 -p 6 -d 0.249.0.0/16 -s 36.15.191.116 --dport 12563 -j ACCEPT
iptables -A INPUT -p 6 -d 120.57.117.155 --sport 24991 -j ACCEPT
iptables -A test3 -p 6 --dport 28897 -j DROP
iptables -A test2 -p 17 --dport 27869 -s 75.163.202.146 --sport 18557 -j ACCEPT
iptables -A test1 -p 17 -s 210.96.108.0/24 --sport 52354 --dport 64654 -j ACCEPT
iptables -A OUTPUT -p 17 -d 92.21.216.48 --sport 12615 --dport 46021 -j DROP
iptables -A FORWARD -d 222.32.0.0/16 -j test3
iptables -A INPUT -p 17 --dport 62967 -d 206.86.24.0/24 -j ACCEPT
iptables -A INPUT -d 247.157.197.163 -p 255 -j DROP
iptables -A test3 -d 36.56.137.0/24 -s 94.0.0.0/8 -j DROP
iptables -A test1 -p 17 -d 25.0.0.0/8 --dport 36337 --sport 32026 -j DROP
iptables -A INPUT -s 33.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 -s 155.192.37.0/24 --sport 13411 -j ACCEPT
iptables -A INPUT -p 6 --sport 17434 -s 176.3.1.96 -j DROP
iptables -A OUTPUT -p 6 -s 101.0.0.0/8 --dport 37757 -d 179.29.227.0/24 -j DROP
iptables -A test1 -p 6 --sport 21567 -j DROP
iptables -A test3 -s 64.29.0.0/16 -d 86.116.153.68 -p 234 -j ACCEPT
iptables -A test2 -p 6 --dport 39631 --sport 52846 -s 187.104.0.0/16 -j ACCEPT
iptables -A test3 -p 17 -d 55.0.0.0/8 --dport 64719 --sport 15822 -j DROP
iptables -A OUTPUT -p 78 -j DROP
iptables -A test3 -p 17 --sport 37167 -d 53.1.69.0/24 --dport 23330 -j ACCEPT
iptables -A FORWARD -s 131.0.0.0/8 -j DROP
iptables -A test1 -p 17 --sport 16648 -j ACCEPT
iptables -A test1 -p 6 --sport 44475 --dport 59008 -j DROP
iptables -A INPUT -p 6 --sport 29045 -j ACCEPT
iptables -A OUTPUT -p 6 -s 167.49.44.180 --dport 59330 -j DROP
iptables -A FORWARD -p 17 --sport 33781 --dport 7648 -j DROP
iptables -A OUTPUT -p 6 --sport 14568 -j DROP
iptables -A test1 -p 6 --sport 34910 -s 207.222.165.253 -d 138.150.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -d 70.0.0.0/8 --dport 39188 -j ACCEPT
iptables -A test3 -p 17 -s 18.14.0.0/16 -d 58.174.126.31 --dport 21568 -j DROP
iptables -A test2 -p 6 --dport 24566 --sport 49631 -d 201.41.177.0/24 -j DROP
iptables -A test3 -p 17 --sport 31028 -s 41.104.185.0/24 --dport 53316 -j DROP
iptables -A INPUT -p 17 --sport 44959 -s 2.160.115.0/24 --dport 41482 -j DROP
iptables -A test1 -p 6 --dport 37655 -s 194.64.174.112 -j ACCEPT
iptables -A test1 -p 6 --sport 27009 -d 87.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --sport 840 -d 198.240.232.47 --dport 60043 -j ACCEPT
iptables -A test3 -p 6 --sport 3390 --dport 43780 -j ACCEPT
iptables -A test3 -p 6 --dport 47421 -s 106.0.0.0/8 -d 98.238.221.143 -j ACCEPT
iptables -A test1 -p 17 -d 246.182.244.0/24 -s 74.0.0.0/8 --dport 63544 --sport 62929 -j DROP
iptables -A test1 -p 15 -s 144.227.81.167 -j DROP
iptables -A OUTPUT -d 151.22.28.0/24 -j DROP
iptables -A INPUT -p 17 -d 86.45.0.0/16 -s 103.26.52.120 --sport 41812 -j DROP
iptables -A OUTPUT -p 6 --sport 7125 -j test3
iptables -A test3 -p 17 --sport 62964 --dport 7129 -d 133.174.6.96 -j DROP
iptables -A INPUT -p 6 --dport 53648 -s 128.27.154.0/24 -d 48.167.232.78 --sport 26879 -j ACCEPT
iptables -A OUTPUT -p 6 -d 44.119.140.23 --dport 44286 -s 34.208.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --sport 20534 --dport 52817 -s 142.59.54.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 22196 -s 196.15.71.111 -d 196.208.36.107 -j DROP
iptables -A FORWARD -d 42.28.39.137 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 7978 --dport 62313 -d 171.242.0.0/16 -j DROP
iptables -A test2 -p 6 -d 155.135.104.70 --dport 40093 -j DROP
iptables -A INPUT -p 6 -d 104.32.255.0/24 --sport 39462 -j DROP
iptables -A FORWARD -p 6 --sport 4575 -d 224.211.217.117 -j DROP
iptables -A INPUT -d 220.59.111.17 -j DROP
iptables -A INPUT -p 6 -s 221.45.110.151 --dport 20452 --sport 37252 -j ACCEPT
iptables -A OUTPUT -p 17 -d 199.33.146.21 --sport 37304 -s 186.228.95.38 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 45223 --dport 14964 -s 101.39.0.0/16 -j DROP
iptables -A test2 -p 17 --sport 1651 -j DROP
iptables -A test3 -p 17 -d 179.111.65.230 --sport 26474 --dport 17148 -j ACCEPT
iptables -A FORWARD -p 6 --dport 42921 -d 166.111.192.248 -j ACCEPT
iptables -A test3 -p 17 -d 217.12.151.49 -s 234.48.180.0/24 --sport 57686 -j ACCEPT
iptables -A INPUT -d 78.14.87.101 -j ACCEPT
iptables -A FORWARD -p 6 -d 17.11.238.104 --dport 10600 -j DROP
iptables -A test3 -p 6 --dport 64824 -j DROP
iptables -A test3 -p 17 -d 187.67.11.211 --sport 25243 --dport 44605 -j DROP
iptables -A INPUT -p 6 -d 47.232.20.154 --dport 39376 -s 149.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 -d 83.37.242.241 --sport 21648 -j test1
iptables -A test3 -p 6 --dport 45471 -d 225.176.0.0/16 --sport 15049 -j ACCEPT
iptables -A OUTPUT -p 6 -d 223.76.0.0/16 --sport 45776 -j DROP
iptables -A FORWARD -p 17 --dport 55082 -j ACCEPT
iptables -A test3 -p 6 -s 46.162.6.237 -d 34.50.189.39 --sport 59819 -j DROP
iptables -A test2 -p 17 --sport 50185 -j DROP
iptables -A FORWARD -p 6 -d 83.125.0.0/16 --sport 21761 -s 160.166.205.0/24 -j ACCEPT
iptables -A INPUT -p 6 --sport 53471 --dport 25478 -s 77.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 -d 179.119.128.184 --dport 6664 -j ACCEPT
iptables -A test2 -p 6 --dport 61701 --sport 20055 -d 44.156.192.0/24 -s 211.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --dport 7264 -d 140.128.34.0/24 -j DROP
iptables -A test1 -p 6 --dport 7106 --sport 54443 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 35280 -s 154.88.74.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -s 14.128.0.0/16 --dport 26391 -d 164.132.107.1 --sport 46442 -j DROP
iptables -A test2 -p 17 --dport 17558 --sport 4829 -s 98.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 28781 --sport 65061 -d 120.162.170.150 -j DROP
iptables -A test1 -p 6 --dport 2605 --sport 35513 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 48537 -d 93.129.0.0/16 -j DROP
iptables -A FORWARD -s 155.51.70.202 -j ACCEPT
iptables -A test1 -p 6 --dport 7350 --sport 10990 -d 1.127.67.82 -j ACCEPT
iptables -A test1 -p 6 -d 35.22.78.10 --sport 44397 --dport 64865 -j ACCEPT
iptables -A test2 -d 116.109.65.49 -p 78 -s 237.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -s 142.19.224.68 --sport 5700 -j DROP
iptables -A test3 -p 17 --dport 21752 -j ACCEPT
iptables -A FORWARD -p 6 -d 25.57.98.39 --sport 15058 -j test2
iptables -A OUTPUT -p 6 --sport 62519 -s 80.0.0.0/8 --dport 11929 -j ACCEPT
iptables -A INPUT -p 6 --dport 17431 -d 120.253.66.250 --sport 48594 -j DROP
iptables -A test2 -d 124.101.214.78 -j DROP
iptables -A INPUT -p 6 --dport 34948 -j ACCEPT
iptables -A FORWARD -p 6 --dport 33109 --sport 678 -s 160.48.240.0/24 -j DROP
iptables -A test1 -p 17 --sport 29801 -d 1.27.18.16 --dport 35037 -s 252.115.57.62 -j ACCEPT
iptables -A test2 -p 6 -d 17.120.210.188 --dport 10015 -j DROP
iptables -A INPUT -p 6 --sport 52692 -d 13.233.66.145 -j DROP
iptables -A INPUT -p 17 --sport 32508 -s 78.107.33.73 -d 191.0.0.0/8 --dport 11045 -j DROP
iptables -A test2 -p 17 --sport 39156 -s 100.246.108.116 --dport 31381 -j ACCEPT
iptables -A test1 -d 210.200.145.165 -j DROP
iptables -A test3 -p 17 --dport 11582 -j DROP
iptables -A test1 -p 6 -d 9.160.249.80 --dport 19728 -j DROP
iptables -A FORWARD -p 17 --sport 63754 -s 114.103.200.215 -j ACCEPT
iptables -A test2 -p 17 --sport 63423 -s 96.14.20.108 -j DROP
iptables -A FORWARD -p 17 --dport 16600 -s 62.70.73.198 -d 231.121.158.72 -j ACCEPT
iptables -A OUTPUT -p 196 -s 139.141.0.0/16 -j ACCEPT
iptables -A test2 -p 6 -d 165.110.214.139 --sport 11946 -j ACCEPT
iptables -A INPUT -p 6 --dport 42595 -d 246.153.59.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 36228 --sport 20686 -s 170.86.223.0/24 -j ACCEPT
iptables -A test3 -d 208.11.144.68 -j ACCEPT
iptables -A test1 -p 6 --sport 32722 --dport 45706 -d 178.22.227.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 6493 -s 117.0.0.0/8 --dport 53523 -j DROP
iptables -A OUTPUT -p 17 -d 93.90.253.195 --sport 32711 -j DROP
iptables -A test1 -p 17 --sport 55697 -j DROP
iptables -A test1 -p 17 --sport 4235 -j ACCEPT
iptables -A FORWARD -s 225.34.0.0/16 -j ACCEPT
iptables -A FORWARD -p 150 -s 115.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 29037 -j ACCEPT
iptables -A test1 -p 17 -s 73.48.40.35 -d 0.111.128.92 --dport 54045 -j DROP
iptables -A OUTPUT -p 17 -d 233.22.97.0/24 --sport 46947 -s 20.108.4.0/24 -j ACCEPT
iptables -A test1 -p 157 -j ACCEPT
iptables -A FORWARD -p 6 --sport 16103 -j ACCEPT
iptables -A test2 -d 187.155.122.0/24 -j DROP
iptables -A test2 -p 6 -s 157.129.55.204 --dport 60255 -d 106.69.102.221 -j ACCEPT
iptables -A test1 -p 6 --dport 61861 -j ACCEPT
iptables -A test3 -p 17 -d 82.0.0.0/8 --sport 26387 -j ACCEPT
iptables -A INPUT -p 17 --dport 18488 -j ACCEPT
iptables -A INPUT -p 17 -d 219.65.0.0/16 --sport 58951 -j DROP
iptables -A FORWARD -s 233.0.0.0/8 -p 240 -j ACCEPT
iptables -A OUTPUT -s 53.142.0.0/16 -p 166 -j DROP
iptables -A test1 -p 6 --dport 33053 -j ACCEPT
iptables -A test3 -p 148 -j ACCEPT
iptables -A INPUT -p 6 -d 222.23.20.214 --dport 48713 -s 163.80.99.124 -j DROP
iptables -A OUTPUT -p 6 -s 186.255.0.0/16 --dport 37694 -j ACCEPT
iptables -A test3 -p 114 -j DROP
iptables -A INPUT -s 17.0.0.0/8 -j ACCEPT
iptables -A INPUT -d 137.172.39.146 -s 171.225.94.144 -j DROP
iptables -A test3 -p 6 --sport 36652 -s 188.134.0.0/16 -j DROP
iptables -A INPUT -p 6 --sport 2020 -j DROP
iptables -A test3 -p 6 -s 164.44.17.92 --dport 64457 -j ACCEPT
iptables -A test3 -p 17 --dport 60995 -j DROP
iptables -A test3 -p 17 --dport 34249 -j ACCEPT
iptables -A INPUT -p 6 --sport 60968 -d 4.158.219.198 --dport 26733 -j DROP
iptables -A FORWARD -p 17 --sport 43457 --dport 64474 -d 80.30.234.26 -j test1
iptables -A INPUT -p 6 -s 245.25.177.64 --dport 53433 -j DROP
iptables -A INPUT -p 17 --sport 1103 -d 45.0.0.0/8 -j DROP
iptables -A INPUT -d 165.89.163.216 -p 199 -j ACCEPT
iptables -A OUTPUT -p 17 -s 174.122.74.122 -d 107.0.0.0/8 --dport 13991 --sport 14188 -j ACCEPT
iptables -A INPUT -p 6 -s 250.208.0.0/16 --dport 43557 --sport 37664 -j ACCEPT
iptables -A test3 -p 17 --dport 22060 -s 126.67.33.0/24 --sport 15327 -j ACCEPT
iptables -A test2 -p 6 --sport 38522 -j ACCEPT
iptables -A test2 -p 6 --dport 42640 --sport 64494 -s 162.11.0.0/16 -d 133.35.133.0/24 -j DROP
iptables -A FORWARD -p 189 -j DROP
iptables -A test1 -p 6 -d 190.0.0.0/8 --dport 8578 -s 49.145.23.143 --sport 11844 -j DROP
iptables -A FORWARD -p 6 --dport 43358 -d 210.108.0.0/16 --sport 60550 -j ACCEPT
iptables -A test1 -s 157.82.7.38 -j ACCEPT
iptables -A test1 -p 17 -s 110.0.0.0/8 -d 228.0.0.0/8 --sport 30308 -j DROP
iptables -A FORWARD -p 6 --sport 59973 -s 245.95.23.0/24 -j DROP
iptables -A INPUT -s 91.187.125.0/24 -p 167 -j DROP
iptables -A OUTPUT -d 162.74.7.0/24 -j DROP
iptables -A OUTPUT -p 6 --sport 60036 -s 113.5.145.0/24 --dport 21736 -j ACCEPT
iptables -A INPUT -p 6 -s 16.156.0.0/16 --sport 51302 -j ACCEPT
iptables -A test2 -d 64.13.235.232 -s 59.211.164.87 -j DROP
iptables -A test1 -p 17 --sport 39222 -d 23.150.250.20 -s 201.136.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --dport 51696 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 13115 -j ACCEPT
iptables -A test2 -p 6 -d 22.70.79.46 --dport 60678 -j ACCEPT
iptables -A test3 -p 229 -j ACCEPT
iptables -A INPUT -d 64.198.0.0/16 -j DROP
iptables -A test1 -p 6 -s 177.16.124.0/24 --dport 33106 --sport 57411 -j ACCEPT
iptables -A test1 -d 32.172.0.0/16 -j ACCEPT
iptables -A test1 -d 170.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 --dport 2458 -s 66.0.0.0/8 -j DROP
iptables -A test3 -p 17 -d 15.38.0.0/16 --dport 1303 --sport 50272 -j DROP
iptables -A FORWARD -p 6 --dport 20428 --sport 42237 -d 238.170.0.0/16 -j DROP
iptables -A test1 -p 6 --dport 45026 -j DROP
iptables -A test1 -p 17 --dport 63684 -j ACCEPT
iptables -A INPUT -p 6 --sport 55762 --dport 65494 -s 143.233.146.115 -d 10.0.0.0/8 -j test3
iptables -A FORWARD -s 106.154.206.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --dport 41918 --sport 14391 -d 209.4.227.3 -j DROP
iptables -A test2 -p 17 --dport 14496 -s 224.135.0.0/16 -d 187.47.218.109 -j DROP
iptables -A INPUT -p 6 -s 33.152.61.78 --sport 40892 --dport 47305 -j DROP
iptables -A test2 -p 17 --sport 6496 -d 138.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --dport 31946 --sport 30959 -d 103.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 19179 -d 160.178.22.202 -j ACCEPT
iptables -A test2 -p 6 --sport 10734 -j DROP
iptables -A FORWARD -p 6 --sport 49578 -s 208.251.163.74 -d 132.0.0.0/8 --dport 55991 -j DROP
iptables -A test2 -p 17 -d 232.57.25.105 --sport 39884 -j ACCEPT
iptables -A FORWARD -p 17 -d 251.0.0.0/8 --dport 55682 --sport 14746 -j DROP
iptables -A OUTPUT -p 17 --dport 54731 -j ACCEPT
iptables -A FORWARD -p 17 --sport 29544 -d 78.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -d 254.0.0.0/8 --sport 57037 -s 30.182.124.48 -j ACCEPT
iptables -A test3 -d 85.187.19.0/24 -j ACCEPT
iptables -A test2 -d 25.162.69.93 -j DROP
iptables -A test1 -s 157.191.233.152 -p 67 -d 133.202.2.252 -j DROP
iptables -A test1 -p 17 --sport 63931 -d 200.18.103.90 -j ACCEPT
iptables -A test1 -p 17 --sport 57340 -j DROP
iptables -A OUTPUT -p 17 --sport 40673 -d 77.9.149.105 --dport 31956 -j DROP
iptables -A FORWARD -p 6 --sport 47376 --dport 44435 -j ACCEPT
iptables -A OUTPUT -p 17 -s 1.87.117.214 --sport 41092 -d 41.150.158.0/24 -j ACCEPT
iptables -A test2 -p 6 -s 34.168.48.16 --sport 3336 -j DROP
iptables -A test3 -p 152 -j DROP
iptables -A INPUT -d 15.211.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --sport 33077 -j DROP
iptables -A test2 -p 6 --dport 11512 --sport 2719 -d 224.74.0.0/16 -s 166.169.253.39 -j ACCEPT
iptables -A test1 -d 35.89.232.0/24 -j DROP
iptables -A INPUT -p 6 -d 25.131.29.120 --dport 62841 -j DROP
iptables -A test3 -p 17 --dport 56404 -j DROP
iptables -A test2 -p 122 -j ACCEPT
iptables -A FORWARD -d 1.177.55.0/24 -p 86 -j ACCEPT
iptables -A INPUT -p 17 -d 26.177.110.0/24 --sport 2512 -j DROP
iptables -A test2 -p 17 --sport 64376 --dport 47724 -d 214.192.193.227 -j DROP
iptables -A test2 -p 17 --dport 25891 -j ACCEPT
iptables -A INPUT -p 6 --sport 12383 -d 29.232.0.0/16 --dport 42968 -j DROP
iptables -A test1 -p 6 --dport 93 --sport 29119 -j ACCEPT
iptables -A OUTPUT -p 17 -s 117.176.0.0/16 -d 162.188.171.0/24 --dport 64522 -j ACCEPT
iptables -A OUTPUT -p 17 -s 177.179.58.123 -d 98.29.211.0/24 --dport 27574 --sport 36280 -j ACCEPT
iptables -A test1 -p 6 -d 24.137.0.0/16 --sport 36789 -s 70.71.199.126 -j DROP
iptables -A INPUT -p 17 -d 155.112.84.80 -s 243.90.155.1 --dport 58820 -j DROP
iptables -A OUTPUT -p 6 -s 137.21.102.121 --sport 11795 -j DROP
iptables -A test3 -p 17 --dport 20774 -j DROP
iptables -A OUTPUT -p 199 -j ACCEPT
iptables -A FORWARD -p 6 --sport 38810 --dport 22256 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 64706 -d 24.31.49.179 -s 4.51.122.45 --sport 35860 -j DROP
iptables -A FORWARD -p 25 -s 54.216.98.88 -j ACCEPT
iptables -A FORWARD -p 17 -s 68.38.10.46 -d 65.0.0.0/8 --dport 21764 -j ACCEPT
iptables -A OUTPUT -p 6 -d 244.81.3.249 -s 61.151.49.41 --dport 32647 -j DROP
iptables -A test3 -d 87.210.208.0/24 -p 105 -s 81.7.0.0/16 -j DROP
iptables -A OUTPUT -p 6 -d 143.0.0.0/8 --sport 61435 -s 200.48.24.249 -j ACCEPT
iptables -A test2 -p 6 -d 216.196.0.0/16 --sport 52739 --dport 39172 -j DROP
iptables -A OUTPUT -p 17 --sport 53270 -d 207.13.231.207 --dport 50463 -j ACCEPT
iptables -A test2 -p 17 --dport 61960 --sport 38429 -s 183.147.249.142 -j DROP
iptables -A OUTPUT -p 17 --dport 17501 -j ACCEPT
iptables -A INPUT -p 6 --sport 40518 -j DROP
iptables -A OUTPUT -p 17 --sport 21915 --dport 38901 -j DROP
iptables -A OUTPUT -p 17 --dport 8054 -s 45.86.119.0/24 --sport 56327 -j ACCEPT
iptables -A INPUT -p 6 --sport 21138 -d 230.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --sport 60829 -d 248.158.184.0/24 -j ACCEPT
iptables -A INPUT -p 62 -j ACCEPT
iptables -A test3 -p 58 -j DROP
iptables -A test2 -p 17 --sport 15128 -d 101.0.0.0/8 --dport 52738 -j DROP
iptables -A test2 -p 80 -j DROP
iptables -A test3 -p 17 -d 7.150.79.129 --dport 29079 -j DROP
iptables -A test1 -p 6 --sport 46759 -s 190.33.214.251 --dport 9808 -j DROP
iptables -A INPUT -d 210.245.143.0/24 -j ACCEPT
iptables -A test2 -p 6 --dport 9293 -s 8.0.0.0/8 -j DROP
iptables -A INPUT -d 37.71.170.0/24 -j DROP
iptables -A INPUT -p 6 -s 196.239.77.0/24 --sport 11060 -j ACCEPT
iptables -A FORWARD -p 17 --sport 31801 -j ACCEPT
iptables -A INPUT -p 17 --sport 39836 --dport 30010 -s 66.117.57.35 -d 64.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 -d 175.120.57.0/24 --dport 259 -j DROP
iptables -A FORWARD -p 6 --sport 56954 -s 98.74.0.0/16 -d 160.226.0.0/16 -j DROP
iptables -A FORWARD -p 17 --sport 21116 -d 73.52.163.0/24 --dport 27797 -s 157.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 --sport 8896 --dport 1236 -j DROP
iptables -A test3 -p 6 -d 37.0.0.0/8 --sport 48642 -j DROP
iptables -A INPUT -p 59 -j DROP
iptables -A test1 -p 17 --sport 39687 --dport 21031 -s 2.234.83.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -s 62.40.211.145 -d 248.40.52.152 --dport 9230 --sport 60654 -j DROP
iptables -A INPUT -s 236.181.0.0/16 -d 227.174.0.0/16 -p 150 -j DROP
iptables -A test1 -p 17 --dport 52880 -d 34.235.165.119 -j ACCEPT
iptables -A INPUT -p 6 --dport 56338 -d 52.140.240.235 -j DROP
iptables -A INPUT -p 6 --dport 18000 -j ACCEPT
iptables -A INPUT -p 6 --dport 34522 -d 25.95.61.197 -s 121.39.82.193 -j DROP
iptables -A test2 -p 17 -d 58.178.187.48 --dport 41906 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 21946 -s 57.176.122.65 -d 206.179.207.59 -j DROP
iptables -A FORWARD -p 6 --dport 28002 -d 36.81.0.0/16 -s 85.225.237.107 -j ACCEPT
iptables -A FORWARD -s 44.62.190.234 -d 175.172.13.177 -j DROP
iptables -A FORWARD -p 17 --sport 57155 -d 114.187.235.125 -j DROP
iptables -A test3 -p 17 -s 117.200.198.134 --dport 57346 --sport 39733 -j DROP
iptables -A FORWARD -p 6 --sport 12298 -d 224.196.241.229 -j DROP
iptables -A FORWARD -p 6 --sport 11748 -s 241.0.0.0/8 --dport 58299 -d 129.88.46.126 -j test1
iptables -A test2 -p 98 -j ACCEPT
iptables -A FORWARD -s 99.31.97.252 -j ACCEPT
iptables -A FORWARD -p 6 -s 73.136.94.0/24 --dport 26529 --sport 53729 -j DROP
iptables -A test1 -p 115 -d 244.220.153.12 -j DROP
iptables -A OUTPUT -p 164 -d 247.0.0.0/8 -s 19.0.0.0/8 -j DROP
iptables -A OUTPUT -s 12.19.111.107 -j ACCEPT
iptables -A test1 -p 6 --sport 27999 -d 156.31.189.71 -s 118.229.6.113 -j DROP
iptables -A INPUT -p 6 --sport 12311 -j test1
iptables -A test2 -p 6 --dport 57840 -j ACCEPT
iptables -A test1 -p 6 --dport 57961 -j ACCEPT
iptables -A FORWARD -s 8.154.0.0/16 -p 81 -j test3
iptables -A INPUT -p 17 -s 175.164.76.197 --dport 3492 -j DROP
iptables -A test1 -d 155.65.13.0/24 -j DROP
iptables -A INPUT -p 6 --dport 64716 -j DROP
iptables -A test3 -p 6 --dport 6804 -s 190.171.251.230 -d 2.157.46.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 40000 --sport 38674 -s 160.173.153.112 -j DROP
iptables -A FORWARD -p 17 -s 156.0.0.0/8 --sport 36635 --dport 49933 -j DROP
iptables -A test3 -p 6 --dport 869 -s 52.188.44.140 -j ACCEPT
iptables -A test1 -p 17 -d 94.21.0.63 --dport 43753 -j DROP
iptables -A OUTPUT -p 17 --dport 20146 -j DROP
iptables -A test1 -p 17 --dport 53566 -d 197.1.0.0/16 -s 4.77.31.49 -j DROP
iptables -A OUTPUT -s 59.197.177.154 -j DROP
iptables -A OUTPUT -d 40.75.182.173 -j DROP
iptables -A OUTPUT -p 6 --sport 50969 -s 89.111.182.185 -d 35.121.231.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -d 144.148.21.32 -s 45.116.177.41 --dport 38265 -j DROP
iptables -A test3 -p 6 --dport 4459 -s 200.30.184.201 -d 22.38.97.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --dport 34968 -s 58.182.226.29 -d 246.7.236.146 --sport 56498 -j ACCEPT
iptables -A FORWARD -p 17 --dport 47982 -j ACCEPT
iptables -A OUTPUT -p 17 -d 9.0.0.0/8 --sport 13737 -j ACCEPT
iptables -A test2 -p 6 --dport 37217 -s 1.0.0.0/8 -j ACCEPT
iptables -A FORWARD -s 211.35.0.0/16 -p 61 -d 146.109.158.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 46217 -j ACCEPT
iptables -A INPUT -d 95.137.144.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 35179 -d 107.71.254.225 --dport 64304 -j DROP
iptables -A test3 -p 6 --sport 14701 -d 2.194.95.101 -j DROP
iptables -A test1 -p 6 --sport 26887 -s 160.203.63.101 --dport 31373 -j DROP
iptables -A OUTPUT -d 170.173.0.0/16 -j DROP
iptables -A test1 -d 64.0.0.0/8 -j DROP
iptables -A test3 -p 17 --sport 57045 -s 103.98.37.0/24 -j ACCEPT
iptables -A test3 -d 77.123.0.0/16 -j DROP
iptables -A INPUT -d 3.26.0.0/16 -s 232.43.185.88 -j DROP
iptables -A INPUT -p 6 --sport 65347 --dport 49957 -s 20.210.85.0/24 -j ACCEPT
iptables -A FORWARD -s 77.32.11.228 -j DROP
iptables -A OUTPUT -p 17 --dport 45855 --sport 35931 -j DROP
iptables -A OUTPUT -s 13.177.213.16 -p 40 -d 221.169.24.53 -j DROP
iptables -A test3 -p 6 --dport 51253 -j ACCEPT
iptables -A FORWARD -p 17 -d 209.205.0.0/16 --sport 1970 -j ACCEPT
iptables -A INPUT -s 70.249.206.47 -j ACCEPT
iptables -A test3 -p 17 --sport 25474 -d 14.209.185.110 -s 133.213.0.0/16 --dport 35800 -j ACCEPT
iptables -A test1 -p 6 --dport 51940 -s 90.189.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -s 45.34.0.0/16 --dport 53404 --sport 11301 -j ACCEPT
iptables -A OUTPUT -p 17 -d 48.4.230.26 --sport 27761 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 16659 --sport 35562 -j ACCEPT
iptables -A OUTPUT -p 17 -d 8.20.228.164 --sport 26976 -j DROP
iptables -A test2 -p 17 --sport 17465 --dport 21821 -d 231.54.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --sport 12861 -s 211.194.0.0/16 -d 73.66.76.234 -j ACCEPT
iptables -A INPUT -d 191.204.53.169 -s 79.12.47.1 -j DROP
iptables -A FORWARD -p 17 --sport 65161 -s 182.184.0.0/16 -d 108.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -d 79.247.205.243 -s 219.8.0.0/16 --sport 30455 -j DROP
iptables -A FORWARD -p 6 --dport 38399 -d 12.115.163.50 -j DROP
iptables -A test3 -d 163.82.175.33 -j ACCEPT
iptables -A test3 -p 6 --dport 55959 -j ACCEPT
iptables -A INPUT -p 6 -d 186.174.56.166 --sport 56773 -j ACCEPT
iptables -A FORWARD -s 4.41.102.90 -d 197.187.57.10 -p 193 -j DROP
iptables -A OUTPUT -p 17 --sport 64423 --dport 27525 -d 59.70.0.0/16 -j DROP
iptables -A test2 -p 17 --sport 50747 -d 138.0.0.0/8 -j DROP
iptables -A test3 -d 129.64.0.0/16 -j DROP