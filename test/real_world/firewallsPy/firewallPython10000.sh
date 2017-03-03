iptables -N test1
iptables -N test2
iptables -N test3
iptables -A test2 -p 6 --sport 11339 --dport 7178 -s 197.163.86.207 -d 118.143.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --sport 7724 -s 159.0.0.0/8 --dport 48398 -j DROP
iptables -A test1 -p 17 --sport 29980 -j ACCEPT
iptables -A INPUT -p 17 --sport 11324 -d 22.43.117.0/24 -s 37.73.132.23 -j DROP
iptables -A FORWARD -p 17 --dport 25618 -s 209.31.78.54 -j DROP
iptables -A test3 -p 17 -d 75.249.0.0/16 --sport 21099 -s 241.40.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -d 152.174.191.56 -s 146.170.252.0/24 --dport 39495 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 59519 -j DROP
iptables -A INPUT -p 6 --sport 22824 -s 186.97.249.91 -j ACCEPT
iptables -A test2 -p 6 -d 96.10.82.130 --sport 5935 -j DROP
iptables -A INPUT -p 6 -d 148.235.120.75 -s 86.154.60.169 --sport 39670 -j DROP
iptables -A test2 -p 17 --dport 41609 -j DROP
iptables -A test2 -d 255.0.0.0/8 -p 215 -j ACCEPT
iptables -A OUTPUT -p 17 -s 167.167.0.0/16 -d 222.213.176.89 --sport 18259 -j DROP
iptables -A INPUT -p 17 --dport 15521 --sport 26629 -j DROP
iptables -A test1 -p 17 --dport 64389 -s 147.155.226.55 -j ACCEPT
iptables -A test2 -d 4.7.251.16 -s 192.90.77.174 -j ACCEPT
iptables -A test2 -p 17 --dport 46637 -s 138.205.0.0/16 --sport 40679 -j ACCEPT
iptables -A FORWARD -p 17 -s 178.234.58.0/24 --dport 5510 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 17639 -j DROP
iptables -A test2 -s 211.97.5.0/24 -j DROP
iptables -A INPUT -p 6 --sport 62628 -d 144.159.80.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 56454 --dport 6936 -d 60.12.188.234 -j DROP
iptables -A test2 -s 27.72.196.205 -j DROP
iptables -A OUTPUT -p 17 -d 70.160.127.0/24 --sport 38994 --dport 45459 -j DROP
iptables -A test1 -p 17 --sport 41157 -j DROP
iptables -A test1 -p 6 -d 15.230.99.40 --dport 8025 --sport 20319 -j DROP
iptables -A OUTPUT -p 6 --dport 39327 -d 196.220.4.209 --sport 26878 -j ACCEPT
iptables -A INPUT -p 17 --dport 40691 --sport 38139 -s 158.150.114.35 -j DROP
iptables -A INPUT -p 122 -d 37.0.0.0/8 -j test3
iptables -A test3 -p 6 --sport 31014 -j DROP
iptables -A test2 -p 17 --dport 36655 -d 227.72.209.0/24 --sport 63864 -j DROP
iptables -A test2 -p 6 --sport 49105 --dport 5286 -s 187.109.59.129 -j ACCEPT
iptables -A test3 -p 6 --dport 26915 -j ACCEPT
iptables -A INPUT -p 6 -s 138.180.51.233 --dport 1975 --sport 40988 -j DROP
iptables -A INPUT -s 249.47.63.109 -j DROP
iptables -A FORWARD -p 6 --dport 21645 --sport 26630 -d 23.0.0.0/8 -j DROP
iptables -A OUTPUT -s 76.0.0.0/8 -j test2
iptables -A test1 -p 168 -s 223.0.0.0/8 -d 53.134.139.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 39805 -s 242.46.61.0/24 -j DROP
iptables -A test2 -p 17 --dport 44976 -d 33.40.193.0/24 -j ACCEPT
iptables -A test1 -p 6 -d 215.201.158.0/24 --sport 23662 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 27792 -d 20.104.25.247 -s 189.235.172.201 -j ACCEPT
iptables -A test3 -p 17 --dport 38592 -j ACCEPT
iptables -A test1 -p 6 --sport 11364 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 29842 -d 213.0.0.0/8 -s 68.244.2.0/24 --dport 3193 -j ACCEPT
iptables -A FORWARD -p 6 --sport 28 -j ACCEPT
iptables -A test2 -p 6 --dport 26547 --sport 3262 -j ACCEPT
iptables -A INPUT -p 17 --sport 55583 --dport 1043 -s 203.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 14266 -s 200.248.192.0/24 -j DROP
iptables -A test2 -d 147.251.1.18 -s 34.7.21.221 -j ACCEPT
iptables -A FORWARD -p 6 -s 172.0.0.0/8 --sport 54066 -d 120.211.72.0/24 -j ACCEPT
iptables -A INPUT -p 6 --sport 6504 -j DROP
iptables -A test3 -d 111.63.203.249 -j DROP
iptables -A test1 -p 6 --dport 22365 -d 44.26.62.253 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 29602 -j test3
iptables -A test3 -p 152 -j ACCEPT
iptables -A test1 -p 53 -j DROP
iptables -A test2 -s 174.0.0.0/8 -d 255.0.0.0/8 -j DROP
iptables -A test1 -p 17 --sport 22966 -s 249.221.210.0/24 --dport 54029 -j DROP
iptables -A OUTPUT -p 6 --sport 47246 -j ACCEPT
iptables -A OUTPUT -s 70.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -d 245.133.22.246 --sport 4183 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 46448 -d 145.19.63.100 --sport 11772 -j DROP
iptables -A FORWARD -p 6 --sport 65113 -d 70.230.0.197 -j ACCEPT
iptables -A test2 -p 6 --dport 45170 -j DROP
iptables -A test3 -p 6 --dport 50754 -d 19.81.168.0/24 -j DROP
iptables -A test1 -d 71.184.0.0/16 -p 12 -j DROP
iptables -A test3 -p 17 -s 3.130.230.155 --sport 32706 -j DROP
iptables -A FORWARD -d 196.137.171.240 -j DROP
iptables -A test1 -p 6 -s 45.227.0.0/16 --sport 11484 --dport 47145 -j ACCEPT
iptables -A INPUT -p 6 --sport 58503 -s 140.0.0.0/8 -j test3
iptables -A OUTPUT -p 6 -s 132.53.42.59 -d 147.238.231.0/24 --sport 25072 --dport 31157 -j DROP
iptables -A test3 -p 6 -d 150.109.67.0/24 --sport 17873 -j DROP
iptables -A test3 -p 6 --dport 26111 -j ACCEPT
iptables -A test1 -d 174.188.99.0/24 -j ACCEPT
iptables -A test2 -p 17 --dport 4360 -d 164.66.69.117 -j ACCEPT
iptables -A INPUT -p 6 --sport 13080 -j ACCEPT
iptables -A OUTPUT -p 6 -d 71.212.158.0/24 --dport 8210 -s 8.179.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 -s 214.69.83.19 --dport 30596 -j DROP
iptables -A OUTPUT -p 6 -d 71.18.59.187 -s 26.0.0.0/8 --sport 49327 -j DROP
iptables -A test2 -p 17 --sport 8602 --dport 17103 -s 21.196.0.0/16 -j DROP
iptables -A INPUT -p 17 -d 108.16.161.138 --dport 9315 -j ACCEPT
iptables -A test2 -d 136.151.77.0/24 -j DROP
iptables -A test2 -p 17 -s 136.0.0.0/8 --dport 37756 --sport 48136 -d 129.83.114.212 -j ACCEPT
iptables -A OUTPUT -p 6 -s 55.89.0.0/16 --sport 33952 -j DROP
iptables -A test3 -d 24.195.0.0/16 -j DROP
iptables -A OUTPUT -p 17 -s 122.0.0.0/8 --sport 28817 -d 110.25.101.30 -j DROP
iptables -A FORWARD -p 17 -d 85.49.153.0/24 -s 185.50.178.0/24 --sport 10968 -j ACCEPT
iptables -A test3 -p 17 --sport 37781 -j DROP
iptables -A OUTPUT -p 6 --dport 40152 -d 188.62.180.234 -s 82.99.143.229 -j DROP
iptables -A OUTPUT -p 199 -j ACCEPT
iptables -A test2 -p 17 --dport 31522 -j ACCEPT
iptables -A test3 -p 235 -j ACCEPT
iptables -A test3 -p 13 -j DROP
iptables -A test2 -s 231.200.45.158 -p 23 -j DROP
iptables -A OUTPUT -p 17 -s 253.0.0.0/8 --sport 13629 --dport 53408 -j ACCEPT
iptables -A test2 -p 17 --sport 56542 -j ACCEPT
iptables -A OUTPUT -s 237.168.214.0/24 -j ACCEPT
iptables -A OUTPUT -d 133.165.116.65 -s 131.235.0.0/16 -p 182 -j ACCEPT
iptables -A test1 -p 6 --dport 46782 -s 252.146.31.97 -j DROP
iptables -A INPUT -p 17 --sport 32537 -d 2.193.37.121 -j ACCEPT
iptables -A INPUT -p 6 -s 195.125.105.232 --sport 48560 --dport 54150 -j ACCEPT
iptables -A FORWARD -p 6 -d 2.176.0.0/16 -s 129.0.0.0/8 --sport 33 --dport 10039 -j ACCEPT
iptables -A test1 -p 6 --dport 45835 -j DROP
iptables -A test2 -p 6 -s 90.34.91.81 --sport 47079 --dport 46404 -j DROP
iptables -A test3 -p 17 --sport 10637 -j DROP
iptables -A FORWARD -p 6 --sport 4425 --dport 10299 -s 128.150.21.0/24 -j DROP
iptables -A INPUT -p 17 -d 194.35.146.149 --dport 5484 --sport 35770 -s 198.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 14768 -d 35.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 -s 29.36.0.0/16 --sport 40043 -d 219.100.55.223 --dport 11991 -j DROP
iptables -A test1 -p 17 -s 248.0.0.0/8 -d 240.0.0.0/8 --dport 15003 -j ACCEPT
iptables -A test3 -p 6 -s 216.124.117.15 --sport 40815 --dport 26204 -j ACCEPT
iptables -A test3 -p 6 --sport 63842 -s 98.226.93.88 -d 220.227.0.0/16 -j DROP
iptables -A FORWARD -p 6 --sport 15404 -j DROP
iptables -A test1 -p 17 --dport 13372 -j DROP
iptables -A test1 -d 240.212.233.117 -j DROP
iptables -A test1 -p 6 --sport 8919 -j ACCEPT
iptables -A test3 -p 130 -j ACCEPT
iptables -A test2 -p 17 --sport 175 -j DROP
iptables -A FORWARD -p 17 --sport 47370 --dport 15329 -d 247.24.215.0/24 -j DROP
iptables -A test1 -p 17 --sport 58031 -s 17.231.50.40 --dport 55188 -j ACCEPT
iptables -A test3 -p 58 -s 179.14.66.69 -d 132.53.248.57 -j DROP
iptables -A FORWARD -p 6 --sport 17738 -s 49.0.0.0/8 -j DROP
iptables -A test2 -p 6 -d 231.146.125.232 -s 143.73.59.156 --sport 21902 -j ACCEPT
iptables -A INPUT -s 129.0.0.0/8 -j DROP
iptables -A test1 -p 17 --dport 1908 --sport 31533 -d 69.183.237.0/24 -j ACCEPT
iptables -A test3 -p 6 --dport 57832 -d 27.71.229.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 61174 -d 217.231.253.102 -s 12.28.102.190 -j ACCEPT
iptables -A OUTPUT -s 41.129.219.38 -d 215.29.20.103 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 59254 --sport 8542 -s 106.94.39.31 -j DROP
iptables -A test2 -p 6 --dport 26455 -j DROP
iptables -A INPUT -p 6 --dport 62996 -j ACCEPT
iptables -A test3 -p 6 --dport 9068 -j DROP
iptables -A test2 -d 151.6.157.88 -j ACCEPT
iptables -A test3 -p 164 -j DROP
iptables -A INPUT -p 17 --dport 60702 -d 79.239.225.64 -s 233.51.246.0/24 -j test2
iptables -A OUTPUT -p 17 --dport 57908 -j ACCEPT
iptables -A test1 -p 6 --dport 62040 --sport 49432 -j DROP
iptables -A test3 -p 17 --sport 30039 --dport 35666 -j DROP
iptables -A test2 -p 17 --sport 35004 -j DROP
iptables -A test2 -p 6 -s 145.65.58.195 --dport 23760 -d 117.193.185.108 -j ACCEPT
iptables -A test1 -p 6 --dport 35623 -d 75.76.0.0/16 --sport 63204 -j ACCEPT
iptables -A OUTPUT -p 209 -d 198.241.0.0/16 -j DROP
iptables -A test1 -p 6 -d 221.63.97.34 --sport 24985 -j DROP
iptables -A OUTPUT -p 17 --dport 54849 -d 145.33.123.171 -j ACCEPT
iptables -A test1 -p 6 --sport 40924 -d 253.0.0.0/8 --dport 43317 -j DROP
iptables -A OUTPUT -p 17 -d 98.0.0.0/8 --sport 53472 -j DROP
iptables -A FORWARD -s 239.159.163.176 -p 175 -j DROP
iptables -A OUTPUT -p 6 --dport 64706 -d 92.128.233.122 -j DROP
iptables -A INPUT -p 17 -s 100.24.244.0/24 --dport 36235 --sport 10465 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 21245 --dport 56358 -d 37.89.246.64 -j DROP
iptables -A test1 -p 6 --sport 11104 -s 116.138.64.117 --dport 33600 -j DROP
iptables -A INPUT -p 6 --dport 8025 --sport 645 -s 138.194.34.0/24 -j DROP
iptables -A test1 -p 17 --dport 64784 -s 162.172.173.149 -j DROP
iptables -A FORWARD -p 6 -d 51.152.23.155 --dport 40375 --sport 35031 -j ACCEPT
iptables -A test2 -p 6 --sport 17109 --dport 62418 -s 15.47.75.117 -j DROP
iptables -A FORWARD -p 172 -j ACCEPT
iptables -A test1 -p 6 -s 107.238.70.8 --sport 59696 -d 6.213.222.72 -j ACCEPT
iptables -A test3 -p 6 --sport 32033 -j ACCEPT
iptables -A test1 -p 6 --dport 45220 -s 85.127.251.254 -d 109.46.27.109 -j DROP
iptables -A test3 -p 6 --sport 56458 -s 13.131.165.0/24 -j DROP
iptables -A FORWARD -p 6 --sport 16719 -d 243.33.136.107 -j DROP
iptables -A test2 -p 17 --sport 23719 -d 104.186.56.95 --dport 59094 -s 12.52.227.0/24 -j ACCEPT
iptables -A INPUT -p 6 --sport 53084 -d 189.205.45.0/24 -s 254.0.0.0/8 -j DROP
iptables -A FORWARD -s 239.54.82.162 -j ACCEPT
iptables -A test1 -p 17 --sport 605 --dport 6312 -j DROP
iptables -A OUTPUT -p 17 --sport 42138 -d 178.39.191.80 -j DROP
iptables -A test2 -p 17 -d 4.0.0.0/8 --dport 29758 -s 214.202.32.0/24 -j ACCEPT
iptables -A test3 -p 6 --sport 6278 -j DROP
iptables -A test3 -p 6 --dport 1032 --sport 17280 -s 140.174.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 -d 42.207.39.63 --dport 28568 -s 82.184.93.0/24 -j DROP
iptables -A test1 -p 6 --dport 28106 --sport 5108 -s 137.124.73.215 -j DROP
iptables -A test3 -d 233.16.0.0/16 -s 116.92.11.0 -j ACCEPT
iptables -A test1 -p 104 -d 172.55.118.198 -j ACCEPT
iptables -A test2 -p 6 --dport 62988 -j DROP
iptables -A FORWARD -p 6 --dport 51699 -d 99.230.66.253 --sport 5464 -j ACCEPT
iptables -A test3 -p 6 -d 22.0.0.0/8 --dport 64408 -j ACCEPT
iptables -A test2 -p 6 --dport 55219 -s 194.136.6.189 -j ACCEPT
iptables -A INPUT -p 6 --sport 52341 -j DROP
iptables -A INPUT -p 37 -j test3
iptables -A test3 -p 17 --dport 44514 --sport 24169 -s 174.53.0.0/16 -d 41.35.106.216 -j DROP
iptables -A FORWARD -p 92 -j ACCEPT
iptables -A FORWARD -p 209 -j ACCEPT
iptables -A INPUT -p 17 --dport 19867 -j ACCEPT
iptables -A FORWARD -p 6 --sport 39497 -j DROP
iptables -A test2 -p 6 -d 30.18.28.160 --dport 20715 -j DROP
iptables -A test1 -p 6 --sport 9681 --dport 59933 -s 162.88.211.250 -j DROP
iptables -A FORWARD -p 6 -d 179.230.40.0/24 -s 253.88.45.0/24 --dport 25042 -j DROP
iptables -A test1 -d 27.13.205.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 27414 --dport 62708 -s 63.44.224.228 -d 85.0.0.0/8 -j ACCEPT
iptables -A FORWARD -d 111.66.64.133 -j ACCEPT
iptables -A test2 -d 52.135.41.244 -j DROP
iptables -A test3 -p 6 -s 207.0.0.0/8 --sport 133 -d 109.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -d 232.156.161.12 --dport 31690 --sport 43126 -j ACCEPT
iptables -A test3 -s 206.85.193.0/24 -j DROP
iptables -A FORWARD -p 6 --sport 920 -d 217.189.0.0/16 -s 29.60.152.33 -j DROP
iptables -A INPUT -p 17 --dport 33716 -s 139.43.108.0/24 --sport 50436 -d 191.137.39.228 -j DROP
iptables -A INPUT -p 17 -d 5.10.11.12 --sport 34128 --dport 12649 -j test3
iptables -A test3 -p 6 --dport 30037 -j ACCEPT
iptables -A test2 -p 6 --sport 58035 -d 193.0.0.0/8 --dport 48716 -j ACCEPT
iptables -A FORWARD -p 6 --dport 62544 -s 244.4.50.161 --sport 6272 -j DROP
iptables -A OUTPUT -d 219.75.175.126 -j ACCEPT
iptables -A FORWARD -p 108 -d 46.11.72.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 1277 -d 253.147.200.0/24 -j DROP
iptables -A INPUT -p 52 -d 32.0.0.0/8 -j DROP
iptables -A OUTPUT -p 28 -j ACCEPT
iptables -A test3 -p 6 -s 183.26.183.0/24 --sport 34978 -j ACCEPT
iptables -A FORWARD -p 17 -d 42.83.57.205 --sport 41630 -j DROP
iptables -A test3 -p 6 -s 207.122.193.10 -d 118.244.118.134 --dport 30110 -j DROP
iptables -A OUTPUT -s 42.171.189.0/24 -j DROP
iptables -A test2 -d 235.225.40.19 -j ACCEPT
iptables -A INPUT -p 17 --sport 4373 -s 116.227.248.163 --dport 46919 -j DROP
iptables -A test3 -p 6 --sport 50767 -d 38.0.0.0/8 --dport 6225 -j DROP
iptables -A OUTPUT -p 6 --dport 45145 --sport 11831 -s 239.91.0.0/16 -j DROP
iptables -A test1 -s 57.83.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --dport 56380 -s 101.0.0.0/8 --sport 19819 -d 3.103.106.63 -j DROP
iptables -A test1 -p 6 --dport 1611 -j ACCEPT
iptables -A FORWARD -p 6 --sport 21359 -j ACCEPT
iptables -A test3 -s 14.0.0.0/8 -d 58.157.0.0/16 -p 147 -j DROP
iptables -A FORWARD -p 6 --sport 2203 -d 173.219.152.177 -s 61.199.77.93 -j DROP
iptables -A OUTPUT -p 17 -d 239.0.0.0/8 --sport 40922 -s 197.0.0.0/8 -j DROP
iptables -A test2 -p 6 --sport 2246 -j DROP
iptables -A FORWARD -p 17 -s 89.220.162.210 --dport 29967 -j ACCEPT
iptables -A test2 -p 6 -s 33.158.101.112 -d 59.227.27.236 --sport 41158 -j DROP
iptables -A FORWARD -p 6 --dport 22924 -d 220.209.120.186 -j DROP
iptables -A FORWARD -p 17 --dport 49099 -s 191.76.37.175 -d 128.70.0.0/16 --sport 55057 -j DROP
iptables -A OUTPUT -p 172 -j ACCEPT
iptables -A test1 -p 6 --dport 39984 --sport 35397 -j ACCEPT
iptables -A INPUT -p 6 -d 64.194.208.181 --dport 20207 -j ACCEPT
iptables -A INPUT -p 17 --sport 29481 --dport 1604 -j ACCEPT
iptables -A test2 -p 17 -d 205.0.0.0/8 -s 19.184.102.231 --sport 12329 -j DROP
iptables -A FORWARD -p 17 --sport 12821 -s 52.0.0.0/8 -d 209.57.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 -d 30.78.60.0/24 --sport 7769 -j ACCEPT
iptables -A INPUT -p 17 --dport 57887 -s 162.0.0.0/8 --sport 34603 -j ACCEPT
iptables -A FORWARD -p 17 -d 81.107.188.64 --sport 36051 -j DROP
iptables -A FORWARD -p 17 -d 102.181.39.0/24 --sport 25962 -j ACCEPT
iptables -A FORWARD -d 75.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 -d 172.136.0.0/16 --dport 7574 -j ACCEPT
iptables -A test3 -p 251 -d 37.100.0.0/16 -j ACCEPT
iptables -A test1 -s 43.119.175.0/24 -p 91 -j ACCEPT
iptables -A test2 -s 87.163.245.103 -p 255 -j DROP
iptables -A test3 -p 6 --dport 2855 -j ACCEPT
iptables -A FORWARD -p 6 --dport 35427 -s 149.132.177.133 -d 249.0.0.0/8 -j DROP
iptables -A test1 -p 6 --sport 14970 --dport 47250 -s 144.230.0.0/16 -j DROP
iptables -A OUTPUT -p 2 -j DROP
iptables -A test2 -p 6 --sport 65383 --dport 30057 -j DROP
iptables -A test2 -p 17 -s 118.40.192.249 -d 158.17.228.0/24 --sport 46723 -j DROP
iptables -A FORWARD -p 17 --dport 23485 -j ACCEPT
iptables -A FORWARD -p 6 --sport 55352 --dport 41047 -d 98.229.66.189 -j ACCEPT
iptables -A test3 -p 133 -s 120.197.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -d 66.102.0.0/16 --dport 5978 -j ACCEPT
iptables -A INPUT -s 16.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 -d 33.0.0.0/8 --dport 42306 --sport 15095 -j DROP
iptables -A test3 -p 17 --sport 1169 -s 63.138.4.100 -d 255.213.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 -s 162.248.0.0/16 --sport 4455 -d 190.239.136.209 -j ACCEPT
iptables -A test1 -d 127.170.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --dport 47971 -s 99.250.67.0/24 --sport 18681 -j ACCEPT
iptables -A test1 -s 133.131.189.159 -j DROP
iptables -A test2 -d 104.86.0.0/16 -s 140.149.179.242 -j ACCEPT
iptables -A FORWARD -p 6 --dport 63901 -j DROP
iptables -A test1 -p 117 -s 194.122.202.27 -j ACCEPT
iptables -A FORWARD -p 60 -j DROP
iptables -A OUTPUT -p 234 -s 148.35.128.215 -j ACCEPT
iptables -A test2 -d 94.53.204.12 -j ACCEPT
iptables -A test3 -p 6 -d 187.129.73.49 --sport 31903 -s 33.121.72.9 --dport 3256 -j ACCEPT
iptables -A test3 -p 6 --sport 44082 -j DROP
iptables -A OUTPUT -p 6 --sport 20102 -s 47.135.228.245 --dport 46836 -j ACCEPT
iptables -A INPUT -p 17 --dport 8500 -j ACCEPT
iptables -A test1 -d 7.194.250.139 -s 220.121.21.19 -j DROP
iptables -A OUTPUT -p 6 --sport 31051 -d 104.73.135.196 --dport 46521 -s 15.108.23.0/24 -j ACCEPT
iptables -A INPUT -p 17 -s 45.0.0.0/8 --sport 43607 --dport 20723 -j test3
iptables -A OUTPUT -d 158.219.0.0/16 -j DROP
iptables -A test2 -p 6 --sport 54458 -j DROP
iptables -A test3 -p 17 --sport 10400 -j DROP
iptables -A FORWARD -p 6 --sport 15858 --dport 63597 -j DROP
iptables -A OUTPUT -p 17 --sport 35946 -d 140.13.74.251 -j ACCEPT
iptables -A INPUT -p 17 -d 4.145.0.0/16 --sport 23489 --dport 47670 -j DROP
iptables -A test3 -p 6 --sport 21511 -j DROP
iptables -A FORWARD -p 17 --dport 49081 --sport 53442 -j ACCEPT
iptables -A FORWARD -p 6 -d 55.225.156.23 --sport 33242 -j ACCEPT
iptables -A INPUT -p 6 --dport 52642 -s 148.207.104.74 -j ACCEPT
iptables -A INPUT -d 64.191.25.59 -p 144 -j DROP
iptables -A OUTPUT -p 17 -s 191.28.109.0/24 --sport 64773 -j ACCEPT
iptables -A INPUT -p 6 --sport 29761 --dport 24936 -s 34.144.0.0/16 -j DROP
iptables -A FORWARD -p 6 --sport 14409 -d 186.0.0.0/8 -j ACCEPT
iptables -A INPUT -d 109.43.125.32 -j ACCEPT
iptables -A test2 -p 6 --sport 21051 -j DROP
iptables -A test1 -p 6 --dport 28480 -d 216.232.225.119 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 47676 -d 184.143.12.248 -j ACCEPT
iptables -A FORWARD -p 17 --dport 19598 -s 36.74.0.0/16 -d 142.131.22.152 -j ACCEPT
iptables -A test3 -p 17 --sport 24922 -d 154.84.0.0/16 -s 198.25.0.0/16 -j DROP
iptables -A test3 -p 6 -d 154.201.72.12 -s 107.0.0.0/8 --sport 1456 --dport 25743 -j ACCEPT
iptables -A INPUT -p 17 --sport 36456 -d 99.83.13.0/24 -j test2
iptables -A FORWARD -p 17 --dport 14511 -s 88.119.0.0/16 --sport 12834 -j ACCEPT
iptables -A test3 -p 17 --sport 47245 -j DROP
iptables -A OUTPUT -p 17 --sport 13277 --dport 45709 -j DROP
iptables -A test2 -p 17 --sport 22666 -d 131.242.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --sport 35874 --dport 40714 -d 115.61.242.20 -j DROP
iptables -A test2 -p 6 --sport 49847 -d 29.239.118.57 -j ACCEPT
iptables -A test2 -p 6 -s 176.155.0.0/16 --dport 53024 -d 155.63.99.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 10762 -j DROP
iptables -A OUTPUT -p 6 --sport 25389 --dport 31988 -j DROP
iptables -A test2 -p 17 --dport 14139 -d 219.0.0.0/8 -s 117.175.54.0/24 --sport 58465 -j DROP
iptables -A OUTPUT -s 57.197.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --sport 23762 -j DROP
iptables -A INPUT -p 6 -s 217.179.141.21 --sport 33143 -j DROP
iptables -A test1 -p 17 --sport 53131 -d 248.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -d 254.88.54.134 -s 207.7.0.0/16 --dport 17150 -j test3
iptables -A test3 -p 17 --sport 15524 -d 51.223.94.244 -j DROP
iptables -A test2 -p 17 --dport 57309 --sport 64845 -s 184.34.250.0/24 -j DROP
iptables -A INPUT -p 17 --dport 49934 -s 123.72.145.4 -d 60.111.250.3 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 58872 -d 156.39.0.0/16 --sport 19902 -j ACCEPT
iptables -A OUTPUT -s 203.54.77.0/24 -j DROP
iptables -A test3 -p 6 --sport 34072 -j DROP
iptables -A test3 -p 71 -j ACCEPT
iptables -A INPUT -d 222.107.0.0/16 -p 134 -s 240.112.166.15 -j test2
iptables -A test2 -p 253 -d 132.106.62.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 61643 --dport 47961 -s 10.8.159.95 -j ACCEPT
iptables -A OUTPUT -p 6 -d 118.89.98.112 --dport 59825 --sport 63403 -j ACCEPT
iptables -A FORWARD -s 62.106.62.116 -j ACCEPT
iptables -A test3 -p 6 --sport 37535 -d 218.85.197.253 -s 207.240.100.191 -j DROP
iptables -A INPUT -p 17 -d 12.177.176.0/24 --dport 55770 -s 186.185.234.160 -j DROP
iptables -A INPUT -p 17 -s 104.170.1.145 --dport 55750 -j ACCEPT
iptables -A INPUT -p 17 -s 224.74.133.135 -d 74.206.59.0/24 --dport 63065 --sport 5300 -j ACCEPT
iptables -A test2 -p 17 -d 127.0.0.0/8 --dport 25953 -j ACCEPT
iptables -A FORWARD -p 6 --sport 22102 -d 233.203.2.212 -j ACCEPT
iptables -A OUTPUT -d 10.0.0.0/8 -s 37.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --sport 6417 -s 82.99.141.24 -j ACCEPT
iptables -A test3 -p 17 --sport 20817 -d 52.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -s 196.41.101.24 -d 156.228.114.98 --sport 21909 -j ACCEPT
iptables -A test2 -p 17 --dport 38693 -d 101.187.229.161 --sport 25672 -j ACCEPT
iptables -A test2 -p 6 -s 244.253.245.0/24 --sport 21673 -j ACCEPT
iptables -A test2 -p 6 --dport 61209 -j ACCEPT
iptables -A INPUT -s 31.99.68.51 -j ACCEPT
iptables -A test3 -p 6 --dport 41976 -j DROP
iptables -A INPUT -s 197.0.0.0/8 -d 123.79.196.0/24 -j ACCEPT
iptables -A test2 -p 55 -d 114.132.248.0/24 -s 230.104.150.229 -j DROP
iptables -A test3 -p 17 --sport 40533 -j ACCEPT
iptables -A test1 -p 17 -d 143.206.124.120 --sport 58941 -j DROP
iptables -A test1 -p 17 --sport 49629 -s 152.0.0.0/8 --dport 19660 -j DROP
iptables -A INPUT -p 17 -s 85.94.178.181 --sport 57201 -d 45.197.0.0/16 -j test2
iptables -A test3 -p 17 --dport 11922 --sport 18584 -j DROP
iptables -A OUTPUT -s 103.168.170.0/24 -d 245.82.133.221 -j DROP
iptables -A INPUT -p 17 -d 238.80.208.0/24 --sport 46374 -j ACCEPT
iptables -A test3 -p 6 --sport 31913 -d 5.232.0.0/16 -j DROP
iptables -A FORWARD -p 165 -s 233.41.23.23 -j ACCEPT
iptables -A FORWARD -p 6 --dport 17994 -s 183.78.0.0/16 -j DROP
iptables -A test2 -p 17 --sport 8790 --dport 27811 -s 191.223.114.253 -j DROP
iptables -A INPUT -p 6 --dport 49927 -s 121.0.0.0/8 --sport 32840 -j DROP
iptables -A INPUT -p 6 -s 197.206.0.0/16 -d 135.228.47.66 --dport 19625 --sport 20732 -j ACCEPT
iptables -A OUTPUT -p 17 -d 22.40.134.155 --dport 3016 -j ACCEPT
iptables -A test3 -d 50.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --dport 43835 -d 246.112.147.30 -s 164.29.0.0/16 -j DROP
iptables -A test1 -p 6 --dport 26632 --sport 27431 -d 196.118.65.231 -j DROP
iptables -A FORWARD -p 6 --dport 17526 -j DROP
iptables -A test2 -p 17 --dport 15387 -j ACCEPT
iptables -A test3 -d 72.17.1.196 -j DROP
iptables -A FORWARD -p 17 -d 59.50.147.203 --dport 21355 -j DROP
iptables -A OUTPUT -p 17 --dport 27580 -j ACCEPT
iptables -A FORWARD -p 17 --sport 29728 -s 33.92.0.0/16 --dport 7371 -d 21.223.102.0/24 -j DROP
iptables -A test1 -p 6 --dport 39255 --sport 44436 -d 134.4.0.0/16 -j DROP
iptables -A test3 -p 17 -d 117.135.171.0/24 --sport 14882 -s 254.183.118.0/24 --dport 18396 -j ACCEPT
iptables -A INPUT -p 6 --sport 11043 --dport 10515 -j DROP
iptables -A FORWARD -p 6 --dport 37942 -j test1
iptables -A test1 -p 17 --sport 53219 -d 75.0.0.0/8 -s 144.238.122.97 -j DROP
iptables -A test1 -p 17 --dport 9388 -j ACCEPT
iptables -A test2 -p 43 -s 68.253.4.123 -j ACCEPT
iptables -A FORWARD -d 103.53.15.129 -s 191.172.97.41 -p 213 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 20977 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 28327 -d 64.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 -d 39.130.36.232 --sport 39913 -j DROP
iptables -A OUTPUT -p 17 -s 73.48.0.0/16 --sport 27653 --dport 21411 -j ACCEPT
iptables -A test2 -p 17 --sport 12425 -d 155.10.245.0/24 -j DROP
iptables -A test3 -p 17 --dport 8390 --sport 9991 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 22673 -j DROP
iptables -A OUTPUT -s 230.88.217.6 -j ACCEPT
iptables -A test1 -p 17 --dport 18394 --sport 57606 -s 152.223.52.0/24 -d 64.238.78.206 -j ACCEPT
iptables -A FORWARD -p 17 -d 85.172.0.0/16 --sport 61991 -j DROP
iptables -A test2 -p 216 -j ACCEPT
iptables -A test3 -d 103.218.114.206 -s 94.60.124.120 -j ACCEPT
iptables -A test2 -p 6 --sport 1674 -d 42.71.35.221 --dport 13340 -s 185.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 54188 --sport 45064 -s 187.62.154.6 -j test3
iptables -A INPUT -p 6 --sport 26010 --dport 34221 -j DROP
iptables -A FORWARD -s 31.158.74.20 -j ACCEPT
iptables -A INPUT -p 17 -s 112.0.0.0/8 --dport 6922 --sport 47993 -d 188.114.49.137 -j DROP
iptables -A test1 -p 6 -d 173.3.63.0/24 -s 75.6.103.174 --dport 20012 -j DROP
iptables -A OUTPUT -p 6 -s 194.0.0.0/8 -d 180.94.233.0/24 --dport 51374 -j DROP
iptables -A test1 -p 6 -d 222.198.237.218 -s 11.98.121.226 --dport 19487 -j ACCEPT
iptables -A FORWARD -s 158.7.0.0/16 -d 199.247.1.116 -j ACCEPT
iptables -A OUTPUT -p 6 -d 248.0.0.0/8 --sport 34633 -j DROP
iptables -A OUTPUT -p 17 -d 214.48.186.0/24 --dport 27462 --sport 3130 -s 136.205.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --dport 63315 --sport 4573 -j ACCEPT
iptables -A test2 -p 6 -s 148.226.220.218 --dport 62968 -j DROP
iptables -A test2 -p 6 -s 144.226.95.0/24 -d 143.0.0.0/8 --sport 9944 -j ACCEPT
iptables -A test1 -p 6 --dport 1559 -j DROP
iptables -A test3 -s 67.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -s 178.221.0.0/16 --dport 4126 --sport 4228 -d 218.116.2.30 -j ACCEPT
iptables -A test1 -p 17 -d 249.62.162.0/24 --sport 57878 -s 50.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 -d 150.217.0.0/16 --sport 27519 --dport 23330 -j ACCEPT
iptables -A INPUT -s 48.0.0.0/8 -p 192 -j DROP
iptables -A test3 -p 38 -j DROP
iptables -A OUTPUT -p 17 --dport 16754 --sport 35034 -d 20.192.99.78 -s 71.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 11732 -d 26.123.170.251 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 8739 --sport 27527 -s 241.0.0.0/8 -j ACCEPT
iptables -A test2 -s 18.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --sport 55170 -d 62.146.146.243 --dport 839 -j ACCEPT
iptables -A FORWARD -p 17 -d 11.66.87.0/24 --sport 18723 -j DROP
iptables -A OUTPUT -p 17 --sport 2638 -j DROP
iptables -A OUTPUT -p 17 --sport 40842 -d 228.19.152.0/24 -s 223.144.226.42 -j ACCEPT
iptables -A test1 -p 6 --dport 17477 --sport 41896 -s 38.225.45.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 58635 -s 181.90.0.0/16 -d 130.49.243.0/24 -j ACCEPT
iptables -A test3 -p 17 -s 212.0.0.0/8 --dport 40095 -d 38.166.15.251 -j DROP
iptables -A test3 -p 17 --dport 17008 -s 29.52.61.126 -j DROP
iptables -A FORWARD -p 6 --sport 62956 -j DROP
iptables -A test2 -s 186.0.0.0/8 -p 242 -d 198.240.217.165 -j ACCEPT
iptables -A INPUT -p 17 -d 75.196.64.242 --dport 18275 -s 216.75.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 15218 -d 7.91.188.1 --sport 18240 -j ACCEPT
iptables -A test1 -p 17 -s 127.0.0.0/8 --dport 20866 --sport 40894 -j ACCEPT
iptables -A test2 -p 17 --sport 12314 -j DROP
iptables -A FORWARD -p 17 -s 230.42.18.0/24 --sport 42695 --dport 54881 -j DROP
iptables -A test1 -p 17 -d 24.94.131.169 --sport 17554 -s 213.185.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 18334 -d 139.0.0.0/8 -s 110.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 33935 -j DROP
iptables -A test1 -d 245.214.17.89 -p 91 -j DROP
iptables -A FORWARD -p 6 --sport 36729 -d 29.54.192.179 --dport 48933 -j DROP
iptables -A test1 -p 17 --sport 11388 --dport 5179 -s 116.28.227.124 -j DROP
iptables -A test3 -p 17 --sport 17822 -d 107.160.220.176 --dport 10363 -s 203.197.196.0/24 -j DROP
iptables -A test1 -p 82 -j DROP
iptables -A OUTPUT -p 17 --sport 44795 -s 115.155.187.177 -j DROP
iptables -A test1 -p 6 --dport 59077 -j DROP
iptables -A test3 -s 241.146.7.36 -d 48.57.242.111 -p 47 -j ACCEPT
iptables -A test1 -p 6 --sport 22800 --dport 35964 -j DROP
iptables -A test2 -d 53.0.0.0/8 -j DROP
iptables -A test3 -p 6 --dport 4429 -s 50.17.0.0/16 -j ACCEPT
iptables -A test3 -p 17 -d 174.0.0.0/8 --sport 26041 -j ACCEPT
iptables -A test3 -p 182 -j DROP
iptables -A INPUT -p 6 --sport 62622 -j ACCEPT
iptables -A FORWARD -p 1 -j DROP
iptables -A test1 -p 6 --sport 13509 -d 88.23.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 17522 --dport 52453 -j ACCEPT
iptables -A test2 -p 6 --sport 64044 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 25624 -d 11.229.53.250 -s 205.144.122.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -d 51.0.0.0/8 --dport 7491 -s 46.224.139.160 --sport 4425 -j ACCEPT
iptables -A test1 -p 6 --sport 18238 -d 186.199.83.198 -s 126.33.117.40 -j DROP
iptables -A OUTPUT -d 77.55.81.184 -s 51.0.0.0/8 -p 18 -j DROP
iptables -A test3 -p 17 --dport 20639 -d 214.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 -d 73.0.0.0/8 --sport 64830 --dport 36080 -j ACCEPT
iptables -A test1 -d 179.138.140.195 -j DROP
iptables -A test3 -d 143.153.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 17414 -j ACCEPT
iptables -A INPUT -p 17 --sport 37911 -d 66.27.0.0/16 --dport 52208 -j ACCEPT
iptables -A test1 -p 17 --dport 13892 -s 53.0.0.0/8 -d 83.220.195.59 -j DROP
iptables -A OUTPUT -p 17 --sport 46353 -s 56.126.145.120 --dport 41720 -j ACCEPT
iptables -A test2 -p 43 -d 239.123.0.0/16 -j ACCEPT
iptables -A INPUT -d 208.216.177.32 -s 79.226.122.166 -j DROP
iptables -A test2 -s 113.172.245.7 -j ACCEPT
iptables -A test3 -p 6 -s 218.0.0.0/8 --dport 63111 -d 159.0.0.0/8 -j DROP
iptables -A test2 -p 99 -j ACCEPT
iptables -A test3 -p 6 -d 102.169.0.0/16 --sport 37751 --dport 11060 -j DROP
iptables -A INPUT -p 6 --sport 49616 -j DROP
iptables -A test1 -p 6 --sport 5134 -d 123.0.0.0/8 -s 234.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 48131 -d 189.89.234.128 -s 119.2.159.136 -j DROP
iptables -A OUTPUT -p 6 -s 250.31.192.24 --sport 56959 -j DROP
iptables -A OUTPUT -p 17 --dport 33521 -d 39.193.181.3 --sport 58794 -j ACCEPT
iptables -A FORWARD -p 6 -s 111.102.156.0/24 --dport 4577 -j DROP
iptables -A INPUT -p 17 --dport 28900 -d 150.153.0.0/16 -j DROP
iptables -A test2 -p 6 --dport 18332 -j DROP
iptables -A test2 -p 6 --dport 35225 -s 25.93.0.0/16 --sport 8807 -j ACCEPT
iptables -A test2 -p 17 --sport 20881 -d 169.187.45.121 -s 88.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --sport 5350 -d 140.79.0.0/16 -s 143.237.159.138 -j DROP
iptables -A test2 -p 6 --dport 48179 -s 166.152.21.78 -j ACCEPT
iptables -A test2 -p 17 --dport 29107 -j ACCEPT
iptables -A test1 -p 17 --sport 20569 -s 137.33.122.62 --dport 12905 -j ACCEPT
iptables -A test1 -p 17 --sport 17079 -d 155.153.7.195 --dport 9211 -s 31.101.14.60 -j DROP
iptables -A test3 -p 6 -d 26.0.0.0/8 --dport 28373 -j DROP
iptables -A INPUT -s 22.0.0.0/8 -d 187.1.0.0/16 -j test3
iptables -A OUTPUT -p 6 --sport 36600 -j DROP
iptables -A test1 -p 17 -d 31.163.0.0/16 --dport 34062 -s 14.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 22306 --sport 11919 -s 48.235.126.201 -d 220.63.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --dport 14255 -j DROP
iptables -A test1 -p 17 --dport 17253 -j DROP
iptables -A test2 -p 17 -s 144.24.196.83 --sport 15035 --dport 51614 -j DROP
iptables -A INPUT -p 17 -d 253.104.27.161 --dport 26678 -j DROP
iptables -A test2 -p 6 -s 141.181.172.0/24 --dport 21900 -d 98.62.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 -s 4.0.0.0/8 --sport 56071 -j ACCEPT
iptables -A test2 -p 17 --sport 34038 -j DROP
iptables -A FORWARD -p 6 -s 238.230.80.0/24 --dport 30528 -j test2
iptables -A OUTPUT -d 134.233.23.245 -s 161.113.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 37426 -j ACCEPT
iptables -A test3 -p 215 -s 32.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 64998 -s 88.63.227.128 --sport 4185 -j DROP
iptables -A test3 -p 6 --dport 32423 --sport 5120 -j ACCEPT
iptables -A FORWARD -p 6 -s 108.0.0.0/8 -d 179.3.145.166 --dport 30045 -j ACCEPT
iptables -A test2 -s 230.8.156.4 -j DROP
iptables -A test1 -p 6 --sport 13845 -j ACCEPT
iptables -A INPUT -p 17 -d 216.0.0.0/8 --dport 46855 -j ACCEPT
iptables -A test3 -p 6 -d 103.126.253.170 --dport 7638 --sport 28590 -j DROP
iptables -A test2 -p 17 --dport 20040 -d 36.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --dport 50184 -d 10.229.87.23 -s 67.81.0.0/16 -j ACCEPT
iptables -A FORWARD -s 43.33.143.238 -j DROP
iptables -A test3 -p 6 --dport 64315 -s 151.49.184.225 -j DROP
iptables -A test3 -p 17 -s 45.0.0.0/8 -d 154.0.0.0/8 --dport 18359 -j DROP
iptables -A test3 -p 17 -s 54.37.0.0/16 --sport 37978 --dport 32160 -j DROP
iptables -A INPUT -p 17 -s 60.239.1.191 -d 87.51.0.0/16 --dport 3201 --sport 8640 -j ACCEPT
iptables -A test2 -p 6 -d 171.251.223.201 --dport 12475 -j ACCEPT
iptables -A FORWARD -p 6 --sport 16527 -d 207.101.199.57 -j ACCEPT
iptables -A test1 -p 6 --sport 64087 -j ACCEPT
iptables -A test1 -p 6 -d 17.130.157.245 --sport 12628 -s 104.221.196.9 --dport 8929 -j ACCEPT
iptables -A INPUT -p 6 --dport 58643 -s 38.244.210.147 -d 199.54.82.0/24 --sport 45968 -j ACCEPT
iptables -A INPUT -s 137.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 18101 -j DROP
iptables -A OUTPUT -p 17 --dport 41932 -d 197.0.0.0/8 --sport 28914 -s 170.230.229.18 -j ACCEPT
iptables -A test2 -d 214.9.134.192 -j ACCEPT
iptables -A test1 -p 6 --sport 51795 --dport 56798 -s 202.125.67.171 -j ACCEPT
iptables -A INPUT -p 6 -s 67.0.0.0/8 --sport 60232 -j DROP
iptables -A test2 -p 220 -j DROP
iptables -A test1 -p 17 --sport 51704 -j ACCEPT
iptables -A FORWARD -p 6 --sport 223 -d 251.95.12.0/24 --dport 25473 -j ACCEPT
iptables -A INPUT -p 17 --sport 43950 -d 47.47.73.175 -j ACCEPT
iptables -A test2 -p 6 --dport 56050 -j ACCEPT
iptables -A INPUT -p 63 -s 32.230.0.0/16 -j DROP
iptables -A test2 -p 6 -d 24.248.191.244 --dport 22550 --sport 17325 -j ACCEPT
iptables -A test2 -p 17 -d 168.148.166.0/24 --sport 53994 -j ACCEPT
iptables -A INPUT -d 91.92.210.0/24 -s 147.163.251.0/24 -j ACCEPT
iptables -A INPUT -p 6 --sport 14027 -s 152.238.183.0/24 --dport 11359 -d 117.143.124.141 -j DROP
iptables -A INPUT -p 6 --sport 29253 -d 92.41.96.200 --dport 15534 -j ACCEPT
iptables -A test1 -p 17 -s 8.10.0.0/16 --dport 60057 -j DROP
iptables -A test1 -s 49.66.0.0/16 -p 24 -j ACCEPT
iptables -A INPUT -p 17 --sport 47467 -s 14.139.72.215 -d 44.0.0.0/8 --dport 65434 -j ACCEPT
iptables -A test1 -p 6 -s 176.25.0.0/16 --sport 48932 -j DROP
iptables -A FORWARD -d 3.58.0.0/16 -p 177 -j DROP
iptables -A FORWARD -p 6 -s 127.0.0.0/8 --sport 56176 --dport 19655 -d 188.59.152.187 -j DROP
iptables -A FORWARD -p 98 -j DROP
iptables -A test1 -p 17 --dport 21100 -j DROP
iptables -A OUTPUT -d 140.16.48.118 -j DROP
iptables -A INPUT -s 201.104.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 32427 -s 189.159.207.15 --dport 53617 -j ACCEPT
iptables -A test3 -s 18.248.249.134 -j ACCEPT
iptables -A test2 -p 17 --dport 49360 -d 24.213.35.33 -j ACCEPT
iptables -A FORWARD -s 26.0.0.0/8 -j DROP
iptables -A OUTPUT -s 1.95.0.0/16 -d 200.235.30.108 -j DROP
iptables -A test2 -s 196.33.175.11 -j ACCEPT
iptables -A FORWARD -p 23 -j DROP
iptables -A test3 -p 6 --dport 33925 -d 107.101.173.0/24 --sport 34678 -j DROP
iptables -A OUTPUT -p 6 -s 81.24.0.0/16 --dport 19457 -d 163.202.241.226 -j DROP
iptables -A test2 -p 17 --sport 10550 --dport 12517 -s 2.107.141.238 -j ACCEPT
iptables -A test1 -p 6 --sport 65411 -d 206.194.127.254 -j ACCEPT
iptables -A OUTPUT -p 17 -d 202.0.0.0/8 --dport 49897 --sport 21873 -j test1
iptables -A FORWARD -p 6 --dport 44265 -d 229.178.234.31 -j DROP
iptables -A test1 -p 6 --sport 39449 -d 123.115.156.0/24 -j DROP
iptables -A test2 -s 90.186.139.193 -p 194 -j DROP
iptables -A test1 -p 6 --dport 22276 -j ACCEPT
iptables -A OUTPUT -p 6 -s 20.233.0.0/16 --dport 61664 --sport 41762 -j DROP
iptables -A OUTPUT -p 6 --sport 49869 --dport 28284 -d 176.53.0.0/16 -j ACCEPT
iptables -A test2 -p 6 -s 113.221.0.0/16 --dport 52943 -j ACCEPT
iptables -A test2 -p 17 --dport 14875 --sport 57796 -j DROP
iptables -A FORWARD -p 6 --dport 25831 -j test3
iptables -A test2 -p 17 -d 213.16.177.244 --dport 33158 -j DROP
iptables -A test2 -p 17 --sport 65489 --dport 41004 -d 65.127.82.0/24 -j DROP
iptables -A FORWARD -p 17 -d 8.204.81.0/24 --dport 9093 -j ACCEPT
iptables -A test1 -p 17 --sport 12921 --dport 47653 -d 123.129.173.124 -j DROP
iptables -A test3 -s 61.129.95.168 -j DROP
iptables -A FORWARD -p 17 --sport 59294 -s 240.146.55.137 -d 25.183.38.229 -j ACCEPT
iptables -A FORWARD -s 227.212.73.118 -d 195.214.113.114 -j DROP
iptables -A test3 -p 6 --sport 39060 -s 234.213.207.145 --dport 64942 -j ACCEPT
iptables -A test1 -p 6 -s 188.7.145.177 -d 187.0.0.0/8 --sport 49789 -j ACCEPT
iptables -A INPUT -p 17 --dport 23128 --sport 40942 -j ACCEPT
iptables -A test3 -p 6 --sport 10026 --dport 33292 -j DROP
iptables -A INPUT -p 183 -s 179.220.194.90 -j ACCEPT
iptables -A FORWARD -s 167.85.178.6 -j DROP
iptables -A test3 -p 6 --sport 23509 -j DROP
iptables -A test3 -p 176 -d 52.240.189.176 -j ACCEPT
iptables -A test3 -p 17 -s 203.119.173.0/24 --dport 41765 -j DROP
iptables -A FORWARD -p 12 -j DROP
iptables -A test2 -s 10.47.0.0/16 -d 59.22.0.242 -p 69 -j DROP
iptables -A FORWARD -p 17 --dport 39304 -d 43.37.0.0/16 --sport 34623 -j DROP
iptables -A test3 -s 127.124.58.235 -p 111 -j DROP
iptables -A FORWARD -p 6 --dport 58275 -s 159.157.224.40 --sport 59577 -j ACCEPT
iptables -A INPUT -p 6 -s 39.42.132.254 -d 220.76.85.188 --dport 20989 -j DROP
iptables -A test3 -p 6 -d 181.0.0.0/8 --sport 1356 --dport 59432 -j ACCEPT
iptables -A FORWARD -p 17 --dport 46291 -d 205.0.0.0/8 -s 58.89.0.0/16 -j DROP
iptables -A test3 -p 17 --sport 43038 -j DROP
iptables -A OUTPUT -p 17 --sport 58916 -s 247.169.0.0/16 -d 23.174.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 46015 -j ACCEPT
iptables -A FORWARD -p 6 --sport 35145 --dport 57892 -j DROP
iptables -A OUTPUT -p 17 -s 16.0.0.0/8 --sport 52635 -d 147.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 -s 135.47.207.193 --dport 44553 -d 113.137.98.0/24 -j DROP
iptables -A test3 -s 180.0.0.0/8 -p 23 -j ACCEPT
iptables -A INPUT -p 17 --sport 21012 --dport 18059 -j ACCEPT
iptables -A test1 -p 17 --dport 59173 -s 70.250.108.0/24 --sport 14764 -j ACCEPT
iptables -A test3 -d 220.137.163.228 -p 150 -j DROP
iptables -A test1 -p 17 -s 226.33.0.0/16 --dport 36604 -d 117.237.98.124 -j ACCEPT
iptables -A OUTPUT -d 214.114.37.94 -j DROP
iptables -A test1 -p 17 --sport 64357 -j ACCEPT
iptables -A test1 -p 17 --sport 39436 -d 194.69.0.0/16 -j ACCEPT
iptables -A test2 -p 221 -s 47.19.0.0/16 -j DROP
iptables -A INPUT -p 6 --dport 29082 --sport 202 -s 12.224.113.39 -j ACCEPT
iptables -A INPUT -d 43.59.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --sport 22140 -d 89.122.96.153 -j DROP
iptables -A test2 -p 6 -d 157.105.0.0/16 --dport 12096 -s 170.38.75.0/24 -j DROP
iptables -A FORWARD -s 10.28.216.208 -j test3
iptables -A test2 -p 6 --sport 38973 -d 37.151.91.0/24 --dport 59702 -j DROP
iptables -A INPUT -p 17 --sport 6247 -j DROP
iptables -A INPUT -p 6 --dport 18091 -d 63.184.248.0/24 -s 33.135.183.240 -j DROP
iptables -A test3 -p 6 -s 58.6.0.0/16 -d 139.185.2.93 --dport 7996 -j ACCEPT
iptables -A OUTPUT -p 6 -d 42.11.0.0/16 --dport 53136 -j ACCEPT
iptables -A test1 -p 17 -s 45.143.245.161 --sport 47736 --dport 58812 -j DROP
iptables -A FORWARD -d 212.118.0.0/16 -s 231.62.71.205 -j ACCEPT
iptables -A test2 -p 6 --sport 46757 -s 214.232.234.80 -j DROP
iptables -A FORWARD -p 17 --dport 3157 -s 130.93.242.34 -d 154.154.242.13 -j DROP
iptables -A OUTPUT -p 6 --sport 64337 -j DROP
iptables -A test2 -p 17 --dport 29285 -s 229.25.178.126 --sport 14536 -j ACCEPT
iptables -A test2 -d 17.84.120.249 -j DROP
iptables -A test2 -p 6 --dport 11464 -j ACCEPT
iptables -A FORWARD -p 237 -j ACCEPT
iptables -A test1 -p 6 --sport 2326 -d 75.157.0.0/16 -s 107.0.0.0/8 -j DROP
iptables -A test2 -p 6 -s 4.124.239.221 --sport 13677 --dport 46032 -j ACCEPT
iptables -A test2 -p 6 -d 233.85.186.114 --sport 61628 -j ACCEPT
iptables -A OUTPUT -p 96 -j DROP
iptables -A INPUT -p 17 -d 106.200.62.177 --dport 40436 -s 156.190.227.200 -j ACCEPT
iptables -A test3 -p 6 --dport 6510 -j DROP
iptables -A FORWARD -p 17 -s 170.215.148.0/24 --sport 15071 --dport 30640 -j DROP
iptables -A FORWARD -p 17 --dport 22006 -s 30.205.118.171 -d 97.48.0.0/16 -j DROP
iptables -A FORWARD -p 6 --dport 62063 -s 189.156.0.0/16 --sport 5757 -j ACCEPT
iptables -A OUTPUT -p 6 -s 254.173.157.176 --sport 39369 --dport 23508 -j DROP
iptables -A FORWARD -d 66.63.253.22 -j ACCEPT
iptables -A test3 -p 17 -s 166.236.28.145 --dport 20438 --sport 18043 -j DROP
iptables -A INPUT -p 17 -d 95.190.139.224 -s 33.252.78.33 --sport 57725 -j ACCEPT
iptables -A test2 -p 6 --sport 38041 -j DROP
iptables -A test3 -p 6 --sport 2273 -s 48.179.95.110 -j DROP
iptables -A INPUT -p 6 --sport 19078 --dport 33852 -d 225.138.5.173 -j DROP
iptables -A test3 -p 6 --dport 53322 -d 141.63.162.0/24 --sport 34539 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 63666 -j ACCEPT
iptables -A test1 -d 90.85.101.144 -p 219 -j DROP
iptables -A test1 -p 6 --dport 11298 -j ACCEPT
iptables -A test2 -p 73 -j DROP
iptables -A INPUT -p 6 --dport 508 -j DROP
iptables -A test2 -p 17 -s 147.106.0.0/16 --sport 61975 -j DROP
iptables -A FORWARD -p 17 --dport 4924 --sport 46496 -d 125.66.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 42837 -d 232.75.0.0/16 -s 135.80.81.19 --sport 20145 -j DROP
iptables -A test2 -p 140 -d 44.160.248.0/24 -s 213.90.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 43273 -d 107.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -d 215.12.0.0/16 --sport 47390 -s 7.8.222.241 --dport 1811 -j DROP
iptables -A INPUT -d 248.244.157.192 -p 15 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 24269 -j ACCEPT
iptables -A INPUT -p 17 --dport 2646 -s 250.112.231.138 -j DROP
iptables -A test3 -d 149.0.0.0/8 -s 203.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 -d 105.0.0.0/8 --sport 35543 -s 201.169.0.0/24 -j DROP
iptables -A INPUT -p 17 --dport 19611 --sport 40960 -d 235.194.0.0/16 -j DROP
iptables -A test2 -p 56 -j DROP
iptables -A FORWARD -p 114 -j ACCEPT
iptables -A INPUT -p 6 --sport 56856 -j DROP
iptables -A INPUT -p 17 -d 235.0.0.0/8 --dport 60003 --sport 58722 -j DROP
iptables -A FORWARD -p 17 --dport 35713 --sport 19260 -j test2
iptables -A test1 -p 6 --dport 42094 --sport 61473 -d 103.0.0.0/8 -j DROP
iptables -A test2 -p 17 -d 88.10.93.173 --dport 43220 --sport 11661 -j ACCEPT
iptables -A test3 -p 17 -d 59.0.0.0/8 --dport 56899 -s 51.159.167.53 -j DROP
iptables -A INPUT -p 17 --dport 24873 -j DROP
iptables -A test2 -p 6 --dport 23930 -s 32.224.44.102 -j DROP
iptables -A test1 -p 17 --sport 26217 -j DROP
iptables -A test3 -p 17 -s 244.74.211.205 -d 191.90.228.14 --sport 389 -j DROP
iptables -A OUTPUT -p 6 -d 243.52.243.28 -s 32.100.0.0/16 --dport 15764 -j DROP
iptables -A OUTPUT -p 6 -d 176.67.241.204 --sport 16606 --dport 32491 -j ACCEPT
iptables -A test3 -p 17 -d 154.3.33.82 --sport 30226 -j ACCEPT
iptables -A INPUT -p 17 --dport 1531 -s 163.204.0.0/16 --sport 61521 -j DROP
iptables -A OUTPUT -p 6 --sport 31394 -j ACCEPT
iptables -A test1 -d 157.191.87.205 -s 79.137.250.198 -p 255 -j ACCEPT
iptables -A OUTPUT -p 6 -d 245.0.0.0/8 --dport 23790 -j ACCEPT
iptables -A test2 -p 6 --dport 64418 -s 182.130.140.0/24 -d 217.145.189.0/24 -j ACCEPT
iptables -A FORWARD -s 74.97.222.196 -j DROP
iptables -A test1 -p 6 -s 203.77.0.0/16 --dport 54092 --sport 14162 -j DROP
iptables -A FORWARD -p 17 -s 100.8.93.233 --sport 22069 -j DROP
iptables -A test3 -p 17 -s 69.90.146.111 -d 5.0.0.0/8 --dport 29132 -j ACCEPT
iptables -A test2 -p 17 --dport 23839 -j DROP
iptables -A FORWARD -p 6 --dport 62992 -s 164.133.227.166 -d 72.209.175.128 --sport 23690 -j DROP
iptables -A test3 -p 17 --dport 37068 -j ACCEPT
iptables -A FORWARD -p 6 --dport 43993 -j DROP
iptables -A test1 -d 154.164.193.244 -p 194 -j ACCEPT
iptables -A test3 -p 136 -j DROP
iptables -A FORWARD -p 17 --sport 22723 -j DROP
iptables -A OUTPUT -p 6 --dport 14521 -d 149.6.246.14 -j ACCEPT
iptables -A OUTPUT -p 31 -j ACCEPT
iptables -A FORWARD -p 17 --sport 27990 -d 228.250.220.0/24 -s 172.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 58733 --sport 62100 -d 114.135.193.0/24 -j DROP
iptables -A INPUT -p 17 -s 79.0.0.0/8 --dport 37125 -j DROP
iptables -A INPUT -p 17 -d 55.55.40.219 --dport 29133 --sport 16215 -j ACCEPT
iptables -A test1 -p 6 --dport 30353 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 43322 --dport 16494 -d 181.20.24.0/24 -j DROP
iptables -A FORWARD -p 17 --dport 53602 -d 211.64.41.249 -s 136.67.84.61 --sport 52910 -j ACCEPT
iptables -A test2 -p 6 -s 152.85.129.74 --sport 46690 --dport 4704 -j DROP
iptables -A test3 -p 6 -d 170.107.0.0/16 -s 79.107.17.32 --dport 13648 -j ACCEPT
iptables -A test1 -p 6 -d 56.75.71.0/24 --sport 39197 --dport 6985 -j DROP
iptables -A test1 -d 154.118.214.150 -p 130 -j ACCEPT
iptables -A FORWARD -p 17 -d 17.224.9.47 -s 87.0.0.0/8 --dport 20145 --sport 26161 -j DROP
iptables -A test3 -p 17 --dport 58414 -d 6.179.0.0/16 -s 186.16.0.0/16 -j DROP
iptables -A test3 -p 17 --dport 32180 -j ACCEPT
iptables -A test2 -p 17 --sport 21311 --dport 5167 -d 160.76.189.187 -j DROP
iptables -A test3 -p 6 -d 232.41.0.0/16 --sport 44708 -s 11.79.221.0/24 -j DROP
iptables -A test2 -p 17 --dport 46266 -d 62.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 10032 -j DROP
iptables -A test3 -p 6 --sport 57716 -s 62.131.253.0/24 -j ACCEPT
iptables -A FORWARD -s 69.101.29.81 -d 211.191.14.226 -p 61 -j DROP
iptables -A test1 -p 6 --sport 5117 -d 45.81.127.0/24 --dport 21847 -j DROP
iptables -A FORWARD -p 6 -d 68.184.108.185 -s 78.102.2.142 --dport 38518 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 30427 -j ACCEPT
iptables -A test3 -d 152.42.0.0/16 -j DROP
iptables -A test1 -d 162.242.123.37 -p 82 -j DROP
iptables -A OUTPUT -s 55.217.140.0/24 -d 208.216.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --sport 16517 --dport 13194 -j DROP
iptables -A test2 -p 17 -d 31.149.0.0/16 --dport 27975 --sport 64463 -j DROP
iptables -A test1 -p 17 -d 16.65.47.10 --sport 34733 -j ACCEPT
iptables -A test1 -s 18.193.0.0/16 -p 11 -j DROP
iptables -A test1 -p 17 -s 134.0.0.0/8 --dport 48004 --sport 19236 -j DROP
iptables -A INPUT -s 27.178.96.0/24 -p 223 -j DROP
iptables -A INPUT -p 6 --sport 15686 --dport 57972 -j ACCEPT
iptables -A test1 -p 17 -d 108.231.57.174 --dport 30612 -j DROP
iptables -A test2 -p 6 -s 219.48.170.207 --dport 28633 -d 183.55.21.239 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 41993 -d 134.214.228.0/24 --dport 449 -j DROP
iptables -A OUTPUT -p 17 -d 153.231.86.27 --dport 23833 -j DROP
iptables -A test2 -p 6 --dport 23730 -d 12.242.76.0/24 -j DROP
iptables -A INPUT -d 94.162.247.200 -j ACCEPT
iptables -A test1 -p 17 --dport 21839 -s 42.16.10.208 -d 147.115.53.14 -j DROP
iptables -A test3 -p 17 -s 13.23.0.0/16 --dport 24295 -j DROP
iptables -A OUTPUT -s 232.63.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --sport 18280 --dport 18546 -j DROP
iptables -A test1 -p 17 --dport 40003 -d 164.234.55.222 -s 125.173.206.0/24 -j DROP
iptables -A test3 -p 17 -s 166.81.0.0/16 --sport 19464 -d 143.142.0.0/16 --dport 46792 -j ACCEPT
iptables -A test3 -p 6 --dport 61318 --sport 4505 -d 61.246.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -d 34.0.0.0/8 --sport 37288 -j DROP
iptables -A test2 -p 17 -d 143.142.40.207 -s 149.227.53.84 --sport 43978 -j ACCEPT
iptables -A FORWARD -s 186.52.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 -d 126.235.225.0/24 --sport 60879 --dport 45565 -j ACCEPT
iptables -A INPUT -p 6 --dport 28964 -j ACCEPT
iptables -A INPUT -p 6 --dport 14582 -s 249.191.77.0/24 -d 56.153.93.4 -j ACCEPT
iptables -A INPUT -p 6 --dport 64018 -d 39.132.31.0/24 -j DROP
iptables -A test2 -p 6 --dport 40196 --sport 28251 -j DROP
iptables -A INPUT -p 17 -s 141.12.220.45 --sport 7143 -j ACCEPT
iptables -A test1 -p 17 --dport 2854 -d 248.136.0.0/16 -s 44.172.252.157 --sport 58517 -j ACCEPT
iptables -A INPUT -p 6 -d 81.0.0.0/8 --sport 17018 -j ACCEPT
iptables -A test1 -p 177 -j DROP
iptables -A test3 -p 6 --sport 33254 -j DROP
iptables -A FORWARD -p 6 -d 195.121.0.0/16 -s 1.116.15.153 --dport 1542 -j ACCEPT
iptables -A INPUT -p 6 --sport 44143 -d 105.0.0.0/8 -s 12.239.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 49222 --sport 17642 -j DROP
iptables -A OUTPUT -p 17 --dport 25495 -s 142.69.50.221 -d 11.11.24.0/24 -j DROP
iptables -A test1 -d 201.32.229.205 -s 112.158.61.0/24 -j DROP
iptables -A INPUT -d 134.25.228.246 -p 58 -j DROP
iptables -A FORWARD -p 17 -d 12.64.33.204 -s 80.45.176.167 --dport 21780 -j DROP
iptables -A test1 -p 17 --dport 17989 -s 134.64.203.62 -d 195.124.194.89 -j DROP
iptables -A OUTPUT -p 17 -s 107.0.0.0/8 --sport 61236 -j DROP
iptables -A test1 -p 17 -s 220.142.160.241 -d 122.209.242.143 --dport 10414 -j DROP
iptables -A OUTPUT -p 17 -s 216.225.162.120 --dport 2267 -d 56.224.32.98 -j DROP
iptables -A INPUT -p 17 -s 212.58.13.0/24 --sport 46709 -j ACCEPT
iptables -A FORWARD -p 17 --sport 20447 -j ACCEPT
iptables -A test3 -p 17 --dport 49695 --sport 26425 -s 110.197.148.150 -d 152.121.123.209 -j DROP
iptables -A test2 -p 17 --sport 34971 -d 219.130.0.0/16 -s 5.144.152.226 --dport 39682 -j DROP
iptables -A test1 -d 250.133.195.63 -p 233 -j DROP
iptables -A OUTPUT -p 17 -s 197.188.44.52 --sport 27622 -d 87.0.0.0/8 -j DROP
iptables -A test3 -p 6 -d 140.0.0.0/8 --sport 62492 -j ACCEPT
iptables -A test3 -p 17 -d 56.53.131.0/24 --sport 24010 -j DROP
iptables -A test2 -p 6 -s 25.79.67.154 --dport 9639 -j ACCEPT
iptables -A test1 -s 195.119.0.0/16 -j DROP
iptables -A FORWARD -s 28.219.135.146 -j ACCEPT
iptables -A FORWARD -d 187.246.191.0/24 -j DROP
iptables -A OUTPUT -p 17 --sport 12097 -j ACCEPT
iptables -A test2 -s 120.112.138.14 -j ACCEPT
iptables -A test3 -p 6 -d 143.136.163.19 --dport 14521 -j DROP
iptables -A test2 -p 6 -s 28.98.104.58 --dport 30107 --sport 24819 -j DROP
iptables -A INPUT -p 6 --dport 57414 -j DROP
iptables -A test1 -p 17 --sport 13512 -j ACCEPT
iptables -A FORWARD -d 106.72.34.81 -j ACCEPT
iptables -A FORWARD -p 17 -d 226.227.213.42 --dport 64502 -s 207.74.0.0/16 -j ACCEPT
iptables -A test2 -d 2.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --sport 5408 -d 244.0.0.0/8 -j DROP
iptables -A test2 -p 17 -d 0.62.240.47 --sport 7773 --dport 13087 -j ACCEPT
iptables -A test2 -p 6 --dport 35662 -j ACCEPT
iptables -A test2 -p 17 --sport 39358 -d 46.252.5.98 -s 173.85.0.0/16 -j ACCEPT
iptables -A test1 -p 6 -s 153.102.14.0/24 -d 200.147.198.99 --dport 6067 -j ACCEPT
iptables -A test2 -d 142.6.232.217 -p 96 -s 208.62.114.126 -j DROP
iptables -A INPUT -p 93 -s 187.99.128.0/24 -j ACCEPT
iptables -A test1 -p 6 -s 213.192.70.70 --sport 31688 -d 240.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --sport 3787 --dport 58466 -j DROP
iptables -A FORWARD -d 15.63.71.182 -p 130 -j ACCEPT
iptables -A test2 -p 6 -s 86.90.204.169 -d 105.201.189.63 --sport 2056 -j DROP
iptables -A test2 -p 17 --dport 188 -d 126.112.78.197 --sport 55316 -j DROP
iptables -A test3 -p 17 -s 15.169.199.68 -d 141.0.0.0/8 --dport 52155 -j ACCEPT
iptables -A test2 -p 17 -s 102.113.206.0/24 --sport 10224 --dport 57608 -j ACCEPT
iptables -A test3 -d 242.187.69.57 -s 168.168.166.167 -p 93 -j ACCEPT
iptables -A test2 -p 6 --dport 51651 -s 98.207.117.226 -d 210.230.12.163 -j DROP
iptables -A INPUT -p 6 --dport 764 -j ACCEPT
iptables -A test3 -p 6 -s 166.211.39.25 -d 187.151.44.75 --dport 46107 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 58528 -j ACCEPT
iptables -A INPUT -p 6 -s 17.189.0.0/16 --dport 49382 -j DROP
iptables -A INPUT -p 6 --sport 4938 -j test2
iptables -A FORWARD -p 6 --dport 26937 -s 30.172.169.82 --sport 42120 -j ACCEPT
iptables -A OUTPUT -p 17 -d 245.0.0.0/8 --dport 57684 -s 24.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --sport 63878 -s 122.0.0.0/8 -j ACCEPT
iptables -A test3 -d 221.150.45.40 -j DROP
iptables -A OUTPUT -d 121.112.2.0/24 -s 236.39.95.248 -j ACCEPT
iptables -A INPUT -p 17 --dport 21067 -d 141.77.0.0/16 --sport 45534 -j ACCEPT
iptables -A FORWARD -p 17 --sport 30281 -d 46.0.0.0/8 --dport 47938 -j ACCEPT
iptables -A FORWARD -p 17 --dport 11481 --sport 8148 -j DROP
iptables -A OUTPUT -p 17 --dport 57974 -j DROP
iptables -A FORWARD -p 6 -d 186.34.215.0/24 -s 122.62.247.0/24 --dport 58798 -j ACCEPT
iptables -A INPUT -p 17 -s 112.137.235.231 --dport 19535 --sport 25206 -j DROP
iptables -A FORWARD -p 6 -d 67.88.0.0/16 --sport 9986 -s 9.235.132.0/24 -j DROP
iptables -A OUTPUT -p 6 -s 156.144.76.57 --dport 32114 -j DROP
iptables -A test1 -p 17 --dport 16738 -s 200.158.82.133 -j DROP
iptables -A test3 -p 17 -d 83.52.0.0/16 --dport 5838 -j DROP
iptables -A FORWARD -s 78.254.17.3 -j DROP
iptables -A OUTPUT -p 17 -s 117.89.100.104 --sport 38714 --dport 11333 -j ACCEPT
iptables -A test1 -d 219.78.54.181 -j DROP
iptables -A test1 -p 17 -d 123.147.0.0/16 --dport 55700 -s 205.46.120.93 -j DROP
iptables -A INPUT -d 180.86.0.0/16 -j DROP
iptables -A FORWARD -p 6 -s 78.3.0.0/16 --sport 44143 --dport 25267 -j test1
iptables -A test2 -p 17 --dport 58320 -d 223.169.215.187 -j ACCEPT
iptables -A test2 -p 6 -s 222.58.27.46 --dport 7924 --sport 32918 -j DROP
iptables -A test1 -p 6 -d 125.143.70.0/24 --sport 47027 -j DROP
iptables -A test1 -p 6 --dport 26873 -j DROP
iptables -A OUTPUT -p 6 -s 127.54.0.0/16 -d 144.94.0.0/16 --dport 38718 -j DROP
iptables -A test1 -p 6 --sport 3074 -j DROP
iptables -A test3 -p 17 -d 49.130.148.127 --dport 64368 --sport 23374 -j DROP
iptables -A test3 -p 17 -s 93.168.184.24 --sport 50435 -j ACCEPT
iptables -A INPUT -p 17 --sport 16618 -s 139.0.0.0/8 --dport 15908 -j DROP
iptables -A OUTPUT -d 245.166.131.46 -j ACCEPT
iptables -A test2 -d 196.75.195.106 -j DROP
iptables -A test1 -p 6 -d 82.201.158.79 --dport 47406 -j ACCEPT
iptables -A test1 -d 189.16.148.0/24 -j DROP
iptables -A OUTPUT -p 17 --sport 22964 --dport 57319 -s 48.131.10.4 -j test2
iptables -A INPUT -p 6 --sport 1111 -j DROP
iptables -A FORWARD -p 17 --sport 1732 -j ACCEPT
iptables -A test1 -p 6 -s 250.180.222.249 --dport 28382 --sport 80 -j ACCEPT
iptables -A FORWARD -p 17 --sport 3593 -d 65.122.24.160 -j ACCEPT
iptables -A test1 -s 183.0.0.0/8 -j DROP
iptables -A test3 -p 17 -d 100.151.239.150 --dport 36494 -j ACCEPT
iptables -A test3 -p 6 --sport 9163 -d 194.64.37.141 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 29576 -d 129.248.129.107 -j ACCEPT
iptables -A FORWARD -p 17 -d 125.72.201.219 -s 41.239.149.48 --dport 57994 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 42560 -s 223.37.46.185 --dport 2029 -j test1
iptables -A test1 -p 17 -d 9.127.194.62 --dport 22350 --sport 21845 -j DROP
iptables -A FORWARD -p 17 --sport 8136 -j DROP
iptables -A test3 -d 238.17.19.63 -s 2.245.175.0/24 -j ACCEPT
iptables -A test2 -p 17 -s 209.81.0.0/16 --sport 59094 -j ACCEPT
iptables -A FORWARD -p 6 --sport 3245 -j DROP
iptables -A OUTPUT -p 17 --sport 6220 -d 176.119.217.120 -s 250.80.199.150 --dport 65310 -j test3
iptables -A INPUT -p 17 --sport 19634 -d 255.0.0.0/8 -j DROP
iptables -A OUTPUT -d 223.226.146.246 -j ACCEPT
iptables -A INPUT -p 6 -d 197.127.227.0 --sport 3944 --dport 25684 -s 248.162.218.134 -j DROP
iptables -A test3 -d 80.119.198.204 -p 166 -j DROP
iptables -A INPUT -p 17 -d 180.187.237.0/24 --dport 40074 -j ACCEPT
iptables -A test1 -p 6 --dport 46191 -s 25.119.233.0/24 --sport 64496 -j DROP
iptables -A test1 -p 17 -d 94.0.0.0/8 --dport 16296 --sport 1967 -j DROP
iptables -A OUTPUT -p 17 --sport 31335 -d 219.65.236.0/24 --dport 53990 -j ACCEPT
iptables -A test1 -s 248.0.239.134 -j DROP
iptables -A OUTPUT -p 17 --dport 50218 -d 247.0.0.0/8 -j DROP
iptables -A OUTPUT -d 74.208.230.195 -s 12.182.215.31 -j DROP
iptables -A test2 -p 6 -d 112.241.227.140 --dport 10111 -s 148.0.0.0/8 --sport 44084 -j DROP
iptables -A test2 -p 17 --dport 60965 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 52680 -j DROP
iptables -A OUTPUT -d 17.0.0.0/8 -p 189 -s 35.83.0.0/16 -j DROP
iptables -A test3 -s 107.58.0.0/16 -d 53.188.109.71 -j DROP
iptables -A test3 -p 6 --sport 6680 --dport 38839 -j ACCEPT
iptables -A test2 -d 118.184.23.141 -j ACCEPT
iptables -A test1 -p 17 -s 69.240.21.60 --dport 8826 -j ACCEPT
iptables -A INPUT -p 17 -d 71.129.135.78 --sport 3639 -s 183.214.176.106 -j ACCEPT
iptables -A test2 -p 6 --dport 40805 -d 157.32.246.35 -s 164.121.235.253 -j ACCEPT
iptables -A test1 -d 41.148.2.87 -p 95 -s 240.169.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --sport 24867 --dport 20343 -j DROP
iptables -A INPUT -p 6 --dport 36578 -s 107.215.36.218 -j ACCEPT
iptables -A test2 -p 6 --sport 36489 -j DROP
iptables -A test2 -p 6 --dport 49843 -d 15.205.22.0/24 -j DROP
iptables -A test1 -p 17 --dport 46010 -s 30.229.126.108 -d 242.56.171.27 -j DROP
iptables -A test2 -p 6 --dport 36800 --sport 46937 -d 174.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --dport 61653 -j DROP
iptables -A FORWARD -p 6 -s 227.76.3.191 --dport 37022 -j ACCEPT
iptables -A OUTPUT -p 236 -j DROP
iptables -A test1 -p 6 --dport 53576 -d 37.181.234.0/24 --sport 45995 -s 253.83.53.0/24 -j DROP
iptables -A test3 -p 6 --dport 4120 -s 254.108.224.224 -j DROP
iptables -A test1 -p 17 --sport 15799 --dport 52444 -s 159.125.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --dport 47802 -s 70.0.0.0/8 -j DROP
iptables -A test1 -p 173 -s 122.12.0.0/16 -j DROP
iptables -A test2 -p 6 -d 49.0.0.0/8 --dport 9683 -j DROP
iptables -A FORWARD -p 6 -d 162.233.194.242 --sport 3558 -s 182.0.0.0/8 --dport 34141 -j ACCEPT
iptables -A test3 -p 17 -d 39.86.89.94 --dport 64244 -j ACCEPT
iptables -A test1 -p 6 -s 209.196.8.0/24 --dport 44346 -j ACCEPT
iptables -A test2 -p 6 -s 105.184.175.156 -d 80.114.142.136 --sport 61787 --dport 8849 -j ACCEPT
iptables -A INPUT -d 107.57.18.237 -j DROP
iptables -A test3 -p 6 --dport 31591 -d 94.13.219.0/24 --sport 61355 -j ACCEPT
iptables -A test3 -p 6 -s 215.0.0.0/8 --dport 9891 -j DROP
iptables -A test3 -p 6 -s 241.0.0.0/8 --dport 46332 -d 24.19.193.0/24 -j DROP
iptables -A test1 -p 17 --sport 24968 -j DROP
iptables -A test3 -p 17 --dport 15267 -d 80.155.128.20 --sport 52247 -j DROP
iptables -A test1 -p 62 -j DROP
iptables -A test2 -p 17 -s 162.243.0.0/16 -d 180.183.151.144 --dport 59845 -j ACCEPT
iptables -A INPUT -p 6 -d 166.163.201.247 --dport 3196 -s 151.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --dport 34332 -d 211.15.2.118 -j DROP
iptables -A OUTPUT -s 169.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 25298 -j DROP
iptables -A OUTPUT -p 17 --sport 10176 -j ACCEPT
iptables -A FORWARD -d 98.0.0.0/8 -s 241.226.2.164 -j ACCEPT
iptables -A INPUT -p 17 --sport 16152 --dport 53757 -s 207.106.236.0/24 -j ACCEPT
iptables -A OUTPUT -p 66 -j DROP
iptables -A OUTPUT -p 17 -s 35.36.0.0/16 --dport 17237 -d 74.42.0.0/16 -j DROP
iptables -A test3 -p 6 -d 228.160.170.160 --dport 36356 --sport 33863 -j DROP
iptables -A INPUT -p 17 --dport 47556 -j ACCEPT
iptables -A test2 -d 126.91.85.70 -j ACCEPT
iptables -A test2 -p 6 -d 8.57.93.147 --sport 45817 -j DROP
iptables -A test3 -p 6 --sport 63191 -j DROP
iptables -A test1 -p 6 -d 143.47.0.0/16 --dport 42178 -j DROP
iptables -A test3 -d 40.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 1570 --sport 39240 -j DROP
iptables -A FORWARD -p 17 --sport 47592 --dport 34857 -s 28.93.122.0/24 -d 107.139.216.162 -j ACCEPT
iptables -A FORWARD -p 17 --sport 6886 -j ACCEPT
iptables -A test1 -p 17 --dport 20523 -j DROP
iptables -A test1 -p 6 --sport 37903 -d 146.0.0.0/8 --dport 46612 -j DROP
iptables -A INPUT -p 17 -d 119.69.215.248 --dport 49782 --sport 44382 -j DROP
iptables -A OUTPUT -p 17 --dport 60997 -j ACCEPT
iptables -A test1 -p 17 --sport 42450 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 2015 -s 223.210.0.0/16 -j DROP
iptables -A INPUT -p 17 --dport 65153 -d 197.99.202.188 --sport 15191 -s 195.248.52.68 -j DROP
iptables -A OUTPUT -p 6 --dport 50589 -d 160.56.222.202 --sport 49723 -j ACCEPT
iptables -A test1 -p 6 --dport 29090 -j DROP
iptables -A OUTPUT -s 241.137.214.48 -d 4.164.68.9 -j DROP
iptables -A test2 -d 72.89.79.106 -s 190.47.182.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 -d 75.154.0.0/16 --sport 63427 -j DROP
iptables -A INPUT -p 17 -s 254.241.174.193 --dport 8720 -j DROP
iptables -A test3 -p 17 --dport 7905 -d 103.124.191.47 -j DROP
iptables -A test2 -p 17 --sport 47102 -d 228.19.15.143 --dport 13632 -j ACCEPT
iptables -A test2 -p 6 -d 162.66.45.10 --dport 14926 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 26499 --sport 27696 -s 0.171.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -s 62.200.230.0/24 --dport 57512 -j DROP
iptables -A test3 -p 17 --sport 36416 --dport 440 -s 109.6.245.250 -j DROP
iptables -A test2 -p 17 -d 194.0.0.0/8 -s 49.247.170.3 --dport 35386 -j DROP
iptables -A test2 -p 6 --sport 52817 -s 97.67.190.164 --dport 20945 -j ACCEPT
iptables -A test2 -p 6 --sport 45160 -s 211.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --dport 3184 -j ACCEPT
iptables -A FORWARD -p 6 --dport 24715 -s 36.159.115.191 -d 82.0.0.0/8 -j test2
iptables -A test1 -p 17 --dport 6078 -d 114.117.0.0/16 -s 8.5.143.183 -j ACCEPT
iptables -A test1 -p 17 -s 241.142.103.0/24 --dport 12717 -j ACCEPT
iptables -A FORWARD -p 6 --sport 15739 --dport 52773 -j DROP
iptables -A test2 -p 6 --sport 46635 -s 6.83.56.81 -j ACCEPT
iptables -A test1 -s 97.195.159.0/24 -j ACCEPT
iptables -A test2 -p 6 --sport 8361 --dport 54579 -s 111.10.233.33 -j DROP
iptables -A test3 -p 6 -d 182.85.240.115 --dport 48136 -s 109.124.16.157 -j ACCEPT
iptables -A INPUT -p 6 -d 57.152.0.0/16 --sport 62936 --dport 24399 -j DROP
iptables -A FORWARD -p 17 --dport 34679 -s 158.0.197.4 --sport 12600 -j ACCEPT
iptables -A OUTPUT -p 6 -d 207.148.254.9 --sport 20582 --dport 16643 -j ACCEPT
iptables -A test1 -s 196.6.69.220 -j ACCEPT
iptables -A FORWARD -p 17 --sport 9306 -d 35.169.240.0/24 -s 162.161.153.178 -j ACCEPT
iptables -A test1 -p 17 -d 111.248.231.0/24 -s 254.51.227.96 --sport 25326 -j DROP
iptables -A INPUT -p 17 --sport 10615 -j ACCEPT
iptables -A INPUT -p 6 --sport 56333 --dport 18100 -s 236.11.238.0/24 -d 132.49.140.172 -j DROP
iptables -A test3 -d 234.150.115.222 -j ACCEPT
iptables -A test3 -p 6 --sport 34840 -j ACCEPT
iptables -A test2 -p 17 --dport 17597 -d 84.154.179.0/24 -j DROP
iptables -A FORWARD -p 6 --dport 14966 -s 50.88.0.0/16 --sport 10160 -j ACCEPT
iptables -A test2 -p 17 --sport 56625 -s 111.237.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 50144 -d 193.139.80.160 -j ACCEPT
iptables -A test1 -p 6 -d 184.21.212.0/24 --dport 63577 -s 161.5.194.88 -j ACCEPT
iptables -A OUTPUT -s 136.179.37.88 -p 68 -d 161.217.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 17414 --dport 57115 -j DROP
iptables -A test3 -s 11.0.0.0/8 -j ACCEPT
iptables -A test2 -s 164.179.0.0/16 -p 1 -j DROP
iptables -A test2 -p 17 --sport 23767 -d 176.80.216.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 30633 -j DROP
iptables -A test2 -p 6 --sport 15597 -j DROP
iptables -A test2 -p 6 --dport 52628 -s 54.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 -d 131.84.239.31 --sport 28982 -s 6.93.0.0/16 -j DROP
iptables -A test1 -p 17 -d 170.169.172.0/24 --dport 62718 -j DROP
iptables -A INPUT -p 6 -s 146.0.0.0/8 --dport 56496 -j ACCEPT
iptables -A OUTPUT -p 89 -j DROP
iptables -A FORWARD -p 6 -d 91.135.0.0/16 --dport 14080 -s 113.65.164.0/24 -j DROP
iptables -A INPUT -p 6 --dport 17048 --sport 21499 -s 234.144.58.58 -d 175.74.161.30 -j DROP
iptables -A test3 -p 6 -s 152.22.176.84 --dport 59334 --sport 50198 -j DROP
iptables -A FORWARD -p 17 -s 46.225.23.138 -d 238.248.217.0/24 --sport 55001 -j DROP
iptables -A INPUT -p 17 -d 27.176.106.166 -s 240.0.0.0/8 --dport 47723 --sport 43920 -j DROP
iptables -A OUTPUT -p 6 -s 81.110.0.0/16 -d 186.139.63.0/24 --dport 23947 -j ACCEPT
iptables -A test3 -p 17 -d 118.172.22.150 --dport 23879 --sport 3405 -j DROP
iptables -A INPUT -s 45.126.48.0/24 -j ACCEPT
iptables -A test1 -s 199.171.98.124 -j DROP
iptables -A test2 -p 17 --sport 7830 -d 140.18.250.161 -s 31.209.45.178 --dport 24553 -j DROP
iptables -A OUTPUT -p 17 -s 121.58.0.0/16 --sport 22906 -d 31.100.207.155 -j DROP
iptables -A test3 -p 6 -s 246.255.0.0/16 -d 7.194.16.199 --sport 65013 -j DROP
iptables -A FORWARD -p 6 --sport 760 -j ACCEPT
iptables -A test2 -p 6 --sport 3917 --dport 39627 -j DROP
iptables -A test2 -s 38.0.0.0/8 -p 37 -j ACCEPT
iptables -A FORWARD -p 17 --dport 59883 -d 183.60.0.0/16 -s 192.237.112.175 -j ACCEPT
iptables -A test1 -p 6 --dport 16219 --sport 43035 -d 7.124.232.239 -j ACCEPT
iptables -A test2 -p 17 --dport 38056 -j DROP
iptables -A FORWARD -p 6 --dport 6195 -j DROP
iptables -A test2 -d 120.81.165.0/24 -j ACCEPT
iptables -A test3 -d 201.0.0.0/8 -j DROP
iptables -A test3 -p 17 --sport 17486 -j DROP
iptables -A FORWARD -p 6 --sport 23256 -s 132.215.0.0/16 --dport 10152 -j DROP
iptables -A OUTPUT -s 177.0.0.0/8 -d 148.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --sport 50643 -j ACCEPT
iptables -A test1 -p 17 --sport 17340 -d 67.67.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 -s 13.99.117.41 --dport 64349 -j ACCEPT
iptables -A OUTPUT -d 28.6.110.142 -j DROP
iptables -A OUTPUT -p 17 --sport 52677 -d 35.150.145.0/24 -s 7.23.226.0/24 -j DROP
iptables -A test3 -p 6 --sport 23089 -s 181.199.93.107 -j DROP
iptables -A test3 -p 6 --sport 3168 -d 247.58.245.96 -s 4.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 49955 -s 176.7.88.70 --sport 48242 -j ACCEPT
iptables -A FORWARD -s 62.159.149.21 -p 74 -j ACCEPT
iptables -A INPUT -p 6 -d 170.195.116.238 --dport 58577 -j DROP
iptables -A FORWARD -p 6 --dport 38496 -j ACCEPT
iptables -A test2 -p 6 --sport 58274 -s 131.115.80.189 --dport 7929 -j DROP
iptables -A test1 -s 172.108.67.46 -p 115 -j ACCEPT
iptables -A test1 -p 17 -d 51.142.195.214 --dport 2675 --sport 27384 -j ACCEPT
iptables -A FORWARD -p 72 -s 169.15.83.254 -j DROP
iptables -A FORWARD -s 103.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --dport 40777 -d 43.13.244.193 -j DROP
iptables -A OUTPUT -p 6 -d 58.136.0.0/16 --sport 47155 -j DROP
iptables -A test3 -p 17 --sport 21515 --dport 4072 -j DROP
iptables -A test3 -p 200 -s 160.197.76.0/24 -j DROP
iptables -A OUTPUT -d 48.0.0.0/8 -j DROP
iptables -A test1 -p 17 --sport 43372 -d 214.5.240.208 --dport 28031 -j DROP
iptables -A test2 -p 17 --sport 59745 --dport 17852 -j ACCEPT
iptables -A INPUT -p 17 --dport 19574 -j DROP
iptables -A test2 -p 216 -j ACCEPT
iptables -A test2 -d 20.163.140.0/24 -p 48 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 9950 -s 227.34.99.0/24 -d 220.250.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --sport 44604 -d 207.176.101.0/24 --dport 59622 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 59154 --dport 11834 -j DROP
iptables -A test3 -p 17 --sport 506 --dport 59646 -j DROP
iptables -A OUTPUT -d 128.98.50.126 -j DROP
iptables -A FORWARD -p 6 -d 179.109.232.216 --sport 24503 -j ACCEPT
iptables -A INPUT -p 17 --dport 46597 -d 111.246.80.43 -j ACCEPT
iptables -A test2 -p 17 -d 235.60.69.182 --dport 5609 -j DROP
iptables -A INPUT -s 4.242.118.62 -j DROP
iptables -A test3 -p 17 --dport 40447 -j ACCEPT
iptables -A test1 -p 6 --dport 44453 -s 196.72.161.138 -j DROP
iptables -A FORWARD -p 6 -s 67.76.0.1 --sport 18398 --dport 18305 -j ACCEPT
iptables -A test3 -p 6 -s 132.79.37.66 --sport 20686 --dport 10977 -d 102.224.9.0/24 -j DROP
iptables -A test1 -p 17 -d 208.27.86.239 --sport 28316 -s 177.160.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 -s 93.0.0.0/8 -d 181.166.231.30 --sport 50108 -j ACCEPT
iptables -A INPUT -p 17 --dport 50802 -j DROP
iptables -A OUTPUT -p 6 --dport 6703 --sport 50635 -j ACCEPT
iptables -A test2 -d 77.144.146.1 -j DROP
iptables -A OUTPUT -p 17 --sport 54107 --dport 46429 -j ACCEPT
iptables -A INPUT -p 6 -d 232.152.181.55 --dport 22158 --sport 51582 -j ACCEPT
iptables -A test3 -p 17 -d 90.0.0.0/8 --dport 50380 --sport 46481 -s 167.239.118.1 -j DROP
iptables -A test2 -p 6 --sport 60354 -d 239.0.0.0/8 --dport 37930 -j ACCEPT
iptables -A test3 -s 26.0.0.0/8 -d 36.87.0.0/16 -j DROP
iptables -A INPUT -p 17 --sport 43773 -j ACCEPT
iptables -A test2 -d 248.182.0.0/16 -j DROP
iptables -A test3 -p 17 --dport 64183 -s 244.29.191.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 6995 -s 86.150.121.12 -j DROP
iptables -A FORWARD -p 17 --dport 52844 -s 104.83.0.0/16 --sport 25712 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 63060 -j DROP
iptables -A OUTPUT -p 6 --sport 6193 -j DROP
iptables -A OUTPUT -p 6 -s 130.0.0.0/8 --sport 36289 -j DROP
iptables -A INPUT -p 17 -s 250.172.0.0/16 --sport 21668 -j DROP
iptables -A OUTPUT -p 6 --sport 4476 -d 216.140.1.0/24 --dport 56040 -s 110.35.244.48 -j DROP
iptables -A test1 -p 17 -s 111.184.0.0/16 --sport 43144 -j DROP
iptables -A test3 -p 17 -d 202.171.0.0/16 -s 181.79.251.74 --sport 35762 -j DROP
iptables -A test1 -s 2.0.0.0/8 -p 50 -j DROP
iptables -A test2 -p 6 --sport 5711 -s 235.219.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 24355 -j DROP
iptables -A INPUT -p 6 -d 155.156.0.0/16 --dport 21027 -s 143.236.170.75 -j DROP
iptables -A test2 -p 6 --sport 64219 -j ACCEPT
iptables -A test2 -p 6 -s 222.106.151.130 --sport 36606 -j ACCEPT
iptables -A test2 -p 6 -s 189.56.27.149 --sport 1667 --dport 10202 -j DROP
iptables -A test3 -p 173 -j ACCEPT
iptables -A test3 -p 236 -d 49.77.239.0/24 -j DROP
iptables -A FORWARD -p 17 -d 16.212.0.0/16 --sport 55716 --dport 61943 -j DROP
iptables -A test2 -p 6 --sport 25151 -j DROP
iptables -A INPUT -p 6 --sport 22324 -d 58.45.62.0/24 -j ACCEPT
iptables -A OUTPUT -s 71.78.128.216 -d 89.65.158.22 -j ACCEPT
iptables -A test2 -p 17 --dport 27943 --sport 64945 -s 84.209.0.0/16 -j ACCEPT
iptables -A OUTPUT -d 106.0.0.0/8 -j DROP
iptables -A FORWARD -d 207.140.229.18 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 6921 -j ACCEPT
iptables -A test1 -p 6 --dport 25758 -j ACCEPT
iptables -A test2 -p 243 -s 134.52.251.153 -j DROP
iptables -A test2 -p 6 --dport 55602 -j DROP
iptables -A FORWARD -p 6 -s 219.10.229.92 -d 118.205.134.0/24 --sport 53578 -j DROP
iptables -A INPUT -p 6 --dport 65372 -j ACCEPT
iptables -A FORWARD -p 17 --dport 19676 -j ACCEPT
iptables -A FORWARD -p 6 --dport 61447 -d 243.207.208.209 --sport 51652 -j DROP
iptables -A test1 -s 152.70.40.197 -d 34.160.35.109 -j DROP
iptables -A FORWARD -p 17 --sport 38551 -s 31.247.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -s 246.56.13.17 --sport 30954 -d 186.85.171.130 -j DROP
iptables -A INPUT -p 6 --dport 23411 -j test1
iptables -A test1 -p 6 --dport 8285 -j ACCEPT
iptables -A test1 -p 82 -j ACCEPT
iptables -A INPUT -p 17 --sport 8444 -s 151.164.171.77 --dport 37871 -j DROP
iptables -A FORWARD -p 229 -j ACCEPT
iptables -A test1 -p 6 -d 176.125.253.237 --sport 40686 -j ACCEPT
iptables -A FORWARD -s 164.100.23.0/24 -j DROP
iptables -A INPUT -p 6 --sport 14279 -d 35.0.0.0/8 --dport 48747 -s 172.0.0.0/8 -j DROP
iptables -A INPUT -d 211.107.0.0/16 -s 48.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 60915 --sport 27535 -d 25.190.0.0/16 -j DROP
iptables -A test2 -p 6 --dport 19464 -s 51.175.103.68 --sport 42273 -j ACCEPT
iptables -A FORWARD -p 17 --dport 19442 --sport 30097 -s 46.34.3.221 -j DROP
iptables -A FORWARD -p 6 --dport 12030 -j ACCEPT
iptables -A INPUT -p 6 -s 86.156.0.0/16 -d 192.211.0.0/16 --sport 43085 -j DROP
iptables -A FORWARD -p 6 --dport 21435 -s 204.53.0.0/16 -j DROP
iptables -A FORWARD -p 6 -d 47.48.0.0/16 --sport 11488 -s 70.77.213.11 -j DROP
iptables -A INPUT -p 6 --dport 62953 --sport 52458 -j ACCEPT
iptables -A FORWARD -s 160.33.44.0/24 -j DROP
iptables -A OUTPUT -p 84 -j DROP
iptables -A OUTPUT -p 6 --dport 22145 --sport 862 -j DROP
iptables -A test3 -p 6 --dport 11804 -s 199.198.238.211 -j DROP
iptables -A OUTPUT -p 6 --dport 48738 --sport 45482 -s 161.0.0.0/8 -j DROP
iptables -A test3 -p 17 -s 164.192.245.157 --sport 14556 -j DROP
iptables -A test2 -p 6 --dport 6378 -j DROP
iptables -A OUTPUT -p 6 --dport 23335 -s 243.148.122.0/24 -d 112.159.239.174 -j DROP
iptables -A INPUT -p 6 -s 178.0.0.0/8 -d 123.216.19.0/24 --dport 27898 --sport 52236 -j DROP
iptables -A test1 -p 17 --dport 17610 --sport 3301 -d 233.225.0.0/16 -s 149.0.0.0/8 -j DROP
iptables -A test1 -p 6 --sport 48557 -d 17.35.57.178 -j DROP
iptables -A test2 -p 17 -d 93.65.18.118 --dport 11981 --sport 61518 -j ACCEPT
iptables -A FORWARD -p 6 --dport 2401 -d 122.209.56.0/24 -j ACCEPT
iptables -A test2 -p 118 -d 96.73.0.0/16 -j DROP
iptables -A INPUT -p 17 --sport 19697 -d 112.15.0.0/16 --dport 392 -j DROP
iptables -A test2 -p 6 --dport 10750 -s 112.0.0.0/8 --sport 32947 -j DROP
iptables -A OUTPUT -p 6 --dport 45917 -s 145.121.98.164 -d 79.82.246.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 57148 --dport 25799 -j ACCEPT
iptables -A FORWARD -p 6 --dport 24768 -j ACCEPT
iptables -A FORWARD -p 17 --sport 29531 -j ACCEPT
iptables -A INPUT -p 17 --dport 26282 -s 247.162.82.228 --sport 24692 -j DROP
iptables -A INPUT -p 17 --dport 36306 -s 54.224.47.144 -d 205.62.68.79 -j DROP
iptables -A test2 -p 6 -s 113.134.166.205 -d 144.230.40.0/24 --dport 9955 -j ACCEPT
iptables -A FORWARD -s 1.0.0.0/8 -p 185 -j ACCEPT
iptables -A FORWARD -p 17 --dport 12869 -j DROP
iptables -A FORWARD -p 6 --sport 14777 -j DROP
iptables -A FORWARD -s 3.176.0.0/16 -j ACCEPT
iptables -A OUTPUT -s 48.8.123.84 -d 182.21.30.0/24 -j DROP
iptables -A test1 -p 17 --sport 42276 --dport 45025 -d 137.0.0.0/8 -j ACCEPT
iptables -A test2 -s 125.90.243.35 -p 95 -j ACCEPT
iptables -A OUTPUT -p 17 -s 60.0.0.0/8 -d 10.71.0.0/16 --dport 32081 -j test1
iptables -A test1 -p 6 --dport 21887 -j ACCEPT
iptables -A test3 -p 6 --sport 9069 -j DROP
iptables -A INPUT -p 6 --dport 19131 -d 17.176.56.0/24 -s 51.46.0.0/16 -j DROP
iptables -A test2 -p 17 -d 16.204.218.101 --dport 17325 -j DROP
iptables -A test2 -s 78.80.144.53 -j ACCEPT
iptables -A test3 -p 17 --dport 40061 --sport 64411 -j ACCEPT
iptables -A INPUT -p 6 -s 180.230.111.3 -d 15.137.146.154 --sport 33861 -j ACCEPT
iptables -A test2 -p 17 -d 138.196.84.0/24 --dport 35805 -j DROP
iptables -A test3 -p 6 --sport 40247 --dport 15215 -d 228.237.29.145 -j ACCEPT
iptables -A FORWARD -p 17 --sport 4938 -d 167.0.0.0/8 --dport 119 -j ACCEPT
iptables -A INPUT -p 6 --sport 58901 -d 216.72.78.55 --dport 11144 -j DROP
iptables -A INPUT -p 98 -j DROP
iptables -A test1 -p 17 --sport 914 -s 120.0.0.0/8 --dport 41381 -j DROP
iptables -A OUTPUT -p 6 --sport 28998 -s 8.239.166.0/24 -j DROP
iptables -A test3 -p 17 --sport 15626 -s 88.0.0.0/8 -d 251.60.9.22 -j DROP
iptables -A FORWARD -p 6 -s 170.0.0.0/8 --sport 34740 --dport 64834 -j ACCEPT
iptables -A test1 -p 6 -s 6.88.0.0/16 --dport 22113 -j DROP
iptables -A test2 -p 6 --sport 33515 --dport 9667 -s 203.104.90.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -s 141.251.53.69 --dport 53150 -d 129.43.100.162 -j DROP
iptables -A FORWARD -p 17 --sport 39467 -s 189.49.11.13 -j ACCEPT
iptables -A test1 -p 6 -d 170.172.233.0/24 -s 185.28.158.50 --sport 56890 -j DROP
iptables -A INPUT -p 17 -s 218.238.145.167 --dport 40689 -j ACCEPT
iptables -A INPUT -s 82.95.108.240 -p 163 -j DROP
iptables -A OUTPUT -p 6 -s 135.138.225.26 --dport 56273 -j ACCEPT
iptables -A test2 -p 6 -s 202.33.0.0/16 --dport 45394 --sport 4008 -j DROP
iptables -A test3 -d 69.86.234.204 -j ACCEPT
iptables -A INPUT -p 17 --sport 27022 -d 38.10.194.0/24 -j ACCEPT
iptables -A OUTPUT -d 126.62.106.0/24 -j DROP
iptables -A test1 -p 6 -s 46.98.0.0/16 --sport 41554 -j ACCEPT
iptables -A test1 -s 131.225.47.71 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 29850 --dport 9727 -s 82.133.159.0/24 -j DROP
iptables -A FORWARD -p 94 -j DROP
iptables -A INPUT -s 151.183.0.0/16 -p 199 -j DROP
iptables -A FORWARD -p 6 --sport 58053 -j DROP
iptables -A INPUT -p 17 --dport 47092 -s 43.71.213.31 -d 251.0.0.0/8 --sport 39867 -j DROP
iptables -A INPUT -p 17 --sport 59282 -s 155.145.219.6 -d 34.119.202.51 -j DROP
iptables -A FORWARD -p 17 --sport 47898 -d 70.142.8.248 --dport 44074 -j ACCEPT
iptables -A OUTPUT -d 65.0.0.0/8 -j DROP
iptables -A test3 -p 17 -d 82.184.83.111 --sport 42905 --dport 57058 -j ACCEPT
iptables -A OUTPUT -p 17 -d 32.177.192.0/24 --dport 2951 -j ACCEPT
iptables -A test3 -p 17 -d 46.148.0.0/16 --sport 15484 --dport 59642 -j ACCEPT
iptables -A test1 -p 6 --sport 14423 -j ACCEPT
iptables -A OUTPUT -p 145 -j DROP
iptables -A test1 -d 20.136.124.0/24 -j DROP
iptables -A INPUT -p 6 --dport 34716 -d 20.34.185.185 --sport 19429 -s 251.68.48.211 -j DROP
iptables -A INPUT -p 6 --dport 3254 --sport 30904 -s 46.178.0.0/16 -j ACCEPT
iptables -A test3 -d 94.83.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 42408 -s 235.187.0.0/16 -d 9.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 52988 -j ACCEPT
iptables -A test3 -p 6 -d 240.96.162.29 --dport 49478 --sport 23946 -s 202.160.0.0/16 -j DROP
iptables -A INPUT -p 17 --sport 23526 -j ACCEPT
iptables -A test2 -p 17 --dport 51584 -j ACCEPT
iptables -A INPUT -p 17 --dport 35624 -j ACCEPT
iptables -A test2 -p 17 --dport 11640 --sport 47213 -s 80.33.6.213 -j DROP
iptables -A test1 -d 131.0.0.0/8 -j DROP
iptables -A test1 -p 20 -j DROP
iptables -A INPUT -p 17 -s 241.0.0.0/8 -d 156.73.0.0/16 --dport 63758 -j ACCEPT
iptables -A FORWARD -p 17 -d 213.175.37.31 --sport 23391 -j DROP
iptables -A test1 -p 17 --sport 4926 -s 35.152.138.199 --dport 18648 -d 46.25.0.0/16 -j DROP
iptables -A INPUT -p 17 -d 128.206.0.0/16 --sport 24043 -s 120.178.196.149 -j DROP
iptables -A OUTPUT -p 184 -j ACCEPT
iptables -A test3 -p 145 -j DROP
iptables -A FORWARD -p 17 --sport 28533 -s 180.193.94.37 --dport 42382 -j ACCEPT
iptables -A test3 -p 17 --sport 34930 -d 193.174.46.102 --dport 37563 -j DROP
iptables -A OUTPUT -p 17 -d 1.0.0.0/8 --dport 11895 -s 202.0.0.0/8 --sport 55585 -j ACCEPT
iptables -A FORWARD -p 17 --sport 590 -s 253.93.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 20601 --dport 7874 -d 238.163.98.0/24 -j ACCEPT
iptables -A test3 -d 159.0.183.39 -j ACCEPT
iptables -A test2 -d 30.112.82.0/24 -j ACCEPT
iptables -A test1 -p 6 -s 245.0.0.0/8 -d 16.0.0.0/8 --sport 59533 -j ACCEPT
iptables -A test3 -p 17 --sport 26572 -d 32.171.41.11 --dport 55651 -j DROP
iptables -A INPUT -p 17 -s 180.17.185.0/24 --sport 63618 --dport 31031 -j ACCEPT
iptables -A test2 -p 17 --sport 48792 -d 51.112.27.0/24 --dport 60968 -j DROP
iptables -A OUTPUT -p 20 -j ACCEPT
iptables -A FORWARD -p 147 -j ACCEPT
iptables -A INPUT -s 171.242.220.111 -j ACCEPT
iptables -A test3 -p 6 --sport 43639 -d 39.140.235.162 -j ACCEPT
iptables -A test3 -p 6 --dport 37048 --sport 36458 -j ACCEPT
iptables -A OUTPUT -s 220.84.136.17 -d 12.0.0.0/8 -j DROP
iptables -A test2 -p 17 -s 152.94.0.0/16 -d 50.160.30.0/24 --sport 7412 -j ACCEPT
iptables -A test3 -p 6 --sport 28065 --dport 55989 -j DROP
iptables -A test2 -p 17 -d 154.136.51.0/24 --sport 59414 -s 160.239.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --sport 24122 --dport 65050 -s 21.212.69.209 -d 23.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --sport 59271 -j ACCEPT
iptables -A test3 -p 6 --dport 44120 -s 239.0.0.0/8 --sport 16304 -j ACCEPT
iptables -A FORWARD -d 158.135.218.92 -s 217.0.0.0/8 -p 6 -j DROP
iptables -A test1 -p 17 --sport 12979 -j DROP
iptables -A INPUT -p 6 --dport 17941 -d 207.239.146.0/24 -s 167.13.0.0/16 -j DROP
iptables -A INPUT -p 226 -j ACCEPT
iptables -A INPUT -p 17 -s 132.7.45.226 --dport 57359 -d 137.163.0.0/16 -j DROP
iptables -A test3 -p 17 -d 121.0.0.0/8 --sport 62930 -s 184.239.151.166 --dport 63205 -j DROP
iptables -A test1 -p 17 --sport 37109 -s 156.73.34.220 -d 156.137.236.33 -j DROP
iptables -A FORWARD -s 98.74.173.75 -j DROP
iptables -A OUTPUT -p 112 -d 6.37.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --dport 58575 -d 48.0.0.0/8 -j ACCEPT
iptables -A FORWARD -s 128.77.0.0/16 -d 132.218.131.146 -j DROP
iptables -A FORWARD -s 1.81.204.217 -p 209 -j DROP
iptables -A test1 -p 17 --dport 56894 -d 50.124.224.29 -s 221.60.37.207 -j ACCEPT
iptables -A test3 -p 6 --dport 30811 -j ACCEPT
iptables -A INPUT -p 6 --dport 44085 -j DROP
iptables -A FORWARD -p 6 -s 20.124.131.151 --dport 38184 -j DROP
iptables -A INPUT -p 17 -d 48.191.0.0/16 -s 68.0.0.0/8 --dport 43872 -j test3
iptables -A test3 -p 6 --sport 62218 -d 160.53.244.46 -j ACCEPT
iptables -A OUTPUT -s 240.101.155.216 -d 218.142.190.185 -j ACCEPT
iptables -A INPUT -p 6 --dport 18980 -j DROP
iptables -A test2 -p 17 -s 39.55.0.0/16 --sport 31279 -d 47.110.24.3 -j ACCEPT
iptables -A test2 -d 245.0.0.0/8 -s 115.95.26.101 -j ACCEPT
iptables -A test2 -s 132.64.148.26 -j DROP
iptables -A test1 -p 17 --dport 1558 -j DROP
iptables -A OUTPUT -p 162 -j ACCEPT
iptables -A test2 -p 17 --sport 18100 -j ACCEPT
iptables -A OUTPUT -s 94.222.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --dport 45513 -d 225.216.219.76 -j test2
iptables -A FORWARD -p 6 -s 20.7.201.234 --sport 22806 -j DROP
iptables -A FORWARD -p 17 -s 250.102.119.180 --sport 58859 --dport 14858 -j DROP
iptables -A test1 -p 17 --sport 36726 -j ACCEPT
iptables -A test2 -p 29 -j DROP
iptables -A test3 -p 6 -s 240.0.0.0/8 --dport 33386 -j ACCEPT
iptables -A test1 -p 17 --dport 41375 -d 22.238.166.8 -j ACCEPT
iptables -A INPUT -p 6 -s 147.13.128.177 --sport 65077 -j ACCEPT
iptables -A test2 -p 6 --sport 5417 -j ACCEPT
iptables -A test3 -p 17 -s 90.249.227.132 --dport 61415 -j ACCEPT
iptables -A test3 -s 59.0.0.0/8 -p 254 -d 192.25.189.76 -j ACCEPT
iptables -A test3 -d 14.156.133.14 -p 213 -s 178.0.0.0/8 -j DROP
iptables -A test1 -p 17 --dport 56471 -j ACCEPT
iptables -A test1 -p 6 -s 166.245.195.219 --dport 42829 --sport 7791 -j ACCEPT
iptables -A test1 -p 17 --sport 39414 --dport 52094 -j DROP
iptables -A OUTPUT -p 17 --sport 21128 -d 185.103.76.0/24 --dport 46911 -j DROP
iptables -A test3 -p 6 --dport 26589 --sport 11748 -d 4.254.37.168 -s 158.115.77.101 -j DROP
iptables -A INPUT -p 6 -d 2.0.0.0/8 --dport 555 -j ACCEPT
iptables -A INPUT -p 237 -d 221.247.233.192 -j ACCEPT
iptables -A test1 -p 6 -s 226.208.82.2 --dport 3599 --sport 54528 -j DROP
iptables -A test1 -p 6 -d 206.214.52.60 -s 131.183.100.0/24 --dport 54359 -j ACCEPT
iptables -A FORWARD -p 6 --dport 15310 -s 230.64.69.239 -d 2.120.6.244 -j ACCEPT
iptables -A test1 -p 17 --sport 11136 -j DROP
iptables -A test2 -p 17 --dport 49247 -s 129.0.0.0/8 -d 138.77.254.235 -j ACCEPT
iptables -A test1 -s 84.23.145.237 -j DROP
iptables -A FORWARD -p 17 -d 146.130.243.107 --dport 16472 -j ACCEPT
iptables -A test2 -p 17 -d 204.187.0.0/16 --sport 31015 -j ACCEPT
iptables -A FORWARD -p 17 --dport 33988 -j ACCEPT
iptables -A test3 -d 141.0.0.0/8 -j DROP
iptables -A test1 -p 6 -s 192.22.0.0/16 -d 64.27.189.87 --dport 26480 -j DROP
iptables -A test1 -p 6 --sport 25725 --dport 51484 -d 31.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -d 236.129.0.0/16 --dport 37023 --sport 16055 -s 81.174.183.96 -j DROP
iptables -A OUTPUT -p 17 -d 242.166.34.0/24 -s 250.142.0.0/16 --dport 14348 -j DROP
iptables -A test1 -p 17 -s 5.76.72.113 -d 132.163.221.63 --sport 22914 -j ACCEPT
iptables -A INPUT -p 17 -s 43.162.0.0/16 -d 207.0.0.0/8 --dport 23189 -j DROP
iptables -A OUTPUT -p 6 --dport 5929 -s 192.77.0.0/16 -j DROP
iptables -A FORWARD -p 6 -s 94.0.0.0/8 --sport 2760 --dport 56004 -j ACCEPT
iptables -A INPUT -s 37.0.0.0/8 -d 211.118.138.203 -j test2
iptables -A OUTPUT -p 6 -d 107.238.154.73 -s 101.182.22.72 --sport 33391 -j ACCEPT
iptables -A test3 -p 17 --dport 19665 --sport 17520 -j DROP
iptables -A test1 -p 6 --dport 58519 -s 208.0.0.0/8 -d 100.108.166.41 -j DROP
iptables -A test3 -p 17 --sport 37405 -j ACCEPT
iptables -A FORWARD -p 17 --sport 30836 -s 70.72.79.0/24 -j ACCEPT
iptables -A INPUT -p 17 --sport 40005 -d 241.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 49777 --sport 50982 -s 137.140.212.209 -j ACCEPT
iptables -A test3 -p 6 -s 231.11.0.0/16 --dport 2610 --sport 10131 -j ACCEPT
iptables -A test1 -p 6 --dport 50979 -j DROP
iptables -A test3 -p 6 --dport 6300 -d 12.12.0.0/16 -j DROP
iptables -A test1 -s 38.247.17.0/24 -j DROP
iptables -A INPUT -d 245.111.54.247 -j ACCEPT
iptables -A INPUT -p 90 -j test1
iptables -A OUTPUT -p 6 --dport 43163 -d 113.215.122.253 -j DROP
iptables -A INPUT -p 17 --sport 13700 --dport 6644 -s 119.189.0.0/16 -d 140.231.46.105 -j ACCEPT
iptables -A test2 -d 49.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 --dport 60779 -s 252.155.218.166 --sport 32500 -j ACCEPT
iptables -A INPUT -p 6 -d 31.253.64.239 --dport 7233 -j ACCEPT
iptables -A INPUT -p 6 -d 168.167.0.0/16 --dport 24670 -j DROP
iptables -A test2 -p 17 --sport 42677 --dport 64177 -s 187.148.109.125 -j ACCEPT
iptables -A test3 -p 6 --sport 55230 -s 194.0.0.0/8 --dport 20124 -j ACCEPT
iptables -A FORWARD -p 17 --dport 65417 -j ACCEPT
iptables -A FORWARD -p 6 --dport 37680 -j test1
iptables -A INPUT -p 6 -s 40.199.68.199 --dport 12149 -j ACCEPT
iptables -A test2 -s 106.132.20.0/24 -j ACCEPT
iptables -A INPUT -p 6 --dport 5652 -j DROP
iptables -A FORWARD -p 6 --dport 57619 -j DROP
iptables -A test2 -s 151.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 56563 -d 127.223.0.0/16 -s 106.0.0.0/8 -j ACCEPT
iptables -A test2 -d 134.237.104.21 -j DROP
iptables -A test1 -p 17 --dport 14233 -d 85.0.0.0/8 -j DROP
iptables -A test3 -d 181.0.0.0/8 -p 179 -j DROP
iptables -A OUTPUT -p 6 --dport 31024 -j DROP
iptables -A test2 -p 6 --dport 31401 -j DROP
iptables -A test3 -p 17 -s 215.215.0.0/16 --sport 29238 --dport 62124 -d 167.131.251.10 -j DROP
iptables -A FORWARD -p 17 --dport 43804 -j DROP
iptables -A FORWARD -d 51.82.247.68 -s 30.148.114.0/24 -p 227 -j ACCEPT
iptables -A test1 -p 6 --sport 19413 -d 214.167.73.180 -j ACCEPT
iptables -A INPUT -p 6 --dport 46216 -s 116.94.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --dport 38986 -s 16.27.125.160 -d 166.238.31.0/24 -j ACCEPT
iptables -A test1 -p 17 -d 152.229.124.254 --sport 28904 -j DROP
iptables -A OUTPUT -p 17 -s 182.142.0.0/16 --sport 34083 --dport 527 -j ACCEPT
iptables -A INPUT -p 6 -s 32.0.0.0/8 -d 65.161.222.192 --sport 15686 -j DROP
iptables -A test1 -p 17 --sport 24055 -d 196.194.213.0/24 -s 3.224.75.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -d 43.38.0.0/16 --sport 50123 -j ACCEPT
iptables -A FORWARD -p 17 -d 116.146.0.0/16 --sport 61224 -s 53.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 21980 -d 227.147.77.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 21683 -s 185.200.246.0/24 -d 125.252.101.144 -j DROP
iptables -A test2 -s 13.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 -s 112.57.248.88 --dport 10943 -d 188.231.60.140 -j ACCEPT
iptables -A FORWARD -p 6 --dport 42156 -s 187.193.204.46 -j DROP
iptables -A FORWARD -s 197.141.228.241 -j DROP
iptables -A FORWARD -s 201.246.68.64 -j DROP
iptables -A test3 -p 37 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 24413 --dport 55263 -j ACCEPT
iptables -A FORWARD -p 6 -s 138.168.0.0/16 --dport 47547 -j ACCEPT
iptables -A INPUT -d 135.178.75.1 -p 133 -s 253.225.182.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 56645 -s 2.120.184.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 -d 207.0.0.0/8 -s 242.112.0.0/16 --dport 21095 -j DROP
iptables -A test1 -p 6 -s 254.0.0.0/8 -d 1.68.164.0/24 --sport 28337 -j DROP
iptables -A test3 -s 232.34.208.0/24 -d 25.20.99.0/24 -p 245 -j ACCEPT
iptables -A test1 -p 17 --dport 29805 -d 64.84.42.192 -j DROP
iptables -A test3 -p 17 --dport 65532 -j ACCEPT
iptables -A FORWARD -p 17 --sport 35744 --dport 12592 -j DROP
iptables -A OUTPUT -d 151.220.20.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 11814 -d 255.49.0.0/16 -s 145.185.114.241 -j DROP
iptables -A test3 -p 6 --sport 42733 --dport 35781 -d 151.141.76.0/24 -j DROP
iptables -A OUTPUT -s 19.38.119.0/24 -j DROP
iptables -A test2 -p 6 -s 7.154.0.0/16 --sport 53477 --dport 58684 -j DROP
iptables -A test1 -p 17 -d 132.178.183.61 --sport 50221 -s 3.217.211.123 -j ACCEPT
iptables -A FORWARD -p 17 --sport 62683 -d 82.191.126.28 -s 44.37.0.0/16 -j DROP
iptables -A INPUT -p 6 -s 119.0.0.0/8 -d 128.175.197.42 --sport 50465 -j DROP
iptables -A test1 -p 6 -d 159.156.0.0/16 --sport 18423 -s 156.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 9894 -j ACCEPT
iptables -A test1 -p 17 --dport 15952 -j DROP
iptables -A INPUT -p 17 -d 77.231.255.0/24 -s 192.81.0.0/16 --dport 47815 -j ACCEPT
iptables -A test3 -p 17 -d 202.173.91.135 --dport 36261 --sport 51263 -j DROP
iptables -A test3 -p 6 --dport 22286 -j ACCEPT
iptables -A INPUT -d 108.246.28.112 -s 25.124.205.81 -p 106 -j DROP
iptables -A test3 -p 17 -s 100.8.0.0/16 --sport 9269 -d 252.125.158.167 -j DROP
iptables -A INPUT -p 6 --sport 25379 -d 129.68.167.0/24 -j ACCEPT
iptables -A test2 -s 100.67.0.0/16 -p 163 -j DROP
iptables -A test1 -p 17 -s 157.61.219.16 --sport 62516 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 54747 -j DROP
iptables -A FORWARD -p 6 --sport 64012 -d 29.18.160.106 -j DROP
iptables -A test3 -p 6 -s 119.238.11.0/24 --sport 525 -j ACCEPT
iptables -A OUTPUT -p 6 -s 34.217.0.0/16 --dport 21175 -d 11.171.55.168 -j ACCEPT
iptables -A INPUT -p 6 --dport 1815 -d 233.21.162.76 -j DROP
iptables -A OUTPUT -d 89.130.183.0/24 -s 199.14.153.139 -p 236 -j ACCEPT
iptables -A test3 -p 17 -s 189.151.2.12 --sport 18252 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 39948 -d 253.176.202.98 --sport 57572 -j DROP
iptables -A OUTPUT -p 17 --dport 11353 -j DROP
iptables -A OUTPUT -p 17 --sport 20349 -j DROP
iptables -A INPUT -s 207.65.252.123 -j ACCEPT
iptables -A INPUT -p 17 -d 230.182.0.0/16 --sport 53202 -s 122.153.119.7 -j DROP
iptables -A OUTPUT -p 17 -s 130.160.143.92 --sport 59539 --dport 9335 -j DROP
iptables -A FORWARD -p 153 -j ACCEPT
iptables -A test3 -p 17 --sport 54998 --dport 31373 -j ACCEPT
iptables -A OUTPUT -s 216.50.11.0/24 -p 23 -j ACCEPT
iptables -A OUTPUT -d 201.44.74.191 -j DROP
iptables -A FORWARD -p 6 -d 53.179.0.0/16 --sport 18368 -s 172.164.0.0/16 --dport 22569 -j ACCEPT
iptables -A test2 -p 6 -s 59.194.99.158 --sport 10589 --dport 20142 -j DROP
iptables -A test1 -d 33.68.133.133 -s 145.107.42.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --dport 59994 -j DROP
iptables -A INPUT -p 17 -s 208.151.71.212 --dport 32782 -d 216.159.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --sport 63447 --dport 15441 -d 93.241.178.214 -j DROP
iptables -A test1 -p 6 -d 42.242.240.254 --dport 53090 -j ACCEPT
iptables -A OUTPUT -p 17 -d 110.25.23.67 -s 100.13.0.0/16 --sport 2082 -j ACCEPT
iptables -A INPUT -p 17 --sport 20928 -j DROP
iptables -A test2 -p 17 --sport 51088 -d 11.73.0.0/16 -s 139.0.0.0/8 --dport 62846 -j ACCEPT
iptables -A test3 -s 109.119.33.0/24 -j DROP
iptables -A OUTPUT -d 116.183.0.0/16 -j ACCEPT
iptables -A INPUT -d 188.176.202.221 -j ACCEPT
iptables -A test2 -p 6 --dport 25285 -d 72.4.0.0/16 -s 228.166.48.177 -j ACCEPT
iptables -A test1 -p 6 --dport 17858 --sport 52619 -d 229.88.150.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 50347 -d 80.84.223.143 -j ACCEPT
iptables -A OUTPUT -p 15 -j test2
iptables -A test2 -p 6 --dport 23073 -j DROP
iptables -A test2 -p 6 -s 161.101.201.0/24 --sport 24687 --dport 10583 -d 15.175.63.55 -j DROP
iptables -A test2 -p 248 -j ACCEPT
iptables -A test3 -p 6 -s 156.231.0.0/16 --sport 13424 --dport 10989 -d 248.149.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --dport 12672 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 4056 -d 1.126.143.32 --sport 11982 -s 134.132.24.124 -j ACCEPT
iptables -A test2 -p 6 -s 200.145.235.32 --dport 30931 -j DROP
iptables -A INPUT -d 72.189.158.212 -s 220.0.0.0/8 -j test1
iptables -A test2 -p 6 --sport 25702 -s 153.245.0.0/16 -j DROP
iptables -A test1 -p 6 --sport 42174 -j DROP
iptables -A test2 -p 17 -s 79.0.0.0/8 --sport 35512 -j ACCEPT
iptables -A test3 -p 17 --sport 46754 -s 95.233.0.0/16 -d 175.210.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -d 79.221.0.0/16 --sport 64139 -j ACCEPT
iptables -A FORWARD -p 17 --dport 65076 -j ACCEPT
iptables -A test2 -p 6 --sport 32736 --dport 21390 -s 131.17.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -d 89.23.0.0/16 --dport 21929 -j DROP
iptables -A INPUT -s 168.0.0.0/8 -j DROP
iptables -A OUTPUT -s 45.0.0.0/8 -j DROP
iptables -A test3 -p 17 -d 234.0.0.0/8 --dport 60804 -s 232.151.253.26 -j ACCEPT
iptables -A test1 -p 6 --sport 12496 --dport 44220 -j DROP
iptables -A test1 -p 17 --dport 59510 -j DROP
iptables -A test2 -p 17 -s 31.200.71.240 --sport 45366 --dport 47941 -j ACCEPT
iptables -A test2 -p 6 --sport 51428 --dport 9915 -s 35.227.0.0/16 -j DROP
iptables -A FORWARD -d 64.252.252.40 -j ACCEPT
iptables -A test1 -d 218.73.130.92 -j ACCEPT
iptables -A OUTPUT -p 6 -s 11.179.237.202 -d 180.74.133.12 --sport 16042 -j DROP
iptables -A INPUT -p 17 --dport 3586 -j ACCEPT
iptables -A INPUT -p 6 --dport 1126 --sport 824 -s 171.90.170.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 41215 -j DROP
iptables -A test3 -d 136.49.246.167 -j DROP
iptables -A FORWARD -p 13 -j DROP
iptables -A test2 -p 6 --sport 52842 --dport 16135 -j ACCEPT
iptables -A test1 -s 125.186.180.138 -p 36 -d 153.232.29.134 -j DROP
iptables -A test3 -p 17 --sport 42989 -s 239.0.0.0/8 -j DROP
iptables -A FORWARD -s 127.57.128.0/24 -d 148.75.177.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --dport 33431 --sport 47800 -j DROP
iptables -A FORWARD -p 17 --dport 17718 -d 81.181.65.54 --sport 32326 -j DROP
iptables -A FORWARD -d 200.44.14.52 -j ACCEPT
iptables -A test1 -p 17 --dport 37195 -d 19.29.75.0/24 -j DROP
iptables -A test1 -d 83.109.0.0/16 -p 190 -j ACCEPT
iptables -A test1 -p 6 --dport 64251 -s 116.32.243.0/24 --sport 41185 -j ACCEPT
iptables -A test2 -p 6 --dport 766 -s 82.0.0.0/8 --sport 24677 -j DROP
iptables -A OUTPUT -p 17 --sport 58794 -s 13.187.0.175 -j DROP
iptables -A INPUT -p 6 --dport 27835 -j ACCEPT
iptables -A test2 -s 179.202.166.224 -p 186 -j DROP
iptables -A INPUT -p 6 --dport 52823 --sport 46033 -j DROP
iptables -A test3 -p 17 --dport 39333 -d 91.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --dport 38564 -d 160.205.7.187 --sport 35867 -j ACCEPT
iptables -A FORWARD -p 17 -d 11.213.80.0/24 --dport 12193 -j DROP
iptables -A test1 -d 93.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --dport 28944 -j DROP
iptables -A FORWARD -p 6 --sport 4274 -d 226.3.0.0/16 -j ACCEPT
iptables -A test2 -d 15.156.197.223 -p 40 -j ACCEPT
iptables -A INPUT -p 6 -s 202.48.101.251 --sport 64489 -d 225.0.0.0/8 --dport 64532 -j ACCEPT
iptables -A INPUT -p 17 --dport 9778 --sport 61198 -j ACCEPT
iptables -A FORWARD -p 76 -j ACCEPT
iptables -A OUTPUT -p 17 -s 146.165.0.0/16 --dport 59743 -j ACCEPT
iptables -A test2 -s 225.46.186.106 -j DROP
iptables -A test1 -s 191.186.149.57 -j DROP
iptables -A test2 -p 17 -s 186.160.6.253 --dport 49265 -j DROP
iptables -A test2 -d 26.70.168.71 -j ACCEPT
iptables -A FORWARD -p 236 -j DROP
iptables -A test3 -p 6 -d 6.179.202.203 --dport 8813 -j ACCEPT
iptables -A test2 -p 6 -d 236.150.123.171 --dport 9767 -s 240.226.71.0/24 -j DROP
iptables -A test2 -p 6 --dport 58136 -d 72.68.115.94 -j DROP
iptables -A test1 -p 6 -d 112.39.10.203 --dport 61815 --sport 57810 -j ACCEPT
iptables -A INPUT -s 56.43.29.6 -j ACCEPT
iptables -A test1 -p 6 --dport 22221 -j DROP
iptables -A INPUT -p 17 -s 56.225.220.201 --sport 42853 -j DROP
iptables -A test2 -d 176.32.0.0/16 -j DROP
iptables -A FORWARD -p 108 -j DROP
iptables -A OUTPUT -p 6 -s 43.173.249.196 --dport 527 -d 236.180.0.0/16 -j ACCEPT
iptables -A test1 -p 6 -d 55.173.37.0/24 -s 122.176.123.179 --sport 1874 -j DROP
iptables -A OUTPUT -p 11 -d 6.111.15.117 -j DROP
iptables -A INPUT -p 17 -s 63.56.85.0/24 --sport 7633 -d 236.222.126.0/24 --dport 24071 -j DROP
iptables -A test1 -p 17 --dport 27265 -j ACCEPT
iptables -A INPUT -p 6 --dport 41560 -s 123.203.93.127 --sport 50698 -j DROP
iptables -A INPUT -p 244 -s 118.207.145.168 -d 240.213.72.42 -j DROP
iptables -A test1 -p 17 --sport 46004 -j DROP
iptables -A FORWARD -p 6 -s 58.99.76.103 -d 201.48.138.241 --sport 33988 -j ACCEPT
iptables -A OUTPUT -p 17 -d 255.0.0.0/8 -s 110.194.139.5 --dport 28165 -j DROP
iptables -A test1 -p 45 -j ACCEPT
iptables -A test2 -p 17 -d 69.77.0.0/16 --dport 47476 -s 215.55.213.0/24 -j ACCEPT
iptables -A OUTPUT -d 2.177.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 28009 -j DROP
iptables -A test3 -s 221.112.70.116 -j DROP
iptables -A test1 -p 6 --dport 47877 -j DROP
iptables -A test2 -p 17 --sport 55350 -d 34.123.178.174 --dport 55261 -j ACCEPT
iptables -A test2 -p 17 --dport 24064 -d 102.224.37.81 -j DROP
iptables -A test1 -p 6 -d 82.215.136.0/24 --sport 44458 -j DROP
iptables -A test3 -p 6 --dport 57598 -j DROP
iptables -A test3 -p 6 --sport 40686 --dport 46212 -s 102.134.154.140 -d 16.0.0.0/8 -j DROP
iptables -A INPUT -p 17 -s 200.31.153.0/24 --sport 44036 -j DROP
iptables -A INPUT -p 61 -j DROP
iptables -A test1 -p 6 --sport 48376 -s 166.17.114.189 -j ACCEPT
iptables -A test3 -p 6 -s 156.0.0.0/8 --sport 22003 -d 183.35.68.10 -j DROP
iptables -A test3 -p 6 -s 143.186.0.0/16 --dport 61410 -j ACCEPT
iptables -A test2 -p 17 --dport 64991 -s 192.6.34.72 -j ACCEPT
iptables -A test3 -p 6 -d 138.43.7.174 --sport 28996 --dport 12707 -j DROP
iptables -A test2 -p 6 --dport 53254 -s 75.70.122.123 --sport 31137 -j ACCEPT
iptables -A test2 -p 6 --sport 19068 -d 86.0.0.0/8 -s 21.41.39.106 -j DROP
iptables -A INPUT -p 17 --dport 8549 -s 17.192.124.216 -j ACCEPT
iptables -A test1 -p 17 -d 166.202.0.0/16 --sport 3915 -s 204.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 62550 -j ACCEPT
iptables -A test2 -p 17 --sport 20948 --dport 6015 -d 64.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --dport 27770 -j ACCEPT
iptables -A test1 -p 17 --sport 21572 -j DROP
iptables -A test3 -p 6 --sport 15064 --dport 9330 -j DROP
iptables -A FORWARD -p 6 --sport 5675 -j ACCEPT
iptables -A INPUT -p 6 -d 253.96.0.0/16 --sport 25349 -j DROP
iptables -A INPUT -p 17 --dport 43966 -d 226.110.150.31 -s 215.235.165.154 -j ACCEPT
iptables -A test1 -s 46.195.147.59 -p 123 -j DROP
iptables -A FORWARD -p 246 -j DROP
iptables -A test1 -s 171.91.0.0/16 -p 107 -j ACCEPT
iptables -A INPUT -p 17 -d 219.96.0.0/16 -s 83.72.50.208 --dport 60286 -j DROP
iptables -A FORWARD -p 6 --sport 60823 -s 214.137.175.0/24 --dport 14427 -j DROP
iptables -A INPUT -p 17 --dport 41449 -j DROP
iptables -A test3 -p 17 --dport 45755 -s 52.217.64.117 -d 172.113.1.0/24 -j DROP
iptables -A test3 -p 6 -d 120.205.246.204 --sport 7358 -s 255.205.250.0/24 -j DROP
iptables -A test2 -p 17 --dport 41295 -j DROP
iptables -A OUTPUT -p 17 -s 190.77.165.249 --dport 50125 -j DROP
iptables -A test3 -p 17 -d 74.227.194.44 --dport 26230 --sport 63839 -s 144.206.200.159 -j DROP
iptables -A OUTPUT -p 17 --sport 31483 -j DROP
iptables -A test1 -p 17 -d 106.33.62.0/24 --dport 38742 --sport 36284 -j DROP
iptables -A test3 -p 17 -d 211.103.166.99 --sport 30929 -j ACCEPT
iptables -A FORWARD -p 6 -d 7.204.246.0/24 --sport 13056 -s 120.159.136.93 --dport 21772 -j ACCEPT
iptables -A test2 -p 17 --dport 36290 --sport 10636 -s 11.111.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 20066 -s 49.33.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --dport 16686 -s 139.249.116.131 -j ACCEPT
iptables -A INPUT -d 156.124.28.0/24 -j ACCEPT
iptables -A test2 -s 173.6.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --sport 44572 --dport 14047 -d 121.12.226.138 -j ACCEPT
iptables -A test1 -p 17 --dport 13205 --sport 5483 -s 220.235.245.213 -j DROP
iptables -A test3 -p 6 --dport 20407 -s 137.252.167.104 -j DROP
iptables -A test1 -p 17 --sport 15291 -d 2.252.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --sport 44009 -s 19.37.7.52 -d 98.233.63.246 -j ACCEPT
iptables -A INPUT -p 17 --sport 59490 -d 152.7.43.27 -j DROP
iptables -A INPUT -p 6 --dport 51352 -d 84.216.227.50 -j ACCEPT
iptables -A test1 -p 6 --sport 6473 -j ACCEPT
iptables -A test3 -p 6 -d 101.31.7.237 -s 35.0.0.0/8 --sport 8430 --dport 64663 -j DROP
iptables -A test3 -p 17 --sport 44018 -d 146.0.0.0/8 --dport 46666 -j DROP
iptables -A FORWARD -p 17 --sport 34287 -d 76.94.121.70 -j ACCEPT
iptables -A INPUT -p 6 -s 234.74.122.70 --dport 33939 --sport 33368 -j ACCEPT
iptables -A test1 -p 6 --sport 10532 -j ACCEPT
iptables -A FORWARD -p 17 --sport 22448 -j DROP
iptables -A test1 -p 6 --dport 43632 -s 117.220.157.124 --sport 21850 -j ACCEPT
iptables -A test1 -p 17 --dport 36635 -j ACCEPT
iptables -A FORWARD -p 6 --dport 25012 -d 21.232.239.0/24 --sport 40779 -j DROP
iptables -A INPUT -p 17 -s 162.0.0.0/8 --dport 8738 --sport 27075 -j ACCEPT
iptables -A test3 -p 17 --sport 19993 -s 170.20.113.0/24 -j DROP
iptables -A test2 -p 6 --sport 60759 -s 33.0.0.0/8 --dport 10659 -j ACCEPT
iptables -A OUTPUT -p 246 -j ACCEPT
iptables -A test1 -p 6 -d 201.246.12.155 --dport 14842 -j DROP
iptables -A OUTPUT -p 115 -s 137.0.0.0/8 -d 125.0.0.0/8 -j DROP
iptables -A OUTPUT -p 156 -j ACCEPT
iptables -A FORWARD -p 6 --dport 43149 -j DROP
iptables -A FORWARD -p 17 --sport 43506 --dport 54525 -s 172.60.105.152 -j DROP
iptables -A FORWARD -s 119.24.117.186 -d 77.178.213.0/24 -p 176 -j ACCEPT
iptables -A test2 -p 6 --sport 27798 -s 223.19.104.195 -d 103.165.203.0/24 -j DROP
iptables -A test1 -p 6 --sport 8446 -d 112.177.180.254 --dport 26894 -j DROP
iptables -A test2 -p 6 --dport 5441 -d 3.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -s 68.67.253.0/24 -d 27.161.1.28 --sport 40893 -j ACCEPT
iptables -A INPUT -p 17 --dport 4065 -j DROP
iptables -A OUTPUT -p 6 --dport 32318 -s 117.165.0.0/16 -j ACCEPT
iptables -A test1 -p 57 -j ACCEPT
iptables -A test3 -p 17 --dport 14204 -s 54.144.157.243 -j DROP
iptables -A test1 -p 103 -d 64.164.175.187 -j ACCEPT
iptables -A test2 -p 17 --dport 49575 -d 174.154.184.83 --sport 13711 -j DROP
iptables -A test2 -p 6 -d 193.227.3.141 --dport 30272 --sport 48271 -s 44.90.242.54 -j ACCEPT
iptables -A FORWARD -p 17 --dport 39184 -s 212.24.167.129 -j ACCEPT
iptables -A test2 -p 17 --dport 3017 -s 67.64.166.64 -j DROP
iptables -A FORWARD -p 6 -s 92.121.251.77 -d 184.39.0.0/16 --dport 9371 -j DROP
iptables -A FORWARD -p 6 --sport 11400 -s 214.159.217.0/24 --dport 60388 -j ACCEPT
iptables -A test1 -p 6 --sport 52477 -j ACCEPT
iptables -A INPUT -p 17 --dport 27397 -d 217.198.231.107 -j test1
iptables -A FORWARD -d 79.219.183.0/24 -j DROP
iptables -A test2 -p 6 --sport 64797 -j ACCEPT
iptables -A FORWARD -p 17 --dport 26307 --sport 37572 -j test2
iptables -A INPUT -p 6 --dport 44275 -d 42.92.194.24 -s 107.113.124.0/24 --sport 61612 -j DROP
iptables -A INPUT -p 6 --dport 50838 -s 51.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 22790 -j ACCEPT
iptables -A INPUT -s 116.212.19.160 -j ACCEPT
iptables -A test3 -s 56.109.0.0/16 -p 249 -d 217.0.0.0/8 -j DROP
iptables -A test1 -p 17 --dport 46837 -d 26.187.13.242 --sport 44868 -j ACCEPT
iptables -A INPUT -p 17 --dport 9853 -d 199.58.210.0/24 -j DROP
iptables -A OUTPUT -p 17 --dport 16924 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 7710 --dport 5569 -d 211.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 -d 140.146.183.50 --sport 55025 --dport 31897 -s 213.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 9712 -j ACCEPT
iptables -A test3 -d 198.197.0.0/16 -j DROP
iptables -A FORWARD -p 6 -s 144.161.55.137 --dport 43052 --sport 35918 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 52366 --dport 19515 -j test3
iptables -A test3 -p 17 -s 194.73.44.18 --dport 12488 -j DROP
iptables -A test1 -p 6 -d 64.225.28.157 --sport 39437 -s 216.213.27.0/24 -j DROP
iptables -A INPUT -d 22.15.239.196 -p 111 -j ACCEPT
iptables -A test1 -p 6 --sport 13869 -s 240.114.126.0/24 -d 115.143.13.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --sport 41194 -s 50.53.188.204 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 27722 --dport 12807 -s 132.240.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -d 178.77.238.207 --sport 22283 -j DROP
iptables -A OUTPUT -p 6 --dport 7244 -j ACCEPT
iptables -A FORWARD -p 17 -d 218.191.198.0/24 --sport 15715 -j DROP
iptables -A OUTPUT -p 17 --dport 62695 -j DROP
iptables -A INPUT -p 6 --dport 14835 --sport 56572 -j DROP
iptables -A FORWARD -p 6 -s 49.155.214.215 -d 176.208.98.91 --dport 3506 -j ACCEPT
iptables -A test2 -p 6 --dport 57830 -s 146.159.111.27 -d 59.54.54.76 --sport 31672 -j ACCEPT
iptables -A test2 -p 6 --sport 16427 -d 53.0.0.0/8 -s 241.9.0.0/16 -j DROP
iptables -A test2 -p 17 --sport 26076 -j ACCEPT
iptables -A test1 -p 6 --sport 21686 --dport 39572 -d 86.0.0.0/8 -j ACCEPT
iptables -A test2 -s 70.0.0.0/8 -p 206 -j DROP
iptables -A test2 -p 17 --sport 44317 --dport 56575 -d 151.228.45.140 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 2529 -d 145.91.105.175 -j ACCEPT
iptables -A test1 -p 6 -d 250.185.41.65 --dport 5596 --sport 29723 -j DROP
iptables -A test1 -s 249.0.0.0/8 -p 104 -d 148.0.0.0/8 -j DROP
iptables -A test2 -p 247 -d 242.248.56.240 -j DROP
iptables -A OUTPUT -s 168.236.216.108 -j DROP
iptables -A INPUT -d 215.204.110.203 -p 109 -j DROP
iptables -A OUTPUT -p 6 --dport 16518 -d 88.131.0.0/16 --sport 47157 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 8281 -j DROP
iptables -A FORWARD -d 67.211.223.174 -p 26 -j DROP
iptables -A OUTPUT -p 6 -d 166.12.212.99 --dport 13071 -s 221.148.184.102 -j ACCEPT
iptables -A test2 -p 6 --dport 48497 -j DROP
iptables -A FORWARD -p 6 -s 34.100.186.242 --dport 39326 --sport 5015 -j DROP
iptables -A INPUT -p 6 --dport 21029 -j DROP
iptables -A test1 -s 4.101.129.0/24 -j DROP
iptables -A test2 -p 6 --dport 55537 -j DROP
iptables -A OUTPUT -p 127 -j DROP
iptables -A test1 -p 6 --sport 6433 -j ACCEPT
iptables -A FORWARD -p 17 -s 29.132.0.0/16 --sport 36078 -j test1
iptables -A test3 -p 17 --dport 44742 -d 83.203.155.0/24 --sport 61119 -j DROP
iptables -A test3 -p 170 -j DROP
iptables -A test2 -p 6 --dport 36578 --sport 53426 -d 3.227.247.0/24 -s 56.115.85.137 -j DROP
iptables -A INPUT -p 17 --sport 7323 -d 234.54.218.108 --dport 49425 -j DROP
iptables -A test2 -p 17 --sport 29598 -d 170.223.174.0/24 --dport 37351 -j ACCEPT
iptables -A test2 -p 17 --dport 6469 -s 11.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --sport 46460 --dport 12989 -d 52.144.195.62 -j DROP
iptables -A INPUT -p 6 --dport 44686 -j DROP
iptables -A INPUT -s 247.219.38.15 -p 94 -j DROP
iptables -A FORWARD -p 17 --dport 23726 -d 179.116.187.214 -j DROP
iptables -A test2 -p 6 -s 52.161.176.234 --dport 62790 -j ACCEPT
iptables -A test1 -p 17 --dport 18232 -d 67.0.0.0/8 -j DROP
iptables -A test3 -p 6 -s 37.21.85.250 -d 190.45.50.135 --dport 65368 --sport 7875 -j ACCEPT
iptables -A test1 -p 17 -d 156.76.91.0/24 --sport 31301 --dport 56441 -j DROP
iptables -A OUTPUT -s 239.0.0.0/8 -j DROP
iptables -A test2 -p 6 --sport 3725 -d 94.0.0.0/8 -j ACCEPT
iptables -A INPUT -d 44.147.15.179 -p 76 -j ACCEPT
iptables -A FORWARD -p 72 -d 241.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 62532 --dport 65069 -s 162.150.131.80 -d 12.0.0.0/8 -j DROP
iptables -A test1 -p 17 --dport 21312 -s 109.0.0.0/8 --sport 29262 -j DROP
iptables -A test2 -d 62.107.200.120 -j DROP
iptables -A test1 -p 17 --sport 30672 -s 67.197.225.30 -j DROP
iptables -A test3 -p 17 -s 104.211.238.186 -d 37.127.193.167 --sport 17583 -j DROP
iptables -A INPUT -p 48 -j ACCEPT
iptables -A FORWARD -p 6 --dport 60506 -j ACCEPT
iptables -A test2 -p 17 --dport 40162 --sport 35764 -d 166.220.103.192 -j DROP
iptables -A INPUT -p 141 -j ACCEPT
iptables -A test1 -p 17 --dport 17417 --sport 139 -s 14.177.122.32 -j DROP
iptables -A INPUT -s 95.53.107.42 -p 248 -d 136.161.29.0/24 -j DROP
iptables -A test2 -p 6 --sport 19321 --dport 29588 -j ACCEPT
iptables -A test3 -p 6 -d 126.193.164.254 --sport 21062 -j ACCEPT
iptables -A test1 -p 6 -j DROP
iptables -A test1 -p 17 -d 170.155.42.209 --sport 59774 -s 206.159.107.229 -j DROP
iptables -A test3 -p 6 --dport 52197 -j ACCEPT
iptables -A test2 -p 6 --dport 12499 -s 125.63.211.0/24 -j ACCEPT
iptables -A FORWARD -d 149.133.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --dport 27977 -d 153.227.19.129 --sport 61503 -j ACCEPT
iptables -A INPUT -p 17 -s 234.52.23.76 -d 92.0.0.0/8 --sport 30501 -j DROP
iptables -A OUTPUT -p 66 -j ACCEPT
iptables -A OUTPUT -p 6 -s 13.86.177.199 -d 24.20.0.0/16 --sport 17720 --dport 49568 -j DROP
iptables -A INPUT -p 17 -d 23.178.99.81 --sport 15278 -j test2
iptables -A test3 -p 6 -d 2.0.0.0/8 --sport 31170 -j DROP
iptables -A test1 -p 6 -d 225.231.189.82 --dport 63893 -j ACCEPT
iptables -A FORWARD -p 6 -s 61.0.0.0/8 --sport 45675 -j ACCEPT
iptables -A OUTPUT -s 49.39.244.0/24 -j DROP
iptables -A INPUT -p 17 --dport 9761 --sport 60057 -j DROP
iptables -A test1 -d 177.63.153.216 -s 224.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 -d 187.129.144.178 -s 202.128.100.0/24 --sport 48869 --dport 48746 -j ACCEPT
iptables -A FORWARD -p 17 -s 9.0.0.0/8 --dport 37208 --sport 7141 -j DROP
iptables -A test1 -p 6 --sport 53231 -d 120.145.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -d 176.60.31.203 --sport 54838 -j DROP
iptables -A OUTPUT -p 17 -s 237.50.31.140 --sport 54576 -j DROP
iptables -A FORWARD -s 228.139.0.0/16 -j DROP
iptables -A test1 -p 59 -s 54.156.191.91 -j DROP
iptables -A FORWARD -p 6 --dport 22812 --sport 32792 -s 104.68.100.128 -j ACCEPT
iptables -A test2 -p 17 --sport 16390 --dport 30039 -s 177.0.0.0/8 -d 243.107.176.127 -j DROP
iptables -A test2 -p 17 -d 210.250.20.105 --sport 32957 -s 129.146.36.0/24 --dport 18695 -j DROP
iptables -A OUTPUT -p 6 -d 44.254.231.238 --sport 32923 --dport 33456 -j DROP
iptables -A test1 -d 134.190.166.106 -j DROP
iptables -A test1 -p 6 -d 218.0.0.0/8 --sport 52454 -s 81.30.170.0/24 --dport 59505 -j DROP
iptables -A test1 -s 25.240.133.133 -j ACCEPT
iptables -A test1 -p 6 --dport 58882 -j ACCEPT
iptables -A FORWARD -s 150.238.0.0/16 -d 42.19.93.33 -j ACCEPT
iptables -A test3 -p 6 --dport 31259 -d 204.49.33.230 -s 45.221.242.27 --sport 47644 -j ACCEPT
iptables -A test3 -p 17 --sport 12154 -d 38.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 55372 -j DROP
iptables -A test1 -p 6 --sport 9240 -s 179.109.112.0/24 -d 80.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 60176 -s 23.77.179.10 -d 33.241.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 34119 --dport 32709 -j DROP
iptables -A test3 -d 100.153.27.203 -s 171.2.87.0/24 -p 197 -j ACCEPT
iptables -A test2 -d 80.6.0.0/16 -s 213.185.219.201 -p 131 -j DROP
iptables -A FORWARD -p 6 -d 147.0.0.0/8 --sport 21840 --dport 39226 -j test3
iptables -A INPUT -p 17 --sport 32169 -d 120.198.130.138 -j DROP
iptables -A test2 -p 17 --sport 8680 -d 31.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 6685 --sport 15091 -s 78.0.168.0/24 -j ACCEPT
iptables -A INPUT -p 17 --dport 9043 -d 134.146.238.59 --sport 4996 -s 166.51.174.109 -j DROP
iptables -A OUTPUT -p 17 --dport 32281 -s 8.209.189.155 -d 209.14.39.25 -j ACCEPT
iptables -A OUTPUT -p 17 -d 22.118.236.0/24 --dport 55781 -j ACCEPT
iptables -A OUTPUT -d 188.104.140.202 -p 228 -j DROP
iptables -A OUTPUT -s 70.127.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 5549 -d 104.77.175.93 --dport 45978 -j ACCEPT
iptables -A test3 -p 6 --sport 10365 -s 233.82.182.36 --dport 12996 -j ACCEPT
iptables -A test1 -p 39 -s 222.0.0.0/8 -d 249.0.0.0/8 -j DROP
iptables -A OUTPUT -d 74.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --sport 26026 -s 249.78.97.117 --dport 8977 -j ACCEPT
iptables -A test2 -p 17 -s 1.217.40.66 --sport 41998 -d 194.164.167.65 -j DROP
iptables -A test1 -p 17 -d 131.15.86.35 --dport 27146 -s 212.39.65.88 -j ACCEPT
iptables -A test1 -s 144.55.40.0/24 -p 71 -d 235.29.125.204 -j DROP
iptables -A FORWARD -p 6 --sport 14240 -s 189.57.194.187 -d 96.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 38493 --sport 23887 -d 173.91.218.136 -j ACCEPT
iptables -A test3 -p 6 --sport 12501 -j ACCEPT
iptables -A test1 -p 6 --dport 45124 -s 100.70.186.0/24 -j DROP
iptables -A test1 -p 6 -s 141.127.199.175 -d 210.0.0.0/8 --sport 47535 -j ACCEPT
iptables -A test3 -p 17 -s 22.0.0.0/8 -d 166.84.56.38 --dport 23702 -j ACCEPT
iptables -A test2 -p 17 --dport 65034 -j DROP
iptables -A test1 -p 6 -d 54.45.0.0/16 --sport 10032 -j ACCEPT
iptables -A OUTPUT -p 6 -s 41.129.0.0/16 --dport 45223 --sport 36544 -d 34.45.28.0/24 -j DROP
iptables -A test1 -p 17 -s 105.106.154.174 --dport 32933 -j ACCEPT
iptables -A test2 -p 6 -d 67.176.69.0/24 -s 102.15.0.0/16 --sport 54189 --dport 9564 -j ACCEPT
iptables -A INPUT -p 17 -s 118.95.189.194 -d 97.69.198.252 --sport 52010 -j DROP
iptables -A test2 -p 223 -j DROP
iptables -A OUTPUT -d 120.177.4.4 -j DROP
iptables -A test2 -p 6 --sport 25027 -s 212.170.169.0/24 --dport 50848 -j ACCEPT
iptables -A INPUT -p 17 --sport 50748 -d 222.39.92.100 -s 174.184.142.215 -j ACCEPT
iptables -A FORWARD -d 120.224.0.0/16 -j DROP
iptables -A FORWARD -p 17 --sport 39629 -s 22.211.130.0/24 -j ACCEPT
iptables -A test3 -p 17 -s 58.69.108.0/24 --dport 1347 -j DROP
iptables -A INPUT -p 6 --sport 3824 -d 141.125.249.63 -j test2
iptables -A FORWARD -d 36.163.120.102 -j DROP
iptables -A test1 -p 6 --sport 13991 -d 199.75.9.120 --dport 27855 -j ACCEPT
iptables -A FORWARD -p 6 --dport 19934 --sport 55194 -s 33.109.226.3 -j ACCEPT
iptables -A test2 -p 17 -d 243.0.0.0/8 -s 57.203.23.134 --dport 2103 -j DROP
iptables -A INPUT -p 17 --dport 45354 -s 11.156.144.252 -j ACCEPT
iptables -A test1 -p 6 --sport 39600 -s 248.142.98.14 -j DROP
iptables -A test3 -s 64.182.253.88 -j ACCEPT
iptables -A test2 -p 6 --sport 25163 --dport 3968 -j DROP
iptables -A FORWARD -p 23 -j ACCEPT
iptables -A OUTPUT -s 40.209.101.12 -j ACCEPT
iptables -A test2 -p 6 --dport 16223 -d 201.158.64.45 -j DROP
iptables -A OUTPUT -p 6 --dport 13610 --sport 18232 -j DROP
iptables -A OUTPUT -s 217.218.0.0/16 -j DROP
iptables -A FORWARD -p 17 -s 238.0.0.0/8 -d 173.171.248.112 --dport 47594 --sport 885 -j DROP
iptables -A test1 -p 6 -d 78.80.148.170 --sport 49172 -j DROP
iptables -A test1 -s 225.0.0.0/8 -p 135 -j DROP
iptables -A OUTPUT -s 247.171.0.0/16 -j ACCEPT
iptables -A test1 -p 17 -d 99.201.246.78 --sport 27711 -s 254.16.2.0/24 -j DROP
iptables -A test1 -p 17 --dport 5682 -d 51.64.1.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 -s 241.112.43.190 --dport 19517 -d 15.147.161.0/24 -j DROP
iptables -A test1 -p 6 --sport 63348 -j DROP
iptables -A test1 -p 6 --sport 22616 -s 100.51.18.0/24 --dport 22952 -j DROP
iptables -A test1 -p 17 -d 113.98.0.0/16 -s 0.168.178.14 --dport 65059 -j ACCEPT
iptables -A test2 -p 17 --dport 26973 --sport 42975 -d 149.108.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 5987 -d 110.8.96.216 -s 182.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 -d 37.48.229.155 --sport 62495 -j ACCEPT
iptables -A test1 -p 6 --dport 55229 -s 114.28.189.0/24 -d 140.10.39.0/24 -j ACCEPT
iptables -A test2 -p 6 -s 41.0.0.0/8 -d 216.204.35.0/24 --dport 27961 -j DROP
iptables -A INPUT -p 177 -j test3
iptables -A INPUT -p 6 --sport 31613 -j DROP
iptables -A OUTPUT -p 17 --dport 4440 --sport 17895 -d 125.100.23.60 -s 18.243.225.0/24 -j ACCEPT
iptables -A test3 -p 183 -d 126.39.113.15 -j DROP
iptables -A test3 -p 17 --dport 59121 --sport 22758 -s 36.219.47.181 -j ACCEPT
iptables -A test3 -s 152.82.119.200 -d 237.123.193.0/24 -p 142 -j DROP
iptables -A test1 -p 17 -s 116.74.40.217 -d 149.112.144.98 --dport 60789 -j ACCEPT
iptables -A test2 -p 6 --dport 18824 --sport 39785 -d 189.162.92.0/24 -j ACCEPT
iptables -A INPUT -d 211.141.222.249 -j ACCEPT
iptables -A test3 -s 232.88.141.225 -j DROP
iptables -A INPUT -s 110.131.151.0/24 -j DROP
iptables -A test2 -p 6 -s 78.0.0.0/8 --dport 14183 -j ACCEPT
iptables -A FORWARD -s 15.187.73.60 -j ACCEPT
iptables -A test1 -p 6 --dport 58542 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 20776 --dport 20166 -d 216.179.13.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 56438 -d 17.103.9.0/24 -j DROP
iptables -A FORWARD -s 121.209.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --dport 52170 -d 49.130.0.160 -j DROP
iptables -A test3 -p 17 -s 157.198.0.0/16 --sport 15229 -j ACCEPT
iptables -A INPUT -p 17 --sport 28709 --dport 57841 -s 32.226.0.0/16 -j DROP
iptables -A OUTPUT -p 6 -s 81.128.0.0/16 --sport 51347 -j DROP
iptables -A test1 -p 6 --dport 53990 -s 136.128.122.0/24 --sport 46648 -d 207.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 49288 -j DROP
iptables -A OUTPUT -p 17 -d 16.9.10.96 --sport 57937 -j ACCEPT
iptables -A test1 -p 17 --sport 28116 -j ACCEPT
iptables -A test2 -p 6 --sport 31657 -d 195.79.62.0/24 -s 154.105.39.10 -j ACCEPT
iptables -A test1 -p 6 --sport 60704 -s 245.152.57.154 --dport 9754 -j ACCEPT
iptables -A test1 -p 6 --dport 3800 -j DROP
iptables -A test2 -p 17 --sport 9175 -s 191.203.0.0/16 -j DROP
iptables -A test3 -p 6 --sport 57430 -j DROP
iptables -A test2 -p 6 --dport 36588 -s 143.79.247.179 -d 131.0.0.0/8 -j DROP
iptables -A test1 -p 6 --sport 38427 -j ACCEPT
iptables -A test3 -p 6 --sport 16417 -s 220.80.247.110 -j DROP
iptables -A OUTPUT -p 6 -d 81.23.36.10 --sport 25261 --dport 41001 -j DROP
iptables -A OUTPUT -p 34 -j DROP
iptables -A test3 -p 151 -s 212.222.190.241 -j ACCEPT
iptables -A test2 -p 52 -j ACCEPT
iptables -A test1 -p 6 --dport 21347 -d 39.34.97.0/24 -j DROP
iptables -A test3 -s 51.119.0.0/16 -d 43.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -d 182.101.0.0/16 --sport 23146 -j ACCEPT
iptables -A test2 -s 93.0.0.0/16 -j ACCEPT
iptables -A FORWARD -d 50.33.85.109 -j DROP
iptables -A test1 -p 17 --sport 2887 -d 106.62.106.236 --dport 29518 -j DROP
iptables -A test3 -p 6 -s 16.112.224.162 -d 135.0.0.0/8 --sport 61715 -j ACCEPT
iptables -A INPUT -d 127.64.0.0/16 -j DROP
iptables -A test1 -p 23 -d 247.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 19690 --sport 12013 -j DROP
iptables -A OUTPUT -p 17 --dport 21639 --sport 37392 -j DROP
iptables -A test1 -p 6 --dport 35816 -s 225.81.213.240 --sport 53160 -j DROP
iptables -A test1 -s 142.237.16.66 -d 154.159.0.0/24 -j ACCEPT
iptables -A test2 -p 6 --sport 61158 -d 167.30.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 -d 56.164.48.205 --dport 5501 -j DROP
iptables -A FORWARD -p 17 --dport 50591 -d 46.214.10.86 --sport 50380 -j ACCEPT
iptables -A test1 -p 17 -d 71.45.9.196 --dport 54194 -s 114.207.169.72 -j ACCEPT
iptables -A FORWARD -p 48 -j DROP
iptables -A INPUT -p 6 --sport 17352 -j ACCEPT
iptables -A test2 -p 6 -d 34.170.0.0/16 -s 174.0.0.0/8 --sport 27749 -j DROP
iptables -A INPUT -d 222.86.175.44 -j DROP
iptables -A FORWARD -d 108.40.190.83 -j ACCEPT
iptables -A test2 -p 6 -d 118.252.29.0/24 --dport 53955 -j ACCEPT
iptables -A test1 -p 6 --sport 52315 -d 18.168.248.0/24 -j ACCEPT
iptables -A INPUT -p 6 -d 67.86.0.0/16 --sport 15105 -j test2
iptables -A FORWARD -p 6 --dport 63293 --sport 21451 -j DROP
iptables -A test2 -p 17 -d 116.86.252.0/24 --sport 30391 --dport 39398 -j ACCEPT
iptables -A test3 -p 6 -s 23.64.72.19 --dport 5362 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 10486 -j DROP
iptables -A test1 -p 59 -s 24.148.189.103 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 45765 -d 10.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 33398 -d 1.147.0.0/16 -s 147.14.252.43 -j ACCEPT
iptables -A test2 -p 6 -s 249.239.141.192 --dport 6826 -j DROP
iptables -A test2 -d 196.36.254.0/24 -j DROP
iptables -A OUTPUT -p 17 --dport 51213 -s 198.127.204.230 -j ACCEPT
iptables -A test2 -p 17 -d 130.209.101.0/24 --dport 60038 --sport 21098 -j DROP
iptables -A FORWARD -d 206.68.50.0/24 -p 6 -j DROP
iptables -A INPUT -p 49 -j ACCEPT
iptables -A test2 -p 6 --dport 16524 -j ACCEPT
iptables -A test1 -s 98.202.98.27 -j ACCEPT
iptables -A test1 -p 17 --dport 60355 --sport 34331 -j ACCEPT
iptables -A OUTPUT -p 17 -d 97.5.189.0/24 --sport 43971 -j DROP
iptables -A test1 -p 6 -d 116.227.198.62 --sport 50823 -j ACCEPT
iptables -A test1 -p 172 -j ACCEPT
iptables -A test1 -d 152.175.123.140 -j ACCEPT
iptables -A test3 -p 17 -d 40.0.0.0/8 --sport 41156 -j DROP
iptables -A test3 -p 71 -j ACCEPT
iptables -A test3 -p 17 --sport 40289 -s 155.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 44064 -j ACCEPT
iptables -A test3 -p 6 -d 149.211.0.0/16 --sport 38586 -j ACCEPT
iptables -A FORWARD -p 6 --dport 44229 --sport 24000 -j DROP
iptables -A FORWARD -p 17 --dport 785 -j DROP
iptables -A OUTPUT -p 219 -s 118.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 23 -j ACCEPT
iptables -A FORWARD -p 6 --dport 2055 --sport 6288 -d 213.27.166.151 -j test1
iptables -A INPUT -d 233.51.45.107 -j ACCEPT
iptables -A test1 -p 17 --dport 52553 -j DROP
iptables -A test2 -p 17 --dport 6587 -j ACCEPT
iptables -A INPUT -p 17 --sport 65096 --dport 15797 -s 195.144.226.26 -j DROP
iptables -A test3 -p 6 --dport 35889 --sport 58098 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 60774 -j ACCEPT
iptables -A OUTPUT -d 81.29.96.0/24 -j ACCEPT
iptables -A INPUT -p 73 -j DROP
iptables -A test1 -p 17 --dport 31632 --sport 53300 -s 100.129.11.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -s 226.58.191.0/24 --sport 7169 --dport 33036 -j DROP
iptables -A INPUT -p 6 --sport 43436 -d 153.78.56.161 -j ACCEPT
iptables -A FORWARD -p 6 --sport 49527 -j DROP
iptables -A OUTPUT -d 40.32.135.123 -j DROP
iptables -A FORWARD -s 222.140.146.16 -j ACCEPT
iptables -A test3 -p 143 -d 240.92.109.167 -j DROP
iptables -A OUTPUT -p 6 -d 101.0.0.0/8 -s 31.246.0.0/16 --sport 26918 --dport 5806 -j DROP
iptables -A INPUT -s 154.0.0.0/8 -d 250.113.35.47 -j ACCEPT
iptables -A INPUT -p 17 --dport 61811 --sport 29119 -d 173.59.201.233 -j DROP
iptables -A OUTPUT -p 108 -s 149.65.87.8 -d 17.140.43.58 -j ACCEPT
iptables -A test1 -p 17 -s 121.93.0.0/16 --sport 9137 -d 209.0.0.0/8 -j ACCEPT
iptables -A INPUT -d 247.0.0.0/8 -s 125.2.143.82 -j ACCEPT
iptables -A test3 -p 6 --dport 56389 -d 141.199.125.198 -s 236.96.0.0/16 -j ACCEPT
iptables -A test3 -d 231.154.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 23349 -s 111.65.71.171 -j DROP
iptables -A FORWARD -p 6 --dport 49280 -s 52.86.123.178 -d 165.74.29.0/24 -j ACCEPT
iptables -A test3 -p 6 --dport 51470 -s 235.72.107.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 48480 -s 32.77.111.122 --dport 20351 -d 157.113.136.254 -j DROP
iptables -A FORWARD -s 4.75.8.39 -j DROP
iptables -A test1 -p 10 -d 156.32.131.0/24 -j ACCEPT
iptables -A INPUT -p 6 --dport 19763 -j ACCEPT
iptables -A test1 -p 17 --sport 43802 -j ACCEPT
iptables -A INPUT -p 17 --sport 57449 -j DROP
iptables -A OUTPUT -p 17 --dport 62959 -s 136.115.0.0/16 -j ACCEPT
iptables -A test1 -p 6 -d 119.51.68.15 --dport 43363 --sport 39817 -j ACCEPT
iptables -A test2 -p 17 --dport 32726 -s 232.163.0.0/16 --sport 35450 -j DROP
iptables -A test2 -p 6 --dport 19597 --sport 20694 -d 90.207.100.0/24 -j ACCEPT
iptables -A test2 -p 6 --dport 42074 --sport 19338 -j ACCEPT
iptables -A FORWARD -p 6 --sport 41471 -j ACCEPT
iptables -A FORWARD -p 23 -s 35.245.52.0/24 -j ACCEPT
iptables -A OUTPUT -d 245.116.236.0/24 -j DROP
iptables -A FORWARD -p 6 -d 65.20.116.0/24 -s 78.89.225.10 --sport 44562 -j ACCEPT
iptables -A FORWARD -p 6 -d 27.245.0.0/16 --sport 14442 -s 30.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 37681 --sport 19106 -j ACCEPT
iptables -A INPUT -p 6 --sport 50501 --dport 217 -s 35.109.0.0/16 -d 17.12.126.188 -j DROP
iptables -A INPUT -p 180 -j ACCEPT
iptables -A INPUT -s 223.17.209.63 -p 83 -d 10.0.0.0/8 -j test1
iptables -A INPUT -p 210 -j DROP
iptables -A test1 -p 6 --dport 15835 -j ACCEPT
iptables -A INPUT -p 6 --dport 29229 --sport 1635 -s 115.8.162.167 -j ACCEPT
iptables -A test3 -p 6 -s 106.39.105.176 -d 171.49.23.130 --dport 23783 -j ACCEPT
iptables -A test2 -p 6 --sport 13945 -d 185.252.0.0/16 -s 25.110.0.0/16 -j ACCEPT
iptables -A OUTPUT -d 5.233.247.0/24 -s 242.148.0.0/16 -p 48 -j DROP
iptables -A test1 -p 17 --dport 61056 -j DROP
iptables -A test3 -p 6 --sport 36307 -d 145.150.27.189 -j DROP
iptables -A test2 -p 17 --dport 14127 -s 203.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 -d 55.56.36.75 --dport 9557 -s 195.58.236.0/24 -j DROP
iptables -A INPUT -p 17 --dport 48594 -s 197.119.0.0/16 -j DROP
iptables -A INPUT -p 17 -d 59.58.195.11 --dport 14279 -j ACCEPT
iptables -A FORWARD -p 17 --dport 44242 -d 72.9.56.0/24 -s 34.224.175.65 --sport 16342 -j DROP
iptables -A INPUT -p 17 --dport 41005 -s 192.0.0.0/8 -j ACCEPT
iptables -A test2 -d 71.236.52.0/24 -j ACCEPT
iptables -A INPUT -p 17 -s 137.123.203.49 -d 26.25.52.30 --dport 41489 --sport 37591 -j DROP
iptables -A test3 -p 6 --dport 64413 -j DROP
iptables -A INPUT -p 6 -s 3.160.140.217 --dport 12103 --sport 58989 -j ACCEPT
iptables -A INPUT -p 6 --sport 18075 -s 127.210.118.0/24 --dport 60926 -j DROP
iptables -A INPUT -s 164.179.234.153 -d 202.153.43.0/24 -j ACCEPT
iptables -A test2 -p 17 -d 129.103.252.198 --sport 6692 --dport 54236 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 53689 -j test1
iptables -A OUTPUT -p 17 -d 38.194.89.100 --dport 53420 -s 97.5.170.0/24 --sport 61311 -j ACCEPT
iptables -A FORWARD -d 13.5.135.0/24 -j DROP
iptables -A test2 -p 17 -d 79.155.162.193 --dport 43065 -s 17.180.16.170 -j DROP
iptables -A OUTPUT -p 6 --sport 50142 -s 245.135.26.89 -j ACCEPT
iptables -A OUTPUT -p 12 -s 76.164.204.36 -j DROP
iptables -A test1 -s 93.197.164.0/24 -d 71.47.72.67 -j ACCEPT
iptables -A test1 -p 6 -d 147.146.111.142 --sport 26295 --dport 23651 -j ACCEPT
iptables -A test1 -p 6 -s 180.114.175.243 -d 184.63.225.75 --sport 43181 -j DROP
iptables -A INPUT -p 17 --dport 61530 --sport 55627 -s 40.145.0.0/16 -d 234.199.196.205 -j DROP
iptables -A test2 -d 48.101.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 18905 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 63810 --dport 57146 -s 2.198.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 28326 -j ACCEPT
iptables -A test2 -p 6 --sport 8661 -j ACCEPT
iptables -A test1 -p 6 --sport 25801 -s 77.219.33.111 -j DROP
iptables -A FORWARD -p 6 --sport 571 -j DROP
iptables -A FORWARD -p 17 -d 71.173.155.237 -s 214.0.0.0/8 --dport 15531 -j DROP
iptables -A INPUT -p 17 --sport 15559 -d 176.45.136.213 -s 15.125.0.0/16 -j ACCEPT
iptables -A test2 -s 127.12.107.136 -j DROP
iptables -A FORWARD -p 6 --dport 39586 --sport 23227 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 15933 -j DROP
iptables -A test3 -p 17 -s 140.54.198.54 --dport 56768 -d 50.222.153.41 -j DROP
iptables -A test2 -p 17 --sport 42441 --dport 14724 -j ACCEPT
iptables -A test3 -p 17 --dport 21006 -s 28.30.1.251 --sport 19191 -j ACCEPT
iptables -A test3 -p 17 --dport 17458 -d 222.17.1.147 --sport 55601 -j DROP
iptables -A OUTPUT -d 11.66.174.114 -j ACCEPT
iptables -A FORWARD -p 6 --dport 37526 -s 17.110.250.0/24 -d 78.152.156.16 -j DROP
iptables -A test1 -p 6 -s 63.80.134.0/24 --dport 42610 -j DROP
iptables -A test3 -p 17 -s 194.193.140.39 -d 190.132.125.91 --dport 6569 -j ACCEPT
iptables -A test3 -p 17 --dport 10719 -s 131.171.0.0/16 -d 252.179.208.0/24 -j DROP
iptables -A OUTPUT -d 35.210.35.229 -j ACCEPT
iptables -A INPUT -p 65 -j ACCEPT
iptables -A test1 -p 60 -j DROP
iptables -A test2 -p 17 --dport 24850 -s 162.43.11.214 -j DROP
iptables -A test1 -s 119.243.241.0/24 -p 149 -j DROP
iptables -A FORWARD -p 6 -d 237.0.0.0/8 --sport 46049 -j DROP
iptables -A test3 -p 17 -s 16.154.0.0/16 --sport 41881 -j ACCEPT
iptables -A test1 -s 28.198.117.181 -j DROP
iptables -A INPUT -p 6 -s 250.180.127.206 -d 198.110.0.0/16 --sport 41308 -j ACCEPT
iptables -A test2 -p 6 -d 206.79.10.149 --dport 48311 --sport 13461 -j DROP
iptables -A test1 -s 221.198.119.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --dport 1031 --sport 4238 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 28195 --sport 61813 -j ACCEPT
iptables -A test3 -d 90.55.194.170 -j ACCEPT
iptables -A FORWARD -p 17 --dport 979 -s 255.0.0.0/8 -d 181.239.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --dport 33889 -s 1.176.208.0/24 -j ACCEPT
iptables -A test1 -p 6 -d 7.248.152.219 --sport 41361 -j ACCEPT
iptables -A test3 -p 17 --dport 29975 -s 14.144.143.74 -j DROP
iptables -A OUTPUT -p 17 --sport 29236 -d 73.212.86.155 -j DROP
iptables -A test2 -s 249.157.231.0 -j ACCEPT
iptables -A FORWARD -p 6 -s 162.65.29.9 --dport 9151 -d 65.23.120.219 --sport 29933 -j ACCEPT
iptables -A test1 -d 18.213.0.0/16 -j DROP
iptables -A FORWARD -d 126.213.24.0/24 -j ACCEPT
iptables -A test2 -s 93.0.0.0/8 -j DROP
iptables -A test3 -p 6 -d 131.193.45.35 --sport 27487 -j DROP
iptables -A OUTPUT -p 17 --dport 47114 --sport 34836 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 5496 -d 119.74.37.64 -j ACCEPT
iptables -A FORWARD -p 17 --sport 21357 -s 167.40.237.0/24 --dport 12116 -j ACCEPT
iptables -A OUTPUT -p 17 -s 93.70.0.0/16 -d 21.118.235.117 --sport 39855 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 29160 -s 127.190.63.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --dport 10797 -s 109.0.0.0/8 --sport 33251 -j ACCEPT
iptables -A test3 -p 17 --sport 32965 -s 78.250.190.174 -j ACCEPT
iptables -A test3 -p 6 --dport 7680 -s 202.200.63.48 -j ACCEPT
iptables -A test2 -p 6 --dport 8679 -d 165.0.0.0/8 --sport 29940 -j DROP
iptables -A INPUT -p 6 --sport 31103 -d 154.80.100.191 --dport 14026 -j DROP
iptables -A FORWARD -p 6 -s 126.86.75.240 --sport 53968 --dport 5723 -j ACCEPT
iptables -A INPUT -p 6 --sport 38132 -j DROP
iptables -A test1 -p 17 --dport 60581 -j ACCEPT
iptables -A test1 -p 17 -s 194.98.0.0/16 -d 231.113.149.174 --sport 54668 -j ACCEPT
iptables -A test1 -p 17 -s 35.30.213.79 --dport 46255 -d 44.160.204.146 --sport 59743 -j DROP
iptables -A OUTPUT -p 6 --dport 41860 --sport 35278 -d 233.172.0.0/16 -s 206.93.203.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 -s 34.189.45.69 --sport 51680 -d 138.88.0.0/16 --dport 2767 -j ACCEPT
iptables -A INPUT -p 17 --sport 54380 -s 224.171.117.49 -j DROP
iptables -A OUTPUT -p 17 --dport 3169 -s 56.51.2.7 -d 164.140.0.0/16 -j ACCEPT
iptables -A OUTPUT -d 209.0.0.0/8 -j DROP
iptables -A test2 -p 6 -s 93.44.3.120 --sport 61916 --dport 16827 -j DROP
iptables -A FORWARD -p 17 -s 228.121.245.199 --dport 65077 -d 227.102.103.212 -j DROP
iptables -A FORWARD -p 6 -d 199.168.0.0/16 --sport 12278 -s 146.235.191.82 -j DROP
iptables -A test2 -p 6 --dport 60022 -d 57.162.118.202 --sport 50869 -j DROP
iptables -A test2 -p 6 -d 8.52.5.236 --sport 61809 -j ACCEPT
iptables -A test2 -d 193.199.173.0/24 -j ACCEPT
iptables -A test2 -p 6 --sport 35340 -j DROP
iptables -A test3 -p 17 -d 164.86.58.172 --sport 273 -s 192.201.190.216 -j ACCEPT
iptables -A test3 -p 17 --sport 10822 --dport 57149 -d 66.240.121.0/24 -j DROP
iptables -A test3 -p 17 --dport 63910 -j ACCEPT
iptables -A test1 -p 17 --sport 44901 -s 121.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -d 19.0.0.0/8 --sport 11276 --dport 54141 -j DROP
iptables -A FORWARD -p 6 --sport 60965 -j DROP
iptables -A test1 -p 10 -j ACCEPT
iptables -A FORWARD -p 6 -s 18.45.0.0/16 --sport 22736 -j DROP
iptables -A test3 -p 17 --sport 5672 -s 124.68.4.203 --dport 32590 -d 78.154.151.88 -j DROP
iptables -A FORWARD -p 6 --dport 2956 -s 98.31.209.184 -j ACCEPT
iptables -A INPUT -p 6 --dport 1805 -s 182.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --dport 37183 -d 181.246.0.0/16 -s 7.46.202.198 -j DROP
iptables -A test1 -s 8.83.45.109 -j DROP
iptables -A FORWARD -d 255.118.248.0/24 -j test2
iptables -A OUTPUT -p 6 --dport 19447 -s 26.232.234.252 -d 42.156.106.30 -j ACCEPT
iptables -A INPUT -p 6 --dport 22111 -j DROP
iptables -A test1 -p 17 --dport 34217 -j DROP
iptables -A test1 -p 17 -d 117.0.0.0/8 -s 239.57.23.221 --sport 3754 -j ACCEPT
iptables -A test1 -p 17 -d 171.0.0.0/8 --sport 23465 -s 182.54.97.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 57941 --dport 8283 -d 84.165.191.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 51317 -d 54.138.204.109 -s 148.190.161.0/24 -j DROP
iptables -A test2 -d 56.32.8.86 -p 143 -s 113.73.104.167 -j ACCEPT
iptables -A test3 -p 17 --dport 17875 --sport 28716 -j ACCEPT
iptables -A INPUT -s 236.169.118.57 -j DROP
iptables -A test3 -p 6 --dport 15350 -d 175.84.77.181 --sport 14284 -j DROP
iptables -A OUTPUT -p 6 --sport 1558 -j ACCEPT
iptables -A test2 -p 6 --dport 44753 --sport 45135 -d 186.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 -d 7.217.221.179 --dport 23341 --sport 24462 -j ACCEPT
iptables -A test3 -p 172 -j ACCEPT
iptables -A test3 -p 17 -d 33.100.128.0/24 --dport 56796 -j ACCEPT
iptables -A test3 -p 17 --dport 50949 -s 166.124.204.18 -j DROP
iptables -A OUTPUT -p 6 -s 56.6.170.0/24 -d 96.234.247.60 --sport 46228 -j DROP
iptables -A FORWARD -p 68 -d 119.57.133.31 -j DROP
iptables -A test2 -p 17 -d 36.138.214.0/24 --sport 46885 -j ACCEPT
iptables -A test3 -p 17 --dport 27710 -d 45.0.0.0/8 -j DROP
iptables -A test3 -d 253.0.0.0/8 -j DROP
iptables -A test2 -p 6 -s 241.244.160.0/24 --sport 1575 -j DROP
iptables -A test3 -p 17 --sport 3873 --dport 44628 -s 99.171.86.118 -j DROP
iptables -A INPUT -p 6 --dport 498 -s 28.93.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 -d 223.94.17.47 -s 174.145.145.135 --dport 37986 -j ACCEPT
iptables -A INPUT -p 6 --sport 62346 -d 31.130.92.41 -s 230.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 -s 139.151.140.0/24 --sport 57323 -d 161.177.64.0/24 -j DROP
iptables -A OUTPUT -p 17 -d 134.0.0.0/8 --sport 36740 -j test3
iptables -A test2 -d 115.0.0.0/8 -s 190.89.242.190 -j ACCEPT
iptables -A test1 -p 6 --sport 41687 -j DROP
iptables -A OUTPUT -p 6 --dport 43961 -j ACCEPT
iptables -A test1 -s 63.0.0.0/8 -j DROP
iptables -A INPUT -p 17 -d 202.180.230.0/24 --sport 60200 --dport 9178 -j DROP
iptables -A test3 -p 17 --dport 37639 --sport 48554 -s 156.0.0.0/8 -d 5.192.228.211 -j ACCEPT
iptables -A INPUT -p 17 --sport 41397 -s 173.132.232.224 -d 20.9.227.188 -j ACCEPT
iptables -A test3 -p 17 -d 12.251.51.0/24 --dport 19351 -j ACCEPT
iptables -A test3 -p 6 --sport 58870 --dport 57826 -s 197.52.12.161 -d 32.130.243.0/24 -j DROP
iptables -A OUTPUT -p 6 --sport 59102 -j test3
iptables -A test2 -p 17 -s 134.156.229.236 -d 222.73.165.207 --dport 46486 -j ACCEPT
iptables -A test1 -p 17 -d 217.0.0.0/8 -s 63.141.61.1 --dport 13642 -j DROP
iptables -A OUTPUT -p 6 --sport 19932 --dport 38727 -j DROP
iptables -A test1 -p 6 -s 246.31.210.49 --dport 42708 -d 82.156.106.11 -j DROP
iptables -A FORWARD -p 17 -s 67.236.160.0/24 --dport 38406 -j DROP
iptables -A test3 -d 200.154.149.66 -j DROP
iptables -A test1 -d 215.26.50.0/24 -p 48 -j ACCEPT
iptables -A test2 -p 75 -d 170.35.165.247 -j DROP
iptables -A INPUT -p 6 -s 248.36.156.76 --sport 27705 -d 10.139.145.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 30425 -s 15.157.41.175 -d 200.52.45.182 -j ACCEPT
iptables -A INPUT -p 17 --dport 58841 -d 203.170.210.124 -s 216.161.142.0 -j DROP
iptables -A test2 -s 117.35.100.45 -j ACCEPT
iptables -A test2 -p 6 --sport 56142 --dport 54034 -d 239.170.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --dport 7607 -s 98.233.35.26 --sport 32888 -j ACCEPT
iptables -A FORWARD -p 101 -d 189.224.49.174 -j DROP
iptables -A test1 -p 6 --sport 30993 -j ACCEPT
iptables -A FORWARD -p 17 -d 248.54.163.54 -s 59.56.25.179 --sport 43318 -j DROP
iptables -A test1 -p 6 --dport 212 -j ACCEPT
iptables -A INPUT -p 6 -s 78.90.85.74 --dport 14832 -j ACCEPT
iptables -A test3 -p 6 -d 184.198.71.194 --dport 6081 -j DROP
iptables -A test1 -p 17 -s 121.207.21.151 --sport 33035 -d 147.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 44874 -j ACCEPT
iptables -A OUTPUT -p 31 -d 157.208.204.28 -s 31.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -d 228.159.192.247 --dport 17250 -j DROP
iptables -A FORWARD -p 17 --dport 40609 -j ACCEPT
iptables -A test1 -d 166.123.187.211 -j DROP
iptables -A OUTPUT -p 6 --dport 8167 -j DROP
iptables -A test2 -s 24.97.0.0/16 -d 251.194.0.0/16 -p 142 -j DROP
iptables -A test1 -p 17 -s 99.0.0.0/8 --sport 29088 -j ACCEPT
iptables -A test3 -p 17 --dport 8348 -d 52.58.71.59 -j DROP
iptables -A test3 -s 191.0.0.0/8 -p 12 -j DROP
iptables -A test3 -p 6 --sport 46140 -j DROP
iptables -A FORWARD -s 57.103.24.250 -d 15.193.19.3 -p 126 -j test1
iptables -A OUTPUT -p 6 -s 152.81.0.0/16 --sport 11207 -j DROP
iptables -A test3 -p 17 --dport 65441 -j DROP
iptables -A INPUT -p 6 --dport 4714 -j ACCEPT
iptables -A FORWARD -p 6 --sport 56551 --dport 47488 -j DROP
iptables -A OUTPUT -p 17 --dport 50041 -s 10.0.0.0/8 --sport 25323 -j ACCEPT
iptables -A INPUT -p 17 --sport 11681 -d 69.74.171.50 -j ACCEPT
iptables -A INPUT -p 6 -d 80.71.29.9 --sport 65520 -s 25.199.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --sport 1254 -j DROP
iptables -A INPUT -p 17 --dport 20393 --sport 49504 -s 173.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 39746 --dport 13932 -d 197.132.173.108 -j DROP
iptables -A test1 -p 62 -j ACCEPT
iptables -A OUTPUT -p 17 -d 207.143.0.0/16 -s 100.21.53.39 --sport 41424 --dport 6721 -j ACCEPT
iptables -A test2 -p 6 -s 71.240.75.96 -d 34.44.31.121 --sport 8643 -j ACCEPT
iptables -A OUTPUT -d 186.0.0.0/8 -p 116 -j DROP
iptables -A test3 -p 17 -d 144.0.0.0/8 --sport 14690 --dport 19916 -j ACCEPT
iptables -A test2 -p 17 --dport 49090 -j DROP
iptables -A OUTPUT -p 17 --sport 53833 -j ACCEPT
iptables -A FORWARD -p 6 -d 61.14.20.124 -s 43.84.36.183 --dport 61398 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 55605 -d 121.161.17.213 -s 242.101.166.105 -j test1
iptables -A OUTPUT -p 6 --sport 7331 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 4132 -j ACCEPT
iptables -A test1 -p 17 --sport 3313 --dport 59794 -s 214.238.249.221 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 60165 --sport 22503 -j ACCEPT
iptables -A INPUT -p 121 -j DROP
iptables -A OUTPUT -p 6 --sport 8679 -s 49.225.177.76 -j ACCEPT
iptables -A OUTPUT -d 229.120.142.0/24 -s 10.62.87.211 -j ACCEPT
iptables -A test2 -s 248.238.202.0/24 -p 114 -d 221.109.90.138 -j DROP
iptables -A INPUT -p 6 -d 26.99.235.254 -s 55.161.16.0/24 --dport 37821 -j DROP
iptables -A test3 -p 6 -d 234.177.0.0/16 -s 127.2.100.197 --sport 21519 -j DROP
iptables -A FORWARD -s 188.90.0.0/16 -j DROP
iptables -A FORWARD -p 6 --dport 15359 -d 235.120.132.78 -s 238.2.90.246 -j ACCEPT
iptables -A test3 -p 17 --dport 58539 -j ACCEPT
iptables -A test1 -p 17 --sport 34480 --dport 19748 -j DROP
iptables -A test1 -d 6.231.0.0/16 -s 225.51.71.89 -p 233 -j ACCEPT
iptables -A test2 -p 17 --dport 55527 -s 236.133.10.0/24 -j DROP
iptables -A OUTPUT -p 6 --sport 35715 -d 51.243.74.185 --dport 38287 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 64583 --dport 58749 -j ACCEPT
iptables -A test2 -p 17 --dport 62765 -j ACCEPT
iptables -A test2 -p 6 --sport 25894 -j ACCEPT
iptables -A INPUT -p 17 --sport 9068 -d 139.0.0.0/8 -s 75.238.0.0/16 -j test2
iptables -A test2 -p 6 -s 166.233.10.235 --sport 64553 --dport 30586 -d 95.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --sport 48048 -j ACCEPT
iptables -A test3 -p 17 --sport 1427 -j DROP
iptables -A FORWARD -p 17 -d 183.0.0.0/8 --sport 21847 -s 199.96.46.0/24 -j ACCEPT
iptables -A test3 -p 6 -d 121.81.136.62 -s 92.204.119.0/24 --dport 8039 -j ACCEPT
iptables -A test2 -p 6 --sport 18646 -d 93.155.125.233 -j DROP
iptables -A test3 -p 255 -s 161.108.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -s 249.90.149.0/24 --dport 4653 -d 113.104.135.138 -j DROP
iptables -A FORWARD -p 17 -d 116.140.219.47 --dport 43277 -j ACCEPT
iptables -A test3 -p 17 --sport 51281 -d 174.2.129.19 -j ACCEPT
iptables -A INPUT -p 17 -s 115.0.0.0/8 --sport 53218 --dport 55616 -j ACCEPT
iptables -A OUTPUT -p 6 -s 72.152.140.0/24 --sport 50356 -j ACCEPT
iptables -A test1 -p 6 --sport 59166 -d 48.248.147.125 -j DROP
iptables -A test2 -d 28.31.158.101 -p 172 -j ACCEPT
iptables -A INPUT -p 91 -j ACCEPT
iptables -A FORWARD -p 6 --dport 41527 --sport 47508 -j DROP
iptables -A OUTPUT -p 17 -s 215.215.31.12 --sport 26548 --dport 13692 -j ACCEPT
iptables -A test3 -p 17 -d 186.109.161.70 -s 124.203.31.160 --dport 36343 --sport 33612 -j ACCEPT
iptables -A test3 -p 6 --sport 27026 -s 211.141.134.124 -j DROP
iptables -A OUTPUT -p 6 --dport 20102 -j DROP
iptables -A OUTPUT -p 17 --dport 39837 -d 87.20.44.0/24 -j DROP
iptables -A test1 -p 6 --dport 46643 --sport 17333 -d 248.0.0.0/8 -j ACCEPT
iptables -A test3 -p 220 -j DROP
iptables -A INPUT -p 6 --sport 33295 -d 227.124.224.2 -j DROP
iptables -A OUTPUT -p 17 -s 170.35.254.0/24 -d 20.63.129.0/24 --sport 29707 --dport 14115 -j test1
iptables -A FORWARD -p 17 --dport 3901 -j DROP
iptables -A OUTPUT -p 6 --sport 19014 -j ACCEPT
iptables -A FORWARD -p 6 -s 124.0.0.0/8 --dport 24204 -j ACCEPT
iptables -A test1 -p 6 --sport 24511 -s 174.65.11.84 -j ACCEPT
iptables -A OUTPUT -p 6 -d 12.0.0.0/8 --sport 2606 -j ACCEPT
iptables -A test3 -s 101.228.113.22 -d 48.89.96.236 -j DROP
iptables -A OUTPUT -p 6 --sport 11868 -j DROP
iptables -A test1 -p 17 --sport 51257 -j ACCEPT
iptables -A test1 -p 6 --dport 53385 -j ACCEPT
iptables -A test2 -p 6 --dport 45476 -j ACCEPT
iptables -A INPUT -p 17 -s 164.0.28.103 --sport 1197 -j ACCEPT
iptables -A test2 -p 57 -d 203.203.47.71 -s 83.216.192.77 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 9526 -j DROP
iptables -A test1 -p 121 -d 109.93.6.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 -d 145.0.0.0/8 -s 99.0.0.0/8 --dport 14644 -j ACCEPT
iptables -A INPUT -p 6 -s 214.42.77.92 -d 92.31.181.191 --dport 23748 --sport 22868 -j DROP
iptables -A INPUT -p 6 --dport 18387 -d 54.213.181.36 --sport 59689 -s 214.164.251.35 -j DROP
iptables -A test2 -p 6 -s 236.176.174.96 --dport 46161 -j DROP
iptables -A FORWARD -p 17 -d 130.114.245.100 --sport 5834 -s 65.93.176.194 -j ACCEPT
iptables -A test3 -p 17 -d 132.70.71.59 --sport 26673 -s 126.119.86.216 -j DROP
iptables -A FORWARD -p 6 --dport 39047 --sport 35427 -j DROP
iptables -A test2 -p 6 --sport 64426 --dport 37827 -s 41.129.177.188 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 15641 --sport 25311 -j DROP
iptables -A test3 -p 17 --sport 43299 -j DROP
iptables -A OUTPUT -d 130.231.233.140 -s 115.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -s 178.0.0.0/8 --dport 6924 -d 141.214.62.71 -j ACCEPT
iptables -A test1 -p 228 -j DROP
iptables -A test3 -p 17 --dport 36819 -s 48.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --dport 48964 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 36760 -d 24.218.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --dport 62165 -j ACCEPT
iptables -A OUTPUT -p 6 -d 142.135.29.187 --sport 29045 -j ACCEPT
iptables -A test3 -p 17 --sport 61324 -d 226.160.156.141 --dport 29507 -s 204.199.226.108 -j ACCEPT
iptables -A test2 -p 17 -s 216.80.0.0/16 --sport 25241 -d 63.163.221.62 -j DROP
iptables -A test1 -p 17 --dport 27626 -s 3.0.0.0/8 --sport 7375 -j ACCEPT
iptables -A test2 -s 74.79.190.238 -j ACCEPT
iptables -A test3 -p 6 -d 166.104.0.0/16 --dport 34142 -j DROP
iptables -A INPUT -p 6 --dport 63966 -d 14.23.14.0/24 -s 139.194.15.0/24 -j DROP
iptables -A OUTPUT -s 11.205.8.0/24 -j DROP
iptables -A INPUT -p 6 -d 133.0.0.0/8 --dport 18394 -s 204.154.208.253 -j DROP
iptables -A FORWARD -p 6 -s 156.115.72.150 --dport 45595 --sport 50877 -j ACCEPT
iptables -A INPUT -p 17 -s 132.148.0.0/16 --sport 27224 -j ACCEPT
iptables -A FORWARD -p 17 --dport 61854 -d 54.173.95.198 --sport 4180 -s 74.229.0.0/16 -j DROP
iptables -A test2 -p 6 -s 140.196.67.0/24 --sport 24186 -j DROP
iptables -A test1 -p 6 --sport 58490 -s 122.181.200.45 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 24071 -d 111.99.0.0/16 --dport 21397 -j DROP
iptables -A FORWARD -s 101.45.76.54 -j DROP
iptables -A FORWARD -p 6 --sport 42376 -s 209.52.55.91 -j ACCEPT
iptables -A OUTPUT -s 181.221.44.0/24 -j ACCEPT
iptables -A test2 -p 6 --sport 61468 -s 75.229.0.0/16 -j DROP
iptables -A test1 -p 17 -d 3.106.238.102 --sport 46432 -j DROP
iptables -A test1 -p 17 --dport 32101 -s 156.20.201.194 -j DROP
iptables -A OUTPUT -p 17 --sport 64926 -d 49.252.0.0/16 -s 6.36.119.0/24 --dport 5844 -j ACCEPT
iptables -A OUTPUT -p 233 -j DROP
iptables -A OUTPUT -p 17 --sport 2107 --dport 58785 -j ACCEPT
iptables -A test1 -p 17 --sport 53265 -j DROP
iptables -A test1 -p 6 --dport 43137 -j ACCEPT
iptables -A INPUT -p 17 -d 82.37.217.62 --dport 24328 --sport 9701 -j ACCEPT
iptables -A test2 -p 6 -s 159.248.0.0/16 --sport 8289 -j DROP
iptables -A OUTPUT -s 6.163.147.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 32934 -s 65.176.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --sport 33588 -j DROP
iptables -A test3 -p 6 --sport 52301 -j ACCEPT
iptables -A INPUT -p 6 --sport 33010 -j DROP
iptables -A test3 -d 142.200.185.249 -s 36.0.0.0/8 -p 46 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 18519 -s 151.155.176.82 -d 140.0.0.0/8 -j DROP
iptables -A OUTPUT -p 33 -j DROP
iptables -A test3 -s 138.151.186.144 -p 221 -j DROP
iptables -A INPUT -p 6 -s 223.24.108.0/24 --dport 12350 --sport 21716 -j test3
iptables -A FORWARD -p 6 --dport 3332 -d 161.156.146.125 --sport 8426 -j DROP
iptables -A test2 -d 73.193.6.239 -p 61 -j ACCEPT
iptables -A test3 -p 17 --sport 29566 -j ACCEPT
iptables -A FORWARD -p 80 -j DROP
iptables -A OUTPUT -p 6 -s 194.5.107.75 --sport 28530 -j ACCEPT
iptables -A OUTPUT -d 89.4.0.0/16 -j DROP
iptables -A test1 -p 17 --sport 52136 -s 80.30.0.0/16 --dport 35162 -j DROP
iptables -A test1 -p 6 --sport 22973 --dport 55255 -d 95.73.241.175 -j DROP
iptables -A test3 -p 6 -s 97.53.80.0/24 --dport 39727 --sport 54307 -j ACCEPT
iptables -A test1 -d 59.200.23.199 -j ACCEPT
iptables -A FORWARD -p 239 -j ACCEPT
iptables -A test3 -p 6 --sport 24058 -d 39.142.133.0/24 -s 124.205.112.179 --dport 18262 -j ACCEPT
iptables -A test1 -p 6 -d 129.4.212.250 --dport 45127 --sport 41441 -j DROP
iptables -A test1 -p 6 --sport 44977 -j ACCEPT
iptables -A FORWARD -p 6 --sport 60055 -j DROP
iptables -A test3 -p 146 -j DROP
iptables -A test3 -p 6 -d 33.234.114.15 --sport 65161 -j DROP
iptables -A test2 -d 159.248.220.165 -p 196 -s 103.85.181.80 -j DROP
iptables -A test2 -p 6 --dport 44657 -j DROP
iptables -A FORWARD -s 70.212.79.0/24 -j ACCEPT
iptables -A INPUT -p 17 --dport 19051 -d 38.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -s 209.13.116.243 --dport 380 -d 50.229.219.34 --sport 13781 -j DROP
iptables -A FORWARD -p 17 -s 120.64.52.98 --sport 19594 --dport 57631 -j ACCEPT
iptables -A test1 -d 252.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --dport 41104 -j ACCEPT
iptables -A test3 -p 6 -s 126.95.0.0/16 --dport 37738 -j ACCEPT
iptables -A test2 -p 6 -s 42.202.27.0/24 --dport 59785 --sport 20070 -j DROP
iptables -A INPUT -p 17 -d 83.0.0.0/8 --dport 46007 -j ACCEPT
iptables -A FORWARD -p 17 --dport 18374 -d 12.0.0.0/8 -j DROP
iptables -A test1 -p 6 --dport 14014 -s 30.0.0.0/8 -d 153.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 -s 224.156.0.0/16 --sport 5312 -j ACCEPT
iptables -A test1 -p 17 --dport 60542 -j DROP
iptables -A OUTPUT -d 124.162.0.0/16 -j DROP
iptables -A OUTPUT -p 17 -s 209.45.240.57 --sport 19008 -j test3
iptables -A OUTPUT -p 6 -s 244.56.15.116 --dport 55285 --sport 58852 -j test3
iptables -A test1 -s 210.73.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 45745 -j ACCEPT
iptables -A FORWARD -p 6 -s 54.0.0.0/8 --dport 2982 -j DROP
iptables -A INPUT -p 17 -d 127.238.0.0/16 -s 29.133.81.56 --sport 53919 -j ACCEPT
iptables -A INPUT -p 17 --dport 12751 -j DROP
iptables -A test2 -d 119.140.103.0/24 -j DROP
iptables -A test3 -p 17 --dport 54772 -d 7.189.40.72 -j DROP
iptables -A test1 -p 6 --sport 37434 -j ACCEPT
iptables -A test2 -s 151.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 3568 -s 6.197.0.0/16 -d 183.90.0.0/16 -j DROP
iptables -A test1 -p 17 --dport 48547 -j DROP
iptables -A test2 -s 226.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 --dport 17249 -d 8.64.144.10 --sport 43415 -j ACCEPT
iptables -A test2 -s 100.22.88.224 -j DROP
iptables -A test2 -d 94.0.0.0/8 -s 68.57.0.0/16 -j DROP
iptables -A test1 -p 6 -d 12.53.252.0/24 --sport 36954 -j ACCEPT
iptables -A INPUT -p 6 --sport 20602 -s 188.164.10.87 -j ACCEPT
iptables -A test1 -p 6 -d 188.102.45.0/24 --sport 47 -s 61.79.151.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 63943 --sport 27662 -j DROP
iptables -A FORWARD -p 6 --dport 226 -j DROP
iptables -A FORWARD -d 156.214.109.134 -j ACCEPT
iptables -A test2 -d 189.110.95.0/24 -p 32 -j ACCEPT
iptables -A OUTPUT -p 22 -j ACCEPT
iptables -A test1 -p 17 --dport 52375 --sport 49242 -s 208.31.32.96 -j DROP
iptables -A FORWARD -d 201.146.228.170 -s 130.149.0.0/16 -j test1
iptables -A OUTPUT -p 17 -s 166.101.0.0/16 --sport 36071 --dport 51745 -j ACCEPT
iptables -A OUTPUT -d 195.0.0.0/8 -p 85 -j test3
iptables -A test3 -d 89.139.0.0/16 -j DROP
iptables -A FORWARD -p 17 -d 49.227.106.0/24 -s 183.0.0.0/8 --sport 45821 -j ACCEPT
iptables -A INPUT -p 17 -d 45.82.125.73 --dport 42651 -s 39.38.0.0/16 -j DROP
iptables -A FORWARD -d 194.201.223.126 -j DROP
iptables -A test1 -p 6 --sport 44548 -s 24.142.239.26 --dport 25268 -j ACCEPT
iptables -A test2 -p 6 --dport 3011 -s 241.176.214.193 --sport 35303 -j ACCEPT
iptables -A FORWARD -s 11.230.0.0/16 -d 120.45.81.253 -p 222 -j ACCEPT
iptables -A INPUT -p 6 --dport 63605 -j ACCEPT
iptables -A OUTPUT -s 112.218.41.0/24 -d 96.252.221.143 -j ACCEPT
iptables -A test3 -s 15.228.210.189 -d 209.83.192.0/24 -j ACCEPT
iptables -A OUTPUT -d 177.194.19.0/24 -j ACCEPT
iptables -A INPUT -s 110.28.116.28 -j ACCEPT
iptables -A INPUT -p 6 --sport 11034 -d 192.170.101.58 -j ACCEPT
iptables -A test3 -p 6 --sport 55497 -d 72.46.0.0/16 -s 76.178.73.180 -j DROP
iptables -A test2 -p 17 -s 108.0.0.0/8 --dport 18587 --sport 54079 -d 206.116.151.53 -j DROP
iptables -A OUTPUT -d 115.0.0.0/8 -p 130 -s 189.195.2.0/24 -j ACCEPT
iptables -A INPUT -p 155 -d 158.173.232.170 -j ACCEPT
iptables -A FORWARD -p 17 -s 98.6.140.64 --sport 17756 -j ACCEPT
iptables -A FORWARD -p 17 --dport 26857 --sport 29391 -d 228.236.177.199 -j ACCEPT
iptables -A test3 -p 6 -d 174.10.192.122 -s 193.0.0.0/8 --sport 64530 -j ACCEPT
iptables -A test2 -p 17 --dport 44241 -s 69.70.0.0/16 -j ACCEPT
iptables -A test1 -d 77.198.35.19 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 26263 -s 15.189.172.0/24 -d 56.252.45.16 -j ACCEPT
iptables -A test2 -p 6 -s 40.192.0.0/16 --sport 32375 -d 132.148.170.225 -j ACCEPT
iptables -A OUTPUT -s 189.78.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --sport 21026 -s 10.0.0.0/8 -d 198.0.0.0/8 -j DROP
iptables -A test3 -p 6 --dport 39914 -d 44.68.65.121 -j ACCEPT
iptables -A FORWARD -p 17 -s 225.110.133.236 --dport 39815 -j DROP
iptables -A test3 -p 6 --sport 40873 -s 96.0.0.0/8 -j DROP
iptables -A FORWARD -s 71.184.19.32 -j DROP
iptables -A OUTPUT -p 17 --sport 14423 -d 250.228.88.57 -j DROP
iptables -A test1 -p 17 --dport 41728 -d 199.166.251.175 -j DROP
iptables -A test1 -p 128 -j ACCEPT
iptables -A FORWARD -p 17 -d 18.201.16.80 --dport 14775 -j DROP
iptables -A FORWARD -p 6 --dport 27685 -j ACCEPT
iptables -A INPUT -d 57.204.131.0/24 -p 122 -j DROP
iptables -A test1 -p 17 -s 17.246.101.230 --sport 41416 -d 240.106.52.75 -j DROP
iptables -A test3 -p 13 -j ACCEPT
iptables -A test3 -s 165.211.146.68 -j ACCEPT
iptables -A test2 -p 6 -s 131.243.22.191 --sport 18779 --dport 44890 -j DROP
iptables -A INPUT -s 4.31.0.0/16 -p 137 -j ACCEPT
iptables -A OUTPUT -p 6 -d 180.101.0.0/16 --sport 6066 --dport 38290 -j ACCEPT
iptables -A test1 -p 6 --sport 18923 -j DROP
iptables -A test3 -d 65.189.244.25 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 5583 -s 72.117.0.0/16 --sport 49915 -d 39.188.227.245 -j ACCEPT
iptables -A INPUT -p 17 --dport 47522 --sport 19363 -s 216.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 35356 -s 62.230.134.223 -d 104.59.65.180 -j DROP
iptables -A FORWARD -p 17 --dport 59831 -j DROP
iptables -A test2 -p 17 --dport 19425 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 65155 -d 72.86.211.0/24 -j DROP
iptables -A test2 -p 6 --dport 11644 -j ACCEPT
iptables -A INPUT -p 17 --dport 33510 -j ACCEPT
iptables -A OUTPUT -p 229 -s 241.4.1.51 -d 111.6.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 49521 --sport 45210 -s 71.0.0.0/8 -d 96.77.0.0/16 -j DROP
iptables -A FORWARD -p 17 -s 98.187.178.143 --dport 10241 --sport 24163 -j DROP
iptables -A test1 -d 63.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -d 57.81.241.16 --dport 27345 -j ACCEPT
iptables -A test3 -p 6 -d 88.174.0.0/16 --sport 9879 -s 124.171.47.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -d 235.248.187.251 --dport 49754 -j DROP
iptables -A test1 -p 163 -j DROP
iptables -A FORWARD -p 6 -s 185.105.0.0/16 --sport 38861 -j ACCEPT
iptables -A OUTPUT -p 17 -s 57.42.218.241 --sport 17411 --dport 35035 -j DROP
iptables -A INPUT -p 6 --sport 51623 -s 180.59.31.33 --dport 4227 -j DROP
iptables -A OUTPUT -d 15.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --sport 11273 --dport 32520 -j ACCEPT
iptables -A FORWARD -d 156.167.181.60 -p 157 -j DROP
iptables -A FORWARD -p 6 --dport 7905 -d 161.95.131.0/24 -s 169.48.66.220 -j DROP
iptables -A test3 -p 6 -d 49.168.0.0/16 -s 171.164.12.11 --dport 32196 --sport 35611 -j DROP
iptables -A test1 -p 6 --dport 40764 -s 190.207.94.0/24 -j ACCEPT
iptables -A INPUT -d 7.230.216.101 -s 147.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --dport 15480 -s 176.12.26.153 -d 8.164.238.209 -j DROP
iptables -A test1 -p 213 -j ACCEPT
iptables -A INPUT -p 17 --dport 19340 -j ACCEPT
iptables -A test2 -p 6 --dport 30543 -s 219.99.105.77 --sport 64269 -j ACCEPT
iptables -A FORWARD -p 17 --dport 47271 -s 251.214.28.50 -j DROP
iptables -A FORWARD -p 17 --dport 23731 -d 230.254.0.0/16 --sport 14439 -j ACCEPT
iptables -A FORWARD -p 17 --dport 38828 -d 233.148.228.0/24 -j DROP
iptables -A FORWARD -p 6 --dport 28559 -j ACCEPT
iptables -A INPUT -p 61 -j ACCEPT
iptables -A FORWARD -s 5.104.167.0/24 -j DROP
iptables -A test3 -p 17 -s 221.152.3.0/24 -d 217.0.0.0/8 --dport 43169 -j ACCEPT
iptables -A OUTPUT -p 17 -d 247.233.105.123 --dport 63308 -j DROP
iptables -A test1 -p 6 -s 125.67.145.0/24 --dport 3784 -j DROP
iptables -A FORWARD -d 28.101.119.175 -s 171.38.144.141 -j ACCEPT
iptables -A test3 -p 17 --dport 16064 --sport 23322 -s 76.57.187.2 -j ACCEPT
iptables -A INPUT -p 6 --sport 778 --dport 35583 -d 25.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 -d 124.239.0.0/16 --dport 11314 -j ACCEPT
iptables -A test3 -p 17 -s 126.233.113.54 --dport 35686 -d 177.146.121.227 -j DROP
iptables -A OUTPUT -p 17 --sport 17461 -d 9.31.211.65 --dport 36155 -j test3
iptables -A test2 -p 180 -j DROP
iptables -A test2 -p 6 -d 129.34.0.0/16 --sport 56729 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 2897 --sport 17043 -j DROP
iptables -A INPUT -p 17 --sport 42371 -j ACCEPT
iptables -A INPUT -p 6 --sport 4984 --dport 27289 -s 132.0.0.0/8 -d 131.198.115.115 -j ACCEPT
iptables -A test3 -p 6 --dport 47633 --sport 16626 -j ACCEPT
iptables -A test1 -p 17 -s 219.0.0.0/8 --dport 30667 -d 165.47.238.0/24 --sport 25168 -j ACCEPT
iptables -A test3 -p 17 --dport 26863 -j DROP
iptables -A FORWARD -p 6 --sport 42532 -d 31.233.45.109 -j ACCEPT
iptables -A FORWARD -p 17 --sport 11063 -s 167.33.67.97 -j DROP
iptables -A FORWARD -p 6 --dport 47079 --sport 58122 -j DROP
iptables -A test2 -p 216 -j ACCEPT
iptables -A INPUT -d 71.208.212.59 -j ACCEPT
iptables -A INPUT -p 6 -s 228.0.0.0/8 --dport 40367 -d 11.24.126.239 -j ACCEPT
iptables -A INPUT -p 6 --sport 19229 -s 24.0.0.0/8 -d 171.0.0.0/8 -j DROP
iptables -A test2 -p 17 -d 199.41.31.0/24 --dport 10605 --sport 7132 -j DROP
iptables -A FORWARD -p 6 -s 104.74.101.0/24 --dport 472 -d 140.141.140.182 -j DROP
iptables -A INPUT -p 17 --sport 45105 -j ACCEPT
iptables -A test3 -d 1.103.0.0/16 -p 5 -s 109.2.0.0/16 -j DROP
iptables -A test2 -p 6 --sport 30323 --dport 34000 -j DROP
iptables -A test1 -p 17 --dport 38912 -s 22.0.0.0/8 -j DROP
iptables -A INPUT -p 17 -d 92.204.166.228 -s 221.219.81.31 --dport 57619 -j DROP
iptables -A FORWARD -p 38 -j ACCEPT
iptables -A test1 -p 17 --sport 52863 --dport 43615 -j DROP
iptables -A test3 -p 6 --dport 45193 --sport 54233 -j DROP
iptables -A test3 -p 6 --sport 63403 -j DROP
iptables -A test2 -p 6 --sport 40818 -d 19.240.0.0/16 -j DROP
iptables -A FORWARD -p 6 --sport 29322 -j DROP
iptables -A INPUT -d 11.186.129.13 -j DROP
iptables -A OUTPUT -p 17 -s 17.48.129.162 --dport 45646 -j test3
iptables -A INPUT -d 238.24.0.0/16 -p 197 -j DROP
iptables -A test2 -p 6 --sport 39066 -j DROP
iptables -A FORWARD -p 6 --dport 18773 -d 19.205.226.162 -j DROP
iptables -A OUTPUT -p 23 -d 46.132.106.117 -j DROP
iptables -A OUTPUT -p 17 --sport 49072 -j ACCEPT
iptables -A test1 -p 6 -d 78.207.156.96 --dport 22285 -j ACCEPT
iptables -A INPUT -p 6 --sport 15165 -j DROP
iptables -A test3 -p 6 --sport 60645 -s 82.111.48.1 -j DROP
iptables -A test1 -p 17 -s 47.0.0.0/8 --sport 52926 --dport 59136 -j DROP
iptables -A OUTPUT -p 6 -d 138.151.138.17 -s 45.122.248.88 --dport 42963 -j test3
iptables -A test3 -p 6 -d 21.169.110.232 --dport 57751 -j DROP
iptables -A OUTPUT -p 6 -d 244.205.198.160 --dport 61510 -s 148.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 -d 174.170.0.0/16 --dport 15316 -s 180.107.163.187 --sport 48069 -j ACCEPT
iptables -A test3 -p 17 --sport 11285 -j DROP
iptables -A test1 -p 6 --sport 47522 -s 147.0.0.0/8 --dport 19127 -j DROP
iptables -A test2 -p 17 --sport 12160 -d 60.108.26.158 --dport 15684 -j DROP
iptables -A OUTPUT -d 111.0.0.0/8 -s 172.203.159.161 -j DROP
iptables -A test2 -p 6 --sport 8458 -j ACCEPT
iptables -A test3 -p 6 --dport 37426 --sport 42186 -d 202.184.173.197 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 27533 --sport 22874 -s 32.167.137.150 -j ACCEPT
iptables -A OUTPUT -p 17 -d 94.0.0.0/8 --sport 46081 -j DROP
iptables -A FORWARD -p 17 -s 44.0.0.0/8 --sport 62073 --dport 44587 -j DROP
iptables -A FORWARD -d 24.186.111.0/24 -p 126 -s 191.220.175.200 -j ACCEPT
iptables -A test3 -d 78.166.212.0/24 -s 11.144.0.0/16 -p 88 -j ACCEPT
iptables -A test1 -p 89 -j ACCEPT
iptables -A test3 -p 17 -d 228.185.48.96 --dport 57403 -s 195.241.208.0/24 -j DROP
iptables -A test2 -p 6 --dport 4070 --sport 48094 -d 84.160.132.175 -j DROP
iptables -A test2 -p 67 -j ACCEPT
iptables -A FORWARD -p 6 -s 180.112.10.0/24 --dport 26446 --sport 50834 -d 112.99.163.0/24 -j DROP
iptables -A test1 -p 6 --sport 15987 -d 159.0.0.0/8 --dport 24540 -j ACCEPT
iptables -A test3 -d 120.87.105.59 -j DROP
iptables -A INPUT -p 64 -j ACCEPT
iptables -A test3 -p 6 --sport 37065 --dport 40111 -j ACCEPT
iptables -A test2 -p 6 --sport 56090 -j ACCEPT
iptables -A test1 -p 6 -d 103.115.13.0/24 --dport 25495 -s 44.177.132.178 -j DROP
iptables -A test2 -p 17 -s 130.178.152.0/24 --sport 13424 -d 243.83.52.62 -j DROP
iptables -A OUTPUT -p 6 -s 150.160.83.0/24 --dport 41951 -j DROP
iptables -A test3 -p 197 -j DROP
iptables -A OUTPUT -p 17 --dport 63077 -j test3
iptables -A INPUT -p 6 -d 57.0.0.0/8 -s 89.39.250.0/24 --sport 56044 --dport 14348 -j DROP
iptables -A test2 -s 57.101.0.0/16 -d 198.0.0.0/8 -j ACCEPT
iptables -A FORWARD -s 81.195.115.242 -j ACCEPT
iptables -A test1 -p 6 --sport 35521 -d 126.142.130.135 -j DROP
iptables -A FORWARD -p 17 -d 25.0.0.0/8 --sport 15983 -s 91.100.81.254 -j ACCEPT
iptables -A test2 -p 6 --dport 14315 -d 69.0.0.0/8 --sport 33776 -j DROP
iptables -A test1 -p 6 --sport 50636 -d 176.74.239.47 -s 243.234.89.0/24 -j ACCEPT
iptables -A test2 -p 6 --sport 9474 -d 96.205.77.0/24 -j ACCEPT
iptables -A test1 -p 6 -d 56.225.63.203 --dport 1793 -j DROP
iptables -A FORWARD -p 17 -d 248.181.0.0/16 -s 192.44.45.84 --sport 36828 --dport 10052 -j DROP
iptables -A INPUT -p 6 --sport 33603 --dport 65231 -d 203.42.180.92 -j ACCEPT
iptables -A test2 -p 6 --dport 19626 -d 220.43.15.0/24 -s 234.35.139.194 -j DROP
iptables -A FORWARD -p 6 --sport 21171 -d 150.0.0.0/8 --dport 14571 -j ACCEPT
iptables -A INPUT -p 17 -d 78.226.24.68 --dport 10909 -j DROP
iptables -A test3 -p 6 --sport 2347 -d 90.245.113.38 -s 52.65.226.33 -j DROP
iptables -A test2 -d 225.111.0.0/16 -j DROP
iptables -A INPUT -p 6 --sport 15228 --dport 34116 -d 162.229.13.117 -j DROP
iptables -A OUTPUT -p 6 --sport 41563 -j DROP
iptables -A FORWARD -p 17 --sport 43648 -d 197.159.0.0/16 -s 240.0.0.0/8 -j DROP
iptables -A test2 -p 17 --sport 2037 --dport 26398 -s 108.238.58.0/24 -j ACCEPT
iptables -A test3 -d 66.190.36.114 -p 142 -j ACCEPT
iptables -A test1 -s 224.0.0.0/8 -j DROP
iptables -A INPUT -p 17 -s 202.229.23.49 -d 132.63.217.0/24 --sport 27766 -j DROP
iptables -A FORWARD -p 6 --sport 12336 -s 110.0.0.0/8 -d 114.111.105.77 -j ACCEPT
iptables -A test3 -p 6 --dport 62914 --sport 28136 -d 17.0.0.0/8 -j DROP
iptables -A test2 -p 6 --sport 1559 -s 38.248.78.0/24 -d 76.114.0.0/16 --dport 54812 -j ACCEPT
iptables -A FORWARD -p 6 -d 88.197.231.0/24 --sport 62880 -j DROP
iptables -A INPUT -d 41.235.202.77 -j DROP
iptables -A INPUT -p 6 --dport 3700 -d 183.205.0.0/16 -j test3
iptables -A OUTPUT -p 134 -s 10.206.110.2 -j DROP
iptables -A test1 -p 6 --dport 4853 -j ACCEPT
iptables -A test1 -p 6 --dport 52454 -j DROP
iptables -A test2 -p 17 --dport 6181 -s 70.152.68.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --dport 34373 -j DROP
iptables -A OUTPUT -p 17 --sport 52292 -s 43.0.0.0/8 -d 231.141.189.0/24 -j ACCEPT
iptables -A test2 -p 17 --dport 40651 -s 26.64.112.182 -j ACCEPT
iptables -A test2 -p 17 --sport 63956 -j DROP
iptables -A OUTPUT -p 17 -d 175.197.71.0/24 --sport 7873 -s 32.201.48.113 -j DROP
iptables -A test1 -p 17 -d 166.13.152.169 --dport 36806 -s 183.141.19.20 --sport 51882 -j DROP
iptables -A test3 -p 6 --dport 46421 -d 30.97.165.82 --sport 10985 -j ACCEPT
iptables -A test2 -p 17 -d 107.29.0.0/16 --sport 28869 --dport 3778 -j DROP
iptables -A test3 -p 17 --dport 38357 -j ACCEPT
iptables -A test1 -p 6 -s 118.192.223.67 --sport 12100 -j ACCEPT
iptables -A FORWARD -p 17 -s 115.6.136.63 --dport 51232 -d 11.201.1.18 -j DROP
iptables -A INPUT -p 49 -j DROP
iptables -A OUTPUT -d 5.0.0.0/8 -s 24.206.174.49 -p 131 -j ACCEPT
iptables -A INPUT -s 3.25.37.54 -p 240 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 19461 -s 192.0.0.0/8 --sport 55752 -j DROP
iptables -A test3 -p 17 --sport 51938 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 10339 --dport 36025 -s 16.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 -d 237.162.104.0/24 --dport 16026 -s 112.117.156.228 -j DROP
iptables -A FORWARD -p 17 -d 92.0.0.0/8 -s 244.59.140.0/24 --sport 43413 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 45135 -j DROP
iptables -A test3 -p 6 --sport 24970 -j DROP
iptables -A test3 -p 6 --sport 35416 -j DROP
iptables -A test3 -p 6 -s 140.203.5.105 --dport 23857 -j ACCEPT
iptables -A FORWARD -p 17 -d 220.103.164.0/24 --sport 19804 --dport 63895 -s 254.4.192.99 -j ACCEPT
iptables -A test3 -p 74 -d 117.140.54.111 -j ACCEPT
iptables -A INPUT -p 6 --dport 19779 -d 161.0.0.0/8 --sport 63652 -j ACCEPT
iptables -A test3 -s 201.135.233.225 -j ACCEPT
iptables -A test3 -p 17 --dport 54069 -s 247.178.88.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 12949 -s 231.120.199.0/24 -j ACCEPT
iptables -A INPUT -d 171.84.96.58 -j ACCEPT
iptables -A test3 -s 1.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --sport 24155 -s 189.0.0.0/8 --dport 39378 -j ACCEPT
iptables -A test1 -p 17 --sport 59679 -s 10.75.10.163 -j ACCEPT
iptables -A test1 -p 6 --sport 43572 --dport 32593 -j ACCEPT
iptables -A test3 -p 6 -d 64.137.251.157 --sport 40466 -j ACCEPT
iptables -A test1 -p 17 --dport 51162 -s 226.217.97.225 --sport 56155 -d 238.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 61048 -j ACCEPT
iptables -A test2 -p 46 -j DROP
iptables -A test2 -p 6 --dport 10634 -s 7.0.0.0/8 -d 67.214.16.189 -j ACCEPT
iptables -A test3 -p 242 -j DROP
iptables -A INPUT -d 164.227.135.69 -j ACCEPT
iptables -A test1 -p 17 --sport 24918 --dport 17210 -j ACCEPT
iptables -A FORWARD -p 6 -d 120.93.102.0/24 --dport 5854 -j ACCEPT
iptables -A test1 -p 17 --dport 55869 -j ACCEPT
iptables -A FORWARD -p 6 --sport 4257 --dport 28495 -j ACCEPT
iptables -A INPUT -p 0 -j ACCEPT
iptables -A FORWARD -p 17 -d 206.0.0.0/8 --sport 15946 --dport 4566 -j ACCEPT
iptables -A FORWARD -p 17 --dport 38721 --sport 42360 -s 139.246.126.152 -j ACCEPT
iptables -A test3 -p 6 --sport 3017 -d 77.27.20.96 -s 47.194.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 38852 -s 52.45.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 -s 69.190.0.0/16 --dport 47322 -d 126.244.20.0/24 -j DROP
iptables -A test2 -p 17 -d 252.130.214.219 --dport 2150 --sport 14942 -j ACCEPT
iptables -A test3 -p 17 --dport 31917 -d 3.245.99.0/24 -s 49.220.199.199 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 46183 --dport 4290 -j DROP
iptables -A test3 -p 24 -j DROP
iptables -A OUTPUT -p 6 --sport 5145 -j DROP
iptables -A test3 -p 17 --sport 57706 -s 94.98.67.0/24 -d 44.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 -d 123.107.67.0/24 -s 193.156.132.231 --dport 25618 -j DROP
iptables -A test2 -p 17 --dport 60522 --sport 5047 -j ACCEPT
iptables -A INPUT -p 17 --dport 52000 -s 233.132.214.20 -d 190.0.244.75 --sport 8807 -j DROP
iptables -A test2 -d 27.48.173.250 -s 56.132.223.57 -j DROP
iptables -A test2 -p 6 --sport 17857 -s 202.0.0.0/8 --dport 50420 -j DROP
iptables -A INPUT -p 17 --dport 9450 -d 165.171.203.27 -s 205.14.2.92 -j ACCEPT
iptables -A INPUT -p 6 --sport 23321 -j DROP
iptables -A INPUT -p 96 -s 25.0.0.0/8 -d 52.54.118.220 -j DROP
iptables -A FORWARD -p 17 --sport 40017 --dport 10827 -d 157.104.60.10 -j ACCEPT
iptables -A test2 -p 17 --sport 62773 --dport 54114 -s 23.117.172.227 -j DROP
iptables -A INPUT -p 17 --sport 6163 -s 156.245.153.226 -j test3
iptables -A OUTPUT -p 6 --dport 17201 --sport 32431 -d 52.115.164.84 -j ACCEPT
iptables -A OUTPUT -p 17 -d 104.196.0.0/16 -s 204.155.87.110 --sport 30221 --dport 25258 -j ACCEPT
iptables -A test3 -p 156 -s 167.63.168.0/24 -j ACCEPT
iptables -A test3 -p 6 -s 17.114.124.233 -d 254.99.122.64 --sport 14207 -j DROP
iptables -A FORWARD -p 17 -d 115.199.209.0/24 --sport 56841 --dport 61853 -j ACCEPT
iptables -A INPUT -d 122.1.169.0/24 -p 44 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 41432 -d 42.198.82.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 16108 --dport 11718 -j DROP
iptables -A test3 -p 229 -s 184.110.90.142 -d 22.168.254.147 -j DROP
iptables -A INPUT -p 6 --dport 63080 -j test2
iptables -A test1 -p 6 --dport 1766 -d 208.167.9.148 -j DROP
iptables -A OUTPUT -p 114 -j test2
iptables -A test3 -p 17 -d 42.3.103.0/24 --dport 51750 -j DROP
iptables -A test2 -p 17 -s 191.127.214.132 -d 159.0.0.0/8 --sport 19491 -j ACCEPT
iptables -A test3 -p 6 -d 55.28.104.65 --dport 57355 --sport 12861 -j ACCEPT
iptables -A test2 -p 17 --dport 13142 -s 28.40.0.0/16 -d 15.7.0.0/16 -j DROP
iptables -A INPUT -p 6 -s 70.104.202.0/24 --dport 60887 --sport 56921 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 26542 -j test1
iptables -A INPUT -p 6 --dport 55900 -d 49.194.226.0/24 -s 238.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 -d 39.36.0.0/16 --sport 44716 -j DROP
iptables -A FORWARD -p 6 --dport 62159 -j DROP
iptables -A test3 -p 17 -s 194.59.0.0/16 --dport 8553 -d 41.219.77.108 -j DROP
iptables -A test2 -p 6 --sport 49281 -s 56.136.182.209 -j DROP
iptables -A test2 -p 17 -d 81.182.32.128 --sport 45247 -j ACCEPT
iptables -A test3 -p 17 --sport 54631 -j ACCEPT
iptables -A test2 -p 17 -d 23.185.143.118 -s 239.90.0.0/16 --dport 63154 -j ACCEPT
iptables -A FORWARD -p 17 -d 54.24.115.144 --sport 34793 --dport 46936 -j ACCEPT
iptables -A FORWARD -p 17 --sport 30364 -j ACCEPT
iptables -A test3 -p 17 --sport 36221 -s 81.234.242.55 -d 160.143.146.174 -j DROP
iptables -A INPUT -s 64.0.0.0/8 -j ACCEPT
iptables -A test2 -s 133.242.39.202 -d 236.0.0.0/8 -j ACCEPT
iptables -A INPUT -s 105.206.0.0/16 -j ACCEPT
iptables -A test2 -d 7.0.0.0/8 -j DROP
iptables -A test2 -p 6 --sport 30991 -j ACCEPT
iptables -A test1 -p 17 -d 87.170.73.0/24 --sport 64776 -s 146.211.202.142 -j DROP
iptables -A test1 -p 17 --sport 30537 --dport 18005 -s 174.0.0.0/8 -j DROP
iptables -A test2 -p 6 -s 154.62.39.107 --sport 38278 -j ACCEPT
iptables -A test1 -p 17 --dport 24711 -d 125.232.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 -s 66.144.139.4 --dport 47514 -d 75.49.217.138 -j DROP
iptables -A test3 -p 6 --dport 40078 -j ACCEPT
iptables -A test3 -p 6 --sport 20148 -j DROP
iptables -A test3 -s 110.58.12.42 -p 219 -j ACCEPT
iptables -A test3 -p 6 -s 5.0.0.0/8 --dport 43115 -j DROP
iptables -A test3 -p 17 --sport 26912 -s 135.176.54.145 -d 82.2.176.54 -j ACCEPT
iptables -A OUTPUT -p 17 -d 230.131.91.105 --dport 55855 -s 134.185.0.0/16 -j DROP
iptables -A FORWARD -p 6 -d 205.228.103.116 --sport 39127 -s 73.166.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --sport 35144 -j ACCEPT
iptables -A FORWARD -p 17 --dport 9456 -s 229.144.0.0/16 -d 227.41.85.161 -j DROP
iptables -A OUTPUT -p 17 -s 145.69.51.9 -d 208.159.101.140 --dport 2432 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 38301 -s 124.81.0.0/16 --sport 56349 -j DROP
iptables -A INPUT -p 6 -d 45.87.154.20 -s 101.10.105.91 --sport 64112 -j DROP
iptables -A test3 -p 6 -s 219.56.23.0/24 --dport 16714 --sport 13360 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 61677 --sport 19229 -s 109.68.191.119 -j ACCEPT
iptables -A INPUT -p 6 --dport 34350 -d 77.37.187.238 --sport 29247 -j ACCEPT
iptables -A test1 -p 6 --dport 35718 -s 139.160.156.197 --sport 27486 -j ACCEPT
iptables -A test1 -p 6 --dport 9005 --sport 29620 -s 234.121.156.181 -j DROP
iptables -A OUTPUT -p 6 -d 248.95.116.0/24 --sport 33452 -s 66.48.40.253 -j ACCEPT
iptables -A test2 -d 32.110.149.102 -p 88 -j ACCEPT
iptables -A FORWARD -p 17 --sport 52649 -j DROP
iptables -A OUTPUT -p 202 -j DROP
iptables -A test2 -d 213.3.0.0/16 -p 211 -j ACCEPT
iptables -A test1 -p 17 --sport 51827 -d 23.65.149.0/24 --dport 57497 -j ACCEPT
iptables -A INPUT -p 6 --sport 57739 -j ACCEPT
iptables -A test2 -p 17 -d 235.216.102.141 --dport 333 --sport 39572 -s 59.179.23.86 -j ACCEPT
iptables -A INPUT -p 76 -j ACCEPT
iptables -A test3 -p 6 --dport 37184 -d 185.64.48.70 -j DROP
iptables -A OUTPUT -p 6 -d 206.202.10.242 --sport 27897 -j ACCEPT
iptables -A test3 -p 17 --sport 25575 -j ACCEPT
iptables -A INPUT -p 6 --sport 35956 -s 61.0.0.0/8 --dport 8861 -j DROP
iptables -A FORWARD -p 17 -s 75.96.184.146 --sport 2359 -j ACCEPT
iptables -A FORWARD -p 17 --dport 21816 -j DROP
iptables -A test1 -p 17 -d 245.11.186.190 --dport 20445 -j DROP
iptables -A OUTPUT -p 193 -d 127.0.0.0/8 -s 214.237.232.126 -j DROP
iptables -A OUTPUT -p 17 -s 115.124.0.0/16 --dport 25669 -j DROP
iptables -A INPUT -p 6 --dport 11786 --sport 44780 -j DROP
iptables -A FORWARD -s 209.209.221.153 -j ACCEPT
iptables -A FORWARD -p 106 -d 186.0.0.0/8 -s 91.147.24.23 -j ACCEPT
iptables -A test2 -p 17 -s 144.0.0.0/8 --dport 35541 -j ACCEPT
iptables -A test1 -p 6 --sport 3422 -j ACCEPT
iptables -A FORWARD -d 75.15.66.0/24 -j DROP
iptables -A OUTPUT -p 17 --sport 48997 -j DROP
iptables -A test1 -p 6 -s 194.98.20.0/24 --dport 27284 --sport 2031 -j DROP
iptables -A test2 -p 6 --dport 19596 -j ACCEPT
iptables -A INPUT -s 75.0.0.0/8 -j ACCEPT
iptables -A test1 -d 36.216.248.35 -j ACCEPT
iptables -A INPUT -p 6 -d 102.71.209.0 --sport 26996 -j ACCEPT
iptables -A test2 -d 38.0.0.0/8 -s 68.39.204.242 -j ACCEPT
iptables -A FORWARD -p 6 -d 145.112.151.0/24 --dport 49869 -s 223.134.82.200 --sport 21060 -j ACCEPT
iptables -A test3 -p 6 --dport 63184 -d 231.27.190.0/24 --sport 4825 -s 62.199.201.35 -j DROP
iptables -A test3 -d 204.181.0.0/16 -s 242.238.178.17 -j DROP
iptables -A test2 -p 6 -d 22.0.0.0/8 --dport 64099 -j ACCEPT
iptables -A INPUT -s 130.200.143.86 -p 83 -j DROP
iptables -A FORWARD -p 17 -s 190.181.0.0/16 --dport 57256 -d 91.22.0.0/16 --sport 30273 -j DROP
iptables -A OUTPUT -p 17 --dport 42736 -j DROP
iptables -A test2 -p 17 -s 205.244.0.0/16 --sport 26705 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 20858 -j ACCEPT
iptables -A OUTPUT -p 199 -s 25.75.167.245 -j DROP
iptables -A INPUT -p 17 --sport 47705 -d 137.158.155.99 -s 141.7.218.67 -j ACCEPT
iptables -A test1 -s 97.0.0.0/8 -p 119 -d 84.150.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 13784 --sport 58631 -j DROP
iptables -A INPUT -s 213.76.50.242 -j ACCEPT
iptables -A FORWARD -d 88.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 -s 226.64.43.140 --dport 49684 -d 189.84.235.14 -j DROP
iptables -A FORWARD -p 17 -s 31.0.0.0/8 --sport 47087 -j DROP
iptables -A test3 -p 6 --dport 43120 -d 45.229.175.0/24 -s 39.0.0.0/8 -j ACCEPT
iptables -A test2 -p 112 -j ACCEPT
iptables -A test1 -p 17 --dport 56741 -j DROP
iptables -A test1 -d 106.0.0.0/8 -s 119.183.48.195 -j DROP
iptables -A INPUT -p 147 -d 183.251.0.0/16 -s 42.0.0.0/8 -j DROP
iptables -A test2 -p 6 --dport 6543 -s 253.250.214.0/24 -j ACCEPT
iptables -A test3 -d 28.191.70.136 -p 234 -j DROP
iptables -A test2 -p 6 --dport 38825 -s 26.224.227.179 -j ACCEPT
iptables -A INPUT -p 153 -j ACCEPT
iptables -A FORWARD -d 254.32.246.144 -j ACCEPT
iptables -A FORWARD -d 231.196.125.67 -s 38.192.0.0/16 -p 183 -j ACCEPT
iptables -A test2 -p 54 -d 237.114.235.230 -j ACCEPT
iptables -A test2 -p 6 -s 191.242.249.114 --dport 21263 -d 139.3.59.30 -j ACCEPT
iptables -A test1 -s 77.99.32.181 -d 247.0.0.0/8 -j ACCEPT
iptables -A test2 -p 132 -s 105.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --sport 34170 -j DROP
iptables -A test3 -p 17 -d 32.237.0.0/16 --sport 61957 -s 120.175.0.0/16 -j DROP
iptables -A test1 -p 6 -d 52.140.76.0/24 --sport 38042 -s 190.229.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --dport 55375 -d 187.88.64.32 -j ACCEPT
iptables -A test3 -d 191.80.187.0/24 -s 214.128.74.0/24 -j ACCEPT
iptables -A test3 -p 144 -j ACCEPT
iptables -A test2 -p 6 -s 166.20.189.96 -d 223.82.1.240 --sport 43619 -j ACCEPT
iptables -A OUTPUT -p 17 -s 74.129.192.14 -d 204.21.59.223 --sport 10346 -j ACCEPT
iptables -A INPUT -p 17 --dport 42070 -j ACCEPT
iptables -A FORWARD -p 6 --sport 9714 --dport 37684 -j ACCEPT
iptables -A OUTPUT -p 6 -d 139.223.70.222 --dport 41501 -s 70.184.246.186 -j ACCEPT
iptables -A test2 -p 75 -s 2.73.143.0/24 -d 10.95.80.167 -j DROP
iptables -A test3 -p 17 --dport 45943 -s 163.0.0.0/8 -j DROP
iptables -A test3 -p 6 -s 190.48.192.42 --sport 48951 -d 133.120.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 41849 -j DROP
iptables -A test3 -p 6 --dport 36775 -d 165.192.206.161 --sport 39998 -s 95.117.158.98 -j DROP
iptables -A test1 -p 6 --sport 18359 --dport 18826 -j DROP
iptables -A INPUT -p 6 -d 207.204.36.44 --dport 11173 -j ACCEPT
iptables -A test3 -p 6 --dport 64062 -j DROP
iptables -A FORWARD -p 17 -s 241.111.0.0/16 -d 21.0.0.0/8 --sport 48272 -j ACCEPT
iptables -A OUTPUT -s 33.51.75.186 -p 253 -j ACCEPT
iptables -A test2 -p 6 -d 25.200.0.0/16 --sport 60266 -s 223.0.0.0/8 --dport 2267 -j DROP
iptables -A FORWARD -p 6 --sport 32504 --dport 23813 -j ACCEPT
iptables -A FORWARD -p 6 --dport 22747 -d 176.12.53.160 -j DROP
iptables -A test3 -p 17 -s 83.193.47.0/24 --sport 18338 -d 51.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --dport 42183 -j DROP
iptables -A OUTPUT -p 6 -s 103.160.55.176 --sport 31131 --dport 33395 -j DROP
iptables -A test3 -p 17 -s 187.112.169.163 --sport 57042 -j DROP
iptables -A OUTPUT -p 6 --dport 19107 -j DROP
iptables -A INPUT -d 145.106.179.1 -s 206.0.0.0/8 -p 158 -j ACCEPT
iptables -A test3 -p 11 -j ACCEPT
iptables -A test3 -p 26 -d 63.0.0.0/8 -j DROP
iptables -A INPUT -d 2.101.13.254 -j DROP
iptables -A INPUT -p 6 --dport 47889 -j DROP
iptables -A FORWARD -p 17 --dport 30390 -s 107.116.179.186 --sport 18375 -j ACCEPT
iptables -A OUTPUT -p 176 -d 57.2.218.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 17533 --dport 27949 -j DROP
iptables -A FORWARD -p 17 -d 2.123.47.232 --dport 44970 -s 163.184.186.58 -j ACCEPT
iptables -A FORWARD -s 52.75.63.110 -j ACCEPT
iptables -A test2 -p 6 -s 156.195.0.0/16 --dport 31361 -d 49.107.81.36 -j ACCEPT
iptables -A FORWARD -p 17 --sport 27946 -s 143.143.31.242 -j ACCEPT
iptables -A INPUT -p 79 -s 118.21.115.0/24 -j test2
iptables -A test2 -p 17 -s 203.105.244.0/24 -d 56.92.0.0/16 --sport 38641 -j DROP
iptables -A OUTPUT -d 98.165.134.103 -s 109.36.78.31 -j DROP
iptables -A test1 -p 6 --sport 13994 -j ACCEPT
iptables -A FORWARD -p 6 -d 171.34.222.22 --sport 8052 -j DROP
iptables -A INPUT -p 6 -d 88.107.0.0/16 --sport 31567 -s 104.108.140.59 -j ACCEPT
iptables -A FORWARD -p 17 -d 224.75.0.0/16 --dport 213 -j ACCEPT
iptables -A INPUT -p 134 -s 122.137.0.0/16 -d 217.201.0.0/16 -j DROP
iptables -A test2 -p 6 -s 144.157.96.217 --sport 13000 -d 152.162.61.164 -j DROP
iptables -A OUTPUT -p 106 -j DROP
iptables -A INPUT -p 17 --sport 13541 -j ACCEPT
iptables -A test1 -p 17 -d 62.92.154.0/24 --dport 6056 -s 186.41.154.39 -j DROP
iptables -A FORWARD -p 17 -s 184.174.189.16 -d 80.196.203.25 --sport 19144 -j ACCEPT
iptables -A OUTPUT -p 6 -d 238.20.153.239 --sport 22888 --dport 45078 -s 32.220.36.242 -j ACCEPT
iptables -A FORWARD -s 255.142.206.0/24 -d 124.47.12.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 230 -d 173.53.22.135 --sport 41395 -j DROP
iptables -A INPUT -p 6 --sport 65134 -s 117.0.0.0/8 --dport 58229 -j ACCEPT
iptables -A test1 -p 34 -j ACCEPT
iptables -A INPUT -p 6 -d 156.199.16.156 --dport 2516 --sport 22653 -j ACCEPT
iptables -A test1 -p 17 -s 160.67.249.0/24 --sport 44066 --dport 16859 -j DROP
iptables -A FORWARD -p 6 --sport 15489 --dport 21508 -d 108.239.149.0/24 -j DROP
iptables -A test2 -d 204.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 244 -j DROP
iptables -A test1 -p 6 --sport 40041 -j ACCEPT
iptables -A test1 -p 6 -s 13.24.184.0/24 --sport 32276 -j ACCEPT
iptables -A FORWARD -p 6 --sport 28200 -s 248.28.0.0/16 --dport 8031 -j ACCEPT
iptables -A FORWARD -p 17 --sport 62216 -d 225.25.54.0/24 -j ACCEPT
iptables -A test2 -d 2.75.54.64 -j ACCEPT
iptables -A INPUT -p 17 -s 134.178.104.234 --sport 3702 -d 49.216.136.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 41034 --dport 34597 -j DROP
iptables -A test2 -p 6 --dport 50264 --sport 24358 -j DROP
iptables -A FORWARD -p 6 --sport 42877 -s 51.16.81.251 -j ACCEPT
iptables -A test1 -s 37.229.110.53 -j ACCEPT
iptables -A test3 -p 17 --sport 19125 --dport 27842 -j DROP
iptables -A test1 -p 6 --sport 63070 --dport 58573 -j ACCEPT
iptables -A test1 -p 6 -d 219.14.0.0/16 --sport 53998 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 47681 -d 173.78.249.113 -j DROP
iptables -A test2 -s 229.0.0.0/8 -j ACCEPT
iptables -A INPUT -d 216.5.158.198 -j DROP
iptables -A INPUT -p 6 --dport 5999 -s 98.174.3.0/24 --sport 58000 -j DROP
iptables -A INPUT -s 232.39.94.60 -j ACCEPT
iptables -A INPUT -p 17 -s 198.199.172.159 -d 253.48.0.0/16 --sport 65460 -j DROP
iptables -A INPUT -p 17 --sport 55883 -j DROP
iptables -A OUTPUT -p 17 --sport 12128 --dport 8408 -s 228.11.41.0/24 -j DROP
iptables -A INPUT -p 17 --dport 63236 --sport 57983 -j test2
iptables -A test2 -p 34 -j DROP
iptables -A test1 -d 24.127.27.37 -p 150 -j DROP
iptables -A test3 -p 17 -d 37.194.132.169 --sport 52874 --dport 9537 -j ACCEPT
iptables -A FORWARD -p 156 -j DROP
iptables -A test1 -p 103 -s 18.92.169.191 -j DROP
iptables -A OUTPUT -p 42 -j DROP
iptables -A OUTPUT -p 6 --sport 35676 -s 213.239.247.0/24 -j DROP
iptables -A test3 -p 6 --sport 55402 --dport 28253 -d 124.230.213.219 -j ACCEPT
iptables -A FORWARD -s 79.59.29.0/24 -j ACCEPT
iptables -A test3 -p 6 --dport 5818 -d 120.82.72.250 -j DROP
iptables -A test3 -d 164.9.166.0/24 -s 188.71.253.152 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 9745 -j DROP
iptables -A INPUT -p 17 -s 78.182.170.0/24 --sport 9170 -j DROP
iptables -A INPUT -p 17 --sport 35295 -d 210.49.85.0 -s 155.56.0.0/16 -j DROP
iptables -A FORWARD -p 6 --dport 24486 -s 41.0.0.0/8 --sport 33239 -j DROP
iptables -A test1 -p 17 --dport 57118 -s 114.179.183.66 -d 43.100.0.0/16 -j DROP
iptables -A FORWARD -p 6 -s 242.36.70.201 --dport 11293 -j test1
iptables -A test1 -p 17 --sport 37543 -d 223.196.230.45 --dport 23273 -j ACCEPT
iptables -A test3 -p 17 --sport 44592 -j ACCEPT
iptables -A INPUT -p 17 --sport 62354 -d 50.0.0.0/8 -j DROP
iptables -A INPUT -p 222 -j DROP
iptables -A OUTPUT -p 6 --sport 31697 -d 124.251.85.238 -s 184.200.0.0/16 -j DROP
iptables -A test1 -p 6 -d 113.56.29.0/24 -s 208.199.131.96 --sport 24153 -j DROP
iptables -A INPUT -p 17 -d 111.140.232.19 --dport 32336 -s 185.27.144.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 23486 --sport 36688 -j DROP
iptables -A test2 -d 62.28.0.0/16 -j DROP
iptables -A FORWARD -p 17 -s 122.186.244.142 --sport 34560 -j test3
iptables -A test2 -p 254 -j DROP
iptables -A OUTPUT -p 6 -d 14.185.184.37 --dport 45194 --sport 15833 -s 238.71.97.124 -j DROP
iptables -A OUTPUT -p 6 --dport 3056 -s 152.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 -s 106.20.74.144 --sport 20006 -d 170.0.0.0/8 --dport 32418 -j ACCEPT
iptables -A FORWARD -p 17 --sport 44039 -j DROP
iptables -A test3 -p 17 --sport 38287 -d 253.0.0.0/8 --dport 24431 -j DROP
iptables -A OUTPUT -p 6 --sport 3491 -j DROP
iptables -A OUTPUT -p 17 -d 35.10.235.200 --sport 9654 --dport 47176 -j DROP
iptables -A OUTPUT -p 17 --sport 49245 --dport 43375 -d 189.229.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --dport 49366 -j ACCEPT
iptables -A test3 -p 6 --dport 8043 -s 144.42.156.0/24 -d 194.146.162.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -s 160.95.57.171 --dport 53288 -j ACCEPT
iptables -A INPUT -p 17 -d 121.109.0.0/16 --sport 28648 -s 107.160.3.244 -j ACCEPT
iptables -A OUTPUT -p 6 -d 214.198.237.56 --sport 42545 -s 2.84.0.0/16 -j DROP
iptables -A INPUT -p 6 -d 94.233.17.234 --sport 12090 -j DROP
iptables -A test2 -p 17 --sport 38966 -d 194.88.0.0/16 -s 141.74.240.0/24 -j DROP
iptables -A test1 -d 46.208.129.0/24 -p 98 -j ACCEPT
iptables -A FORWARD -p 17 -d 138.181.215.0/24 --dport 36796 --sport 1852 -j DROP
iptables -A INPUT -p 192 -j test3
iptables -A test1 -p 17 --dport 13146 -j ACCEPT
iptables -A INPUT -p 6 --sport 19040 -d 216.65.89.60 --dport 47404 -j DROP
iptables -A test3 -s 229.26.104.0/24 -p 103 -d 189.0.0.0/8 -j DROP
iptables -A test2 -d 127.209.0.0/16 -s 170.7.164.139 -p 137 -j DROP
iptables -A test1 -p 6 --sport 62036 -d 172.231.0.0/16 --dport 40177 -s 35.147.154.233 -j DROP
iptables -A test2 -d 21.117.183.148 -p 243 -j ACCEPT
iptables -A INPUT -p 6 -d 20.204.0.0/16 -s 221.201.0.0/16 --sport 20796 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 59284 -s 242.245.180.0/24 -j test1
iptables -A test3 -p 17 --sport 4594 -s 17.30.0.0/16 --dport 35699 -j DROP
iptables -A test2 -s 250.76.200.172 -d 14.221.204.33 -j ACCEPT
iptables -A test3 -d 130.105.173.0/24 -j DROP
iptables -A FORWARD -p 6 --dport 6370 -s 195.217.126.149 --sport 36843 -j ACCEPT
iptables -A test3 -s 133.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -d 142.41.149.0/24 -s 247.54.78.0/24 --dport 60154 -j ACCEPT
iptables -A OUTPUT -p 6 -d 141.0.0.0/8 -s 167.199.98.0/24 --dport 49437 -j DROP
iptables -A test3 -p 6 --dport 42761 -s 170.202.0.0/16 -j DROP
iptables -A INPUT -d 243.19.3.153 -j DROP
iptables -A test3 -p 6 --dport 54300 -s 33.0.0.0/8 --sport 20862 -j DROP
iptables -A test1 -s 18.11.189.70 -j DROP
iptables -A OUTPUT -p 6 --dport 60558 -d 230.231.213.0/24 --sport 16742 -j ACCEPT
iptables -A test1 -p 17 -d 141.47.0.0/16 -s 173.244.166.96 --sport 39278 -j DROP
iptables -A test2 -p 6 --sport 23399 -j DROP
iptables -A INPUT -s 208.54.215.0/24 -j DROP
iptables -A INPUT -d 78.21.202.59 -j DROP
iptables -A INPUT -p 17 -s 41.146.0.0/16 --sport 14668 --dport 64127 -j DROP
iptables -A test1 -p 6 --dport 9440 -s 46.22.222.0/24 -j ACCEPT
iptables -A INPUT -p 6 -s 159.52.239.43 --sport 9513 --dport 6620 -d 46.146.3.182 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 51409 --dport 37178 -j DROP
iptables -A test3 -p 198 -j DROP
iptables -A test1 -p 6 --sport 19999 -j DROP
iptables -A test2 -p 17 --sport 24888 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 15349 -j DROP
iptables -A test2 -p 17 --dport 35336 -d 221.21.0.0/16 --sport 14309 -s 157.94.85.181 -j DROP
iptables -A test3 -p 6 --dport 5492 --sport 7405 -s 120.103.85.10 -j DROP
iptables -A INPUT -p 6 --sport 20466 --dport 26293 -d 67.51.0.0/16 -j DROP
iptables -A FORWARD -p 17 --sport 8934 -d 187.219.0.0/16 -s 35.165.0.0/16 --dport 19188 -j ACCEPT
iptables -A INPUT -p 6 --dport 45940 -s 159.0.0.0/8 -d 106.107.37.0/24 --sport 38345 -j ACCEPT
iptables -A FORWARD -p 6 --dport 54928 -j DROP
iptables -A test1 -p 17 --sport 47263 -s 188.212.35.56 -d 2.55.183.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --sport 33541 -s 155.0.0.0/8 -d 245.71.245.229 -j ACCEPT
iptables -A INPUT -s 113.90.17.158 -p 216 -d 222.201.179.110 -j ACCEPT
iptables -A test3 -p 17 -d 163.0.0.0/8 --dport 13986 -s 12.65.78.82 -j ACCEPT
iptables -A test3 -p 6 -d 55.0.0.0/8 --sport 8525 -j ACCEPT
iptables -A test2 -p 17 --dport 65326 -j ACCEPT
iptables -A test3 -p 17 --dport 52222 -j DROP
iptables -A INPUT -d 120.0.0.0/8 -j DROP
iptables -A test2 -p 6 --dport 25937 --sport 65204 -s 137.26.191.116 -j ACCEPT
iptables -A test1 -p 6 --sport 16878 -j ACCEPT
iptables -A FORWARD -p 6 --dport 41063 -d 175.109.253.39 -s 99.17.0.0/16 -j DROP
iptables -A INPUT -p 162 -j DROP
iptables -A OUTPUT -p 104 -j DROP
iptables -A test1 -p 137 -s 119.233.118.20 -j ACCEPT
iptables -A test3 -s 253.86.6.0/24 -j DROP
iptables -A test2 -s 51.188.248.117 -j DROP
iptables -A test1 -d 13.241.145.77 -j DROP
iptables -A FORWARD -d 207.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 43409 --sport 13632 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 10964 -s 189.0.0.0/8 -d 106.252.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 -s 127.0.0.0/8 --dport 56225 -d 123.220.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 6441 -j DROP
iptables -A FORWARD -p 6 --dport 41622 --sport 28731 -d 51.66.219.220 -j DROP
iptables -A FORWARD -d 114.23.69.178 -j DROP
iptables -A OUTPUT -p 6 --dport 12415 -s 155.183.86.243 -d 147.0.0.0/8 -j DROP
iptables -A test2 -p 6 -d 101.124.242.30 --sport 21850 -j DROP
iptables -A test2 -p 17 --dport 2766 -s 121.85.0.0/16 -j DROP
iptables -A test1 -p 17 -s 186.228.0.0/16 --sport 30774 -j ACCEPT
iptables -A test3 -p 6 -d 166.229.0.0/16 --dport 25024 -j ACCEPT
iptables -A FORWARD -p 17 --dport 34822 -j DROP
iptables -A INPUT -p 17 --sport 32534 --dport 15383 -j ACCEPT
iptables -A test1 -p 6 --dport 52735 -j DROP
iptables -A FORWARD -p 6 --sport 57043 -j DROP
iptables -A test1 -p 17 --sport 32709 -s 126.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 52142 -s 128.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 -d 188.88.134.218 --sport 50223 --dport 50232 -j DROP
iptables -A test1 -s 11.139.101.250 -j DROP
iptables -A OUTPUT -p 6 --sport 7577 -j DROP
iptables -A OUTPUT -p 17 --dport 6050 -s 60.43.217.0/24 -j ACCEPT
iptables -A test1 -p 6 -s 22.98.0.0/16 --dport 2495 --sport 41535 -j ACCEPT
iptables -A INPUT -p 6 -s 145.122.0.0/16 --dport 7954 -j ACCEPT
iptables -A test1 -p 191 -s 150.221.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 48905 --sport 51792 -j ACCEPT
iptables -A test1 -p 17 --dport 39467 -s 112.227.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 17238 --dport 63339 -s 202.231.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --dport 11561 -j ACCEPT
iptables -A test2 -p 6 --sport 2133 -j ACCEPT
iptables -A INPUT -p 17 -d 141.83.230.218 --dport 32077 -s 161.36.53.0/24 -j ACCEPT
iptables -A test2 -d 53.25.234.8 -p 80 -j ACCEPT
iptables -A test1 -p 17 --sport 36887 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 61692 --sport 14027 -j ACCEPT
iptables -A test2 -d 119.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 44881 --dport 27139 -j ACCEPT
iptables -A test3 -p 17 --sport 9626 -s 196.119.219.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 35894 -j ACCEPT
iptables -A test3 -p 6 --dport 16064 -j DROP
iptables -A test1 -p 17 -s 214.0.0.0/8 --sport 37917 -j ACCEPT
iptables -A INPUT -p 6 --dport 55505 -s 93.0.0.0/8 -d 39.23.88.131 -j DROP
iptables -A test3 -p 6 --dport 55123 -d 75.185.243.125 -j ACCEPT
iptables -A test2 -p 17 -s 78.241.0.0/16 -d 196.69.164.105 --sport 15380 -j DROP
iptables -A FORWARD -p 210 -j ACCEPT
iptables -A INPUT -p 113 -j ACCEPT
iptables -A test2 -p 184 -j DROP
iptables -A INPUT -p 6 -s 151.189.91.205 -d 245.194.155.205 --dport 1300 -j DROP
iptables -A test1 -p 6 --sport 33614 -j DROP
iptables -A FORWARD -d 39.54.153.78 -j DROP
iptables -A INPUT -p 17 -s 188.217.209.0/24 -d 99.30.145.143 --sport 52097 -j ACCEPT
iptables -A FORWARD -p 17 --dport 19706 -s 11.71.43.111 -j ACCEPT
iptables -A OUTPUT -p 6 -d 250.0.0.0/8 --sport 31643 -j ACCEPT
iptables -A FORWARD -p 17 -d 246.0.0.0/8 --sport 9456 --dport 20906 -j DROP
iptables -A OUTPUT -p 17 --sport 6214 -j ACCEPT
iptables -A INPUT -p 17 --sport 34014 --dport 27784 -j ACCEPT
iptables -A OUTPUT -s 99.3.98.63 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 41618 -j DROP
iptables -A OUTPUT -s 196.4.179.56 -j DROP
iptables -A test3 -p 6 --dport 3579 -s 8.0.0.0/8 -j DROP
iptables -A test1 -p 6 --sport 60514 -j DROP
iptables -A OUTPUT -p 17 --sport 24037 -s 11.183.0.0/16 -d 11.50.155.77 --dport 38125 -j DROP
iptables -A INPUT -p 6 --dport 9939 -j DROP
iptables -A test3 -p 17 -d 134.0.0.0/8 --sport 7174 --dport 59179 -j DROP
iptables -A test3 -p 217 -s 78.173.147.0/24 -d 230.118.13.171 -j ACCEPT
iptables -A INPUT -p 17 -s 20.242.216.0/24 -d 160.73.41.52 --dport 22964 -j ACCEPT
iptables -A INPUT -p 17 -s 135.253.157.123 --sport 9618 -j ACCEPT
iptables -A test1 -p 17 -s 213.149.2.234 --sport 24979 --dport 24331 -j DROP
iptables -A FORWARD -p 6 --dport 36903 -d 118.186.201.37 -s 184.40.0.0/16 --sport 56543 -j DROP
iptables -A FORWARD -p 6 --sport 4760 -j ACCEPT
iptables -A test1 -p 6 --sport 57955 -s 128.151.219.32 --dport 60994 -j DROP
iptables -A test2 -p 17 --sport 24089 --dport 14362 -s 152.185.144.11 -j ACCEPT
iptables -A FORWARD -p 6 --sport 35809 -j DROP
iptables -A test1 -s 201.73.23.185 -j DROP
iptables -A OUTPUT -p 6 -d 170.172.200.23 --dport 21797 --sport 27434 -j DROP
iptables -A test3 -s 118.194.0.0/16 -j ACCEPT
iptables -A test1 -p 71 -j ACCEPT
iptables -A INPUT -p 17 -s 117.154.186.79 --sport 60007 -d 203.47.171.43 -j ACCEPT
iptables -A test2 -p 6 -d 246.4.215.93 --dport 17521 -j DROP
iptables -A test3 -p 17 -s 84.158.108.168 -d 203.195.0.0/16 --dport 14588 -j ACCEPT
iptables -A FORWARD -p 39 -j DROP
iptables -A INPUT -p 17 --sport 52579 -j ACCEPT
iptables -A test3 -p 6 --sport 31630 -j ACCEPT
iptables -A test3 -p 17 --dport 51436 -s 68.0.0.0/8 -j DROP
iptables -A test3 -p 151 -j ACCEPT
iptables -A test1 -p 17 --sport 3525 --dport 63451 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 1462 -d 210.222.0.0/16 --dport 371 -j DROP
iptables -A test1 -p 6 --dport 63131 -s 53.105.0.0/16 --sport 42691 -j DROP
iptables -A FORWARD -p 61 -s 162.105.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -d 244.196.129.12 --dport 14674 -s 19.159.244.143 --sport 55978 -j ACCEPT
iptables -A FORWARD -s 153.212.198.10 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 12337 -s 230.195.219.117 -d 157.93.69.24 -j ACCEPT
iptables -A FORWARD -p 6 --sport 3926 -s 111.216.103.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 -s 107.63.233.0/24 -d 219.199.0.0/16 --dport 21510 -j DROP
iptables -A INPUT -p 17 -d 63.65.135.56 --sport 30662 --dport 12743 -j ACCEPT
iptables -A test3 -d 77.12.172.0/24 -j ACCEPT
iptables -A test3 -p 6 --dport 8808 -j DROP
iptables -A INPUT -p 17 --dport 15291 -d 94.127.168.0/24 --sport 31965 -j ACCEPT
iptables -A test2 -p 6 --dport 62848 -j ACCEPT
iptables -A FORWARD -s 37.0.0.0/8 -d 155.213.202.250 -p 171 -j DROP
iptables -A test3 -p 17 --sport 47456 --dport 59616 -s 33.58.0.0/16 -j ACCEPT
iptables -A test3 -s 107.225.59.68 -j DROP
iptables -A test3 -p 17 -d 173.95.0.0/16 --dport 25295 -j DROP
iptables -A test3 -p 17 --sport 21338 --dport 52195 -j DROP
iptables -A FORWARD -p 17 -d 224.102.202.0/24 --dport 15484 -j DROP
iptables -A test3 -p 6 --sport 15350 -j ACCEPT
iptables -A OUTPUT -d 147.36.0.0/16 -j ACCEPT
iptables -A test2 -s 122.89.9.0/24 -j DROP
iptables -A INPUT -p 6 -s 200.125.121.53 --dport 24742 -d 177.26.159.216 -j DROP
iptables -A test3 -p 6 -d 208.220.172.105 --sport 325 -j ACCEPT
iptables -A test2 -p 17 -s 181.60.81.41 -d 13.0.0.0/8 --dport 56481 -j ACCEPT
iptables -A test2 -p 17 --sport 5092 -j ACCEPT
iptables -A test1 -p 213 -j DROP
iptables -A INPUT -p 255 -j DROP
iptables -A test2 -p 6 -s 20.126.151.209 --sport 29480 -d 61.206.139.226 -j DROP
iptables -A INPUT -p 9 -d 63.237.101.174 -j DROP
iptables -A test3 -p 17 --sport 8882 -d 163.134.73.142 -j DROP
iptables -A FORWARD -p 31 -j ACCEPT
iptables -A INPUT -p 6 --dport 30304 -j ACCEPT
iptables -A INPUT -p 17 -d 57.65.121.252 --sport 34321 --dport 29078 -j DROP
iptables -A FORWARD -p 17 -s 44.77.100.72 --dport 49217 -d 62.118.100.193 --sport 8960 -j ACCEPT
iptables -A INPUT -p 17 -s 30.0.0.0/8 -d 43.76.152.50 --sport 31951 -j DROP
iptables -A test2 -p 6 -d 170.234.101.0/24 --sport 21308 --dport 7065 -s 183.90.48.96 -j DROP
iptables -A INPUT -d 162.111.23.148 -j ACCEPT
iptables -A OUTPUT -p 6 -d 24.230.215.165 --dport 20358 --sport 1124 -j test3
iptables -A INPUT -p 6 --dport 5920 -j DROP
iptables -A test2 -p 17 -s 248.19.42.244 --dport 27279 -d 71.0.239.0/24 -j ACCEPT
iptables -A test1 -s 9.32.171.0/24 -d 69.213.7.147 -j DROP
iptables -A test3 -p 17 -s 101.0.0.0/8 --sport 8327 -j ACCEPT
iptables -A test3 -p 17 --dport 58304 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 18273 -d 136.225.0.126 -j ACCEPT
iptables -A test1 -s 36.196.199.52 -j ACCEPT
iptables -A OUTPUT -p 17 -d 213.196.53.64 --sport 9562 -j test2
iptables -A OUTPUT -p 17 --dport 58878 -d 194.3.245.251 -s 61.238.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 42911 -j ACCEPT
iptables -A test3 -s 174.24.24.26 -p 110 -d 37.170.136.124 -j ACCEPT
iptables -A test3 -p 6 --sport 56776 -s 251.253.134.161 --dport 17253 -j DROP
iptables -A INPUT -p 17 --sport 43203 -j DROP
iptables -A OUTPUT -p 17 --dport 30953 -j ACCEPT
iptables -A INPUT -p 17 --sport 48974 -s 216.18.182.62 -j test2
iptables -A test3 -p 17 --dport 44368 --sport 948 -s 167.148.50.233 -d 174.0.0.0/8 -j ACCEPT
iptables -A test1 -d 83.7.58.124 -p 34 -j DROP
iptables -A FORWARD -p 6 --dport 7616 -j DROP
iptables -A FORWARD -p 198 -j ACCEPT
iptables -A test2 -p 6 --sport 24312 -j ACCEPT
iptables -A INPUT -p 17 -d 202.7.232.0/24 --sport 36114 -j DROP
iptables -A test3 -p 6 --dport 53102 -s 65.118.0.0/16 --sport 61521 -j DROP
iptables -A INPUT -p 17 -s 84.0.0.0/8 --dport 27767 -d 183.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 3081 -j ACCEPT
iptables -A test1 -p 17 -d 26.49.211.211 --sport 34954 -j ACCEPT
iptables -A OUTPUT -s 219.14.58.216 -d 125.75.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 -d 181.167.11.218 --dport 43721 -j ACCEPT
iptables -A test2 -p 17 --dport 49238 -s 182.19.5.75 -j ACCEPT
iptables -A test2 -p 6 --sport 44409 -s 72.22.176.106 --dport 65413 -d 228.186.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --dport 63239 --sport 65100 -j ACCEPT
iptables -A test3 -p 147 -s 23.180.105.0 -j ACCEPT
iptables -A test2 -p 164 -j DROP
iptables -A INPUT -p 17 -d 187.244.165.85 --dport 56826 --sport 9603 -j ACCEPT
iptables -A INPUT -p 17 -d 1.122.171.93 --sport 20367 --dport 40438 -j ACCEPT
iptables -A FORWARD -p 17 -s 240.123.234.234 -d 106.7.154.91 --sport 3035 --dport 60428 -j ACCEPT
iptables -A test2 -p 17 --dport 35171 --sport 22303 -j ACCEPT
iptables -A INPUT -p 17 -d 239.92.182.142 --sport 31738 --dport 12312 -j DROP
iptables -A INPUT -p 163 -j ACCEPT
iptables -A test3 -p 6 --sport 8948 -j ACCEPT
iptables -A FORWARD -d 95.43.172.136 -p 122 -s 158.211.143.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 33231 -j DROP
iptables -A test3 -p 17 -s 53.19.154.0/24 -d 1.180.241.116 --dport 36614 --sport 22558 -j ACCEPT
iptables -A test3 -p 17 -d 45.63.139.210 --sport 61028 --dport 61607 -j DROP
iptables -A test3 -p 17 --sport 51623 -s 216.82.182.159 -d 192.73.248.58 -j ACCEPT
iptables -A INPUT -p 6 -d 0.20.45.204 --sport 14135 --dport 39583 -j ACCEPT
iptables -A test2 -p 17 --sport 21787 -s 6.2.60.101 -j ACCEPT
iptables -A INPUT -d 150.250.139.0/24 -s 239.220.4.111 -j DROP
iptables -A FORWARD -p 6 -s 82.65.0.0/16 --sport 15126 --dport 29315 -j DROP
iptables -A test2 -p 17 -s 0.130.155.136 --sport 7269 -j ACCEPT
iptables -A test2 -p 6 --dport 21598 -j ACCEPT
iptables -A INPUT -p 6 --dport 22751 -d 182.121.0.0/16 --sport 6995 -j ACCEPT
iptables -A INPUT -s 188.157.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 39201 -d 253.0.0.0/8 --sport 3964 -j ACCEPT
iptables -A test3 -p 17 --dport 494 --sport 58040 -s 12.82.0.0/16 -j DROP
iptables -A test1 -p 6 -s 159.243.163.189 --sport 59166 -j DROP
iptables -A INPUT -p 17 --dport 55437 --sport 56189 -d 253.198.244.0 -j DROP
iptables -A INPUT -s 199.240.180.200 -j ACCEPT
iptables -A INPUT -p 29 -j ACCEPT
iptables -A test2 -p 6 --sport 2646 -d 254.0.0.0/8 --dport 9636 -j ACCEPT
iptables -A test1 -p 17 --sport 31294 --dport 44003 -d 168.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 -s 193.5.202.138 --sport 39380 -j ACCEPT
iptables -A test3 -p 17 --sport 36000 -s 58.82.0.0/16 --dport 24395 -j ACCEPT
iptables -A test1 -p 17 --sport 44364 -j DROP
iptables -A OUTPUT -p 6 -s 110.158.37.230 --dport 23630 -j test1
iptables -A test1 -p 6 --dport 51396 -j DROP
iptables -A INPUT -p 6 -d 40.0.0.0/8 --dport 15702 -s 87.101.0.0/16 -j DROP
iptables -A FORWARD -s 140.5.0.0/16 -d 98.145.198.155 -j ACCEPT
iptables -A test2 -p 222 -j ACCEPT
iptables -A test1 -p 17 -s 193.51.0.0/16 --dport 30995 -d 124.214.85.176 -j ACCEPT
iptables -A test1 -p 10 -j DROP
iptables -A test2 -p 17 -d 26.150.240.195 --sport 47705 -s 216.44.77.254 -j ACCEPT
iptables -A INPUT -p 17 --sport 43172 -d 9.87.38.13 -j ACCEPT
iptables -A OUTPUT -p 17 -s 124.88.29.100 --dport 62147 -d 118.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 38230 -j DROP
iptables -A test2 -d 222.237.0.0/16 -p 239 -j DROP
iptables -A test2 -p 17 --dport 30699 -d 15.18.10.0/24 -s 114.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --dport 27887 --sport 16931 -j ACCEPT
iptables -A test1 -p 6 -s 160.6.154.171 --sport 41961 -j ACCEPT
iptables -A OUTPUT -p 6 -s 17.254.127.31 --sport 50935 -j DROP
iptables -A FORWARD -p 17 -d 84.252.0.0/16 --sport 1164 -s 129.103.176.158 --dport 47400 -j DROP
iptables -A OUTPUT -p 6 -d 48.161.114.245 --sport 35080 -j ACCEPT
iptables -A test2 -p 6 --dport 6351 -s 191.10.61.117 --sport 58125 -j ACCEPT
iptables -A FORWARD -p 175 -j DROP
iptables -A FORWARD -p 17 -d 190.142.0.0/16 --sport 32212 -j DROP
iptables -A INPUT -p 17 -d 62.47.82.4 --sport 28968 -j ACCEPT
iptables -A test3 -p 6 --dport 2646 -j ACCEPT
iptables -A INPUT -p 6 --sport 63309 -j DROP
iptables -A test1 -p 17 --dport 51717 --sport 22617 -d 214.84.69.185 -j DROP
iptables -A test3 -p 6 --sport 28722 -s 219.42.139.126 -d 96.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -s 66.226.229.254 -p 55 -d 50.128.30.186 -j DROP
iptables -A test3 -p 17 --sport 25422 -j DROP
iptables -A INPUT -p 17 -s 196.246.158.0/24 --sport 51298 -d 128.121.184.188 -j ACCEPT
iptables -A test2 -d 176.120.184.0/24 -p 155 -j ACCEPT
iptables -A test1 -p 17 --dport 65087 -j ACCEPT
iptables -A test2 -s 211.21.0.0/16 -p 198 -d 188.39.97.0/24 -j ACCEPT
iptables -A test3 -d 163.215.0.0/16 -j DROP
iptables -A test2 -s 88.0.196.106 -d 218.92.0.0/16 -j ACCEPT
iptables -A test2 -p 193 -j DROP
iptables -A FORWARD -p 6 -d 54.5.0.0/16 --dport 62031 -j DROP
iptables -A test1 -p 6 --sport 19206 -j DROP
iptables -A test1 -p 6 --sport 23042 -s 71.88.0.0/16 --dport 40156 -d 47.238.35.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 25339 -s 198.244.73.0/24 --sport 27146 -j DROP
iptables -A test3 -d 50.17.235.0/24 -p 184 -j DROP
iptables -A FORWARD -p 17 --sport 54569 -d 51.202.236.0/24 --dport 11761 -s 14.97.0.0/16 -j test1
iptables -A test2 -p 6 -s 171.57.170.5 --dport 49376 -j ACCEPT
iptables -A test1 -p 6 --sport 60067 --dport 12834 -j ACCEPT
iptables -A FORWARD -p 6 -s 205.69.87.158 --dport 19914 -j DROP
iptables -A test1 -p 6 --sport 46097 --dport 17327 -d 239.229.109.146 -j DROP
iptables -A test3 -s 48.94.62.0/24 -p 162 -j DROP
iptables -A test3 -p 6 --sport 61225 -s 154.48.190.206 --dport 47192 -j ACCEPT
iptables -A test3 -p 6 -s 93.67.3.7 --sport 62192 -j ACCEPT
iptables -A INPUT -d 175.0.0.0/8 -s 176.0.0.0/8 -j DROP
iptables -A test1 -p 6 -d 212.36.0.0/16 --dport 62878 -s 168.83.186.242 --sport 55689 -j ACCEPT
iptables -A test2 -p 6 -d 252.77.0.0/16 --dport 902 -s 238.0.0.0/8 -j DROP
iptables -A test1 -s 161.244.139.119 -j DROP
iptables -A INPUT -p 6 --sport 56192 -j DROP
iptables -A INPUT -s 251.171.64.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --sport 3456 -j ACCEPT
iptables -A FORWARD -p 17 --sport 21164 -s 110.58.252.0/24 -j ACCEPT
iptables -A INPUT -p 228 -d 213.36.160.165 -j test2
iptables -A test3 -p 6 -s 192.0.0.0/8 --sport 54401 -j ACCEPT
iptables -A INPUT -p 6 -d 32.0.0.0/8 --dport 5472 -j ACCEPT
iptables -A INPUT -p 46 -d 97.199.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --sport 5638 -j ACCEPT
iptables -A OUTPUT -d 250.161.110.233 -p 179 -s 111.30.0.0/16 -j DROP
iptables -A FORWARD -p 6 --sport 27801 -s 5.214.222.233 --dport 54827 -j DROP
iptables -A test3 -p 17 --dport 40139 -s 36.207.99.38 -j DROP
iptables -A test1 -p 6 -s 86.109.14.148 --sport 7087 -j ACCEPT
iptables -A test3 -p 17 -s 11.71.104.186 --dport 56328 -j DROP
iptables -A test1 -p 6 --sport 51646 -s 60.108.91.101 -d 89.160.65.161 -j ACCEPT
iptables -A FORWARD -p 6 -d 10.0.0.0/8 --sport 59911 --dport 22315 -j DROP
iptables -A OUTPUT -d 130.186.215.251 -j ACCEPT
iptables -A OUTPUT -p 6 -d 217.238.0.0/16 --sport 62338 -j ACCEPT
iptables -A INPUT -p 17 -d 3.243.0.0/16 --dport 42383 -s 15.173.225.13 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 46434 -d 162.125.56.182 -j DROP
iptables -A test2 -p 6 --sport 46514 --dport 8536 -j ACCEPT
iptables -A INPUT -p 17 --sport 58617 -d 58.15.186.37 -s 7.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 -d 59.116.0.0/16 -s 140.66.203.4 --sport 7709 -j ACCEPT
iptables -A test3 -p 17 -s 34.72.87.213 --dport 13 --sport 33779 -j DROP
iptables -A OUTPUT -p 17 -s 145.0.0.0/8 --dport 59953 -d 223.0.0.0/8 -j ACCEPT
iptables -A INPUT -s 203.0.0.0/8 -j DROP
iptables -A test1 -p 6 --sport 45288 --dport 59832 -d 174.224.77.29 -s 128.7.226.225 -j DROP
iptables -A OUTPUT -p 6 --sport 63529 -s 202.174.194.168 -d 70.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 -d 151.203.216.244 -s 92.176.104.230 --dport 29262 --sport 20246 -j ACCEPT
iptables -A test2 -p 6 -s 126.147.155.8 -d 75.0.0.0/8 --sport 23968 -j DROP
iptables -A INPUT -p 6 --sport 51921 -s 78.21.98.0/24 --dport 9357 -j test3
iptables -A FORWARD -d 158.8.121.81 -s 206.244.38.232 -j ACCEPT
iptables -A test3 -p 17 --dport 26140 --sport 2261 -d 21.161.86.173 -j ACCEPT
iptables -A test3 -p 17 -d 201.64.29.106 --sport 40033 -j DROP
iptables -A test1 -p 17 -s 119.22.196.90 -d 221.124.245.0/24 --sport 27400 --dport 32456 -j DROP
iptables -A test2 -p 17 -d 224.0.0.0/8 -s 25.146.227.176 --dport 38581 --sport 48477 -j ACCEPT
iptables -A FORWARD -p 17 -d 7.148.176.22 --dport 7917 --sport 53371 -j ACCEPT
iptables -A INPUT -d 58.228.0.0/16 -p 237 -j DROP
iptables -A FORWARD -p 17 -s 195.200.86.112 --sport 5754 -j test2
iptables -A test3 -p 17 --dport 24007 -d 137.192.0.0/16 -j DROP
iptables -A test2 -p 17 --sport 22968 --dport 39599 -j DROP
iptables -A test3 -p 17 --dport 57289 -s 109.106.190.219 -j ACCEPT
iptables -A test1 -p 17 -d 201.121.175.0/24 --sport 38649 -j ACCEPT
iptables -A INPUT -p 6 --dport 18841 -d 211.116.33.0/24 -s 148.107.0.0/16 -j ACCEPT
iptables -A test3 -d 194.101.0.0/16 -j DROP
iptables -A INPUT -p 6 --dport 53945 -d 160.144.182.155 -j DROP
iptables -A test3 -p 195 -j DROP
iptables -A test2 -p 17 --sport 48328 -s 198.180.32.194 -d 217.187.199.133 --dport 21460 -j DROP
iptables -A INPUT -p 6 --sport 35057 -s 62.125.8.131 -d 58.57.8.183 -j ACCEPT
iptables -A INPUT -p 17 --sport 9965 --dport 57617 -j test1
iptables -A OUTPUT -p 6 -d 2.0.0.0/8 --sport 21541 --dport 26684 -j ACCEPT
iptables -A INPUT -p 17 --sport 44034 -j ACCEPT
iptables -A test2 -d 29.205.168.57 -s 56.237.214.20 -j ACCEPT
iptables -A test3 -p 6 --sport 21594 --dport 30064 -j DROP
iptables -A test2 -s 103.62.105.16 -j DROP
iptables -A OUTPUT -p 17 --dport 11912 -j DROP
iptables -A FORWARD -p 6 --dport 11122 --sport 17875 -s 147.203.113.241 -j DROP
iptables -A OUTPUT -p 6 --sport 1857 -s 75.177.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 -s 48.190.87.66 --sport 17306 -d 63.11.65.78 -j ACCEPT
iptables -A test3 -p 6 -s 139.142.146.46 --dport 61634 -d 107.4.79.79 -j ACCEPT
iptables -A FORWARD -p 17 -d 21.0.0.0/8 -s 91.43.61.139 --sport 48308 -j ACCEPT
iptables -A FORWARD -p 17 --sport 59968 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 91 -j DROP
iptables -A test1 -p 17 --sport 40805 -d 136.0.0.0/8 -s 128.128.14.251 -j DROP
iptables -A OUTPUT -p 17 --dport 30347 -s 198.167.136.158 -j DROP
iptables -A test3 -p 6 --sport 44965 -d 253.212.0.0/16 --dport 63230 -j ACCEPT
iptables -A test2 -s 214.135.226.123 -j ACCEPT
iptables -A test2 -p 6 -s 17.253.0.0/16 -d 175.0.0.0/8 --sport 12844 -j DROP
iptables -A test3 -d 112.103.0.0/16 -p 196 -s 134.82.55.192 -j ACCEPT
iptables -A OUTPUT -p 102 -j DROP
iptables -A OUTPUT -p 17 --sport 27800 -j DROP
iptables -A INPUT -p 6 --sport 58096 -d 43.50.195.0/24 -s 124.185.185.0/24 -j ACCEPT
iptables -A test2 -p 17 --dport 9377 --sport 17961 -d 68.106.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 64559 -d 217.206.249.136 -j ACCEPT
iptables -A INPUT -p 6 --dport 8266 -d 10.58.101.0/24 -j ACCEPT
iptables -A test2 -p 50 -j ACCEPT
iptables -A test2 -p 17 --sport 48136 -s 185.210.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 55357 --dport 49512 -j DROP
iptables -A OUTPUT -p 6 --dport 47037 -d 85.56.2.3 -j ACCEPT
iptables -A test3 -p 6 -s 254.98.215.19 --dport 4795 -d 152.239.166.0/24 -j ACCEPT
iptables -A INPUT -p 17 --dport 9820 -j DROP
iptables -A test1 -p 6 -d 222.192.0.0/16 -s 239.34.60.242 --dport 36196 -j ACCEPT
iptables -A test2 -p 6 --sport 19315 -j DROP
iptables -A test1 -p 17 --dport 24302 --sport 33755 -d 114.181.0.0/16 -j DROP
iptables -A INPUT -p 17 --dport 64764 -j DROP
iptables -A test1 -p 6 -d 97.115.159.53 --dport 11355 -s 196.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -s 59.21.171.19 --sport 52549 -j DROP
iptables -A test2 -p 17 --dport 38969 -d 150.192.57.0/24 --sport 17290 -j ACCEPT
iptables -A OUTPUT -p 17 -d 53.0.0.0/8 --dport 41083 --sport 5845 -j DROP
iptables -A test1 -p 50 -j DROP
iptables -A test1 -p 17 --dport 25095 --sport 14489 -d 192.219.0.0/16 -j ACCEPT
iptables -A FORWARD -p 158 -j ACCEPT
iptables -A OUTPUT -p 253 -d 48.0.0.0/8 -s 133.15.106.0/24 -j test1
iptables -A OUTPUT -p 6 --dport 61314 -s 142.81.71.167 --sport 44001 -j ACCEPT
iptables -A INPUT -p 6 -s 137.206.0.0/16 --dport 11216 -d 132.60.103.0/24 -j DROP
iptables -A OUTPUT -p 17 --dport 8096 --sport 52920 -j ACCEPT
iptables -A FORWARD -p 17 --dport 60301 -j ACCEPT
iptables -A OUTPUT -p 17 -d 13.0.0.0/8 --sport 29170 -j ACCEPT
iptables -A test1 -p 6 --dport 53953 -d 51.191.15.67 --sport 51370 -j ACCEPT
iptables -A test3 -d 205.162.192.50 -p 133 -j ACCEPT
iptables -A test2 -p 17 --dport 45278 -d 177.170.222.0/24 -s 2.45.198.36 -j DROP
iptables -A OUTPUT -d 137.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -s 71.254.117.0/24 --dport 27944 -j ACCEPT
iptables -A FORWARD -d 155.117.64.104 -s 178.151.180.0/24 -j ACCEPT
iptables -A test2 -p 6 -d 113.109.187.135 --dport 25958 -j ACCEPT
iptables -A OUTPUT -p 17 -d 232.106.79.106 --sport 15359 -s 166.82.146.181 --dport 13651 -j ACCEPT
iptables -A test1 -p 17 --sport 39646 -j ACCEPT
iptables -A INPUT -p 17 --dport 25964 -d 226.0.0.0/8 -s 30.74.228.60 -j ACCEPT
iptables -A FORWARD -p 6 --sport 50990 -d 167.0.0.0/8 --dport 64667 -s 108.236.26.174 -j ACCEPT
iptables -A test2 -p 17 --dport 21729 --sport 49954 -s 178.16.139.0/24 -d 186.86.34.244 -j DROP
iptables -A INPUT -p 6 -d 146.167.0.0/16 --sport 53454 -s 9.40.0.0/16 -j DROP
iptables -A OUTPUT -d 229.0.0.0/8 -p 242 -j ACCEPT
iptables -A test2 -p 17 --sport 30309 --dport 9173 -d 235.175.38.115 -s 38.200.253.170 -j ACCEPT
iptables -A test2 -d 72.57.112.0/24 -j DROP
iptables -A test3 -s 144.0.0.0/8 -j DROP
iptables -A test3 -p 6 --sport 64873 -d 115.85.134.7 -j DROP
iptables -A OUTPUT -p 17 --sport 33260 --dport 63475 -s 53.203.0.0/16 -j DROP
iptables -A test3 -p 162 -j ACCEPT
iptables -A INPUT -p 6 -s 156.176.0.0/16 --dport 2062 -j test3
iptables -A INPUT -s 108.218.170.103 -j DROP
iptables -A test3 -p 17 --dport 20964 -j ACCEPT
iptables -A OUTPUT -s 163.151.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 5045 -s 82.13.108.154 --dport 48200 -j DROP
iptables -A FORWARD -p 17 --dport 22488 -j DROP
iptables -A FORWARD -p 17 --sport 16566 -d 8.68.6.9 --dport 41547 -j ACCEPT
iptables -A INPUT -p 17 -s 153.23.91.12 --dport 26073 -j DROP
iptables -A INPUT -p 6 -d 192.116.0.0/16 --sport 20371 -j ACCEPT
iptables -A INPUT -p 6 --dport 26253 --sport 62249 -j ACCEPT
iptables -A OUTPUT -p 17 -s 115.28.102.0/24 --dport 8340 -d 172.121.0.0/16 --sport 12327 -j DROP
iptables -A test3 -p 123 -s 54.29.197.62 -j ACCEPT
iptables -A INPUT -p 17 --sport 23053 -s 8.45.157.198 --dport 9374 -j ACCEPT
iptables -A INPUT -p 243 -d 89.90.138.36 -j DROP
iptables -A test2 -p 17 -d 171.20.212.142 --dport 35027 -s 208.185.147.229 -j ACCEPT
iptables -A OUTPUT -s 30.102.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --dport 55545 -j DROP
iptables -A FORWARD -p 17 --sport 27586 -s 118.180.0.0/16 -j ACCEPT
iptables -A test3 -d 254.39.71.48 -j ACCEPT
iptables -A test1 -p 6 --sport 28324 -d 187.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 12091 -s 230.178.69.0/24 --sport 12559 -j DROP
iptables -A test3 -p 17 --sport 14406 --dport 27794 -j ACCEPT
iptables -A INPUT -p 6 -d 176.105.8.64 --dport 26310 --sport 17396 -j DROP
iptables -A test2 -p 17 --dport 25860 -d 193.95.188.30 -s 26.174.0.0/16 -j DROP
iptables -A test1 -s 132.0.0.0/8 -d 9.0.0.0/8 -p 223 -j ACCEPT
iptables -A test2 -p 17 --sport 29648 -d 219.159.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --sport 25517 -j DROP
iptables -A test2 -p 6 --sport 54450 -j ACCEPT
iptables -A test3 -p 95 -s 107.239.254.98 -d 208.239.13.233 -j ACCEPT
iptables -A INPUT -p 6 --dport 15682 -j ACCEPT
iptables -A test1 -p 6 --sport 14944 --dport 16142 -d 138.0.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 8712 -s 64.5.33.0/24 -j DROP
iptables -A FORWARD -p 6 --dport 64178 -j ACCEPT
iptables -A test2 -p 6 -d 204.202.0.0/16 -s 182.209.145.166 --dport 47079 --sport 3094 -j ACCEPT
iptables -A test3 -p 172 -j DROP
iptables -A test2 -p 17 --dport 45120 -j DROP
iptables -A test3 -d 20.199.86.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 -s 66.81.208.89 --sport 32920 -j ACCEPT
iptables -A FORWARD -p 6 --sport 47159 -d 160.205.0.0/16 --dport 28103 -j DROP
iptables -A test3 -p 6 --dport 1665 -s 52.245.0.0/16 --sport 9716 -j DROP
iptables -A OUTPUT -p 6 --dport 22813 -s 98.44.57.245 -d 134.81.53.114 -j ACCEPT
iptables -A INPUT -p 17 -d 154.126.43.151 --dport 23840 -j DROP
iptables -A OUTPUT -s 153.153.8.179 -j ACCEPT
iptables -A test1 -p 17 --dport 5060 --sport 35214 -d 207.108.209.49 -j ACCEPT
iptables -A INPUT -p 17 --sport 27916 -s 198.107.139.17 -j DROP
iptables -A test1 -p 17 --dport 55772 --sport 27102 -d 242.177.171.238 -s 114.155.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -d 142.0.0.0/8 --sport 30601 -j DROP
iptables -A FORWARD -p 17 --sport 47506 -j DROP
iptables -A test2 -d 127.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --dport 2014 -j DROP
iptables -A INPUT -p 244 -j DROP
iptables -A INPUT -p 17 --sport 4648 -d 95.222.210.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 38841 -j ACCEPT
iptables -A OUTPUT -p 6 -s 58.82.183.153 --dport 9418 -j ACCEPT
iptables -A test3 -p 6 --dport 58890 -d 239.123.212.45 -s 141.0.0.0/8 -j DROP
iptables -A test2 -p 6 --dport 51691 -s 160.219.209.0/24 -j ACCEPT
iptables -A test1 -d 58.141.190.0/24 -s 164.0.0.0/8 -p 0 -j DROP
iptables -A FORWARD -p 17 -s 217.161.252.39 --dport 14072 -j DROP
iptables -A test3 -p 6 --sport 56904 --dport 51696 -j ACCEPT
iptables -A test2 -p 6 --sport 27037 -s 179.248.9.182 -j DROP
iptables -A test3 -p 6 -d 162.218.0.0/16 --sport 24158 --dport 18748 -j ACCEPT
iptables -A test1 -p 17 -d 88.38.127.35 -s 128.116.0.0/16 --dport 53248 -j DROP
iptables -A FORWARD -p 6 -s 51.0.0.0/8 --dport 21735 --sport 60039 -j ACCEPT
iptables -A FORWARD -p 6 --sport 23120 -j DROP
iptables -A FORWARD -p 6 --dport 54157 -s 44.94.90.105 -j DROP
iptables -A test2 -p 6 --sport 5965 -j ACCEPT
iptables -A test1 -p 17 --dport 7698 -s 159.57.249.0/24 -j DROP
iptables -A FORWARD -p 17 --dport 13016 -j DROP
iptables -A test3 -p 30 -j ACCEPT
iptables -A test3 -p 17 --dport 2954 -d 238.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --sport 5256 -d 46.21.0.0/16 --dport 19291 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 50443 --dport 62325 -d 144.47.0.0/16 -j test3
iptables -A test2 -p 17 --sport 6754 -j DROP
iptables -A FORWARD -p 17 --dport 50973 --sport 33054 -d 14.0.0.0/8 -j DROP
iptables -A test1 -p 17 --sport 63628 --dport 39557 -j DROP
iptables -A INPUT -p 17 --dport 49427 -d 59.170.74.16 -j DROP
iptables -A test3 -p 6 --dport 15529 -d 234.216.243.246 --sport 47389 -j DROP
iptables -A OUTPUT -p 11 -j ACCEPT
iptables -A test3 -p 6 -s 125.69.8.155 --dport 10222 -j DROP
iptables -A OUTPUT -p 17 -s 17.83.0.0/16 --dport 23391 --sport 4708 -j DROP
iptables -A test3 -p 6 -s 3.0.0.0/8 --dport 40867 -d 80.119.5.193 -j DROP
iptables -A test3 -p 6 --sport 46982 -j DROP
iptables -A test2 -s 140.119.75.86 -j DROP
iptables -A OUTPUT -p 6 --dport 59335 -j DROP
iptables -A test3 -p 6 --sport 25933 -j ACCEPT
iptables -A INPUT -s 162.158.186.133 -j ACCEPT
iptables -A test3 -p 145 -j DROP
iptables -A FORWARD -p 17 --dport 6410 --sport 13361 -d 49.242.50.86 -s 23.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 -d 132.195.115.0/24 --sport 24512 --dport 9613 -j DROP
iptables -A FORWARD -p 17 --dport 30049 -s 174.101.221.143 -j DROP
iptables -A test2 -p 6 --dport 2684 -d 152.7.248.224 -s 83.229.233.50 -j ACCEPT
iptables -A OUTPUT -p 17 -s 73.0.0.0/8 --sport 12029 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 13430 -s 140.230.171.178 -j ACCEPT
iptables -A INPUT -p 6 --dport 65397 -j DROP
iptables -A INPUT -p 6 --dport 36165 -s 19.88.83.163 -d 52.62.81.174 -j DROP
iptables -A FORWARD -p 6 --dport 3480 -j ACCEPT
iptables -A INPUT -d 126.76.112.35 -s 88.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --dport 7654 -j DROP
iptables -A test1 -p 6 --sport 28201 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 3991 --dport 6472 -j test1
iptables -A test2 -p 17 -s 217.0.0.0/8 --dport 20094 -j DROP
iptables -A FORWARD -p 30 -j DROP
iptables -A FORWARD -p 17 --sport 15880 -j DROP
iptables -A OUTPUT -p 6 -s 9.222.189.154 --sport 33277 -j ACCEPT
iptables -A test2 -p 128 -d 198.193.170.223 -j DROP
iptables -A FORWARD -p 17 --dport 23625 -s 188.211.196.6 -d 31.0.0.0/8 -j test2
iptables -A test3 -p 17 -s 220.0.0.0/8 --sport 18180 --dport 40980 -j DROP
iptables -A test1 -p 17 -s 87.8.222.90 --sport 51939 -j ACCEPT
iptables -A test3 -p 17 --dport 31063 --sport 56340 -j DROP
iptables -A test3 -p 17 --dport 18981 --sport 26448 -d 58.132.146.98 -j ACCEPT
iptables -A test1 -p 6 --dport 5883 -d 199.151.0.0/16 -j DROP
iptables -A test1 -s 83.200.0.0/16 -j ACCEPT
iptables -A FORWARD -d 204.210.211.127 -s 142.237.143.238 -j ACCEPT
iptables -A test1 -d 119.253.216.242 -s 197.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 63489 -s 216.86.4.77 --sport 10228 -j ACCEPT
iptables -A test1 -p 6 --sport 53357 --dport 50050 -d 162.0.0.0/8 -j DROP
iptables -A INPUT -p 129 -d 0.152.191.0/24 -j DROP
iptables -A test3 -p 6 -d 168.0.0.0/8 --sport 57453 -j DROP
iptables -A test2 -p 6 --dport 39638 -d 34.221.198.186 -s 133.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -d 9.210.0.0/16 --dport 62883 -j ACCEPT
iptables -A test2 -p 6 --sport 37533 -j DROP
iptables -A INPUT -s 37.155.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --sport 50481 -s 56.115.104.39 -j DROP
iptables -A OUTPUT -p 6 --dport 63885 -s 215.51.0.0/16 --sport 60711 -j test1
iptables -A INPUT -p 6 --sport 54704 -j ACCEPT
iptables -A test3 -p 6 --dport 12141 --sport 25890 -j DROP
iptables -A test1 -p 17 -d 146.100.180.160 --dport 18502 --sport 35136 -s 103.211.42.147 -j ACCEPT
iptables -A FORWARD -p 17 -s 48.19.135.133 --sport 11299 --dport 55460 -j ACCEPT
iptables -A test1 -p 6 -d 107.107.81.25 -s 68.0.0.0/8 --sport 3527 -j ACCEPT
iptables -A test1 -p 6 --dport 8118 -j DROP
iptables -A INPUT -p 6 --sport 41273 -s 173.191.0.0/16 -d 174.156.50.137 --dport 21539 -j ACCEPT
iptables -A test2 -p 17 -d 153.223.3.177 --sport 22417 -s 250.155.25.104 --dport 25106 -j DROP
iptables -A FORWARD -d 19.212.247.138 -j ACCEPT
iptables -A INPUT -p 17 -s 202.0.0.0/8 --sport 27269 -j ACCEPT
iptables -A test1 -p 17 -s 26.111.20.128 --dport 38708 -d 185.69.21.166 -j DROP
iptables -A INPUT -p 6 --sport 36438 -s 6.219.94.57 -j ACCEPT
iptables -A OUTPUT -p 17 -s 128.13.159.0/24 --sport 48824 -j DROP
iptables -A INPUT -p 17 --dport 31532 -s 145.241.216.139 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 6017 -d 225.215.46.74 -j ACCEPT
iptables -A test2 -p 6 -d 205.0.0.0/8 --dport 44685 --sport 24344 -s 34.153.107.154 -j DROP
iptables -A test1 -p 6 --sport 23152 --dport 29578 -j DROP
iptables -A test3 -p 6 -d 181.153.42.226 -s 42.185.20.97 --dport 45515 -j DROP
iptables -A test3 -p 6 --dport 63558 -j ACCEPT
iptables -A test1 -p 6 --dport 16812 -s 72.0.0.0/8 -d 73.118.109.218 -j DROP
iptables -A FORWARD -p 17 --dport 564 -s 100.171.145.3 -d 139.254.112.158 --sport 44724 -j DROP
iptables -A FORWARD -s 140.185.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --sport 25655 -d 214.156.238.112 -j ACCEPT
iptables -A test2 -p 6 -s 24.198.149.49 --dport 5260 --sport 61537 -d 119.204.208.0/24 -j ACCEPT
iptables -A test3 -p 6 --sport 679 -d 187.179.206.91 -s 95.202.239.236 -j ACCEPT
iptables -A test3 -s 207.36.0.0/16 -d 2.190.0.0/16 -j ACCEPT
iptables -A INPUT -s 61.53.25.137 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 28298 -d 29.130.0.0/16 -s 23.28.36.0/24 -j ACCEPT
iptables -A test2 -p 6 -s 224.195.68.0/24 -d 28.138.30.52 --dport 56432 -j ACCEPT
iptables -A test1 -p 29 -s 43.42.64.62 -j DROP
iptables -A OUTPUT -p 135 -s 4.89.29.175 -d 216.212.175.138 -j DROP
iptables -A OUTPUT -p 6 --sport 64167 -d 200.24.160.1 -j DROP
iptables -A FORWARD -p 17 -d 96.17.200.128 --dport 19 -s 28.144.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --dport 1161 --sport 19788 -j DROP
iptables -A INPUT -p 6 -s 108.0.0.0/8 --dport 45159 -d 156.251.54.0/24 -j DROP
iptables -A INPUT -p 17 --sport 55063 --dport 28820 -s 21.167.15.191 -j ACCEPT
iptables -A FORWARD -s 44.193.21.250 -j ACCEPT
iptables -A FORWARD -p 17 --dport 26991 -s 214.20.246.122 -d 121.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 -d 81.107.161.143 --dport 51546 --sport 2247 -j ACCEPT
iptables -A test2 -p 25 -d 188.40.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 -d 175.218.61.241 --sport 35531 -j ACCEPT
iptables -A OUTPUT -p 6 -s 240.192.143.0/24 --sport 39900 -j ACCEPT
iptables -A INPUT -p 6 --dport 59459 -j ACCEPT
iptables -A test2 -p 6 -d 161.252.0.0/16 --sport 62703 -s 222.67.78.100 --dport 6157 -j ACCEPT
iptables -A test1 -s 2.0.0.0/8 -d 212.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --sport 46960 --dport 9525 -j DROP
iptables -A test1 -s 156.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -s 125.69.138.94 -d 15.75.110.246 --dport 57907 --sport 23024 -j ACCEPT
iptables -A INPUT -d 235.0.0.0/8 -s 247.234.249.243 -p 43 -j test3
iptables -A test2 -p 59 -d 158.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 5769 -j ACCEPT
iptables -A test1 -p 6 --sport 30185 --dport 40897 -s 237.99.80.94 -j ACCEPT
iptables -A test1 -p 6 --sport 2701 -j ACCEPT
iptables -A test3 -p 17 --dport 47651 -s 104.18.91.0/24 -d 142.31.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --sport 12332 -j ACCEPT
iptables -A test2 -p 132 -j DROP
iptables -A FORWARD -p 6 --dport 52313 -d 57.156.0.0/16 -s 72.0.0.0/8 -j ACCEPT
iptables -A INPUT -s 255.245.0.0/16 -j DROP
iptables -A INPUT -p 6 -d 115.89.6.75 --sport 21875 -j ACCEPT
iptables -A test2 -p 6 -s 62.115.158.219 --dport 63291 --sport 56056 -j DROP
iptables -A INPUT -d 150.208.220.0/24 -j DROP
iptables -A test3 -p 6 -s 205.61.0.0/16 --dport 57232 -d 185.89.61.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 -d 112.3.0.0/16 -s 21.124.0.0/16 --sport 61624 --dport 52943 -j DROP
iptables -A test1 -p 6 -d 10.242.111.238 --sport 8145 --dport 5729 -s 51.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 59341 --sport 49054 -s 224.213.157.151 -j ACCEPT
iptables -A test2 -s 14.151.244.178 -j ACCEPT
iptables -A test3 -s 133.19.47.35 -j DROP
iptables -A test3 -p 17 --dport 42655 -j ACCEPT
iptables -A test1 -p 6 -s 247.52.78.146 --dport 6274 -j ACCEPT
iptables -A FORWARD -p 6 -s 74.128.240.138 -d 241.0.0.0/8 --dport 15245 -j DROP
iptables -A FORWARD -p 17 --dport 58329 -d 31.190.219.39 -s 14.126.183.0/24 -j ACCEPT
iptables -A OUTPUT -p 226 -j DROP
iptables -A test1 -p 17 --dport 23727 -d 88.155.114.160 -s 153.138.229.15 -j ACCEPT
iptables -A test1 -p 17 --dport 15039 -j DROP
iptables -A OUTPUT -p 6 -s 27.204.78.195 --sport 2114 -d 22.146.195.243 -j DROP
iptables -A test1 -p 17 --dport 64527 -d 175.54.0.0/16 -j DROP
iptables -A INPUT -p 6 --dport 3539 -d 160.107.192.65 -j DROP
iptables -A test3 -p 6 --sport 32208 -d 20.80.0.0/16 --dport 13924 -j DROP
iptables -A test1 -d 76.24.0.0/16 -j DROP
iptables -A test1 -p 6 --sport 29012 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 63963 -d 31.91.169.56 -j DROP
iptables -A test1 -p 6 --sport 49906 -j ACCEPT
iptables -A test3 -p 17 -d 45.134.90.192 --sport 41848 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 61077 -j DROP
iptables -A INPUT -p 6 -d 204.130.161.227 --dport 60 -s 19.11.184.117 --sport 25969 -j DROP
iptables -A test2 -p 17 --sport 36497 -j DROP
iptables -A test1 -d 135.111.106.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 62749 -j ACCEPT
iptables -A test2 -p 102 -j ACCEPT
iptables -A INPUT -p 5 -j ACCEPT
iptables -A INPUT -p 17 --sport 382 --dport 50497 -s 191.244.166.15 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 41063 --sport 45629 -j ACCEPT
iptables -A INPUT -p 17 --sport 4350 -j DROP
iptables -A OUTPUT -p 17 -s 80.29.0.0/16 --sport 51265 -j DROP
iptables -A test2 -p 6 --sport 3025 -j ACCEPT
iptables -A test2 -p 70 -s 238.121.127.114 -j ACCEPT
iptables -A test2 -d 255.141.0.0/16 -j DROP
iptables -A test1 -p 17 --dport 9994 -j DROP
iptables -A FORWARD -p 6 -s 68.200.219.204 -d 168.236.0.0/16 --sport 45378 --dport 60838 -j ACCEPT
iptables -A test2 -d 153.159.62.27 -p 48 -j ACCEPT
iptables -A test1 -p 17 --dport 53433 -s 164.250.113.236 -j DROP
iptables -A test2 -p 17 -s 106.139.55.15 -d 189.242.0.0/16 --sport 18680 --dport 31735 -j ACCEPT
iptables -A OUTPUT -p 17 -d 16.206.24.117 --dport 33937 -s 238.165.200.103 --sport 25114 -j ACCEPT
iptables -A INPUT -p 17 -s 154.239.201.20 --sport 24774 -j ACCEPT
iptables -A test3 -p 190 -j DROP
iptables -A test3 -p 17 --dport 23002 -j DROP
iptables -A test3 -p 17 --sport 39700 -j DROP
iptables -A OUTPUT -p 6 --dport 19066 --sport 47414 -j ACCEPT
iptables -A FORWARD -p 17 --sport 58366 -j DROP
iptables -A FORWARD -p 6 -s 15.182.0.0/16 --sport 57982 -j DROP
iptables -A FORWARD -p 17 --dport 11076 -j DROP
iptables -A test3 -p 17 --sport 3139 -d 34.83.204.0/24 -j ACCEPT
iptables -A OUTPUT -s 248.0.0.0/8 -p 28 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 63798 -j ACCEPT
iptables -A test1 -p 17 -d 133.38.243.0/24 -s 36.107.0.0/16 --dport 15784 -j DROP
iptables -A test3 -p 6 --sport 49985 -s 67.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 4004 --dport 38410 -d 164.254.16.11 -j DROP
iptables -A FORWARD -p 17 --sport 7591 -s 119.113.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --dport 14940 -s 122.196.90.231 --sport 31641 -j DROP
iptables -A test1 -p 17 --dport 58195 -j ACCEPT
iptables -A test3 -p 17 --sport 46465 -s 151.8.160.138 -d 94.20.113.63 -j DROP
iptables -A INPUT -p 6 --dport 27388 --sport 32544 -d 189.83.154.48 -s 184.13.28.0/24 -j ACCEPT
iptables -A test3 -p 40 -j DROP
iptables -A test1 -p 6 -s 113.0.0.0/8 --sport 62803 -d 135.54.134.8 -j DROP
iptables -A test2 -p 6 --dport 32273 -d 158.0.0.0/8 -j DROP
iptables -A OUTPUT -d 167.140.27.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --sport 63280 -s 188.152.86.0/24 -j test2
iptables -A FORWARD -p 18 -j ACCEPT
iptables -A FORWARD -p 17 --dport 65152 --sport 42780 -s 159.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --dport 25192 -j ACCEPT
iptables -A test3 -p 6 -s 145.206.193.33 --dport 60531 -d 12.143.172.139 --sport 65409 -j DROP
iptables -A test2 -p 6 --sport 13340 -s 176.195.109.75 -j ACCEPT
iptables -A FORWARD -p 6 --sport 38292 -s 189.149.239.167 --dport 33235 -j ACCEPT
iptables -A test2 -p 17 -d 190.40.37.6 -s 168.0.0.0/8 --sport 52399 -j ACCEPT
iptables -A FORWARD -p 6 --sport 31826 --dport 59451 -d 99.189.191.180 -j test3
iptables -A test2 -p 6 --sport 51208 -s 165.0.0.0/8 -d 43.62.29.232 -j ACCEPT
iptables -A test2 -p 17 --dport 58302 -j ACCEPT
iptables -A test3 -d 15.135.29.130 -p 82 -j DROP
iptables -A test1 -p 17 --sport 61982 -d 95.177.182.154 -j ACCEPT
iptables -A test1 -p 6 --sport 19112 -j ACCEPT
iptables -A FORWARD -p 6 --dport 47279 -s 218.85.0.0/16 -j DROP
iptables -A test2 -d 143.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 --sport 53127 -j DROP
iptables -A test2 -p 6 --dport 64276 -s 242.251.155.130 -j ACCEPT
iptables -A FORWARD -p 6 -d 31.200.54.180 --sport 60441 --dport 63541 -j DROP
iptables -A INPUT -p 17 -s 172.0.0.0/8 --dport 1016 -d 205.75.133.23 -j DROP
iptables -A test2 -p 17 -d 192.77.0.0/16 --dport 55142 -j DROP
iptables -A FORWARD -p 17 --dport 44848 --sport 37533 -d 206.16.44.124 -j ACCEPT
iptables -A FORWARD -p 6 --dport 62155 -d 62.55.86.233 -j DROP
iptables -A FORWARD -p 17 -d 9.125.102.172 --dport 3890 -s 25.20.176.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 -s 149.151.39.191 --dport 57647 -d 171.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --dport 61978 --sport 42779 -j ACCEPT
iptables -A OUTPUT -p 17 -s 223.209.73.226 --sport 5729 --dport 10274 -d 119.250.134.63 -j DROP
iptables -A INPUT -p 140 -j DROP
iptables -A test1 -p 6 -s 0.122.150.60 --dport 2763 -j DROP
iptables -A OUTPUT -p 117 -j DROP
iptables -A OUTPUT -d 152.51.42.7 -j ACCEPT
iptables -A test3 -p 17 --dport 8417 -s 132.71.184.0/24 --sport 13411 -d 176.192.53.13 -j DROP
iptables -A OUTPUT -p 6 --sport 15593 -d 71.35.110.220 -s 67.0.0.0/8 -j DROP
iptables -A OUTPUT -s 186.250.175.156 -p 195 -d 241.174.163.246 -j DROP
iptables -A test2 -p 6 -s 88.243.164.99 --dport 22809 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 59612 -j ACCEPT
iptables -A test1 -p 186 -j DROP
iptables -A test1 -p 6 -s 237.0.0.0/8 --sport 45976 --dport 62698 -j DROP
iptables -A OUTPUT -p 17 -s 40.103.105.0/24 --dport 37915 -j ACCEPT
iptables -A test2 -p 6 --sport 56496 -j DROP
iptables -A test2 -p 17 --sport 30927 -j DROP
iptables -A test2 -p 17 --dport 8853 -d 151.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --dport 35161 -d 136.217.238.162 -j DROP
iptables -A test1 -p 6 --dport 4294 -j ACCEPT
iptables -A test1 -p 17 --dport 178 -s 31.97.0.0/16 --sport 7870 -j ACCEPT
iptables -A test2 -p 17 --sport 47330 --dport 6221 -s 53.46.23.0/24 -j DROP
iptables -A test1 -p 17 --sport 20552 --dport 59308 -s 40.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 --sport 17675 --dport 10793 -d 160.132.208.0/24 -j DROP
iptables -A test1 -p 17 -s 122.195.203.0/24 -d 128.212.113.143 --sport 52133 --dport 31229 -j DROP
iptables -A test1 -s 254.102.0.0/16 -p 223 -j DROP
iptables -A test3 -p 17 --dport 40238 -s 245.46.126.223 -j ACCEPT
iptables -A FORWARD -p 17 --dport 3828 -j ACCEPT
iptables -A OUTPUT -p 6 -d 27.66.243.142 --sport 27161 -j ACCEPT
iptables -A test1 -p 6 --dport 23097 --sport 18116 -d 89.238.0.0/16 -s 37.151.239.64 -j ACCEPT
iptables -A test1 -p 6 -s 65.244.102.119 --dport 6364 -d 117.206.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 8853 -j DROP
iptables -A test3 -p 17 --sport 34146 -j DROP
iptables -A test1 -p 6 --dport 62937 -s 14.75.0.0/16 --sport 49995 -j DROP
iptables -A INPUT -p 6 --sport 16034 --dport 23238 -s 101.10.0.0/16 -j DROP
iptables -A OUTPUT -s 232.177.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 26698 -d 174.145.103.0/24 --sport 47818 -j test3
iptables -A test2 -p 6 --sport 16990 -j ACCEPT
iptables -A test1 -s 199.217.66.0/24 -j ACCEPT
iptables -A test1 -s 88.30.0.0/16 -p 138 -j DROP
iptables -A test2 -p 17 --dport 8664 --sport 9938 -j DROP
iptables -A test2 -p 128 -j ACCEPT
iptables -A test1 -p 6 -d 71.12.209.12 --sport 59407 -j ACCEPT
iptables -A INPUT -p 6 --sport 6075 -s 156.120.0.0/16 -d 8.54.0.0/16 -j DROP
iptables -A test2 -p 17 -s 106.73.0.0/16 --sport 62396 -j ACCEPT
iptables -A test2 -p 17 --dport 50615 -j DROP
iptables -A OUTPUT -d 26.56.252.0/24 -j ACCEPT
iptables -A INPUT -p 17 --sport 37385 -d 118.134.11.205 --dport 56778 -j DROP
iptables -A test2 -p 17 -d 215.232.0.0/16 -s 16.17.244.220 --sport 23938 -j DROP
iptables -A test2 -p 6 --sport 12987 --dport 22351 -j DROP
iptables -A test3 -p 17 --dport 45202 -d 127.0.0.0/8 --sport 40945 -s 69.125.90.148 -j DROP
iptables -A INPUT -p 17 --sport 57540 -d 34.146.88.151 --dport 53413 -s 193.232.207.0/24 -j DROP
iptables -A INPUT -d 118.182.0.0/16 -j DROP
iptables -A test2 -p 6 -s 145.53.0.0/16 --sport 11379 -j DROP
iptables -A test2 -d 188.138.81.0/24 -p 28 -j DROP
iptables -A OUTPUT -p 6 --dport 3434 -s 91.109.84.16 -j DROP
iptables -A INPUT -p 6 --sport 17142 -j ACCEPT
iptables -A FORWARD -p 6 --sport 27116 -d 0.213.203.90 --dport 58683 -j ACCEPT
iptables -A INPUT -p 6 -s 146.200.150.222 --sport 38019 --dport 50311 -j DROP
iptables -A FORWARD -d 168.200.7.144 -j DROP
iptables -A test3 -p 159 -j ACCEPT
iptables -A INPUT -p 6 --dport 35095 -d 149.3.0.214 -j DROP
iptables -A test2 -p 87 -j DROP
iptables -A FORWARD -p 6 -d 243.0.0.0/8 -s 96.28.0.0/16 --dport 65527 -j ACCEPT
iptables -A FORWARD -p 6 --sport 59311 -d 157.150.235.199 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 61772 --sport 11915 -j test2
iptables -A OUTPUT -s 198.53.210.173 -d 252.188.11.81 -j test3
iptables -A test3 -p 6 --sport 18925 -d 180.250.0.0/16 -s 110.117.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 60599 -d 72.185.154.172 -s 114.240.9.61 -j ACCEPT
iptables -A FORWARD -p 6 --sport 48806 --dport 31254 -d 231.19.191.222 -j ACCEPT
iptables -A test3 -p 6 -s 16.199.91.0/24 -d 13.101.126.177 --sport 35446 -j DROP
iptables -A OUTPUT -p 17 -s 91.151.38.111 --dport 59566 -d 73.187.224.0/24 -j DROP
iptables -A test2 -d 228.36.0.0/16 -p 255 -s 200.127.62.0/24 -j DROP
iptables -A OUTPUT -p 17 --dport 38848 --sport 53214 -j DROP
iptables -A test1 -s 63.193.238.54 -j DROP
iptables -A test2 -p 17 --dport 64181 -d 185.19.102.98 -j ACCEPT
iptables -A test1 -p 17 --sport 51240 -s 252.45.202.0/24 -d 68.176.0.0/16 -j ACCEPT
iptables -A test3 -p 17 -s 24.65.0.0/16 --sport 45804 -j DROP
iptables -A OUTPUT -p 17 --sport 23025 --dport 11001 -j ACCEPT
iptables -A test2 -p 17 -s 221.72.19.154 --sport 3260 -j ACCEPT
iptables -A OUTPUT -s 40.38.168.71 -j DROP
iptables -A test2 -p 207 -d 161.85.119.57 -j DROP
iptables -A test3 -p 6 -s 103.85.112.146 -d 115.46.220.2 --sport 23478 -j ACCEPT
iptables -A test3 -p 17 --dport 37242 -s 182.0.0.0/8 -d 40.116.94.109 -j ACCEPT
iptables -A test3 -p 156 -j DROP
iptables -A test2 -d 11.43.151.147 -j DROP
iptables -A FORWARD -p 17 --sport 32069 --dport 21190 -j ACCEPT
iptables -A test1 -p 17 --sport 1503 -j ACCEPT
iptables -A test3 -p 17 -s 156.228.38.194 --dport 11980 -d 61.75.245.154 -j ACCEPT
iptables -A test2 -s 68.242.11.0/24 -j DROP
iptables -A test1 -p 17 -d 172.138.46.0/24 -s 101.25.82.152 --sport 43504 --dport 17689 -j DROP
iptables -A OUTPUT -d 9.232.156.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 49708 -s 135.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 55984 -d 49.45.95.0/24 -j ACCEPT
iptables -A test2 -p 6 --dport 24948 --sport 39073 -j DROP
iptables -A OUTPUT -p 6 -d 129.126.0.0/16 --dport 58347 -s 16.250.214.0/24 -j DROP
iptables -A test2 -p 6 -s 102.0.0.0/8 --dport 42519 -j ACCEPT
iptables -A OUTPUT -p 17 -s 190.45.203.0/24 --sport 2169 -j test3
iptables -A test3 -p 6 --dport 59444 -d 228.86.44.0/24 -j ACCEPT
iptables -A test2 -p 6 -d 112.88.137.0/24 --dport 186 --sport 44526 -j DROP
iptables -A OUTPUT -p 17 --sport 43180 -d 63.108.5.83 -j ACCEPT
iptables -A OUTPUT -d 113.87.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -s 168.81.149.108 --dport 21954 -j ACCEPT
iptables -A FORWARD -p 6 --dport 42792 --sport 61229 -d 1.0.0.0/8 -j DROP
iptables -A test1 -p 6 --dport 60179 -s 13.158.22.0/24 -d 10.34.24.226 -j ACCEPT
iptables -A FORWARD -p 47 -d 175.247.15.224 -j ACCEPT
iptables -A test1 -p 17 -d 207.20.0.0/16 -s 149.63.189.143 --dport 60653 -j ACCEPT
iptables -A INPUT -p 17 --sport 56111 -j DROP
iptables -A test2 -p 6 --dport 44142 --sport 5770 -d 104.85.136.146 -j ACCEPT
iptables -A FORWARD -p 6 --sport 50581 -j ACCEPT
iptables -A FORWARD -p 6 -s 175.249.46.46 --sport 51309 --dport 63466 -j test1
iptables -A test1 -s 147.28.0.0/16 -p 234 -d 168.108.175.158 -j DROP
iptables -A INPUT -p 17 --sport 8947 -j DROP
iptables -A INPUT -p 17 --dport 29909 -s 177.124.165.241 -j DROP
iptables -A test1 -p 17 -s 230.118.8.173 -d 25.15.0.0/16 --dport 57102 -j ACCEPT
iptables -A OUTPUT -s 9.160.118.138 -j ACCEPT
iptables -A test1 -p 17 --dport 26743 --sport 31936 -s 36.8.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --sport 56430 -j ACCEPT
iptables -A test3 -p 6 --dport 56757 --sport 61937 -s 226.132.133.116 -j DROP
iptables -A test3 -p 6 -d 89.92.0.0/16 --dport 15159 --sport 30075 -j DROP
iptables -A FORWARD -p 17 --sport 53764 --dport 34560 -j ACCEPT
iptables -A INPUT -p 17 -s 108.224.41.0/24 --sport 38694 -d 55.88.201.81 -j ACCEPT
iptables -A test2 -p 17 --sport 5816 -j ACCEPT
iptables -A test3 -d 42.35.202.151 -p 110 -j DROP
iptables -A INPUT -p 6 --dport 23287 -j ACCEPT
iptables -A INPUT -p 125 -s 247.133.212.20 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 14486 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 45181 -d 146.205.132.125 -j ACCEPT
iptables -A test1 -s 206.38.98.122 -d 217.210.1.235 -j DROP
iptables -A FORWARD -d 245.207.109.0/24 -j test3
iptables -A FORWARD -p 17 -d 0.19.212.0/24 --sport 6578 -j ACCEPT
iptables -A FORWARD -p 6 -s 5.164.208.15 --dport 49975 -d 29.30.95.93 --sport 33381 -j ACCEPT
iptables -A FORWARD -p 17 -d 197.116.0.0/16 --sport 15648 -s 14.223.165.190 --dport 35412 -j ACCEPT
iptables -A INPUT -p 6 -d 225.169.206.111 --sport 39641 --dport 60808 -j DROP
iptables -A test1 -p 17 -d 105.70.241.59 --sport 12247 -s 235.177.0.0/16 -j DROP
iptables -A test2 -s 76.0.0.0/8 -j DROP
iptables -A INPUT -p 17 -s 46.35.0.0/16 -d 186.130.153.0/24 --sport 54713 -j ACCEPT
iptables -A test3 -p 17 --dport 16556 --sport 55807 -j DROP
iptables -A test3 -p 230 -d 207.227.198.0/24 -j ACCEPT
iptables -A test3 -p 17 -s 118.71.138.187 -d 156.174.69.175 --dport 34760 -j DROP
iptables -A INPUT -p 6 --sport 49026 -j DROP
iptables -A test2 -p 6 --dport 30753 -s 211.185.0.0/16 -d 84.247.187.127 -j DROP
iptables -A test3 -p 17 -d 143.241.0.0/16 --sport 46243 -j DROP
iptables -A test2 -p 127 -j DROP
iptables -A FORWARD -p 177 -j DROP
iptables -A OUTPUT -p 17 -d 203.39.155.0/24 --dport 44129 -j ACCEPT
iptables -A FORWARD -p 17 --dport 17868 --sport 47807 -j ACCEPT
iptables -A INPUT -p 6 --dport 40558 --sport 19143 -d 251.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 26 -d 212.231.217.153 -s 241.101.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -d 201.146.0.3 --dport 16096 --sport 28110 -j ACCEPT
iptables -A test1 -p 17 --sport 64386 -d 239.226.164.227 -s 181.155.17.121 -j ACCEPT
iptables -A INPUT -s 110.104.192.144 -p 38 -j ACCEPT
iptables -A test3 -d 67.248.245.237 -s 49.17.0.0/16 -p 244 -j ACCEPT
iptables -A INPUT -p 6 --dport 48622 -s 248.122.171.54 --sport 35381 -j DROP
iptables -A FORWARD -p 6 -s 133.227.0.0/16 --sport 61956 -j DROP
iptables -A test2 -s 111.5.77.204 -p 13 -d 136.97.77.0/24 -j ACCEPT
iptables -A test3 -p 6 -s 198.156.0.0/16 --sport 7944 -d 100.115.143.39 -j DROP
iptables -A OUTPUT -p 17 -d 66.96.167.185 --dport 64759 -j DROP
iptables -A test3 -p 6 --dport 10518 -j ACCEPT
iptables -A OUTPUT -p 17 -s 127.3.45.163 --dport 15013 -d 75.209.250.209 -j DROP
iptables -A OUTPUT -p 17 --dport 39732 -s 37.56.138.0/24 --sport 15646 -j DROP
iptables -A test2 -d 169.8.135.184 -j DROP
iptables -A INPUT -p 17 -d 155.101.0.0/16 --sport 28206 --dport 2741 -j ACCEPT
iptables -A FORWARD -p 6 --sport 49218 -j ACCEPT
iptables -A test1 -p 6 --dport 60327 --sport 33300 -d 225.11.191.71 -j ACCEPT
iptables -A test2 -d 28.98.96.132 -s 26.25.28.0/24 -j DROP
iptables -A test3 -p 17 --dport 12919 -s 219.217.159.0/24 -d 101.55.62.142 -j DROP
iptables -A FORWARD -p 6 --dport 35766 -d 223.0.0.0/8 --sport 23309 -j DROP
iptables -A INPUT -p 17 --dport 9638 -s 166.122.0.0/16 -j ACCEPT
iptables -A test1 -d 141.94.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 55764 -d 199.89.25.115 -s 209.180.135.164 -j ACCEPT
iptables -A test3 -p 179 -j ACCEPT
iptables -A FORWARD -p 17 --sport 14937 -j DROP
iptables -A test1 -p 17 --sport 4851 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 55983 -s 109.153.234.253 --dport 22548 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 29145 -s 226.0.0.0/8 --sport 51015 -j ACCEPT
iptables -A test2 -s 16.138.192.0/24 -p 70 -j DROP
iptables -A OUTPUT -p 6 --sport 33141 -j ACCEPT
iptables -A test1 -p 17 --sport 6901 --dport 25412 -j DROP
iptables -A test1 -p 23 -j DROP
iptables -A FORWARD -p 6 --sport 51410 -j DROP
iptables -A OUTPUT -s 181.93.79.84 -p 83 -d 17.241.141.104 -j ACCEPT
iptables -A test1 -p 17 -s 39.248.140.165 --dport 54130 --sport 22443 -d 111.0.0.0/8 -j DROP
iptables -A test1 -s 137.131.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --sport 36891 --dport 54341 -j DROP
iptables -A INPUT -p 6 --dport 39120 --sport 13396 -d 67.109.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 -d 88.0.0.0/8 --sport 22443 -j DROP
iptables -A test3 -p 6 --sport 928 --dport 37350 -d 182.61.83.165 -j ACCEPT
iptables -A test1 -d 180.0.0.0/8 -p 84 -s 97.69.120.140 -j ACCEPT
iptables -A test1 -p 17 --dport 41853 -d 20.91.51.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 7862 -j ACCEPT
iptables -A test2 -p 17 -d 158.0.0.0/8 -s 140.229.28.39 --dport 4438 -j ACCEPT
iptables -A test1 -d 234.108.216.157 -j DROP
iptables -A test3 -p 17 -d 90.12.2.80 --dport 35500 -j ACCEPT
iptables -A FORWARD -p 6 --dport 1588 -s 6.0.0.0/8 -d 15.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 -s 114.222.116.84 -d 217.0.0.0/8 --dport 28552 -j DROP
iptables -A INPUT -p 6 -d 229.51.43.94 -s 187.40.36.200 --dport 36301 -j DROP
iptables -A test3 -p 6 --dport 15021 -j DROP
iptables -A test3 -p 17 -s 7.129.183.0/24 -d 179.101.73.29 --dport 172 --sport 56328 -j DROP
iptables -A test3 -p 17 --dport 26316 --sport 31704 -d 107.0.0.0/8 -j DROP
iptables -A test1 -p 6 -d 157.55.148.112 --sport 40770 -s 250.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --sport 23341 -s 23.189.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 -s 252.0.0.0/8 -d 169.0.0.0/8 --sport 45167 -j ACCEPT
iptables -A FORWARD -d 142.0.0.0/8 -s 4.219.178.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -d 117.156.34.235 --sport 24067 -j ACCEPT
iptables -A test3 -p 6 --sport 31929 --dport 51216 -j DROP
iptables -A OUTPUT -p 17 --dport 39006 -s 218.21.0.0/16 -j ACCEPT
iptables -A test2 -d 150.209.68.252 -s 163.187.126.78 -j ACCEPT
iptables -A INPUT -s 24.196.176.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 5062 -s 189.121.141.0/24 -j ACCEPT
iptables -A test3 -s 139.72.30.225 -j DROP
iptables -A INPUT -p 17 --dport 46993 -s 225.75.196.162 -j DROP
iptables -A OUTPUT -p 17 -s 129.166.29.10 --sport 28493 -d 27.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 -d 52.101.126.0/24 --dport 61334 -j ACCEPT
iptables -A INPUT -s 246.170.145.81 -j ACCEPT
iptables -A OUTPUT -p 17 -d 41.209.94.135 --dport 2701 --sport 25629 -j DROP
iptables -A INPUT -p 134 -s 3.177.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --dport 6026 -d 45.0.0.0/8 -j DROP
iptables -A test1 -s 134.235.27.0/24 -p 80 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 46834 -s 160.193.136.0/24 --sport 17119 -j DROP
iptables -A INPUT -p 6 --sport 41871 -d 204.105.241.0/24 -s 186.46.136.226 -j ACCEPT
iptables -A OUTPUT -p 6 -d 113.0.0.0/8 -s 215.158.0.0/16 --sport 63996 --dport 18054 -j DROP
iptables -A test1 -p 17 --dport 27309 -j DROP
iptables -A INPUT -p 17 --dport 56334 -s 59.113.186.233 -d 125.160.21.9 -j ACCEPT
iptables -A test2 -p 17 -s 69.67.141.0/24 --dport 4687 --sport 17703 -d 216.116.88.94 -j DROP
iptables -A test2 -p 6 --sport 13248 -s 65.0.0.0/8 -d 236.33.119.220 -j DROP
iptables -A FORWARD -p 6 --dport 61292 -s 142.97.41.0/24 --sport 35588 -j DROP
iptables -A FORWARD -d 133.70.233.127 -j DROP
iptables -A test3 -d 22.132.240.0/24 -s 217.38.16.130 -j DROP
iptables -A OUTPUT -d 149.152.0.0/16 -j DROP
iptables -A test3 -p 17 --sport 1058 -s 102.3.0.0/16 -j DROP
iptables -A test3 -d 87.237.39.27 -j DROP
iptables -A test2 -p 17 --dport 13501 -s 209.106.123.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -s 120.172.0.0/16 --sport 16790 -d 86.205.100.235 -j DROP
iptables -A FORWARD -p 61 -j DROP
iptables -A test3 -p 6 -s 12.11.80.179 --dport 35932 -j DROP
iptables -A INPUT -p 17 -d 118.151.249.177 -s 227.63.0.0/16 --sport 57651 -j DROP
iptables -A OUTPUT -p 17 --sport 49175 -j DROP
iptables -A test2 -p 6 --dport 53905 -d 191.147.109.148 -j ACCEPT
iptables -A test3 -p 6 --sport 10218 -d 225.203.83.95 -j ACCEPT
iptables -A FORWARD -d 184.59.170.142 -j ACCEPT
iptables -A FORWARD -p 17 --sport 16982 --dport 30339 -j DROP
iptables -A FORWARD -p 6 --sport 19570 -j ACCEPT
iptables -A test3 -p 6 --dport 47639 -j ACCEPT
iptables -A FORWARD -s 237.21.119.95 -d 51.162.156.58 -p 140 -j ACCEPT
iptables -A test2 -p 6 --sport 33807 --dport 41349 -j ACCEPT
iptables -A test1 -p 17 --dport 8820 -s 184.0.0.0/8 --sport 18699 -j DROP
iptables -A OUTPUT -p 6 --sport 64610 --dport 45472 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 46423 -j ACCEPT
iptables -A test1 -p 6 --sport 53803 -d 124.0.0.0/8 --dport 16130 -j DROP
iptables -A test2 -p 17 -d 20.0.0.0/8 --sport 34661 --dport 57711 -j DROP
iptables -A FORWARD -p 17 -s 2.133.170.110 --sport 2408 -d 148.196.153.166 --dport 9586 -j test3
iptables -A test3 -p 6 -s 95.103.0.0/16 --sport 38750 --dport 26427 -j DROP
iptables -A FORWARD -p 6 -s 24.241.20.55 -d 221.214.106.0/24 --dport 43725 -j DROP
iptables -A INPUT -p 17 --dport 21182 --sport 57529 -j ACCEPT
iptables -A test3 -p 17 -s 72.0.0.0/8 -d 223.149.0.0/16 --sport 14180 -j DROP
iptables -A OUTPUT -p 17 --sport 63184 -s 181.56.152.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 59746 -d 202.189.31.58 -s 94.92.179.50 -j ACCEPT
iptables -A test2 -p 17 --dport 31017 -d 149.0.1.84 -s 34.8.0.0/16 --sport 3806 -j ACCEPT
iptables -A OUTPUT -s 130.62.108.21 -p 34 -d 171.0.0.0/8 -j DROP
iptables -A FORWARD -p 66 -s 113.0.0.0/8 -d 60.187.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --sport 16374 -j ACCEPT
iptables -A INPUT -p 192 -d 230.209.0.0/16 -s 254.78.190.221 -j DROP
iptables -A INPUT -p 6 -d 12.71.4.66 --sport 47442 -j ACCEPT
iptables -A test1 -p 17 -d 86.39.37.0/24 --sport 48414 --dport 13643 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 4475 -s 153.169.0.0/16 -j DROP
iptables -A test3 -p 17 --sport 9740 -d 203.97.217.67 -j DROP
iptables -A test3 -p 159 -j ACCEPT
iptables -A test3 -p 6 --sport 1423 --dport 58044 -s 26.159.74.117 -j DROP
iptables -A FORWARD -s 41.147.0.0/16 -j DROP
iptables -A INPUT -p 17 --dport 36764 -j ACCEPT
iptables -A test2 -p 6 --sport 34652 -j ACCEPT
iptables -A FORWARD -p 17 -s 27.213.162.77 --sport 45279 -d 168.0.0.0/8 -j DROP
iptables -A test2 -p 6 -d 249.89.62.0/24 -s 173.49.94.56 --sport 18446 --dport 52695 -j DROP
iptables -A test1 -p 6 --sport 5294 -s 156.0.0.0/8 -j DROP
iptables -A test1 -p 6 --dport 63966 -d 109.249.32.44 --sport 61549 -j DROP
iptables -A test3 -p 6 -s 34.159.6.172 --dport 38397 -j ACCEPT
iptables -A FORWARD -p 6 --sport 41477 -d 237.228.239.175 -j DROP
iptables -A test3 -s 21.107.57.7 -j DROP
iptables -A INPUT -p 6 --dport 47400 --sport 31529 -j DROP
iptables -A test2 -p 6 -s 138.231.201.138 --sport 45193 -j DROP
iptables -A test1 -p 17 -s 63.118.134.41 --dport 14010 -j DROP
iptables -A INPUT -p 35 -d 30.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --dport 742 -d 219.138.0.0/16 -j DROP
iptables -A test2 -d 224.118.0.0/16 -j DROP
iptables -A test3 -p 17 -s 9.0.0.0/8 --dport 12360 -d 14.122.0.0/16 -j ACCEPT
iptables -A test1 -p 6 -d 137.151.139.190 --dport 29129 --sport 40596 -j ACCEPT
iptables -A INPUT -p 6 -s 192.156.140.144 --dport 10615 --sport 10064 -j DROP
iptables -A test3 -p 6 -d 221.168.0.0/16 --dport 47520 -s 160.154.231.192 -j ACCEPT
iptables -A test1 -p 6 --sport 10110 -d 210.46.0.0/16 -s 32.145.0.0/16 --dport 60759 -j DROP
iptables -A FORWARD -p 17 --sport 32478 --dport 20258 -j ACCEPT
iptables -A test1 -p 6 --dport 23731 -j ACCEPT
iptables -A test3 -p 17 --dport 13986 -j DROP
iptables -A test1 -s 244.168.0.0/16 -j DROP
iptables -A OUTPUT -s 172.226.166.0/24 -d 118.185.92.0/24 -j DROP
iptables -A test3 -p 17 -d 59.221.12.205 --sport 26067 --dport 53187 -j ACCEPT
iptables -A OUTPUT -p 6 -s 156.205.159.149 --sport 23387 -j DROP
iptables -A OUTPUT -p 17 -d 194.143.189.0/24 --sport 14963 -s 57.166.5.0/24 -j test3
iptables -A OUTPUT -p 6 --sport 44575 -j ACCEPT
iptables -A test1 -p 6 --dport 27749 -j DROP
iptables -A OUTPUT -p 17 -d 167.36.104.148 --sport 33038 -j DROP
iptables -A test1 -p 6 -d 48.146.72.0/24 -s 13.175.129.237 --dport 4207 -j DROP
iptables -A FORWARD -p 17 -s 161.65.74.100 --sport 28622 --dport 44633 -j ACCEPT
iptables -A INPUT -p 6 -s 140.225.0.0/16 -d 25.91.55.0/24 --sport 18269 -j ACCEPT
iptables -A FORWARD -p 17 -s 66.0.0.0/8 --dport 40837 -j DROP
iptables -A test1 -p 6 -s 170.195.155.180 --dport 263 -j DROP
iptables -A OUTPUT -p 17 --dport 57992 --sport 58356 -d 47.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 51799 -d 112.172.0.0/16 -j ACCEPT
iptables -A test1 -p 17 -d 11.176.153.0/24 --dport 52181 -s 128.64.96.161 -j ACCEPT
iptables -A test2 -p 6 --sport 47819 -j DROP
iptables -A test3 -p 17 --sport 20309 -j ACCEPT
iptables -A FORWARD -p 253 -s 196.30.214.253 -j ACCEPT
iptables -A test2 -p 6 -s 5.117.31.184 --sport 21121 -d 196.123.170.184 -j DROP
iptables -A OUTPUT -p 6 --sport 7245 -j ACCEPT
iptables -A INPUT -p 17 --dport 10906 -j DROP
iptables -A OUTPUT -s 205.0.0.0/8 -j DROP
iptables -A test3 -p 17 -d 129.159.227.101 --dport 30821 --sport 30741 -j ACCEPT
iptables -A INPUT -p 6 -s 244.113.73.143 -d 14.72.22.48 --sport 52940 -j DROP
iptables -A INPUT -p 17 --dport 57998 -d 181.27.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --dport 11118 --sport 33839 -d 237.22.70.0/24 -j DROP
iptables -A test2 -p 17 --sport 26370 -j ACCEPT
iptables -A test2 -p 17 -s 221.194.119.228 --dport 54961 -j DROP
iptables -A OUTPUT -p 17 -s 45.164.0.0/16 --sport 47344 -j DROP
iptables -A FORWARD -p 6 --dport 25030 -j DROP
iptables -A test1 -p 17 -s 244.0.0.0/8 --dport 49037 -j DROP
iptables -A test2 -d 54.78.0.0/16 -j DROP
iptables -A test1 -p 17 -s 153.0.0.0/8 --dport 44160 --sport 17461 -j DROP
iptables -A INPUT -p 6 --sport 56092 -s 69.35.206.196 -j DROP
iptables -A OUTPUT -p 17 --dport 61387 -j DROP
iptables -A test1 -d 181.9.198.31 -j ACCEPT
iptables -A INPUT -p 6 --sport 14156 --dport 40270 -d 218.174.19.77 -j DROP
iptables -A test1 -p 17 -d 251.234.139.35 --sport 28985 -s 12.164.87.93 -j ACCEPT
iptables -A FORWARD -p 6 --dport 55766 -d 43.13.105.100 -j ACCEPT
iptables -A INPUT -s 218.136.67.234 -p 126 -d 159.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --dport 39956 -j DROP
iptables -A FORWARD -p 6 --dport 62540 -s 85.135.246.208 --sport 35399 -j ACCEPT
iptables -A test3 -p 6 --dport 4307 -j ACCEPT
iptables -A test1 -p 17 --sport 12130 -j DROP
iptables -A test1 -p 17 -s 239.79.79.110 --dport 44468 -d 78.121.0.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 63031 --dport 32449 -j ACCEPT
iptables -A test3 -p 6 --sport 15571 -j DROP
iptables -A OUTPUT -p 6 --dport 13122 --sport 9133 -d 210.147.50.0/24 -j ACCEPT
iptables -A test2 -p 153 -j DROP
iptables -A test2 -p 17 -s 194.126.175.205 --sport 18393 --dport 59593 -j ACCEPT
iptables -A INPUT -p 6 --dport 34355 -d 73.180.138.139 --sport 8612 -j DROP
iptables -A test2 -p 6 -s 63.217.172.213 --sport 8652 -d 93.181.7.0/24 -j DROP
iptables -A FORWARD -p 17 -d 74.39.0.0/16 --dport 9843 --sport 23860 -s 23.209.59.0/24 -j ACCEPT
iptables -A FORWARD -s 151.30.230.0/24 -j DROP
iptables -A test1 -s 57.252.254.221 -d 164.67.109.153 -j DROP
iptables -A test1 -p 17 --dport 11896 -j ACCEPT
iptables -A test2 -p 6 --sport 12735 --dport 57736 -d 209.133.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --dport 58082 -d 88.88.228.205 -s 66.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --sport 59169 -j ACCEPT
iptables -A INPUT -p 17 --sport 41121 --dport 50399 -j DROP
iptables -A INPUT -s 192.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 7940 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 37275 -d 55.96.0.0/16 -j DROP
iptables -A INPUT -p 17 -s 199.46.167.169 --dport 2543 -j DROP
iptables -A test1 -p 17 -s 158.159.34.147 --dport 20235 -j ACCEPT
iptables -A test2 -s 232.114.78.45 -j DROP
iptables -A INPUT -p 17 -d 136.1.126.0 --sport 17216 -j ACCEPT
iptables -A FORWARD -d 187.0.0.0/8 -j ACCEPT
iptables -A test1 -d 203.9.67.196 -j DROP
iptables -A test2 -p 6 -d 119.145.242.0/24 --dport 27029 --sport 16374 -s 175.218.3.22 -j ACCEPT
iptables -A test1 -s 10.247.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -d 75.215.63.0/24 -s 211.26.35.0/24 --dport 54044 -j DROP
iptables -A test2 -p 17 --dport 29746 --sport 51898 -j DROP
iptables -A INPUT -p 121 -s 144.238.173.99 -j ACCEPT
iptables -A INPUT -p 17 --dport 8058 -s 255.0.0.0/8 -j DROP
iptables -A test1 -p 6 -d 13.211.180.245 --dport 28020 -s 12.220.26.0/24 -j DROP
iptables -A INPUT -p 17 -d 103.0.0.0/8 --dport 6642 -s 205.69.51.168 --sport 14298 -j DROP
iptables -A test1 -s 211.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 49591 -s 35.126.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --sport 65027 -s 42.26.17.168 -d 89.69.0.0/16 -j ACCEPT
iptables -A INPUT -p 37 -j DROP
iptables -A FORWARD -s 97.185.243.191 -j DROP
iptables -A FORWARD -p 6 --sport 63631 -j ACCEPT
iptables -A INPUT -p 17 --dport 56285 -j DROP
iptables -A OUTPUT -p 6 --sport 9685 -j ACCEPT
iptables -A FORWARD -p 6 --sport 13208 -j test3
iptables -A FORWARD -p 6 --dport 5251 -s 12.128.38.136 --sport 33984 -j ACCEPT
iptables -A INPUT -p 17 --dport 16561 -d 150.96.0.0/16 -s 143.68.151.213 -j ACCEPT
iptables -A test1 -p 6 --sport 39844 -s 96.233.194.0/24 -j DROP
iptables -A INPUT -d 65.140.168.63 -p 102 -s 231.33.26.35 -j ACCEPT
iptables -A test3 -p 17 -s 128.234.147.0/24 --dport 52553 -j DROP
iptables -A test3 -p 6 --dport 18923 -s 146.228.207.211 -j DROP
iptables -A test1 -d 52.27.223.11 -j ACCEPT
iptables -A test3 -p 17 --dport 48240 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 19025 -s 9.8.173.138 -j DROP
iptables -A OUTPUT -p 17 --sport 26502 -d 59.62.0.0/16 -s 69.27.225.0/24 -j DROP
iptables -A OUTPUT -p 17 --dport 55161 -s 156.177.150.0/24 -j ACCEPT
iptables -A INPUT -p 6 --sport 4049 -s 176.207.42.0/24 -j DROP
iptables -A test1 -p 17 --sport 54565 -d 11.0.0.0/8 -s 27.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --sport 13214 -j DROP
iptables -A test2 -p 6 -s 81.178.247.158 --sport 33902 -j DROP
iptables -A test1 -p 17 --sport 25462 -s 150.183.130.11 -j ACCEPT
iptables -A test1 -p 17 -d 142.101.181.102 --dport 24810 -j ACCEPT
iptables -A test3 -p 6 --dport 43160 -j DROP
iptables -A INPUT -p 17 --sport 35276 -j ACCEPT
iptables -A INPUT -p 6 --sport 22307 -d 254.233.0.0/16 -j DROP
iptables -A test1 -p 17 --sport 57180 -j DROP
iptables -A OUTPUT -p 17 -s 127.140.135.231 --dport 51521 -d 241.0.0.0/8 -j ACCEPT
iptables -A test3 -d 36.253.77.119 -s 221.237.120.0/24 -j ACCEPT
iptables -A test2 -p 17 -s 15.89.159.248 --sport 48652 -j DROP
iptables -A OUTPUT -s 252.222.82.72 -j DROP
iptables -A OUTPUT -p 17 --sport 38461 -j ACCEPT
iptables -A INPUT -p 63 -j DROP
iptables -A test3 -d 213.218.50.0/24 -j DROP
iptables -A test1 -p 29 -j DROP
iptables -A OUTPUT -s 201.203.112.249 -j DROP
iptables -A OUTPUT -p 17 --dport 5389 -d 244.191.55.222 -j DROP
iptables -A test2 -d 182.57.76.240 -j DROP
iptables -A test3 -p 6 --sport 3290 -d 190.94.0.0/16 -j ACCEPT
iptables -A test1 -p 117 -d 238.149.104.0/24 -j DROP
iptables -A test2 -p 6 --dport 2332 -d 65.208.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 44231 -s 48.0.0.0/8 --dport 58628 -d 245.210.143.114 -j ACCEPT
iptables -A test2 -p 6 --dport 23744 -d 176.196.7.0/24 --sport 42710 -j ACCEPT
iptables -A test2 -p 6 --dport 56850 -j ACCEPT
iptables -A test1 -p 6 --sport 17497 -s 13.17.69.201 -j ACCEPT
iptables -A INPUT -p 17 -d 125.86.233.0/24 -s 251.245.0.0/16 --dport 42344 -j ACCEPT
iptables -A test3 -p 6 --sport 5587 --dport 18572 -d 182.88.40.162 -j ACCEPT
iptables -A test3 -p 6 --sport 33274 -d 180.177.80.118 -j ACCEPT
iptables -A FORWARD -p 6 --dport 33027 -d 100.21.0.0/16 --sport 38690 -j ACCEPT
iptables -A INPUT -p 171 -s 89.0.0.0/8 -j DROP
iptables -A test1 -p 232 -j DROP
iptables -A OUTPUT -p 17 --sport 1001 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 16491 -s 95.226.0.0/16 -d 55.209.0.0/16 -j test3
iptables -A test2 -p 17 --dport 25271 -d 212.223.0.0/16 --sport 50850 -j DROP
iptables -A test1 -p 240 -d 251.73.79.253 -j DROP
iptables -A test2 -s 13.229.80.140 -p 208 -j DROP
iptables -A OUTPUT -p 6 --sport 14346 -s 227.16.187.0/24 -j ACCEPT
iptables -A test3 -p 17 -d 200.22.59.179 -s 187.139.79.55 --sport 58705 -j ACCEPT
iptables -A INPUT -p 6 -s 126.168.35.0/24 --sport 26429 -j DROP
iptables -A OUTPUT -s 70.73.240.194 -j DROP
iptables -A test2 -p 17 --sport 9192 -d 44.138.166.36 --dport 63443 -j DROP
iptables -A test1 -s 138.220.52.12 -p 26 -j ACCEPT
iptables -A FORWARD -p 17 --sport 13138 --dport 41284 -j DROP
iptables -A INPUT -p 6 --dport 61594 --sport 47002 -d 170.65.56.43 -j DROP
iptables -A test3 -s 186.0.0.0/8 -p 36 -j ACCEPT
iptables -A test1 -p 17 --sport 48644 -s 145.68.192.82 --dport 47094 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 54022 -s 251.0.0.0/8 --dport 22301 -j ACCEPT
iptables -A test3 -d 27.30.101.128 -p 29 -j DROP
iptables -A OUTPUT -p 6 -d 245.80.226.0/24 --sport 12081 --dport 1390 -j DROP
iptables -A test2 -p 6 --sport 31082 -s 133.243.0.0/16 -d 146.204.25.144 -j ACCEPT
iptables -A INPUT -s 27.40.107.6 -j ACCEPT
iptables -A test3 -p 239 -s 129.166.147.200 -j DROP
iptables -A test1 -p 6 --sport 35092 --dport 40183 -j ACCEPT
iptables -A INPUT -p 17 --sport 63960 --dport 29761 -d 128.98.166.0/24 -j DROP
iptables -A test3 -p 6 --sport 21054 -s 145.180.180.236 -j ACCEPT
iptables -A FORWARD -p 91 -d 219.192.196.162 -j ACCEPT
iptables -A test3 -s 78.211.38.221 -p 218 -j ACCEPT
iptables -A test1 -s 71.130.211.5 -j DROP
iptables -A test3 -p 17 --dport 48864 -d 174.70.254.213 -j DROP
iptables -A test1 -p 6 --dport 32984 -d 145.226.139.88 -j DROP
iptables -A test1 -d 202.200.138.60 -p 50 -s 225.175.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 37313 --sport 4067 -d 140.164.0.111 -j ACCEPT
iptables -A test1 -p 6 -d 4.183.161.99 -s 206.58.234.47 --dport 10070 --sport 50642 -j ACCEPT
iptables -A test2 -p 219 -j DROP
iptables -A FORWARD -p 17 --dport 60506 -j DROP
iptables -A INPUT -p 6 -s 79.61.58.136 --dport 20140 -d 121.86.240.150 -j DROP
iptables -A INPUT -s 218.49.52.250 -d 236.249.100.0/24 -p 90 -j DROP
iptables -A INPUT -p 17 -s 197.0.0.0/8 --sport 40213 -j DROP
iptables -A test2 -p 84 -d 8.137.94.218 -j DROP
iptables -A FORWARD -p 6 --dport 26433 -d 138.146.102.168 --sport 42939 -j ACCEPT
iptables -A OUTPUT -p 6 -d 34.141.239.134 --sport 27959 -j DROP
iptables -A test3 -p 6 -s 130.128.13.78 --sport 58801 -d 4.170.10.60 -j ACCEPT
iptables -A FORWARD -p 6 --sport 7333 -d 211.3.230.31 --dport 20918 -j DROP
iptables -A INPUT -p 6 --dport 62136 -s 1.125.119.88 --sport 44001 -j DROP
iptables -A OUTPUT -s 165.244.182.148 -d 209.0.0.0/8 -p 216 -j DROP
iptables -A INPUT -p 17 -d 250.58.66.62 -s 42.0.0.0/8 --dport 3500 -j DROP
iptables -A test3 -p 6 --dport 435 -d 244.200.64.156 -s 136.107.146.65 -j ACCEPT
iptables -A FORWARD -p 6 --dport 58791 -d 46.6.205.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 -s 253.112.0.0/16 --sport 55977 -j ACCEPT
iptables -A FORWARD -p 17 --dport 422 -j DROP
iptables -A test3 -p 6 --dport 60352 -s 157.145.204.148 -j ACCEPT
iptables -A test3 -p 17 --sport 55880 --dport 21141 -j ACCEPT
iptables -A test3 -p 6 --sport 34255 -j DROP
iptables -A test1 -p 6 --dport 10729 --sport 60441 -j DROP
iptables -A test2 -p 17 -d 190.145.25.9 -s 203.153.192.0/24 --dport 60393 -j ACCEPT
iptables -A test3 -p 6 --sport 22305 -j DROP
iptables -A OUTPUT -p 6 --dport 39259 -s 88.254.99.0/24 -j ACCEPT
iptables -A test3 -p 6 --sport 15787 -s 150.213.98.164 -j DROP
iptables -A FORWARD -d 142.155.15.104 -j ACCEPT
iptables -A test1 -p 6 --dport 12815 -d 62.6.248.0/24 -j DROP
iptables -A FORWARD -p 17 --dport 64779 --sport 11899 -d 87.214.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --dport 17505 -s 248.47.72.25 -d 213.106.250.241 -j ACCEPT
iptables -A test3 -p 17 --dport 25869 -d 150.164.0.0/16 -j DROP
iptables -A test1 -p 6 --dport 4278 -j DROP
iptables -A test1 -p 6 -d 124.0.0.0/8 -s 117.0.0.0/8 --sport 34619 -j DROP
iptables -A test1 -p 6 --dport 45963 -d 77.146.247.0 --sport 28699 -s 154.40.248.25 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 26135 -j test1
iptables -A OUTPUT -p 17 -s 204.49.143.0/24 --sport 63021 -d 102.80.118.0/24 -j ACCEPT
iptables -A INPUT -p 6 -d 56.108.216.0/24 --sport 10481 -s 199.207.66.224 -j ACCEPT
iptables -A FORWARD -p 6 -s 112.1.167.89 --dport 47878 -j ACCEPT
iptables -A test3 -p 17 --sport 44401 -d 40.0.139.0/24 -s 169.120.0.0/16 -j DROP
iptables -A test2 -s 181.0.0.0/8 -p 11 -j ACCEPT
iptables -A test1 -s 80.82.249.99 -p 33 -j ACCEPT
iptables -A OUTPUT -p 17 -s 11.143.113.0/24 -d 26.79.241.238 --sport 40515 -j ACCEPT
iptables -A test1 -p 17 --sport 56792 -j ACCEPT
iptables -A INPUT -p 17 -d 23.2.0.0/16 --dport 8769 -j DROP
iptables -A test1 -s 178.163.192.0/24 -j ACCEPT
iptables -A test2 -p 17 --dport 49122 --sport 58482 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 7150 -j DROP
iptables -A FORWARD -p 6 --sport 12765 -s 29.0.137.0/24 --dport 1519 -j DROP
iptables -A test3 -p 6 --dport 61347 --sport 22464 -d 170.201.92.161 -j DROP
iptables -A test2 -p 6 --dport 59290 -j ACCEPT
iptables -A INPUT -d 104.78.186.0/24 -p 35 -j DROP
iptables -A OUTPUT -p 6 --sport 1609 -d 179.151.251.103 --dport 64546 -j ACCEPT
iptables -A test2 -p 17 --dport 2558 --sport 60075 -j DROP
iptables -A test2 -p 17 -s 171.18.101.242 --sport 63783 -j ACCEPT
iptables -A FORWARD -p 17 --dport 42823 -d 42.148.251.191 -j DROP
iptables -A test3 -s 160.46.69.65 -p 45 -d 51.155.22.0/24 -j DROP
iptables -A OUTPUT -p 6 -s 22.191.0.0/16 -d 20.177.2.191 --dport 43243 -j DROP
iptables -A FORWARD -d 44.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 -s 225.183.203.95 -d 251.110.120.246 --sport 31893 -j DROP
iptables -A INPUT -p 17 --sport 1501 -s 115.0.0.0/8 -d 166.11.151.140 --dport 47035 -j DROP
iptables -A test1 -p 17 -d 212.218.0.0/16 -s 173.238.7.229 --dport 44209 -j DROP
iptables -A OUTPUT -p 6 -d 101.15.141.251 --dport 57601 -s 185.165.50.104 -j ACCEPT
iptables -A FORWARD -p 6 -d 103.20.192.58 --sport 56949 --dport 21598 -j DROP
iptables -A test2 -p 6 --dport 37307 -d 186.77.45.56 --sport 56973 -j DROP
iptables -A OUTPUT -p 196 -j ACCEPT
iptables -A OUTPUT -p 6 -d 203.15.137.0/24 --dport 54504 -s 143.0.0.0/8 -j DROP
iptables -A INPUT -d 76.75.0.0/16 -j DROP
iptables -A INPUT -p 204 -s 91.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 58511 --dport 56824 -j ACCEPT
iptables -A INPUT -d 153.0.0.0/8 -p 91 -j ACCEPT
iptables -A FORWARD -d 35.159.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --sport 19980 -s 55.17.173.171 -j ACCEPT
iptables -A test3 -p 17 -d 43.148.207.129 --dport 8539 --sport 8815 -j DROP
iptables -A test1 -p 6 --dport 8371 -j ACCEPT
iptables -A test1 -p 17 --sport 1592 -s 1.0.0.0/8 -j DROP
iptables -A test2 -d 165.0.0.0/8 -p 149 -j ACCEPT
iptables -A OUTPUT -p 6 -d 167.0.0.0/8 --dport 62182 --sport 2344 -j DROP
iptables -A INPUT -p 6 --sport 46427 -j DROP
iptables -A FORWARD -p 17 -d 97.12.213.16 --dport 53043 --sport 18690 -j DROP
iptables -A FORWARD -p 17 --dport 36178 -j ACCEPT
iptables -A test2 -p 17 --sport 41937 --dport 50150 -j DROP
iptables -A OUTPUT -d 252.8.102.69 -j test3
iptables -A test3 -p 6 -s 145.85.115.0/24 --dport 2913 -d 74.160.134.87 -j ACCEPT
iptables -A FORWARD -p 6 -s 136.0.0.0/8 --dport 64875 -j DROP
iptables -A test2 -p 17 -d 88.58.0.0/16 --dport 17278 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 4828 -s 89.32.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 40580 -j ACCEPT
iptables -A FORWARD -p 6 --sport 19066 -d 42.210.130.89 -s 234.0.0.0/8 -j DROP
iptables -A test3 -p 6 --sport 18899 --dport 49048 -s 47.87.117.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 38273 -s 128.252.118.12 -j DROP
iptables -A INPUT -p 17 --sport 14163 --dport 37498 -s 220.89.154.75 -j DROP
iptables -A FORWARD -p 17 --sport 63231 -s 96.187.116.220 --dport 32593 -j test3
iptables -A INPUT -s 113.45.206.31 -j ACCEPT
iptables -A test3 -p 6 --sport 558 --dport 25935 -d 130.0.0.0/8 -j DROP
iptables -A INPUT -p 17 -d 0.82.239.145 --dport 30963 -j test1
iptables -A test1 -p 17 --sport 62973 -j DROP
iptables -A test1 -p 17 --sport 11873 --dport 35821 -s 196.42.0.0/16 -j DROP
iptables -A INPUT -p 17 -s 240.40.229.6 --sport 17872 -d 87.216.47.0/24 -j DROP
iptables -A test3 -p 17 --sport 13218 -s 2.254.85.4 -j ACCEPT
iptables -A test1 -p 104 -j DROP
iptables -A FORWARD -p 6 --dport 48005 -d 117.180.0.0/16 --sport 3922 -j DROP
iptables -A test1 -p 6 --sport 45687 --dport 55872 -d 57.0.0.0/8 -j DROP
iptables -A test3 -s 209.8.95.246 -d 93.57.0.0/16 -j ACCEPT
iptables -A INPUT -d 29.71.86.29 -p 63 -s 229.149.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 42647 --sport 10340 -s 14.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 --sport 40623 -d 113.0.0.0/8 --dport 24787 -s 130.190.203.0/24 -j DROP
iptables -A OUTPUT -p 6 --sport 49781 -j DROP
iptables -A OUTPUT -p 17 --sport 35443 -j test2
iptables -A test2 -p 17 --sport 1938 -s 110.242.234.152 --dport 10177 -j ACCEPT
iptables -A INPUT -d 98.180.115.141 -s 116.0.0.0/8 -j DROP
iptables -A test3 -d 142.186.166.232 -j ACCEPT
iptables -A test1 -p 17 -s 18.0.0.0/8 -d 61.58.62.204 --dport 51500 -j DROP
iptables -A OUTPUT -p 17 -s 246.0.0.0/8 -d 3.236.165.233 --dport 26188 -j DROP
iptables -A test1 -p 6 --dport 21160 -s 243.165.39.151 -j DROP
iptables -A test3 -p 6 --dport 23662 -s 66.2.55.24 -d 196.148.0.0/16 --sport 21039 -j DROP
iptables -A INPUT -p 6 --dport 64688 -s 60.0.0.0/8 -j DROP
iptables -A INPUT -p 17 -d 25.78.237.253 --sport 26635 -j ACCEPT
iptables -A test2 -p 17 -d 68.129.0.0/16 --sport 11444 -j ACCEPT
iptables -A FORWARD -d 46.248.177.0/24 -j DROP
iptables -A OUTPUT -d 2.245.57.211 -p 100 -s 121.60.218.9 -j ACCEPT
iptables -A FORWARD -p 6 -d 2.0.0.0/8 --dport 64968 -j ACCEPT
iptables -A test1 -p 6 -s 228.163.155.0/24 -d 244.243.165.157 --dport 18903 -j ACCEPT
iptables -A test2 -p 6 --dport 17774 -s 101.185.245.0/24 --sport 48723 -j ACCEPT
iptables -A test2 -p 6 --sport 57112 --dport 39076 -s 122.123.171.179 -j ACCEPT
iptables -A test2 -p 6 --dport 63228 --sport 6644 -j DROP
iptables -A INPUT -d 114.108.153.187 -s 165.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 --sport 54351 -s 77.22.161.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -d 56.2.110.128 --sport 10418 -s 67.16.0.0/16 --dport 36733 -j DROP
iptables -A test2 -p 37 -s 9.224.139.82 -d 144.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 24954 -s 14.198.233.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -d 192.72.27.197 --sport 25500 -j ACCEPT
iptables -A INPUT -p 6 --sport 3588 -j DROP
iptables -A FORWARD -p 6 -s 236.0.0.0/8 --dport 12830 -j ACCEPT
iptables -A INPUT -p 6 --dport 17377 -j ACCEPT
iptables -A INPUT -p 6 -d 100.62.105.163 --dport 8830 --sport 36995 -j DROP
iptables -A test1 -p 17 --dport 18576 --sport 16169 -d 54.33.251.29 -j ACCEPT
iptables -A test1 -p 6 -s 100.83.0.0/16 --sport 55830 --dport 22264 -j ACCEPT
iptables -A test1 -s 164.83.3.144 -p 124 -j DROP
iptables -A OUTPUT -p 17 -s 183.252.182.243 -d 225.30.149.81 --sport 2555 -j ACCEPT
iptables -A OUTPUT -p 6 -d 169.80.0.0/16 --sport 38926 -j ACCEPT
iptables -A OUTPUT -d 14.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 -d 5.13.166.0/24 --sport 11152 -s 212.31.79.62 -j DROP
iptables -A OUTPUT -p 17 -s 184.126.95.36 -d 176.40.22.193 --sport 2534 -j test1
iptables -A test3 -p 17 --sport 58343 -s 141.0.0.0/8 -j ACCEPT
iptables -A test2 -d 171.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 -d 114.0.0.0/8 --sport 39127 --dport 35759 -j test1
iptables -A OUTPUT -p 17 --sport 6056 -s 111.172.140.0/24 -j DROP
iptables -A test1 -p 6 --sport 15115 -j DROP
iptables -A INPUT -p 17 -s 80.117.135.0/24 --sport 58130 --dport 15486 -j DROP
iptables -A test2 -p 6 --dport 32721 -s 136.182.198.241 -d 216.237.206.217 -j DROP
iptables -A test2 -p 6 -d 196.74.0.0/16 --dport 36072 -s 16.255.0.0/16 -j DROP
iptables -A FORWARD -p 199 -j DROP
iptables -A FORWARD -p 17 --sport 4357 -j ACCEPT
iptables -A test3 -p 17 -s 238.227.207.180 --dport 21595 -j ACCEPT
iptables -A test2 -d 221.127.107.12 -j ACCEPT
iptables -A FORWARD -p 17 -s 79.0.0.0/8 --dport 53280 -d 14.0.0.0/8 -j ACCEPT
iptables -A FORWARD -s 37.72.61.241 -j ACCEPT
iptables -A test1 -d 255.15.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -d 15.107.0.0/16 --sport 34468 -j ACCEPT
iptables -A test1 -p 17 --sport 9247 --dport 13620 -j ACCEPT
iptables -A INPUT -p 17 -s 214.245.93.0/24 --sport 60042 -d 158.23.148.226 --dport 52318 -j DROP
iptables -A test1 -d 71.44.153.156 -j ACCEPT
iptables -A test3 -p 17 --sport 54916 -s 96.127.45.237 -j DROP
iptables -A FORWARD -p 6 --sport 6903 -s 104.97.25.0/24 -j ACCEPT
iptables -A test3 -p 17 -d 44.197.2.111 --sport 55058 -j DROP
iptables -A test1 -p 17 -d 176.209.218.165 --dport 36204 -j DROP
iptables -A test2 -s 129.0.0.0/8 -d 204.230.248.0/24 -p 140 -j ACCEPT
iptables -A INPUT -p 6 --dport 33619 -j ACCEPT
iptables -A test3 -p 6 --sport 1826 --dport 12045 -s 180.39.106.2 -j ACCEPT
iptables -A test2 -p 6 -s 192.99.0.0/16 -d 62.149.0.0/16 --dport 4516 -j DROP
iptables -A test1 -p 6 -s 94.174.64.39 --dport 57484 -j DROP
iptables -A test3 -p 17 --dport 3773 -j ACCEPT
iptables -A FORWARD -p 6 --dport 12870 -j ACCEPT
iptables -A INPUT -p 17 --sport 26790 -s 207.139.157.0/24 -j DROP
iptables -A INPUT -p 17 --dport 43366 -d 82.116.240.73 -j ACCEPT
iptables -A test1 -d 63.23.0.0/16 -s 56.120.235.238 -j DROP
iptables -A FORWARD -p 17 --dport 61113 -j test2
iptables -A test3 -p 6 --sport 39016 --dport 30022 -d 138.52.236.188 -j ACCEPT
iptables -A test3 -p 6 --sport 36485 -d 78.0.0.0/8 --dport 541 -j DROP
iptables -A FORWARD -p 253 -j ACCEPT
iptables -A test3 -p 6 --sport 61784 -d 172.81.105.211 --dport 40055 -j ACCEPT
iptables -A test3 -p 17 --sport 37465 --dport 47507 -j DROP
iptables -A test2 -p 6 -s 25.204.128.204 --dport 26139 -j ACCEPT
iptables -A test1 -p 17 --sport 10920 -s 40.129.0.0/16 --dport 15355 -j ACCEPT
iptables -A test2 -p 17 --sport 60192 --dport 34279 -s 6.31.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 8833 --sport 3299 -s 126.19.157.119 -j ACCEPT
iptables -A OUTPUT -s 226.101.0.0/16 -d 27.173.6.88 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 34255 -s 1.111.150.66 -j DROP
iptables -A test1 -p 17 -s 243.138.84.233 --dport 39290 -j ACCEPT
iptables -A test2 -d 99.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 -d 56.100.0.0/16 --dport 51840 --sport 64234 -j ACCEPT
iptables -A INPUT -p 60 -d 89.102.177.218 -j ACCEPT
iptables -A test2 -p 6 -s 153.227.248.4 --sport 7739 --dport 1183 -j DROP
iptables -A FORWARD -p 6 -s 248.223.85.123 -d 228.49.165.43 --sport 35157 -j DROP
iptables -A INPUT -s 226.86.3.247 -j ACCEPT
iptables -A OUTPUT -p 6 -d 113.247.230.27 -s 202.243.83.75 --sport 31357 -j DROP
iptables -A test3 -p 17 --sport 33636 --dport 39497 -j DROP
iptables -A test2 -p 6 --dport 16112 --sport 49733 -d 87.98.88.2 -j ACCEPT
iptables -A test3 -p 6 --sport 23703 -j DROP
iptables -A test1 -p 6 --dport 57453 -j DROP
iptables -A test1 -p 6 --sport 39225 -s 148.101.212.220 -j DROP
iptables -A FORWARD -p 201 -j DROP
iptables -A FORWARD -p 6 --sport 57829 -s 171.0.0.0/8 --dport 45932 -j ACCEPT
iptables -A OUTPUT -p 236 -j ACCEPT
iptables -A OUTPUT -p 6 -s 121.10.0.0/16 --dport 20283 --sport 35591 -j DROP
iptables -A test2 -p 6 -s 144.84.226.178 --sport 61656 -j ACCEPT
iptables -A test2 -p 17 --dport 41155 -j ACCEPT
iptables -A test3 -d 200.50.209.109 -s 220.61.233.142 -p 102 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 41931 -j ACCEPT
iptables -A test3 -p 6 -s 197.27.144.151 -d 17.79.0.0/16 --sport 7497 -j ACCEPT
iptables -A OUTPUT -p 17 -s 127.55.86.221 --dport 55200 -j ACCEPT
iptables -A INPUT -p 254 -j ACCEPT
iptables -A INPUT -p 6 --sport 30014 -j DROP
iptables -A test2 -p 17 --sport 14198 --dport 59003 -s 183.242.211.0/24 -d 9.216.0.0/16 -j ACCEPT
iptables -A test2 -p 182 -s 207.54.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -d 143.0.0.0/8 --dport 15739 --sport 51308 -j ACCEPT
iptables -A test2 -p 6 --sport 19536 -s 114.85.0.0/16 -d 25.36.194.2 -j DROP
iptables -A INPUT -p 71 -d 59.99.0.0/16 -s 41.136.223.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 12255 -j ACCEPT
iptables -A FORWARD -s 58.206.191.111 -d 21.234.0.0/16 -p 33 -j DROP
iptables -A OUTPUT -p 6 --dport 30391 -j ACCEPT
iptables -A test3 -p 6 --sport 8027 --dport 41674 -d 130.0.0.0/8 -j DROP
iptables -A FORWARD -p 241 -s 15.131.48.82 -j DROP
iptables -A INPUT -p 17 --dport 36040 -s 231.40.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 38231 -s 152.36.222.188 -j DROP
iptables -A test1 -p 17 --dport 23427 -s 90.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -d 253.141.225.45 --sport 17623 -j DROP
iptables -A FORWARD -p 17 -d 161.83.238.0/24 --dport 35225 -j DROP
iptables -A OUTPUT -p 100 -j ACCEPT
iptables -A test3 -p 6 -d 201.114.222.193 --dport 18815 -j DROP
iptables -A test2 -d 106.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --sport 62879 -j DROP
iptables -A test3 -p 6 --sport 19830 -s 38.199.13.0/24 --dport 6417 -j ACCEPT
iptables -A test3 -s 190.40.5.0/24 -j DROP
iptables -A FORWARD -p 17 --dport 11772 -d 147.148.87.0/24 -s 78.0.0.0/8 -j DROP
iptables -A INPUT -p 251 -j ACCEPT
iptables -A OUTPUT -d 32.222.196.184 -j ACCEPT
iptables -A test1 -p 17 --sport 12349 -s 250.149.9.200 -j ACCEPT
iptables -A test3 -p 17 -s 184.100.23.224 -d 146.229.240.134 --sport 37470 -j DROP
iptables -A test1 -p 6 --sport 27338 -j DROP
iptables -A test2 -p 17 --dport 39848 -d 192.35.87.253 --sport 548 -j ACCEPT
iptables -A test3 -p 17 -s 218.36.70.0/24 -d 36.49.197.133 --dport 60788 --sport 48233 -j DROP
iptables -A test2 -p 17 -d 167.125.227.129 --dport 40031 -j DROP
iptables -A test3 -d 204.167.52.147 -p 199 -j DROP
iptables -A FORWARD -s 190.216.0.0/16 -j ACCEPT
iptables -A INPUT -p 120 -j DROP
iptables -A OUTPUT -p 17 --sport 33616 --dport 29438 -s 23.86.0.0/16 -j DROP
iptables -A FORWARD -p 6 --dport 52410 -d 74.184.145.233 --sport 10052 -j ACCEPT
iptables -A test1 -p 127 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 4072 -j ACCEPT
iptables -A test3 -p 6 -d 65.112.0.0/16 --sport 41146 -j ACCEPT
iptables -A FORWARD -p 6 --sport 59678 -d 8.73.168.124 -j DROP
iptables -A OUTPUT -p 6 --sport 62750 -j DROP
iptables -A test2 -p 244 -s 48.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --sport 13696 -d 149.231.57.0/24 -s 120.26.60.59 -j ACCEPT
iptables -A FORWARD -p 17 -s 109.158.227.105 -d 114.199.141.0/24 --dport 26907 --sport 42327 -j DROP
iptables -A INPUT -p 6 --sport 34348 -d 176.205.0.0/16 --dport 41630 -j ACCEPT
iptables -A test3 -p 17 -s 150.43.0.0/16 --sport 56469 -j DROP
iptables -A INPUT -p 6 -d 121.0.0.0/8 --sport 7450 -j ACCEPT
iptables -A test2 -p 17 --sport 34029 --dport 32403 -j ACCEPT
iptables -A test1 -p 6 --sport 58738 -j ACCEPT
iptables -A test2 -p 252 -s 92.0.0.0/8 -j ACCEPT
iptables -A FORWARD -d 23.253.43.179 -j ACCEPT
iptables -A test2 -p 6 --dport 29867 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 45826 -j ACCEPT
iptables -A INPUT -p 17 --sport 62884 -d 204.240.136.186 --dport 57868 -j test1
iptables -A OUTPUT -p 6 --dport 48701 -j DROP
iptables -A INPUT -d 141.3.165.177 -j ACCEPT
iptables -A test3 -p 150 -j DROP
iptables -A test3 -s 45.72.206.150 -d 241.221.192.26 -p 241 -j DROP
iptables -A OUTPUT -p 17 --dport 2939 -j DROP
iptables -A test2 -p 6 -d 145.83.57.59 --dport 25124 -j DROP
iptables -A test1 -p 6 --dport 12345 -j DROP
iptables -A OUTPUT -p 6 --sport 20787 -j DROP
iptables -A OUTPUT -p 17 --sport 38631 -d 107.0.0.0/8 --dport 53802 -j DROP
iptables -A test2 -p 6 --sport 42296 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 33021 -j ACCEPT
iptables -A OUTPUT -d 4.110.165.207 -j DROP
iptables -A test2 -p 17 --dport 30628 -s 55.194.0.0/16 --sport 40367 -j DROP
iptables -A OUTPUT -s 76.228.189.186 -j DROP
iptables -A test2 -p 17 -s 249.33.66.0/24 --sport 64754 -j ACCEPT
iptables -A test1 -p 17 -s 171.0.0.0/8 --sport 19936 -j DROP
iptables -A FORWARD -p 17 --sport 38296 -j ACCEPT
iptables -A test1 -p 6 --sport 10788 -j DROP
iptables -A test2 -p 6 --dport 3633 -d 2.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 247 -d 148.185.248.173 -s 141.159.14.110 -j ACCEPT
iptables -A test3 -p 175 -j ACCEPT
iptables -A FORWARD -p 228 -d 196.249.42.212 -j DROP
iptables -A test3 -p 17 --sport 2618 --dport 56866 -j DROP
iptables -A test1 -d 158.83.159.148 -s 204.110.110.0/24 -j DROP
iptables -A INPUT -p 6 --sport 2167 --dport 59702 -j DROP
iptables -A OUTPUT -p 17 -s 194.53.254.0/24 -d 118.0.0.0/8 --sport 18982 --dport 39856 -j DROP
iptables -A OUTPUT -p 6 -d 139.67.0.0/16 --sport 25800 -j DROP
iptables -A test1 -p 6 -d 156.0.0.0/8 --sport 47918 -s 1.7.113.0/24 -j DROP
iptables -A test2 -p 17 --sport 47084 -j DROP
iptables -A INPUT -d 245.32.109.236 -j test3
iptables -A FORWARD -p 17 --dport 55990 --sport 19885 -j ACCEPT
iptables -A test2 -s 206.67.84.43 -d 25.172.139.147 -j ACCEPT
iptables -A test1 -d 186.9.188.147 -s 120.92.104.141 -p 136 -j ACCEPT
iptables -A FORWARD -p 17 -d 60.98.0.0/16 --sport 57570 -s 98.56.0.0/16 --dport 22353 -j ACCEPT
iptables -A INPUT -p 17 --dport 59660 -s 63.135.159.0/24 -j DROP
iptables -A test3 -p 17 --sport 19921 -s 229.4.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 46360 -d 254.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 12086 -j ACCEPT
iptables -A OUTPUT -s 241.230.92.74 -j DROP
iptables -A test2 -p 17 --sport 20769 -j DROP
iptables -A test3 -p 17 -d 6.25.0.0/16 --sport 21797 --dport 12598 -j ACCEPT
iptables -A test1 -p 17 --dport 41507 -s 237.0.0.0/8 -j ACCEPT
iptables -A test3 -p 130 -j ACCEPT
iptables -A test3 -p 17 --sport 19937 -j DROP
iptables -A FORWARD -p 17 -d 71.206.0.0/16 --sport 36387 -j ACCEPT
iptables -A INPUT -d 94.0.0.0/8 -s 211.85.237.0/24 -j ACCEPT
iptables -A test3 -p 17 --sport 42994 -s 28.179.85.223 -d 33.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --dport 35666 --sport 18949 -j DROP
iptables -A test1 -p 17 --sport 45255 -s 87.36.0.0/16 -d 105.0.0.0/8 -j DROP
iptables -A OUTPUT -d 227.78.32.96 -j DROP
iptables -A INPUT -d 239.63.40.0/24 -j DROP
iptables -A INPUT -p 6 --dport 60118 -s 82.124.165.113 -j DROP
iptables -A test2 -p 6 --sport 55893 --dport 33250 -d 120.25.27.139 -j DROP
iptables -A FORWARD -p 6 --dport 28816 -s 231.60.124.237 -d 7.154.0.0/16 --sport 13697 -j ACCEPT
iptables -A test1 -p 17 --dport 15572 --sport 55679 -d 210.0.0.0/8 -j ACCEPT
iptables -A INPUT -s 175.59.33.0/24 -p 4 -j DROP
iptables -A INPUT -p 6 -s 131.192.0.0/16 --sport 43666 -j ACCEPT
iptables -A OUTPUT -p 6 -s 196.240.0.0/16 --dport 1867 -d 218.45.193.179 -j ACCEPT
iptables -A test2 -p 6 -d 253.75.115.0/24 --dport 59711 -j ACCEPT
iptables -A test1 -p 6 -d 28.162.173.34 --sport 35060 -j ACCEPT
iptables -A test2 -p 6 --sport 28076 -d 169.134.232.91 -j ACCEPT
iptables -A test1 -p 17 --sport 30644 -s 230.162.240.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 57078 -j DROP
iptables -A INPUT -p 17 --sport 49111 -d 35.0.0.0/8 -j DROP
iptables -A OUTPUT -s 156.151.0.0/16 -j test1
iptables -A OUTPUT -p 6 --dport 60583 -d 15.177.243.123 -s 110.248.248.105 -j DROP
iptables -A FORWARD -p 17 -s 213.29.36.188 -d 106.248.0.0/16 --sport 53146 -j ACCEPT
iptables -A test3 -p 6 --sport 4008 -d 247.230.38.36 -s 178.64.58.58 -j DROP
iptables -A FORWARD -p 17 --dport 44509 -s 26.0.0.0/8 -j ACCEPT
iptables -A test3 -s 7.44.113.68 -j DROP
iptables -A test3 -p 6 -d 65.182.175.0/24 --dport 59722 --sport 40127 -j DROP
iptables -A test2 -p 110 -j ACCEPT
iptables -A test2 -p 6 -d 220.34.0.0/16 --dport 63599 -j DROP
iptables -A test3 -p 17 -d 135.162.123.0/24 --dport 41207 --sport 21320 -s 182.97.246.66 -j DROP
iptables -A test1 -p 6 --dport 55754 -d 208.80.54.124 -j ACCEPT
iptables -A INPUT -p 17 --dport 36264 -s 68.169.175.0/24 --sport 35633 -j DROP
iptables -A OUTPUT -p 6 --sport 60266 -j DROP
iptables -A test3 -p 17 -s 54.72.91.0/24 --dport 62022 -j DROP
iptables -A test3 -p 17 --dport 24985 -d 254.0.0.0/8 -j DROP
iptables -A FORWARD -d 189.0.0.0/8 -s 186.212.47.130 -j DROP
iptables -A test3 -p 6 --sport 62716 -j DROP
iptables -A INPUT -d 93.94.164.222 -p 21 -j DROP
iptables -A test3 -d 67.3.0.0/16 -j DROP
iptables -A test2 -p 49 -j ACCEPT
iptables -A test1 -p 6 --dport 18887 -s 218.15.227.106 -d 31.20.0.0/16 -j DROP
iptables -A test2 -p 17 -d 228.0.0.0/8 --sport 49193 -j ACCEPT
iptables -A test3 -p 6 --sport 23576 -j ACCEPT
iptables -A test2 -p 17 --sport 1342 --dport 49386 -s 204.69.253.13 -d 245.188.0.0/16 -j DROP
iptables -A INPUT -p 17 -s 153.20.135.202 --dport 6664 -j ACCEPT
iptables -A INPUT -d 148.122.47.12 -j ACCEPT
iptables -A OUTPUT -p 6 -d 160.158.22.180 --dport 20049 --sport 9004 -j DROP
iptables -A test1 -d 201.9.19.250 -s 235.57.140.225 -j ACCEPT
iptables -A test3 -p 17 --dport 47492 -d 245.43.48.221 -s 215.163.0.0/16 --sport 34497 -j ACCEPT
iptables -A INPUT -s 229.179.255.0/24 -j test2
iptables -A OUTPUT -p 6 -s 216.43.19.129 --sport 20062 --dport 24884 -d 80.244.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --dport 47453 -s 70.5.62.215 --sport 30614 -j DROP
iptables -A OUTPUT -p 17 --sport 57368 -d 159.85.27.51 -j DROP
iptables -A test3 -p 6 --sport 45832 -d 22.73.0.0/16 -s 0.191.105.159 -j DROP
iptables -A test3 -p 17 --sport 14300 -s 45.122.0.0/16 -j ACCEPT
iptables -A test3 -d 183.139.0.0/16 -s 230.196.243.0/24 -j DROP
iptables -A OUTPUT -d 194.0.0.0/8 -p 7 -j ACCEPT
iptables -A INPUT -p 17 --dport 49761 -j ACCEPT
iptables -A INPUT -p 17 --sport 52196 -s 122.225.115.158 -j DROP
iptables -A OUTPUT -p 6 --sport 6459 -d 55.247.19.0/24 -j ACCEPT
iptables -A OUTPUT -s 39.107.0.0/16 -p 114 -j ACCEPT
iptables -A test3 -p 241 -s 77.169.79.0/24 -j ACCEPT
iptables -A test2 -s 145.0.0.0/8 -j DROP
iptables -A test1 -p 17 --dport 56450 -s 21.185.0.0/16 -j DROP
iptables -A test2 -p 6 --sport 21729 -s 209.12.200.53 --dport 38837 -j DROP
iptables -A INPUT -p 17 --dport 44516 -j ACCEPT
iptables -A test1 -p 17 -s 157.219.0.0/16 --dport 59855 -j ACCEPT
iptables -A test3 -p 6 -d 234.30.46.159 -s 0.174.194.20 --dport 12573 -j DROP
iptables -A OUTPUT -p 6 --sport 52927 -d 244.59.229.7 -j DROP
iptables -A INPUT -p 17 --sport 48444 -s 74.120.165.0/24 --dport 45519 -j DROP
iptables -A test2 -p 17 --dport 21767 -j DROP
iptables -A INPUT -p 122 -s 124.32.0.0/16 -j ACCEPT
iptables -A test2 -p 6 -d 241.0.0.0/8 --dport 63484 --sport 13408 -j ACCEPT
iptables -A test2 -p 6 -d 198.33.0.0/16 --dport 40272 -j DROP
iptables -A OUTPUT -p 17 --dport 3009 -j ACCEPT
iptables -A test1 -p 17 --sport 52968 --dport 21314 -j DROP
iptables -A test2 -d 52.177.149.107 -j ACCEPT
iptables -A test1 -p 6 --dport 26075 --sport 31126 -j ACCEPT
iptables -A test3 -d 20.77.211.186 -s 57.17.164.70 -p 17 -j DROP
iptables -A test2 -p 6 --sport 56085 -j ACCEPT
iptables -A test2 -p 6 --dport 32903 --sport 56333 -s 185.113.117.157 -j DROP
iptables -A INPUT -p 6 -s 93.135.109.125 --sport 59070 -j DROP
iptables -A test1 -p 6 --sport 59595 -s 82.25.248.0/24 -j DROP
iptables -A FORWARD -p 17 -d 45.142.113.149 --sport 20895 --dport 18361 -j DROP
iptables -A FORWARD -p 6 --dport 11369 -j DROP
iptables -A INPUT -p 6 --sport 20851 -d 95.252.153.161 -j ACCEPT
iptables -A test1 -p 6 -d 150.0.0.0/8 --dport 44753 -s 58.247.121.56 -j ACCEPT
iptables -A OUTPUT -p 6 -s 220.73.143.85 -d 9.122.0.0/16 --dport 25906 -j DROP
iptables -A test3 -p 17 --dport 16194 -j ACCEPT
iptables -A INPUT -p 6 -s 194.84.197.125 -d 240.108.120.239 --sport 15996 -j DROP
iptables -A test2 -p 17 --dport 31354 -j ACCEPT
iptables -A test1 -s 112.54.248.250 -j ACCEPT
iptables -A FORWARD -p 17 -s 214.114.40.52 -d 193.202.0.0/16 --dport 1692 -j ACCEPT
iptables -A test2 -p 17 -d 71.139.245.0/24 --dport 52777 -j ACCEPT
iptables -A FORWARD -p 17 --dport 17437 -d 72.89.212.99 -j DROP
iptables -A test3 -p 97 -d 182.180.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 65410 --sport 35175 -d 150.149.192.17 -s 53.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --sport 64342 -s 171.75.202.124 --dport 21833 -j DROP
iptables -A FORWARD -p 6 --sport 51550 --dport 35401 -d 191.84.0.0/16 -j DROP
iptables -A test3 -s 118.103.60.0/24 -j DROP
iptables -A test2 -s 195.0.0.0/8 -p 250 -j DROP
iptables -A FORWARD -p 17 --dport 11228 --sport 40467 -j ACCEPT
iptables -A INPUT -s 72.149.81.0/24 -p 198 -j DROP
iptables -A test1 -p 17 -d 216.80.0.0/16 -s 100.230.29.42 --dport 18158 -j DROP
iptables -A FORWARD -p 17 --sport 41584 -d 128.34.236.142 -j ACCEPT
iptables -A test1 -p 17 -d 124.16.51.176 --dport 52906 --sport 45361 -j DROP
iptables -A test2 -d 188.199.9.181 -j ACCEPT
iptables -A test3 -p 17 --dport 34961 -s 103.90.180.165 -j ACCEPT
iptables -A test1 -p 157 -d 192.146.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 1222 --dport 11389 -d 100.74.0.0/16 -j DROP
iptables -A FORWARD -p 6 --dport 64753 -j DROP
iptables -A FORWARD -p 6 --dport 61661 --sport 27609 -s 98.254.183.36 -j DROP
iptables -A INPUT -p 17 --sport 11004 -j DROP
iptables -A FORWARD -p 6 --sport 9261 -j DROP
iptables -A OUTPUT -p 17 --sport 13649 -d 207.78.193.190 -s 42.0.0.0/8 -j DROP
iptables -A test1 -p 195 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 38743 -d 95.30.134.176 -j ACCEPT
iptables -A INPUT -p 6 --sport 65044 -s 206.226.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --sport 22757 -d 98.168.24.94 --dport 35005 -s 3.95.31.106 -j DROP
iptables -A OUTPUT -p 17 --sport 3784 --dport 27696 -j test1
iptables -A FORWARD -d 9.24.104.81 -j ACCEPT
iptables -A FORWARD -p 17 --sport 36416 -s 138.20.31.157 --dport 2110 -j ACCEPT
iptables -A test1 -d 125.0.0.0/8 -j DROP
iptables -A FORWARD -s 13.29.108.51 -p 215 -j DROP
iptables -A test1 -p 6 -d 187.0.0.0/8 --dport 64294 -s 125.135.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --dport 48397 -s 178.19.154.15 -j DROP
iptables -A INPUT -s 62.61.67.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 37190 -s 140.19.53.0/24 -d 142.90.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --sport 16211 --dport 64965 -d 110.14.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --sport 62899 --dport 57869 -j ACCEPT
iptables -A FORWARD -p 6 -s 12.5.0.0/16 -d 110.114.115.0/24 --dport 63538 -j DROP
iptables -A INPUT -p 6 --sport 40529 -s 189.125.66.0/24 -j ACCEPT
iptables -A test2 -p 6 --sport 12074 -s 185.248.200.0/24 --dport 49985 -j ACCEPT
iptables -A test2 -p 6 --sport 5710 -d 129.133.14.1 -j ACCEPT
iptables -A test1 -p 6 -s 252.5.218.58 --sport 45727 --dport 59563 -d 254.216.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 4428 -s 77.176.238.163 -j DROP
iptables -A OUTPUT -p 17 --sport 17143 -d 146.80.192.0/24 -j ACCEPT
iptables -A test2 -p 6 --dport 30868 -j DROP
iptables -A FORWARD -s 109.164.194.151 -j ACCEPT
iptables -A test1 -p 17 --dport 35083 --sport 15896 -j ACCEPT
iptables -A test1 -p 17 -s 200.71.131.0/24 --sport 41980 --dport 45669 -j DROP
iptables -A INPUT -s 212.62.237.109 -j DROP
iptables -A test3 -p 17 -d 181.188.160.16 --sport 35502 -s 86.227.250.12 -j ACCEPT
iptables -A test2 -d 80.108.0.0/16 -j DROP
iptables -A INPUT -p 58 -j DROP
iptables -A FORWARD -p 17 -d 35.146.0.0/16 --sport 59511 -s 138.229.0.0/16 -j test2
iptables -A test1 -d 90.176.253.188 -p 114 -j ACCEPT
iptables -A test3 -p 6 --dport 15464 -j DROP
iptables -A INPUT -p 24 -s 121.55.123.0/24 -d 155.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -d 145.23.187.60 --sport 51449 --dport 37225 -s 55.116.220.0/24 -j DROP
iptables -A FORWARD -d 61.90.219.212 -p 62 -j DROP
iptables -A test1 -s 71.0.0.0/8 -d 147.250.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --dport 1998 -j ACCEPT
iptables -A test3 -p 17 --dport 14036 -j ACCEPT
iptables -A INPUT -p 6 --dport 33642 -s 226.67.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --sport 62713 --dport 57993 -s 183.183.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --sport 22856 -j DROP
iptables -A FORWARD -p 17 --sport 58532 -j ACCEPT
iptables -A test3 -p 6 --sport 36304 -d 162.92.117.0/24 --dport 1476 -j DROP
iptables -A FORWARD -p 6 --dport 17591 -j DROP
iptables -A OUTPUT -p 17 --sport 34902 -s 75.0.0.0/8 -d 41.163.48.173 -j ACCEPT
iptables -A test3 -p 17 -d 99.95.0.0/16 --sport 53189 -j DROP
iptables -A OUTPUT -p 6 -s 17.105.54.167 -d 249.239.224.147 --sport 44223 -j DROP
iptables -A OUTPUT -p 17 --sport 15795 -d 3.38.35.65 -j ACCEPT
iptables -A INPUT -d 20.101.125.244 -s 91.142.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 8892 -j DROP
iptables -A INPUT -p 17 --dport 40433 -s 51.0.0.0/8 --sport 7663 -j ACCEPT
iptables -A FORWARD -p 17 --sport 33662 -d 67.213.83.0/24 --dport 35199 -j DROP
iptables -A OUTPUT -p 6 -s 204.75.210.205 -d 95.108.41.0/24 --dport 41250 -j DROP
iptables -A INPUT -p 77 -j ACCEPT
iptables -A INPUT -p 6 --dport 445 -j DROP
iptables -A INPUT -p 17 -d 190.167.114.139 --sport 47916 -j DROP
iptables -A test3 -p 6 -s 188.18.203.21 -d 231.230.68.8 --sport 50247 -j DROP
iptables -A test1 -p 6 -s 199.171.0.0/16 --sport 19532 --dport 35774 -j ACCEPT
iptables -A FORWARD -p 6 --dport 4101 --sport 63254 -j ACCEPT
iptables -A FORWARD -s 2.73.149.48 -d 124.153.105.128 -j DROP
iptables -A test2 -s 71.133.151.116 -d 78.174.206.28 -p 221 -j DROP
iptables -A test1 -p 17 --dport 37115 -d 255.0.0.0/8 --sport 42715 -s 4.11.60.180 -j ACCEPT
iptables -A OUTPUT -p 17 -d 131.174.0.0/16 -s 172.191.0.0/16 --dport 44548 -j DROP
iptables -A test2 -p 6 -s 225.102.137.0/24 --dport 3463 --sport 58754 -j DROP
iptables -A OUTPUT -p 17 --sport 42398 -j DROP
iptables -A OUTPUT -s 147.207.73.158 -d 7.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -d 51.157.155.0/24 --dport 9108 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 6883 -d 168.251.162.239 -s 220.124.16.133 -j ACCEPT
iptables -A OUTPUT -p 17 -d 138.0.0.0/8 --sport 10780 -j DROP
iptables -A INPUT -p 17 --sport 56878 -d 88.73.180.164 -s 227.0.0.0/8 -j ACCEPT
iptables -A test3 -d 18.224.34.78 -p 142 -s 63.44.89.103 -j ACCEPT
iptables -A test1 -p 6 -s 146.138.17.0/24 --sport 24682 -j ACCEPT
iptables -A test3 -p 17 --sport 19967 --dport 14105 -j ACCEPT
iptables -A test2 -p 17 -s 75.50.193.177 --dport 58531 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 35064 -j DROP
iptables -A OUTPUT -p 6 --dport 4680 -d 58.207.134.51 -s 126.184.16.27 -j DROP
iptables -A test1 -s 198.176.237.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 21574 -j DROP
iptables -A FORWARD -p 6 --sport 27616 -s 89.30.76.0/24 -j DROP
iptables -A INPUT -p 17 --sport 37147 --dport 8616 -d 31.0.0.0/8 -s 236.42.238.183 -j ACCEPT
iptables -A FORWARD -p 225 -d 49.187.52.129 -j DROP
iptables -A OUTPUT -p 6 --dport 39199 -d 214.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 --sport 36819 --dport 5126 -d 147.13.34.0/24 -j DROP
iptables -A test1 -p 17 -s 63.75.115.72 --dport 18562 -j DROP
iptables -A test2 -p 17 --sport 62352 -d 19.63.0.0/16 --dport 45205 -s 137.90.110.195 -j DROP
iptables -A INPUT -p 17 --dport 50177 -d 26.182.120.34 -j ACCEPT
iptables -A test2 -d 190.126.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --sport 57856 -j ACCEPT
iptables -A test3 -p 17 -d 37.0.0.0/8 --sport 53194 -j ACCEPT
iptables -A FORWARD -p 6 -d 26.180.0.0/16 -s 24.97.21.73 --sport 5557 -j ACCEPT
iptables -A test2 -d 12.75.9.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 22689 --sport 22348 -j DROP
iptables -A test2 -p 6 -d 66.144.0.0/16 --dport 48444 -j DROP
iptables -A test1 -p 143 -j ACCEPT
iptables -A INPUT -p 17 -s 231.168.4.102 --sport 41591 -d 168.192.2.53 -j DROP
iptables -A test1 -p 6 --dport 61952 -d 192.62.143.172 --sport 27659 -j DROP
iptables -A OUTPUT -d 243.191.0.0/16 -s 63.143.246.0/24 -j DROP
iptables -A INPUT -p 17 -d 145.183.0.0/16 -s 31.42.89.160 --dport 32716 -j ACCEPT
iptables -A FORWARD -p 6 --sport 50610 --dport 21531 -j DROP
iptables -A test2 -p 61 -d 110.117.78.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 41187 --dport 42142 -j ACCEPT
iptables -A INPUT -p 17 -s 140.56.197.225 --dport 34301 --sport 50349 -j DROP
iptables -A test3 -p 6 --dport 54509 -s 18.71.200.71 -j DROP
iptables -A INPUT -p 17 -d 121.102.118.60 --dport 21211 --sport 22627 -j DROP
iptables -A test1 -s 21.159.0.0/16 -j DROP
iptables -A test2 -s 48.31.248.81 -j ACCEPT
iptables -A FORWARD -p 6 -s 111.200.210.244 --dport 15664 -j DROP
iptables -A test1 -p 6 -s 116.188.0.0/16 --dport 37939 --sport 31726 -j DROP
iptables -A test2 -p 6 -d 241.142.0.0/16 --sport 16332 -j DROP
iptables -A test1 -p 6 --dport 36266 -j DROP
iptables -A FORWARD -p 6 --sport 15153 -d 49.100.80.33 -j DROP
iptables -A OUTPUT -p 6 --dport 11333 -s 251.175.232.214 -j ACCEPT
iptables -A test3 -p 17 -s 200.134.56.66 -d 50.43.0.0/16 --dport 42074 -j DROP
iptables -A test1 -p 6 -s 68.157.154.152 --dport 33128 -j DROP
iptables -A OUTPUT -p 6 -s 141.210.0.0/16 --dport 57932 -j test2
iptables -A FORWARD -p 17 -s 91.198.243.253 -d 79.80.136.102 --dport 59370 -j ACCEPT
iptables -A OUTPUT -p 17 -s 27.149.129.203 --dport 40275 -d 241.167.206.123 -j DROP
iptables -A test1 -p 17 -d 117.3.47.211 --sport 37818 -j DROP
iptables -A test1 -p 17 --dport 22724 --sport 47574 -d 70.181.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --dport 26232 -d 169.49.225.100 -j ACCEPT
iptables -A FORWARD -p 229 -d 152.19.100.1 -j ACCEPT
iptables -A test2 -s 118.123.198.175 -j DROP
iptables -A INPUT -d 57.111.136.227 -j DROP
iptables -A OUTPUT -p 26 -s 20.251.142.231 -j ACCEPT
iptables -A test2 -d 187.192.209.121 -s 228.254.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --sport 44968 --dport 33389 -j DROP
iptables -A test3 -p 17 -s 166.97.171.26 -d 228.47.115.123 --sport 64444 -j ACCEPT
iptables -A FORWARD -p 6 -d 180.205.116.0/24 --dport 33097 --sport 19117 -j ACCEPT
iptables -A test3 -p 6 -s 250.0.0.0/8 --dport 34350 --sport 6735 -d 140.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 138 -d 205.146.67.0/24 -j DROP
iptables -A FORWARD -p 6 --sport 30078 -j DROP
iptables -A OUTPUT -p 17 -s 7.145.225.128 --dport 11111 --sport 57053 -j ACCEPT
iptables -A OUTPUT -p 17 -s 70.186.68.228 --sport 44958 --dport 7285 -j DROP
iptables -A OUTPUT -s 66.242.91.0/24 -j ACCEPT
iptables -A INPUT -p 6 -d 94.130.83.92 --sport 55792 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 50368 -s 21.145.177.233 -d 28.220.180.150 -j DROP
iptables -A FORWARD -p 49 -d 113.110.191.188 -j DROP
iptables -A test3 -p 247 -j DROP
iptables -A test1 -p 6 --dport 356 -j ACCEPT
iptables -A INPUT -p 6 --dport 18654 -s 130.97.0.0/16 --sport 57699 -j ACCEPT
iptables -A test3 -p 6 -d 247.30.43.26 --sport 33546 -s 40.86.0.0/16 -j DROP
iptables -A OUTPUT -s 240.108.220.173 -d 39.173.95.109 -j ACCEPT
iptables -A OUTPUT -p 197 -j ACCEPT
iptables -A test3 -p 17 -d 32.54.196.0/24 --sport 17171 -s 60.48.24.101 -j ACCEPT
iptables -A OUTPUT -p 17 -s 143.25.58.254 -d 25.43.187.0/24 --dport 37113 -j DROP
iptables -A test1 -p 17 --sport 47900 --dport 44555 -j ACCEPT
iptables -A test1 -p 6 -d 160.1.232.199 --dport 5350 -j ACCEPT
iptables -A INPUT -d 201.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 -d 69.119.0.0/16 --dport 64749 -j DROP
iptables -A test2 -s 95.34.90.180 -d 30.3.94.57 -p 186 -j DROP
iptables -A OUTPUT -p 250 -j ACCEPT
iptables -A test1 -p 17 -d 90.0.0.0/8 --sport 7482 -s 211.26.0.0/16 --dport 40960 -j DROP
iptables -A test2 -d 156.194.21.93 -s 13.197.192.23 -j ACCEPT
iptables -A test2 -p 6 -d 52.25.0.0/16 --sport 61756 -s 121.214.205.100 -j ACCEPT
iptables -A INPUT -p 6 --dport 24474 -s 231.187.50.141 -j DROP
iptables -A OUTPUT -p 210 -d 31.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --dport 21637 -j ACCEPT
iptables -A test2 -p 17 --dport 10448 -j DROP
iptables -A test3 -p 6 --sport 29128 -s 99.16.138.195 --dport 29722 -j ACCEPT
iptables -A test3 -p 17 -s 5.12.14.3 --dport 17510 -j ACCEPT
iptables -A FORWARD -s 103.133.10.57 -d 39.250.93.152 -j test3
iptables -A INPUT -p 17 --dport 31350 -s 234.11.63.171 -j DROP
iptables -A test1 -p 6 -d 159.92.184.0/24 --sport 54737 -s 60.0.0.0/8 --dport 29349 -j DROP
iptables -A test2 -p 6 -s 62.48.33.209 --dport 28499 --sport 9401 -j ACCEPT
iptables -A test2 -s 15.144.120.106 -p 153 -j ACCEPT
iptables -A test3 -p 114 -j DROP
iptables -A test1 -p 17 --dport 60410 -j ACCEPT
iptables -A test1 -p 17 -s 149.0.0.0/8 -d 187.204.250.111 --dport 65044 -j ACCEPT
iptables -A INPUT -s 48.15.196.117 -j ACCEPT
iptables -A OUTPUT -p 17 -s 27.0.0.0/8 --sport 40216 -j ACCEPT
iptables -A test1 -p 17 -s 242.122.154.99 --dport 3534 -j ACCEPT
iptables -A test1 -d 167.22.113.0/24 -j ACCEPT
iptables -A test2 -p 6 --dport 43229 -j ACCEPT
iptables -A INPUT -p 17 -d 251.92.0.0/16 -s 77.74.0.0/16 --sport 47077 -j DROP
iptables -A FORWARD -p 17 --dport 10626 --sport 17536 -d 8.105.90.12 -j ACCEPT
iptables -A FORWARD -p 17 -d 232.223.235.0/24 --sport 53345 -j ACCEPT
iptables -A test3 -p 6 --sport 58042 -j ACCEPT
iptables -A INPUT -p 88 -s 230.124.167.12 -j DROP
iptables -A FORWARD -s 7.114.144.8 -p 215 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 64806 -j ACCEPT
iptables -A test2 -p 6 -d 3.139.128.235 --sport 61217 -j ACCEPT
iptables -A test3 -p 6 --sport 40432 -j ACCEPT
iptables -A FORWARD -p 6 --dport 38276 -d 46.243.75.14 -j ACCEPT
iptables -A test3 -p 6 --dport 34349 -j ACCEPT
iptables -A test1 -p 6 --sport 18175 --dport 8087 -j DROP
iptables -A OUTPUT -s 248.91.255.0/24 -j ACCEPT
iptables -A test1 -p 6 -d 196.180.24.197 --sport 40339 -s 51.198.36.219 --dport 748 -j ACCEPT
iptables -A test1 -p 6 -s 136.0.0.0/8 --sport 47185 -j DROP
iptables -A test2 -s 43.0.0.0/8 -d 185.32.129.30 -j ACCEPT
iptables -A INPUT -p 17 -d 161.0.0.0/8 --dport 50348 --sport 29069 -j ACCEPT
iptables -A test3 -s 32.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --sport 57395 -s 214.41.227.0/24 -j DROP
iptables -A OUTPUT -p 17 -s 159.101.0.0/16 --dport 34001 --sport 9738 -j test3
iptables -A test2 -d 13.194.71.71 -j ACCEPT
iptables -A FORWARD -p 17 -d 203.37.0.0/16 --dport 660 -j test3
iptables -A test2 -p 17 --dport 8532 -j ACCEPT
iptables -A INPUT -p 207 -j ACCEPT
iptables -A INPUT -p 17 --dport 44610 -d 203.159.57.186 --sport 30979 -j ACCEPT
iptables -A test1 -p 17 -s 167.0.0.0/8 --dport 15304 -j ACCEPT
iptables -A FORWARD -p 17 --dport 15675 -j ACCEPT
iptables -A FORWARD -p 17 --dport 28324 -s 99.93.48.64 --sport 11486 -j DROP
iptables -A FORWARD -p 17 --sport 53475 --dport 5162 -s 124.184.20.91 -j test3
iptables -A INPUT -p 6 --dport 54664 --sport 34742 -j DROP
iptables -A FORWARD -p 6 --sport 18562 -d 135.68.229.12 -s 152.74.144.51 --dport 4357 -j ACCEPT
iptables -A FORWARD -p 17 -s 10.0.0.0/8 -d 58.80.105.0/24 --dport 35461 -j ACCEPT
iptables -A test3 -p 17 --sport 38791 -d 150.92.108.92 --dport 39157 -j DROP
iptables -A test2 -p 6 --dport 49221 -s 170.122.216.137 -d 69.78.176.0/24 --sport 38731 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 23742 -j DROP
iptables -A test2 -p 6 -d 215.220.2.133 -s 108.160.108.66 --sport 20372 -j DROP
iptables -A INPUT -s 92.146.0.0/16 -j ACCEPT
iptables -A OUTPUT -d 220.135.64.125 -j DROP
iptables -A FORWARD -p 17 --sport 25584 --dport 43633 -d 102.91.65.12 -j ACCEPT
iptables -A INPUT -d 201.169.0.0/16 -s 160.168.47.136 -p 107 -j DROP
iptables -A INPUT -p 17 -d 44.0.0.0/8 --dport 22806 -j DROP
iptables -A test2 -p 17 --dport 47130 --sport 30992 -s 131.169.170.231 -j DROP
iptables -A INPUT -p 6 --sport 35354 -s 183.3.100.134 -d 224.29.6.107 -j DROP
iptables -A FORWARD -p 3 -j DROP
iptables -A test2 -p 6 --dport 22986 -s 60.155.0.0/16 --sport 21348 -j ACCEPT
iptables -A INPUT -d 52.130.224.229 -s 38.163.178.246 -j DROP
iptables -A test2 -p 6 -d 141.40.193.33 --sport 50891 --dport 64510 -j DROP
iptables -A test3 -p 17 --dport 3017 -s 36.34.97.0/24 --sport 9167 -j DROP
iptables -A INPUT -p 17 --dport 48855 -s 76.103.127.159 --sport 53991 -d 244.101.73.175 -j DROP
iptables -A test2 -p 6 -s 71.127.158.29 --sport 56717 --dport 41736 -j DROP
iptables -A INPUT -p 17 --dport 28498 -s 89.96.106.0/24 --sport 39023 -j DROP
iptables -A OUTPUT -p 17 -d 141.220.212.223 --dport 40498 -j DROP
iptables -A test2 -s 14.239.77.23 -j DROP
iptables -A test3 -p 17 --dport 12832 --sport 26656 -j ACCEPT
iptables -A test1 -p 150 -j DROP
iptables -A test1 -p 6 -d 160.191.226.80 --dport 58564 -j ACCEPT
iptables -A FORWARD -p 6 --dport 23374 -j ACCEPT
iptables -A INPUT -p 6 --dport 25497 -s 47.11.118.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --sport 331 -s 91.15.147.118 -j DROP
iptables -A INPUT -p 17 -d 30.21.233.213 --sport 57464 --dport 47635 -j ACCEPT
iptables -A test1 -p 6 --sport 59466 -s 82.180.237.244 -j DROP
iptables -A INPUT -p 6 --dport 55508 -j ACCEPT
iptables -A INPUT -p 6 --sport 7278 -d 56.200.35.0/24 -j DROP
iptables -A FORWARD -p 6 --sport 30248 -j DROP
iptables -A test1 -p 6 --sport 10299 -s 139.74.0.0/16 --dport 50243 -j DROP
iptables -A test1 -p 6 -s 114.117.97.16 --dport 21142 --sport 32450 -j DROP
iptables -A test1 -p 159 -d 46.232.64.208 -j ACCEPT
iptables -A test2 -p 17 -d 75.25.0.0/16 --dport 16702 --sport 26411 -j DROP
iptables -A FORWARD -p 6 --dport 37633 -s 154.150.73.177 -j ACCEPT
iptables -A test2 -p 6 --sport 52532 -s 185.126.212.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 22866 -j DROP
iptables -A INPUT -p 6 -d 8.200.0.0/16 --sport 31721 --dport 50625 -j test1
iptables -A test1 -p 17 -s 99.238.226.85 -d 85.223.241.243 --dport 5406 -j DROP
iptables -A test1 -p 6 -s 7.81.56.248 -d 215.0.0.0/8 --dport 29497 -j ACCEPT
iptables -A test2 -p 17 --dport 56524 -s 202.242.238.150 -j DROP
iptables -A test1 -s 155.194.22.236 -d 147.104.0.0/16 -j DROP
iptables -A INPUT -d 170.175.31.193 -j ACCEPT
iptables -A OUTPUT -p 17 -d 131.38.100.152 -s 135.249.7.161 --sport 12272 -j ACCEPT
iptables -A test3 -p 17 --sport 37275 --dport 36430 -d 29.97.238.3 -j DROP
iptables -A test1 -p 6 --dport 58552 -j DROP
iptables -A test3 -p 17 -s 130.154.145.61 --sport 6545 -j DROP
iptables -A OUTPUT -p 6 --dport 37901 -s 245.0.0.0/8 -j ACCEPT
iptables -A FORWARD -s 209.227.87.61 -d 110.214.64.98 -j DROP
iptables -A FORWARD -p 17 -s 38.132.0.0/16 --sport 46619 -j ACCEPT
iptables -A test1 -p 17 --sport 51789 -j ACCEPT
iptables -A INPUT -p 6 --dport 61997 -s 180.5.150.85 -d 185.186.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 8538 -d 40.164.103.194 --sport 33646 -j DROP
iptables -A INPUT -p 6 -d 253.0.0.0/8 --dport 62412 -s 16.228.205.15 -j DROP
iptables -A test1 -p 17 -s 3.230.0.0/16 --sport 42141 -d 228.0.0.0/8 -j DROP
iptables -A test2 -p 145 -j DROP
iptables -A OUTPUT -p 17 -s 233.0.0.0/8 --sport 18832 --dport 16850 -j DROP
iptables -A INPUT -p 17 -s 210.223.177.0/24 --sport 51764 -d 190.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 31463 -j DROP
iptables -A OUTPUT -d 60.253.72.167 -j DROP
iptables -A test1 -p 17 --dport 27931 -d 30.235.222.31 -j ACCEPT
iptables -A test3 -p 6 -s 32.2.0.0/16 --sport 15060 -j DROP
iptables -A test1 -p 6 -d 124.157.90.0/24 --dport 50103 -s 2.227.213.210 -j ACCEPT
iptables -A test2 -p 17 --sport 49221 -j DROP
iptables -A test2 -p 6 --sport 28055 -d 11.172.0.0/16 -s 8.222.0.0/16 -j DROP
iptables -A test2 -p 6 -s 238.0.0.0/8 -d 227.0.0.0/8 --dport 23229 --sport 14130 -j ACCEPT
iptables -A test2 -s 235.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 52580 -j ACCEPT
iptables -A OUTPUT -p 6 -s 94.175.0.0/16 -d 167.42.67.0/24 --dport 49919 -j ACCEPT
iptables -A FORWARD -p 17 --sport 16390 -d 185.0.0.0/8 --dport 22319 -j ACCEPT
iptables -A test3 -d 73.0.0.0/8 -j DROP
iptables -A test3 -d 77.54.212.85 -j ACCEPT
iptables -A OUTPUT -p 17 -s 207.178.180.20 -d 148.13.148.45 --sport 60001 -j DROP
iptables -A OUTPUT -p 6 --sport 52977 --dport 37980 -d 229.160.123.50 -j ACCEPT
iptables -A test3 -p 6 -d 184.166.0.0/16 -s 59.0.0.0/8 --dport 21580 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 561 -d 162.34.163.36 --sport 14200 -s 116.9.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --sport 50671 -d 106.172.234.0/24 --dport 1258 -j DROP
iptables -A test3 -p 6 -d 50.133.234.2 -s 121.225.96.23 --dport 47698 -j DROP
iptables -A INPUT -d 8.94.174.107 -j DROP
iptables -A FORWARD -s 12.0.0.0/8 -d 177.112.44.118 -j ACCEPT
iptables -A OUTPUT -p 6 -s 188.0.0.0/8 -d 81.201.40.220 --dport 7944 -j DROP
iptables -A INPUT -s 204.230.95.35 -j ACCEPT
iptables -A test1 -d 194.39.0.0/16 -j DROP
iptables -A INPUT -s 9.225.0.0/16 -p 178 -j DROP
iptables -A test1 -p 6 --dport 64162 -j ACCEPT
iptables -A INPUT -p 34 -j DROP
iptables -A FORWARD -p 17 --dport 43267 -s 73.108.98.145 -j ACCEPT
iptables -A test1 -p 17 --sport 48422 -s 124.215.29.0/24 -j ACCEPT
iptables -A test2 -s 119.95.207.206 -j ACCEPT
iptables -A test1 -p 6 --sport 12626 -j ACCEPT
iptables -A test3 -p 62 -s 174.70.60.43 -j ACCEPT
iptables -A test3 -s 248.168.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -s 135.0.0.0/8 --dport 6357 -d 135.173.0.0/16 -j ACCEPT
iptables -A test3 -d 151.179.210.76 -j DROP
iptables -A test1 -p 17 -d 8.119.192.249 --dport 5532 --sport 32189 -j ACCEPT
iptables -A FORWARD -p 17 -d 37.0.0.0/8 --dport 38526 -s 133.0.0.0/8 -j DROP
iptables -A OUTPUT -s 72.95.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -d 122.6.208.128 --sport 32402 -j ACCEPT
iptables -A test1 -p 17 --dport 29796 -s 64.157.60.193 -j ACCEPT
iptables -A FORWARD -s 39.238.205.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -s 82.191.109.227 --dport 62402 -j DROP
iptables -A FORWARD -p 17 -d 204.65.215.112 --sport 14970 -j ACCEPT
iptables -A INPUT -p 6 -s 254.110.0.0/16 -d 100.0.0.0/8 --sport 57272 --dport 28653 -j DROP
iptables -A test1 -p 225 -d 57.6.45.93 -j DROP
iptables -A test2 -p 6 --dport 48687 -d 241.197.75.0/24 --sport 51637 -j ACCEPT
iptables -A test1 -p 17 --dport 63327 --sport 25932 -s 21.0.0.0/8 -d 24.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --sport 23030 -s 43.133.0.155 --dport 57061 -j DROP
iptables -A FORWARD -p 6 --sport 1309 --dport 21255 -d 183.0.0.0/8 -s 185.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 5262 -s 67.209.0.0/16 --sport 19084 -j DROP
iptables -A OUTPUT -p 17 --dport 11374 -d 196.215.0.0/16 --sport 2174 -j ACCEPT
iptables -A FORWARD -p 6 --sport 10213 --dport 335 -j DROP
iptables -A FORWARD -p 6 --dport 10737 -s 44.11.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 21737 -d 216.199.2.166 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 2959 -d 185.178.64.0/24 -j DROP
iptables -A OUTPUT -d 208.218.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --dport 51651 -j ACCEPT
iptables -A test2 -p 6 --dport 62795 -d 47.17.0.0/16 -j DROP
iptables -A FORWARD -p 17 --sport 53911 --dport 825 -j ACCEPT
iptables -A FORWARD -p 6 --dport 17687 -d 175.40.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 34806 -j DROP
iptables -A OUTPUT -p 6 --dport 54989 --sport 60130 -d 207.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 -d 108.131.0.0/16 --dport 39197 -j ACCEPT
iptables -A test2 -p 17 --sport 31210 -s 82.185.172.167 -j DROP
iptables -A test2 -p 17 --sport 44165 -j DROP
iptables -A OUTPUT -p 6 --dport 20683 -s 190.66.142.219 -d 27.52.55.33 -j DROP
iptables -A OUTPUT -p 6 --dport 17852 -s 136.0.0.0/8 -j ACCEPT
iptables -A FORWARD -s 179.202.219.230 -j DROP
iptables -A test2 -p 6 -d 172.0.0.0/8 --dport 55093 --sport 27633 -j DROP
iptables -A INPUT -p 17 --dport 42093 -j DROP
iptables -A OUTPUT -s 156.238.33.0/24 -j DROP
iptables -A INPUT -p 182 -j ACCEPT
iptables -A FORWARD -p 17 --sport 53447 -d 236.176.0.0/16 -s 13.13.195.205 -j DROP
iptables -A test1 -p 47 -d 130.211.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 -s 61.105.0.0/16 --dport 2990 -j ACCEPT
iptables -A test3 -p 17 --sport 20517 --dport 32254 -j ACCEPT
iptables -A test2 -p 17 --dport 39685 --sport 53187 -d 173.175.144.0/24 -j DROP
iptables -A test2 -p 6 -d 242.0.125.0/24 -s 170.153.0.0/16 --sport 38236 -j ACCEPT
iptables -A test1 -p 17 --dport 7939 -s 24.115.141.1 -d 70.126.137.64 -j DROP
iptables -A test3 -p 17 --dport 47025 -s 7.20.0.0/16 --sport 41881 -d 168.100.162.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -s 161.233.117.18 --dport 6340 -j ACCEPT
iptables -A INPUT -p 17 -d 190.127.54.67 --sport 15682 --dport 28649 -s 5.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --sport 62690 --dport 52641 -j DROP
iptables -A INPUT -d 215.188.0.0/16 -p 216 -j DROP
iptables -A test1 -p 6 -d 204.48.239.0/24 --dport 8324 -j DROP
iptables -A test1 -p 6 -s 18.25.14.125 --sport 23843 -j DROP
iptables -A INPUT -p 17 --dport 58017 --sport 50815 -j ACCEPT
iptables -A INPUT -p 17 --sport 26416 -d 174.17.106.0/24 -j DROP
iptables -A OUTPUT -p 206 -d 231.57.79.3 -s 250.56.128.41 -j ACCEPT
iptables -A FORWARD -p 6 --dport 18151 -j ACCEPT
iptables -A test3 -p 6 --sport 30757 -j DROP
iptables -A test3 -p 17 -s 44.0.0.0/8 -d 104.65.49.195 --dport 29195 -j ACCEPT
iptables -A test1 -d 46.36.233.145 -j ACCEPT
iptables -A OUTPUT -p 154 -j DROP
iptables -A FORWARD -p 6 -s 109.129.210.22 -d 52.144.64.84 --dport 22338 -j ACCEPT
iptables -A FORWARD -p 17 --sport 64574 -d 223.37.99.178 -s 29.39.191.218 -j ACCEPT
iptables -A OUTPUT -d 85.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 -s 12.0.0.0/8 --sport 18458 --dport 62159 -j ACCEPT
iptables -A test2 -p 17 -d 62.140.127.0/24 --dport 16846 -j ACCEPT
iptables -A INPUT -p 17 --dport 45196 -d 36.216.48.14 --sport 33778 -j test3
iptables -A INPUT -p 17 -s 70.223.3.157 --sport 1958 -d 147.236.228.144 -j DROP
iptables -A test1 -p 17 -s 63.203.229.3 --dport 31716 --sport 38661 -j DROP
iptables -A test3 -p 6 -d 38.236.132.222 --sport 2941 -s 118.186.110.235 -j ACCEPT
iptables -A OUTPUT -p 6 -d 52.0.0.0/8 --sport 2611 --dport 12152 -j DROP
iptables -A test2 -p 17 --dport 25905 -j ACCEPT
iptables -A OUTPUT -p 6 -d 7.17.31.5 --dport 39213 --sport 63691 -j test3
iptables -A test3 -p 6 --sport 16727 -d 196.43.8.0/24 -s 140.216.52.172 -j DROP
iptables -A INPUT -p 250 -j DROP
iptables -A INPUT -p 6 --sport 33335 -s 90.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 46530 --dport 19861 -s 167.79.244.153 -j DROP
iptables -A test3 -p 6 --dport 52930 --sport 1358 -j DROP
iptables -A OUTPUT -p 17 -d 198.252.156.70 --dport 61410 -s 243.236.82.34 -j DROP
iptables -A test2 -p 6 -s 132.251.86.65 -d 98.160.0.0/16 --dport 56190 -j ACCEPT
iptables -A test2 -d 41.80.159.234 -j DROP
iptables -A OUTPUT -s 201.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 -s 4.191.102.154 --dport 49821 --sport 33807 -j ACCEPT
iptables -A test3 -p 6 -d 197.195.25.152 --dport 41292 -j DROP
iptables -A OUTPUT -p 17 --sport 18337 -j ACCEPT
iptables -A FORWARD -p 17 --dport 65226 -j DROP
iptables -A test3 -p 17 --sport 12288 -j DROP
iptables -A test1 -s 107.241.0.0/16 -d 132.84.139.63 -j ACCEPT
iptables -A test3 -p 17 --dport 5166 -j DROP
iptables -A test2 -p 6 --dport 8380 -s 19.61.67.76 -j ACCEPT
iptables -A test3 -p 17 --sport 50124 -d 189.132.233.61 -s 184.125.0.0/16 --dport 32643 -j ACCEPT
iptables -A test2 -p 6 -s 54.30.37.0/24 --dport 22920 --sport 16425 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 29057 -d 163.182.205.185 -s 218.59.252.242 -j ACCEPT
iptables -A FORWARD -p 6 --dport 28115 -j ACCEPT
iptables -A test2 -p 17 -d 45.101.199.0/24 -s 60.218.235.10 --dport 30265 -j DROP
iptables -A OUTPUT -p 6 --sport 37273 -j test1
iptables -A FORWARD -p 17 --sport 52715 -j DROP
iptables -A test1 -p 17 -s 96.0.0.0/8 -d 33.99.0.0/16 --sport 59867 -j DROP
iptables -A FORWARD -s 220.233.247.107 -d 157.30.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 59959 -j ACCEPT
iptables -A FORWARD -p 17 --sport 43886 --dport 64969 -d 200.199.121.0/24 -j test1
iptables -A test1 -p 3 -j ACCEPT
iptables -A test1 -p 17 --sport 45010 -s 111.229.223.203 -j ACCEPT
iptables -A test1 -p 6 -s 46.0.0.0/8 -d 71.92.211.214 --dport 60541 -j DROP
iptables -A OUTPUT -p 6 --dport 14650 -s 63.0.0.0/8 --sport 43424 -d 232.186.96.126 -j DROP
iptables -A test1 -p 211 -d 51.190.67.243 -j ACCEPT
iptables -A INPUT -p 17 -s 70.154.249.193 --sport 16354 -j DROP
iptables -A test3 -p 17 --dport 58866 -s 196.149.17.50 -j DROP
iptables -A OUTPUT -p 6 -d 137.0.0.0/8 -s 196.1.98.0/24 --sport 8715 -j ACCEPT
iptables -A test2 -p 17 -d 53.79.240.72 -s 115.245.63.73 --sport 41119 -j ACCEPT
iptables -A test2 -p 17 -d 214.81.67.0/24 -s 153.185.115.107 --dport 47428 -j ACCEPT
iptables -A OUTPUT -s 184.215.0.0/16 -j DROP
iptables -A FORWARD -p 6 -d 43.0.0.0/8 --dport 49720 --sport 47464 -j DROP
iptables -A test1 -p 17 -d 62.176.0.0/16 --sport 49801 -s 222.69.235.201 -j ACCEPT
iptables -A test2 -p 6 -d 240.222.61.51 --dport 6183 --sport 45704 -j DROP
iptables -A OUTPUT -s 110.226.42.154 -j ACCEPT
iptables -A INPUT -p 17 --sport 30392 -d 9.67.143.179 -j DROP
iptables -A test1 -p 6 -d 222.201.209.88 --sport 56391 --dport 58766 -j ACCEPT
iptables -A test3 -p 6 --sport 20045 -j DROP
iptables -A INPUT -p 17 --sport 22994 -j test1
iptables -A test3 -p 6 -s 110.144.0.0/16 --sport 6831 -d 245.174.69.83 -j ACCEPT
iptables -A test2 -d 183.59.230.242 -j ACCEPT
iptables -A test3 -p 17 --dport 44532 -j ACCEPT
iptables -A test3 -p 86 -d 101.242.131.23 -j ACCEPT
iptables -A OUTPUT -p 6 -s 48.86.248.0/24 -d 244.158.153.87 --sport 20810 --dport 50768 -j test1
iptables -A test3 -p 6 -d 92.135.149.0/24 --sport 30672 --dport 64044 -j ACCEPT
iptables -A INPUT -p 6 -s 122.47.33.0/24 --sport 45125 -j DROP
iptables -A test2 -p 6 -d 249.161.32.22 -s 232.74.54.148 --sport 48217 -j DROP
iptables -A test2 -p 6 -d 156.45.0.0/16 --sport 48765 -j DROP
iptables -A test2 -p 6 -d 231.111.234.92 --sport 10246 --dport 61733 -j ACCEPT
iptables -A test1 -p 6 --sport 12440 -d 86.165.229.207 -j DROP
iptables -A INPUT -p 6 --dport 12345 -s 59.12.136.127 -j DROP
iptables -A INPUT -p 17 -d 3.225.238.0/24 --sport 57374 -j ACCEPT
iptables -A test2 -p 6 --dport 41656 -j ACCEPT
iptables -A test3 -p 17 -d 3.160.0.0/16 --dport 35969 -j DROP
iptables -A test3 -d 242.130.236.78 -p 71 -j ACCEPT
iptables -A test2 -p 17 --dport 46479 -j ACCEPT
iptables -A OUTPUT -p 185 -j ACCEPT
iptables -A test1 -p 17 --dport 62701 -s 58.200.187.128 --sport 46213 -j DROP
iptables -A OUTPUT -d 93.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 -s 114.53.0.0/16 --dport 24265 -d 247.223.105.13 --sport 36660 -j ACCEPT
iptables -A test3 -p 227 -s 126.0.0.0/8 -d 228.166.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 38379 --sport 49021 -d 7.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 15409 -j ACCEPT
iptables -A OUTPUT -p 82 -j DROP
iptables -A test3 -p 17 -d 84.0.0.0/8 --dport 47022 --sport 33151 -j ACCEPT
iptables -A INPUT -d 38.195.191.126 -s 230.182.170.38 -j DROP
iptables -A test3 -p 17 --dport 50999 -s 86.139.0.0/16 -d 230.158.53.35 -j DROP
iptables -A test3 -p 17 -d 65.4.164.191 -s 233.183.82.228 --sport 53236 -j ACCEPT
iptables -A FORWARD -p 17 --dport 44294 -d 169.200.215.48 --sport 20068 -j DROP
iptables -A test3 -p 17 -s 158.63.48.156 --sport 34839 -j DROP
iptables -A test1 -p 17 -s 43.44.41.125 --sport 15867 -j ACCEPT
iptables -A INPUT -p 6 --sport 12556 -j ACCEPT
iptables -A test3 -p 17 --sport 6464 -s 104.239.38.10 -d 126.5.254.253 --dport 34653 -j ACCEPT
iptables -A FORWARD -p 17 --sport 20150 --dport 31680 -s 70.113.138.6 -j ACCEPT
iptables -A test3 -d 68.80.0.0/16 -s 200.38.238.186 -p 102 -j ACCEPT
iptables -A INPUT -p 6 -d 226.158.25.191 -s 47.90.38.116 --sport 51532 --dport 3088 -j ACCEPT
iptables -A INPUT -p 9 -j ACCEPT
iptables -A test1 -p 60 -j DROP
iptables -A test3 -p 17 --sport 63284 -s 191.127.61.0/24 -d 175.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -d 25.0.0.0/8 --dport 47017 --sport 46304 -j DROP
iptables -A INPUT -p 17 --sport 17584 -j ACCEPT
iptables -A FORWARD -p 6 -d 28.213.0.0/16 -s 21.34.28.66 --sport 34413 -j DROP
iptables -A FORWARD -p 17 --sport 53497 --dport 5998 -j DROP
iptables -A INPUT -p 6 -s 202.0.0.0/8 -d 241.66.0.0/16 --sport 8935 -j ACCEPT
iptables -A INPUT -d 47.216.0.0/16 -p 10 -j ACCEPT
iptables -A test1 -p 17 --sport 39432 -j DROP
iptables -A test2 -s 204.228.185.241 -d 170.0.0.0/8 -p 104 -j ACCEPT
iptables -A INPUT -p 6 -s 1.64.250.29 --dport 32875 -j DROP
iptables -A test1 -p 17 --dport 18774 -j ACCEPT
iptables -A test2 -p 6 --dport 19821 -d 29.190.155.88 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 12106 -j ACCEPT
iptables -A OUTPUT -p 6 -d 63.20.81.90 -s 136.0.0.0/8 --sport 5446 -j DROP
iptables -A test1 -p 6 --dport 31618 -d 47.0.0.0/8 -s 169.191.65.164 --sport 60688 -j ACCEPT
iptables -A test1 -p 17 -s 99.17.0.0/16 -d 83.118.149.128 --dport 35243 -j DROP
iptables -A test1 -p 6 --sport 31258 --dport 40721 -d 193.200.134.15 -j ACCEPT
iptables -A test2 -p 6 -s 238.76.0.0/16 --dport 22271 -j DROP
iptables -A test3 -s 206.0.0.0/8 -p 96 -d 25.123.13.95 -j DROP
iptables -A OUTPUT -p 6 --sport 55842 --dport 17541 -j ACCEPT
iptables -A test2 -p 17 --sport 19767 -s 224.143.87.162 -j DROP
iptables -A test2 -p 6 -s 70.126.81.0/24 --dport 2643 -j ACCEPT
iptables -A FORWARD -p 6 -d 219.252.0.0/16 -s 83.44.0.0/16 --sport 57617 -j DROP
iptables -A OUTPUT -p 17 --dport 45075 -s 216.200.75.121 -d 23.158.0.0/16 -j DROP
iptables -A test1 -p 17 --dport 26181 --sport 13788 -j ACCEPT
iptables -A INPUT -p 17 -s 177.239.52.0/24 --sport 15409 -j ACCEPT
iptables -A test3 -p 6 --sport 22591 --dport 13113 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 54266 -d 14.117.11.125 -j DROP
iptables -A test2 -p 17 --dport 65070 -d 85.7.0.0/16 --sport 3959 -j ACCEPT
iptables -A FORWARD -p 17 -d 83.103.67.205 --dport 34576 -s 191.0.0.0/8 --sport 38740 -j ACCEPT
iptables -A INPUT -p 6 --sport 24200 --dport 19889 -d 42.12.0.0/16 -j ACCEPT
iptables -A test1 -p 244 -j DROP
iptables -A test1 -p 6 --sport 11112 -d 172.224.172.148 -s 222.217.202.0/24 -j DROP
iptables -A OUTPUT -p 17 --dport 30862 --sport 32623 -j DROP
iptables -A test1 -s 217.255.0.0/16 -j ACCEPT
iptables -A test3 -d 8.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 29746 --sport 25972 -s 161.3.222.118 -d 85.184.0.0/16 -j DROP
iptables -A test2 -d 153.136.0.0/16 -j DROP
iptables -A INPUT -p 13 -d 4.112.133.205 -j DROP
iptables -A FORWARD -p 6 --dport 9434 -s 182.69.14.123 -j test1
iptables -A test1 -s 217.149.68.0/24 -j ACCEPT
iptables -A test3 -p 6 --dport 51927 -s 69.0.0.0/8 -d 42.214.87.18 -j DROP
iptables -A FORWARD -p 6 -s 184.0.0.0/8 --sport 61534 -d 231.254.224.32 -j DROP
iptables -A test3 -p 6 --sport 7962 -s 63.201.0.120 -j DROP
iptables -A FORWARD -s 215.85.7.143 -j ACCEPT
iptables -A test3 -p 6 -d 79.214.0.0/24 --sport 33693 -j DROP
iptables -A test3 -d 181.166.120.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --dport 22533 -s 44.70.173.0/24 --sport 60955 -j ACCEPT
iptables -A test1 -p 6 --sport 5860 -j ACCEPT
iptables -A test3 -p 6 -d 117.172.213.250 --sport 7114 -j DROP
iptables -A test1 -p 17 -d 240.37.185.204 --sport 515 --dport 41481 -s 129.231.145.44 -j DROP
iptables -A test3 -s 23.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 18570 -j DROP
iptables -A test1 -p 6 --dport 28138 -s 30.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 --sport 40533 -s 198.167.240.0/24 -j DROP
iptables -A test2 -p 17 --dport 41043 -j DROP
iptables -A test3 -p 6 --sport 23201 -j ACCEPT
iptables -A test1 -p 6 --dport 31186 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 45739 --sport 7075 -d 210.68.167.170 -j DROP
iptables -A test3 -p 6 -s 52.244.242.0/24 --dport 17657 -d 239.131.166.72 -j DROP
iptables -A test1 -p 17 -s 245.160.214.81 --sport 16436 -j DROP
iptables -A test3 -p 6 --sport 3675 -s 45.242.0.0/16 --dport 20828 -j DROP
iptables -A OUTPUT -p 17 -s 206.226.209.0/24 -d 42.140.0.0/16 --sport 52732 -j ACCEPT
iptables -A test3 -d 168.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --dport 15262 -d 116.149.175.0/24 -j ACCEPT
iptables -A test3 -s 226.99.152.33 -j DROP
iptables -A test1 -d 206.115.96.120 -j DROP
iptables -A FORWARD -p 6 -s 110.233.182.141 --dport 28871 -d 225.80.211.130 -j ACCEPT
iptables -A INPUT -s 102.79.254.211 -j ACCEPT
iptables -A OUTPUT -d 168.90.227.90 -j DROP
iptables -A test2 -p 238 -d 76.152.29.165 -j ACCEPT
iptables -A INPUT -s 46.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 37130 -j DROP
iptables -A test3 -p 17 --sport 7436 -s 218.22.155.56 --dport 43315 -j ACCEPT
iptables -A test1 -p 17 -s 94.242.102.208 --dport 23751 --sport 1975 -j DROP
iptables -A test1 -p 5 -d 35.142.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 19663 -d 75.161.250.120 --dport 34805 -j ACCEPT
iptables -A test1 -p 25 -d 249.88.61.205 -s 5.0.0.0/8 -j DROP
iptables -A INPUT -p 17 -s 58.154.65.246 --dport 56341 -d 196.231.136.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -s 232.0.0.0/8 --dport 2073 --sport 26176 -j DROP
iptables -A FORWARD -d 138.49.112.181 -p 244 -j ACCEPT
iptables -A test1 -p 6 -d 93.0.0.0/8 --dport 7542 -s 46.230.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -s 151.0.0.0/8 --dport 42371 --sport 39382 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 56232 -d 26.0.0.0/8 -s 252.204.48.63 -j ACCEPT
iptables -A INPUT -p 6 --dport 48828 -j DROP
iptables -A OUTPUT -p 6 -d 43.151.237.233 --sport 5445 -j DROP
iptables -A test1 -p 6 --sport 60307 -d 172.144.209.47 -j DROP
iptables -A test1 -p 17 -d 249.0.0.0/8 --sport 52814 -s 221.39.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --dport 29334 -d 194.130.91.135 -s 205.248.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 8779 --sport 52756 -d 94.0.0.0/8 -j DROP
iptables -A test3 -p 17 -d 97.119.81.139 -s 232.229.207.70 --dport 13637 -j DROP
iptables -A test3 -d 9.198.59.199 -j ACCEPT
iptables -A test1 -p 17 -s 170.0.0.0/8 --dport 58738 -j DROP
iptables -A test1 -s 182.31.158.91 -j ACCEPT
iptables -A test3 -p 6 -d 231.114.83.181 -s 87.198.168.111 --sport 24921 -j ACCEPT
iptables -A test2 -p 6 -s 140.116.50.0/24 --dport 37998 -d 107.167.8.220 -j DROP
iptables -A FORWARD -p 17 --sport 27691 -j ACCEPT
iptables -A FORWARD -p 6 --dport 52102 -j ACCEPT
iptables -A test3 -p 6 -d 41.1.155.0/24 --dport 8001 -s 20.240.69.124 -j ACCEPT
iptables -A OUTPUT -p 2 -d 123.242.161.73 -j DROP
iptables -A INPUT -p 6 -s 228.203.7.86 --dport 23611 -j test3
iptables -A test3 -p 6 -s 106.70.43.0/24 --sport 181 -j ACCEPT
iptables -A FORWARD -p 6 --dport 16428 -j DROP
iptables -A FORWARD -p 6 -s 52.209.0.0/16 --dport 10059 -d 222.85.0.0/16 --sport 50742 -j DROP
iptables -A test1 -p 17 --dport 45442 --sport 53852 -j DROP
iptables -A test3 -p 17 -d 80.203.154.23 --sport 61495 --dport 17857 -j ACCEPT
iptables -A test3 -p 71 -j ACCEPT
iptables -A INPUT -p 17 --sport 37629 --dport 18132 -s 97.0.226.0/24 -j ACCEPT
iptables -A OUTPUT -p 29 -j DROP
iptables -A test3 -p 17 -d 244.154.144.0/24 --dport 14045 -j ACCEPT
iptables -A INPUT -p 172 -j ACCEPT
iptables -A test1 -p 6 --sport 34095 -d 23.47.39.234 --dport 25750 -s 9.157.0.0/16 -j DROP
iptables -A INPUT -p 6 -s 8.214.227.183 --dport 57187 -d 205.169.131.146 -j ACCEPT
iptables -A FORWARD -s 133.1.127.0/24 -j ACCEPT
iptables -A OUTPUT -s 216.54.70.140 -p 63 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 23908 -d 153.236.222.222 -j DROP
iptables -A test1 -p 17 -d 174.222.50.0/24 --dport 29837 -s 195.251.188.106 -j ACCEPT
iptables -A test2 -p 6 --sport 38107 -d 253.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -s 246.13.141.0/24 --dport 834 --sport 25054 -j DROP
iptables -A INPUT -s 233.131.69.241 -j DROP
iptables -A FORWARD -p 17 -s 13.0.0.0/8 --dport 61856 --sport 37836 -j ACCEPT
iptables -A test3 -p 6 -s 89.19.0.0/16 --dport 30917 --sport 9442 -d 196.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 43149 -s 183.7.213.128 -j ACCEPT
iptables -A test2 -p 6 --sport 1717 -s 206.75.169.1 -j ACCEPT
iptables -A test3 -p 6 -d 39.34.0.0/16 --sport 57679 -s 221.206.89.119 -j ACCEPT
iptables -A test1 -p 6 --dport 12668 -s 154.70.238.0/24 -j DROP
iptables -A OUTPUT -p 17 -s 185.177.169.0/24 -d 182.0.0.0/8 --dport 4962 -j DROP
iptables -A test3 -p 6 -s 159.6.90.200 --dport 51951 -d 114.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 7714 -j DROP
iptables -A test2 -p 17 --sport 23770 -d 193.0.0.0/8 -j ACCEPT
iptables -A test1 -s 18.0.0.0/8 -d 141.46.183.174 -j DROP
iptables -A test1 -p 6 --dport 2598 -j ACCEPT
iptables -A INPUT -p 6 --sport 35712 -j DROP
iptables -A INPUT -p 6 -d 223.154.247.174 --sport 27510 -j ACCEPT
iptables -A test2 -p 6 -d 239.188.0.0/16 --dport 22926 -j ACCEPT
iptables -A FORWARD -p 6 -d 104.173.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 28519 --sport 20838 -d 253.204.223.0/24 -j DROP
iptables -A OUTPUT -p 6 -s 18.233.0.0/16 -d 116.234.206.89 --dport 54731 -j ACCEPT
iptables -A INPUT -p 17 -s 173.121.97.0/24 -d 245.14.103.190 --sport 22193 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 60084 --sport 52337 -j ACCEPT
iptables -A test3 -p 17 --dport 14715 -s 221.80.105.236 -j DROP
iptables -A test3 -p 6 -s 222.214.58.192 --dport 52341 -j ACCEPT
iptables -A OUTPUT -p 6 -d 51.59.228.62 --dport 22502 -s 37.110.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --dport 41003 -d 189.46.0.0/16 --sport 6584 -j DROP
iptables -A INPUT -p 17 --sport 34787 --dport 15038 -s 78.60.190.208 -j DROP
iptables -A test1 -p 17 -s 111.137.0.0/16 --sport 28422 -j ACCEPT
iptables -A test2 -p 6 --dport 34360 -s 14.84.249.214 -j ACCEPT
iptables -A FORWARD -d 57.199.15.167 -j test3
iptables -A OUTPUT -p 253 -s 20.109.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 63136 --dport 2948 -d 180.21.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 -s 69.68.131.0/24 --sport 38261 -d 106.181.156.0/24 -j ACCEPT
iptables -A INPUT -p 6 -d 187.230.193.23 --dport 1063 -s 166.79.84.146 -j ACCEPT
iptables -A FORWARD -p 17 -s 109.188.80.0/24 --dport 1278 -j ACCEPT
iptables -A OUTPUT -p 200 -j DROP
iptables -A test2 -d 210.18.0.0/16 -j DROP
iptables -A test3 -p 6 -s 146.0.0.0/8 --sport 12359 -d 221.172.41.179 -j DROP
iptables -A test1 -p 6 -s 130.204.106.47 -d 88.146.122.128 --sport 8210 -j ACCEPT
iptables -A FORWARD -p 17 -s 12.0.0.0/8 -d 40.41.194.28 --dport 10542 -j ACCEPT
iptables -A INPUT -p 17 --sport 20563 --dport 27928 -d 137.148.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --sport 64126 -j DROP
iptables -A test3 -s 68.7.59.95 -j DROP
iptables -A OUTPUT -p 17 -s 223.0.198.0/24 --sport 59692 --dport 60222 -j DROP
iptables -A FORWARD -p 6 --dport 38243 --sport 42721 -s 198.59.66.96 -j DROP
iptables -A test3 -s 71.171.221.186 -p 73 -j ACCEPT
iptables -A INPUT -p 6 -d 25.3.80.218 --sport 18696 -j DROP
iptables -A OUTPUT -p 17 --dport 42456 -d 180.66.220.104 --sport 47079 -j ACCEPT
iptables -A test3 -p 17 -s 46.110.96.23 -d 175.238.231.154 --dport 26057 -j DROP
iptables -A FORWARD -p 6 -d 182.184.240.30 -s 66.23.21.3 --sport 26703 -j ACCEPT
iptables -A INPUT -p 17 --dport 52622 -d 117.140.235.169 -j ACCEPT
iptables -A test2 -p 17 --dport 62079 -j ACCEPT
iptables -A FORWARD -d 92.162.0.0/16 -p 76 -s 170.121.141.213 -j ACCEPT
iptables -A test1 -p 64 -j DROP
iptables -A test1 -p 17 -d 33.2.150.193 --sport 3576 --dport 7897 -j DROP
iptables -A test1 -d 187.61.67.22 -j DROP
iptables -A FORWARD -p 17 -s 164.16.103.16 --sport 56807 --dport 15735 -j DROP
iptables -A FORWARD -s 115.126.66.0/24 -d 144.35.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --sport 61621 --dport 10449 -s 73.149.12.238 -j ACCEPT
iptables -A test2 -p 6 --dport 63351 -s 190.187.0.0/16 --sport 5739 -j DROP
iptables -A test2 -p 17 --sport 34764 -d 240.241.0.0/16 --dport 14352 -j DROP
iptables -A INPUT -p 17 --dport 44290 -j DROP
iptables -A FORWARD -p 6 --dport 30129 -j ACCEPT
iptables -A INPUT -p 130 -j DROP
iptables -A OUTPUT -p 6 --dport 64987 -s 251.20.154.23 -d 182.117.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 3119 --sport 26391 -j ACCEPT
iptables -A test3 -p 17 --dport 15716 -j DROP
iptables -A OUTPUT -p 6 --dport 51804 -d 242.154.3.149 -j ACCEPT
iptables -A FORWARD -p 6 --dport 57396 -j DROP
iptables -A test1 -s 155.252.132.215 -j ACCEPT
iptables -A test2 -p 17 -d 119.0.0.0/8 --dport 10972 -j DROP
iptables -A test1 -p 17 -s 65.0.0.0/8 --sport 48783 --dport 7777 -j DROP
iptables -A OUTPUT -p 17 --sport 57139 -s 114.2.112.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 45812 -s 107.195.0.0/16 -j ACCEPT
iptables -A test2 -p 6 -d 188.233.100.194 --dport 58591 -s 236.169.147.241 -j DROP
iptables -A test3 -p 6 --dport 23883 -d 176.219.58.201 --sport 25029 -j DROP
iptables -A FORWARD -p 6 -s 76.212.0.0/16 --sport 37686 -j ACCEPT
iptables -A test3 -p 17 --sport 8193 -d 126.229.134.140 -s 232.231.42.237 -j DROP
iptables -A OUTPUT -p 6 --dport 61810 -d 136.244.133.13 --sport 35774 -s 98.248.78.45 -j ACCEPT
iptables -A test3 -s 80.219.135.118 -j ACCEPT
iptables -A FORWARD -p 6 --sport 46641 -s 156.195.26.220 --dport 35724 -j ACCEPT
iptables -A test1 -p 17 --sport 59437 -s 52.100.0.0/16 -d 153.196.89.0/24 -j ACCEPT
iptables -A test2 -p 6 --dport 39031 -j ACCEPT
iptables -A test2 -p 217 -d 150.180.176.72 -j DROP
iptables -A FORWARD -s 54.31.151.146 -d 145.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --sport 42590 -d 108.35.212.69 -s 220.35.0.0/16 -j DROP
iptables -A test3 -p 17 --sport 36512 --dport 19030 -d 178.131.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --dport 63890 -d 83.189.197.187 -s 81.208.99.0/24 -j ACCEPT
iptables -A test1 -p 6 -d 144.0.0.0/8 --sport 61582 -s 115.0.0.0/8 -j DROP
iptables -A OUTPUT -d 196.45.110.23 -j ACCEPT
iptables -A test2 -p 17 -s 245.227.7.124 --dport 21798 -j DROP
iptables -A OUTPUT -p 6 --dport 54310 -s 240.89.193.18 -j DROP
iptables -A FORWARD -p 6 -j DROP
iptables -A test2 -p 17 -s 182.158.168.0/24 --sport 52024 -d 239.18.162.241 -j ACCEPT
iptables -A test3 -p 6 --sport 36471 -j ACCEPT
iptables -A test3 -p 17 --dport 19722 --sport 58127 -s 102.89.72.139 -j ACCEPT
iptables -A test2 -p 6 -s 149.142.0.0/16 --sport 29233 --dport 38810 -j ACCEPT
iptables -A test1 -p 6 --sport 3585 -j ACCEPT
iptables -A test1 -p 6 -s 177.221.51.102 --sport 10570 -j ACCEPT
iptables -A test3 -p 6 --sport 42139 --dport 20878 -j ACCEPT
iptables -A test1 -p 6 --dport 52169 -j ACCEPT
iptables -A FORWARD -p 6 -s 154.4.83.108 -d 235.60.161.56 --sport 28091 --dport 12267 -j DROP
iptables -A test2 -p 6 -d 156.101.51.0/24 --sport 50995 -j DROP
iptables -A test3 -p 6 --dport 24164 -s 203.156.199.6 --sport 12208 -j DROP
iptables -A INPUT -s 0.125.238.0/24 -j DROP
iptables -A OUTPUT -s 76.157.144.228 -j ACCEPT
iptables -A test3 -p 6 --sport 63866 -d 33.187.56.250 -j DROP
iptables -A OUTPUT -p 6 --dport 35936 -d 31.245.113.79 --sport 27374 -j ACCEPT
iptables -A FORWARD -s 140.173.82.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 17208 -s 221.116.241.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 34719 --dport 18635 -d 47.53.84.138 -j DROP
iptables -A INPUT -p 6 -d 42.0.0.0/8 --sport 52789 -j DROP
iptables -A test2 -p 6 --dport 11369 -j ACCEPT
iptables -A test3 -p 6 -d 132.115.203.242 --dport 53871 --sport 14366 -j ACCEPT
iptables -A test1 -p 6 -s 221.132.0.0/16 --sport 9004 -d 97.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --dport 7147 -s 133.70.71.0/24 --sport 5780 -j DROP
iptables -A test2 -p 6 --dport 14811 --sport 38628 -d 231.230.103.189 -s 122.140.232.48 -j DROP
iptables -A OUTPUT -p 6 --sport 31568 -s 0.0.0.0/8 --dport 38277 -d 154.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --dport 201 -j ACCEPT
iptables -A INPUT -p 6 --dport 48756 -s 21.120.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 34159 -d 26.208.97.30 -s 167.14.234.142 -j ACCEPT
iptables -A test2 -p 17 -d 44.201.65.234 --dport 48093 --sport 27288 -j DROP
iptables -A test1 -p 6 --dport 20532 -j ACCEPT
iptables -A INPUT -s 112.254.112.182 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 44654 --dport 35968 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 6003 --sport 55825 -d 190.0.0.0/8 -j DROP
iptables -A test1 -s 31.252.75.118 -j ACCEPT
iptables -A test2 -s 166.142.198.57 -j DROP
iptables -A OUTPUT -p 6 --dport 17013 -j ACCEPT
iptables -A test1 -p 6 --dport 49897 --sport 37656 -j DROP
iptables -A FORWARD -p 6 --dport 26483 --sport 55318 -s 65.54.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -d 164.170.0.0/16 --sport 58530 -s 95.20.216.23 -j ACCEPT
iptables -A test1 -p 44 -j ACCEPT
iptables -A FORWARD -p 6 --sport 13256 -d 100.0.0.0/8 -j ACCEPT
iptables -A test1 -s 27.18.223.54 -p 217 -j ACCEPT
iptables -A test3 -p 6 --dport 46594 --sport 161 -j DROP
iptables -A test1 -p 17 --sport 8068 -d 111.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 -d 250.226.150.65 --dport 46327 -s 193.123.249.247 -j DROP
iptables -A OUTPUT -p 6 --sport 58809 -d 234.108.215.247 -j ACCEPT
iptables -A test2 -s 97.211.201.0/24 -p 100 -j ACCEPT
iptables -A test2 -p 6 --sport 21163 --dport 26982 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 51567 -j ACCEPT
iptables -A FORWARD -p 17 -s 6.248.177.178 -d 7.46.0.0/16 --sport 20752 -j ACCEPT
iptables -A FORWARD -p 17 -s 70.0.0.0/8 --sport 51495 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 26385 -d 87.65.120.20 -j DROP
iptables -A OUTPUT -p 17 -d 93.184.0.0/16 --sport 24573 -s 250.0.0.0/8 -j DROP
iptables -A test1 -p 6 --sport 13920 -j DROP
iptables -A FORWARD -p 6 --dport 22764 -j ACCEPT
iptables -A INPUT -p 6 --dport 57835 -j DROP
iptables -A INPUT -d 159.50.167.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 12585 -d 142.0.0.0/8 -s 0.131.0.0/16 --dport 10809 -j ACCEPT
iptables -A FORWARD -p 17 --sport 44924 -d 89.0.0.0/8 -j DROP
iptables -A test3 -s 112.85.58.139 -p 143 -d 207.71.104.0/24 -j DROP
iptables -A test2 -p 6 --sport 52619 -d 99.59.9.144 --dport 16439 -j ACCEPT
iptables -A test1 -d 207.207.76.0/24 -j DROP
iptables -A test2 -p 6 --sport 7424 --dport 7350 -s 190.246.73.94 -j DROP
iptables -A test1 -d 13.59.190.96 -p 44 -j ACCEPT
iptables -A FORWARD -p 17 --dport 5518 -j ACCEPT
iptables -A test3 -d 70.69.176.11 -s 165.49.44.97 -p 66 -j ACCEPT
iptables -A OUTPUT -p 17 -d 63.21.0.0/16 --dport 62466 -j ACCEPT
iptables -A FORWARD -p 6 -d 62.82.57.120 --sport 32741 -s 252.37.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 51443 -j ACCEPT
iptables -A FORWARD -p 17 --sport 18940 -d 164.110.218.40 -j DROP
iptables -A test1 -s 14.50.210.0/24 -j DROP
iptables -A INPUT -p 119 -d 235.250.232.12 -s 3.217.44.88 -j ACCEPT
iptables -A FORWARD -p 6 --sport 28266 -s 165.3.183.114 -d 210.0.0.0/8 -j DROP
iptables -A test1 -p 17 --dport 9609 --sport 28841 -s 176.249.0.0/16 -j DROP
iptables -A test1 -p 6 --sport 22842 --dport 53336 -s 48.70.39.0/24 -j ACCEPT
iptables -A OUTPUT -s 140.0.0.0/8 -p 31 -j DROP
iptables -A INPUT -s 32.18.157.49 -d 117.124.184.181 -j ACCEPT
iptables -A test3 -p 17 --dport 24266 -d 28.156.167.102 -j DROP
iptables -A test1 -p 17 --sport 61312 -d 40.14.0.0/16 -j DROP
iptables -A INPUT -p 109 -j ACCEPT
iptables -A INPUT -p 17 -s 235.0.0.0/8 --sport 5727 -j DROP
iptables -A FORWARD -s 0.0.0.0/8 -j DROP
iptables -A test2 -p 6 --dport 39161 -s 3.231.201.220 -d 155.0.0.0/8 -j DROP
iptables -A INPUT -s 119.68.208.119 -d 229.12.16.78 -j DROP
iptables -A FORWARD -p 6 -s 244.33.0.0/16 -d 24.0.0.0/8 --sport 20415 -j ACCEPT
iptables -A FORWARD -p 6 --sport 37784 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 7028 --dport 48595 -s 174.204.0.0/16 -j DROP
iptables -A OUTPUT -s 229.168.0.0/16 -j DROP
iptables -A test2 -d 23.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -d 212.148.57.0/24 -p 38 -j DROP
iptables -A test2 -p 6 --sport 51371 --dport 50665 -d 55.134.163.70 -j DROP
iptables -A test1 -p 6 --sport 15361 -s 50.234.47.179 -j ACCEPT
iptables -A test1 -d 33.49.52.111 -p 119 -j ACCEPT
iptables -A test2 -p 6 -s 255.204.0.0/16 --dport 27049 -j ACCEPT
iptables -A test1 -p 6 --sport 40254 --dport 13524 -s 59.0.0.0/8 -j ACCEPT
iptables -A test1 -s 41.171.0.0/16 -p 196 -j DROP
iptables -A OUTPUT -p 17 --dport 25457 -j DROP
iptables -A test2 -p 17 -d 90.92.232.17 --sport 14420 -j DROP
iptables -A FORWARD -p 17 --dport 47199 -d 6.82.88.90 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 9551 -s 25.170.251.0/24 -j DROP
iptables -A test1 -p 6 --sport 8421 --dport 10986 -j ACCEPT
iptables -A test2 -d 54.44.40.12 -p 152 -s 244.249.133.0/24 -j DROP
iptables -A test1 -p 228 -j DROP
iptables -A FORWARD -d 197.142.169.129 -j ACCEPT
iptables -A INPUT -p 6 --dport 21436 -j ACCEPT
iptables -A INPUT -p 6 -s 216.0.0.0/8 --dport 43069 -j DROP
iptables -A test2 -p 17 --dport 59580 -j ACCEPT
iptables -A INPUT -p 17 --dport 19356 -s 167.37.29.0/24 -j ACCEPT
iptables -A INPUT -p 6 --sport 5591 -j ACCEPT
iptables -A test2 -p 17 --dport 35577 --sport 33842 -s 147.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 -d 133.174.67.209 -s 91.52.54.47 --sport 62073 -j DROP
iptables -A test3 -p 6 --sport 2233 --dport 34605 -j ACCEPT
iptables -A test3 -p 17 -d 93.0.0.0/8 --dport 18408 -s 13.128.120.219 --sport 63054 -j DROP
iptables -A INPUT -d 10.157.206.128 -j ACCEPT
iptables -A INPUT -p 185 -d 163.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 -d 85.208.0.0/16 --dport 33185 -j ACCEPT
iptables -A test2 -p 17 -d 111.194.0.0/16 --sport 43644 --dport 2381 -j DROP
iptables -A FORWARD -p 17 --dport 40767 -s 88.38.47.206 -d 9.132.179.2 -j test1
iptables -A test2 -d 185.230.126.89 -j ACCEPT
iptables -A test3 -p 17 -s 163.75.184.184 --dport 16399 --sport 13349 -j ACCEPT
iptables -A test1 -p 6 --sport 52228 -s 198.65.0.0/16 --dport 53697 -j ACCEPT
iptables -A OUTPUT -d 147.198.247.39 -j DROP
iptables -A test2 -s 51.249.66.40 -j ACCEPT
iptables -A test1 -p 6 --sport 53653 -d 91.0.163.23 -s 235.0.0.0/8 -j DROP
iptables -A test1 -p 6 -s 192.249.0.0/16 -d 124.116.54.0/24 --dport 24480 -j ACCEPT
iptables -A test2 -p 6 -s 202.27.144.249 --dport 15815 --sport 49060 -j DROP
iptables -A test1 -p 17 -s 94.17.100.84 --sport 11432 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 25631 -d 108.183.192.159 -s 187.147.143.134 -j ACCEPT
iptables -A INPUT -p 6 --dport 60068 -j ACCEPT
iptables -A test1 -p 6 --dport 61814 --sport 14379 -j ACCEPT
iptables -A test3 -p 6 -d 21.39.231.38 -s 53.0.0.0/8 --dport 59391 -j DROP
iptables -A OUTPUT -s 119.69.247.143 -j DROP
iptables -A FORWARD -p 6 --dport 42329 -s 203.0.0.0/8 -d 82.103.182.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 31910 -s 99.81.68.0/24 -j ACCEPT
iptables -A INPUT -p 6 --dport 64799 -j DROP
iptables -A OUTPUT -p 6 --sport 24126 -s 157.0.0.0/8 -j DROP
iptables -A INPUT -s 224.56.227.175 -j ACCEPT
iptables -A OUTPUT -p 243 -j DROP
iptables -A OUTPUT -p 202 -j DROP
iptables -A test1 -p 17 --dport 14850 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 29874 --dport 16790 -j ACCEPT
iptables -A FORWARD -p 6 --sport 10420 -d 240.254.50.220 --dport 30597 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 63809 -s 60.58.9.149 --dport 16129 -j DROP
iptables -A test2 -p 17 -s 129.0.0.0/8 --dport 35933 --sport 40655 -j DROP
iptables -A INPUT -p 17 -d 43.171.0.0/16 --dport 15990 -s 60.15.231.38 -j DROP
iptables -A test1 -d 160.71.156.26 -j DROP
iptables -A test3 -p 17 --dport 27990 -d 122.197.226.68 --sport 61716 -j DROP
iptables -A FORWARD -p 17 -s 211.152.0.0/16 --sport 24456 -j DROP
iptables -A FORWARD -p 17 --dport 28381 -d 56.163.112.64 -s 163.0.0.0/8 --sport 26726 -j ACCEPT
iptables -A test2 -p 17 --sport 27648 -j DROP
iptables -A INPUT -p 17 -d 57.53.124.100 -s 249.196.234.229 --dport 41523 -j ACCEPT
iptables -A test2 -p 6 --dport 45588 -d 140.97.211.42 -j DROP
iptables -A test3 -p 17 --sport 18809 -s 184.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 56555 -d 234.131.0.0/16 --sport 8640 -j ACCEPT
iptables -A test1 -p 17 -d 140.135.139.117 --sport 9424 -j ACCEPT
iptables -A test3 -p 17 -s 59.5.41.0/24 --sport 59902 -j ACCEPT
iptables -A INPUT -s 60.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 -s 149.0.0.0/8 --dport 57285 -j ACCEPT
iptables -A OUTPUT -p 17 -s 85.0.0.0/8 --dport 17723 --sport 49255 -j ACCEPT
iptables -A test1 -s 249.192.241.0/24 -j ACCEPT
iptables -A INPUT -p 6 --sport 13007 -d 17.253.22.195 -j ACCEPT
iptables -A test3 -p 6 --dport 19407 --sport 57256 -s 15.172.185.0/24 -j ACCEPT
iptables -A test3 -p 6 --dport 52573 -j DROP
iptables -A test3 -p 6 --dport 55936 -j DROP
iptables -A OUTPUT -p 6 -s 160.160.79.0/24 -d 239.0.0.0/8 --dport 30768 -j DROP
iptables -A INPUT -p 6 --dport 64800 -j ACCEPT
iptables -A test2 -p 128 -s 165.38.243.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -s 159.156.59.0/24 --dport 35608 -j ACCEPT
iptables -A test1 -p 17 --sport 11904 --dport 30852 -d 138.217.0.0/16 -j ACCEPT
iptables -A FORWARD -p 56 -j ACCEPT
iptables -A FORWARD -d 80.72.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --dport 55028 -s 15.67.33.133 --sport 27568 -d 81.163.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --dport 33925 --sport 52808 -d 37.162.152.182 -j DROP
iptables -A FORWARD -p 17 -d 248.0.138.0/24 --sport 4318 --dport 49340 -j ACCEPT
iptables -A FORWARD -p 6 -s 5.0.0.0/8 --dport 20523 --sport 62126 -j DROP
iptables -A FORWARD -p 6 -d 88.219.0.0/16 -s 230.146.48.1 --sport 63144 --dport 45182 -j DROP
iptables -A INPUT -p 17 --sport 62365 -s 180.240.129.104 -j ACCEPT
iptables -A FORWARD -p 17 --dport 22314 -s 93.178.149.146 --sport 53621 -j DROP
iptables -A test3 -s 84.177.107.211 -j DROP
iptables -A test2 -p 17 --sport 43591 -j DROP
iptables -A OUTPUT -p 17 --dport 47876 -j DROP
iptables -A test3 -p 6 -s 155.146.169.39 -d 48.0.0.0/8 --dport 3936 -j DROP
iptables -A test3 -p 17 --sport 10551 -d 152.41.116.0/24 --dport 21337 -j DROP
iptables -A INPUT -p 6 --dport 16689 -s 129.53.0.0/16 -d 187.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --dport 44645 -j DROP
iptables -A test1 -p 17 --sport 25865 -j ACCEPT
iptables -A test2 -p 6 --dport 51641 -j DROP
iptables -A OUTPUT -p 17 --dport 61949 -d 150.84.82.12 -s 56.251.78.57 -j DROP
iptables -A test1 -p 17 --sport 6591 --dport 5407 -s 91.122.102.43 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 1852 -j ACCEPT
iptables -A FORWARD -p 194 -j DROP
iptables -A test2 -d 105.74.0.0/16 -p 128 -j DROP
iptables -A test3 -p 17 -d 205.146.163.216 --dport 28494 -s 172.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --sport 20567 -s 198.149.73.48 -j test2
iptables -A test3 -p 6 -s 109.78.45.246 -d 121.169.125.49 --dport 11320 -j ACCEPT
iptables -A FORWARD -p 17 --dport 62966 --sport 8229 -j DROP
iptables -A INPUT -d 138.133.0.0/16 -p 207 -s 40.238.48.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 34276 --dport 28260 -j DROP
iptables -A FORWARD -p 17 --dport 49530 --sport 6111 -s 40.147.231.71 -j DROP
iptables -A INPUT -p 6 -s 46.171.0.0/16 --sport 40721 -j DROP
iptables -A test1 -p 17 -d 22.174.142.80 --sport 64456 -j ACCEPT
iptables -A OUTPUT -p 87 -d 63.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 -d 238.190.86.0/24 --dport 11582 -j DROP
iptables -A FORWARD -p 17 --dport 19657 -s 189.181.78.231 -j DROP
iptables -A test1 -s 120.48.238.233 -j DROP
iptables -A test3 -p 17 --dport 9140 -j ACCEPT
iptables -A INPUT -p 6 --sport 22021 -d 137.125.199.252 -s 147.0.0.0/8 -j ACCEPT
iptables -A INPUT -d 83.0.0.0/8 -j DROP
iptables -A test2 -p 113 -j ACCEPT
iptables -A OUTPUT -p 17 -d 216.0.0.0/8 --dport 45495 -s 86.17.151.0/24 -j test2
iptables -A INPUT -p 6 -d 248.0.0.0/8 --sport 43559 --dport 30425 -j ACCEPT
iptables -A INPUT -p 17 --sport 31686 -d 44.51.189.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 -d 154.201.0.0/16 --sport 33520 --dport 57961 -j DROP
iptables -A OUTPUT -p 17 --sport 36922 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 44153 --sport 3940 -s 63.195.27.236 -j DROP
iptables -A FORWARD -p 17 --sport 45300 -d 225.100.46.173 -j DROP
iptables -A test1 -p 17 --dport 47001 -d 238.120.171.181 -j ACCEPT
iptables -A test1 -d 157.160.148.131 -s 136.58.88.28 -j DROP
iptables -A test3 -p 17 --dport 47221 -j ACCEPT
iptables -A FORWARD -d 105.201.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 52738 --sport 42964 -j ACCEPT
iptables -A test2 -p 6 -s 137.94.137.135 -d 37.75.136.92 --dport 1698 -j DROP
iptables -A test1 -d 169.63.226.236 -s 57.158.23.68 -j DROP
iptables -A test1 -p 6 --dport 2830 -d 125.8.0.78 -j ACCEPT
iptables -A test3 -p 6 --sport 17545 -j DROP
iptables -A FORWARD -d 164.0.0.0/8 -p 223 -j DROP
iptables -A INPUT -p 6 -d 107.158.215.0/24 -s 152.201.94.104 --sport 58911 -j ACCEPT
iptables -A test1 -d 42.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 54749 -j DROP
iptables -A test2 -p 17 --sport 6441 -d 39.160.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 49998 -j DROP
iptables -A OUTPUT -p 17 --sport 31789 -s 81.0.0.0/8 --dport 16133 -j DROP
iptables -A test1 -p 6 --dport 17645 --sport 30222 -j DROP
iptables -A test3 -p 17 -s 244.243.118.188 --dport 24885 -j ACCEPT
iptables -A test1 -s 141.228.118.44 -d 228.0.0.0/8 -j ACCEPT
iptables -A INPUT -d 182.80.123.0/24 -p 59 -j ACCEPT
iptables -A test1 -p 6 --dport 43479 -d 120.0.0.0/8 --sport 13294 -j DROP
iptables -A OUTPUT -p 6 --dport 49877 --sport 10954 -j DROP
iptables -A FORWARD -p 17 --dport 38827 -j DROP
iptables -A FORWARD -p 17 --dport 48093 -j DROP
iptables -A test1 -p 17 -d 68.2.0.0/16 --sport 30296 --dport 9459 -j ACCEPT
iptables -A OUTPUT -p 17 -d 106.152.94.0/24 -s 235.230.0.0/16 --dport 1960 -j DROP
iptables -A INPUT -p 6 --sport 30444 --dport 64654 -d 180.149.143.75 -j DROP
iptables -A INPUT -p 180 -j ACCEPT
iptables -A test3 -p 172 -d 23.15.90.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -d 242.80.0.0/16 -s 149.224.202.130 --dport 27594 --sport 9170 -j ACCEPT
iptables -A test3 -d 162.158.150.57 -j DROP
iptables -A test3 -p 17 --dport 31519 -j ACCEPT
iptables -A FORWARD -p 17 --sport 50262 --dport 23721 -j ACCEPT
iptables -A test1 -p 17 -s 20.207.80.21 -d 164.31.73.135 --sport 29358 -j DROP
iptables -A OUTPUT -p 17 -s 133.0.0.0/8 --dport 61473 -j ACCEPT
iptables -A INPUT -p 17 -d 190.216.0.0/16 --sport 56755 --dport 24020 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 60152 -j DROP
iptables -A test3 -d 102.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --dport 61291 -d 233.13.38.213 -j ACCEPT
iptables -A test2 -p 6 -s 93.188.0.0/16 --dport 2984 -j DROP
iptables -A test3 -p 6 --sport 16144 --dport 3172 -j DROP
iptables -A test1 -p 17 -d 204.112.3.184 -s 147.56.0.0/16 --dport 34617 -j DROP
iptables -A test3 -p 17 -s 219.80.238.0/24 --sport 23691 --dport 48127 -j ACCEPT
iptables -A test3 -p 6 -d 253.98.192.52 --dport 3966 --sport 61830 -j DROP
iptables -A test3 -p 6 --sport 26716 --dport 63407 -d 144.133.0.0/16 -s 16.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -s 242.40.107.108 --dport 461 --sport 65275 -j DROP
iptables -A OUTPUT -p 17 -s 68.159.171.0/24 --dport 34182 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 56051 -d 121.0.0.0/8 -s 247.177.113.165 -j DROP
iptables -A test3 -p 6 --dport 52301 -s 230.56.251.116 -d 0.2.232.83 -j ACCEPT
iptables -A INPUT -p 17 -s 139.151.144.50 --dport 17623 --sport 57234 -j ACCEPT
iptables -A INPUT -p 6 -d 184.0.0.0/8 --sport 34318 -s 244.240.26.0/24 -j DROP
iptables -A test1 -p 6 --sport 3701 -s 19.88.204.216 -d 239.249.0.0/16 --dport 25292 -j DROP
iptables -A test2 -p 243 -j DROP
iptables -A test1 -p 17 --dport 37878 --sport 21860 -j DROP
iptables -A test2 -p 6 --sport 16224 -s 134.213.190.5 -j DROP
iptables -A test1 -p 6 -s 251.194.211.153 --dport 33115 -j DROP
iptables -A test1 -p 6 --dport 1425 --sport 14787 -d 114.50.173.38 -j DROP
iptables -A test1 -p 17 -s 70.0.0.0/8 --sport 24067 --dport 62158 -j ACCEPT
iptables -A INPUT -p 17 --dport 42292 -d 83.109.180.149 -s 93.22.249.89 -j ACCEPT
iptables -A test1 -p 17 --sport 4491 -s 215.182.161.105 --dport 50819 -j DROP
iptables -A test2 -p 17 --sport 57092 -j DROP
iptables -A test2 -p 6 --dport 61914 -j DROP
iptables -A INPUT -d 231.51.99.0/24 -p 2 -j DROP
iptables -A OUTPUT -p 6 -s 212.77.152.116 --sport 48183 -j DROP
iptables -A test2 -p 6 -d 50.25.63.154 --dport 31421 --sport 38443 -j ACCEPT
iptables -A FORWARD -p 252 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 24028 -s 185.111.71.151 -j DROP
iptables -A test2 -p 6 --dport 54597 -d 76.44.61.75 -s 136.205.190.0/24 --sport 20947 -j DROP
iptables -A INPUT -p 17 -s 182.21.104.11 --dport 57337 -d 188.206.9.157 -j ACCEPT
iptables -A FORWARD -p 17 --sport 57420 -j ACCEPT
iptables -A INPUT -p 17 -s 134.131.124.185 --dport 21351 -d 100.114.195.0/24 -j ACCEPT
iptables -A test2 -p 17 -s 23.149.240.159 -d 141.227.208.0/24 --dport 65493 -j ACCEPT
iptables -A INPUT -p 17 --dport 11549 -s 244.182.244.0/24 -j test3
iptables -A test3 -p 6 --sport 21016 -j DROP
iptables -A FORWARD -p 17 -s 56.32.0.0/16 --sport 42440 -j ACCEPT
iptables -A test3 -s 129.102.229.92 -d 145.0.0.0/16 -p 179 -j DROP
iptables -A INPUT -p 17 --sport 43104 --dport 10316 -s 62.195.185.56 -j DROP
iptables -A OUTPUT -p 199 -j DROP
iptables -A test1 -p 75 -s 89.13.249.62 -d 232.1.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 -s 91.0.0.0/8 --sport 35676 -d 72.238.115.97 -j ACCEPT
iptables -A test3 -d 8.100.0.0/16 -s 33.195.45.48 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 11617 -s 203.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --dport 56293 -s 86.68.63.106 -d 135.197.116.218 -j DROP
iptables -A test2 -p 17 -s 129.28.211.72 --dport 53307 --sport 43643 -d 71.158.0.0/16 -j DROP
iptables -A FORWARD -p 6 --sport 16586 -s 7.233.69.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 32124 --sport 62704 -s 194.174.243.93 -d 11.0.0.0/8 -j ACCEPT
iptables -A test3 -s 79.92.25.92 -j DROP
iptables -A FORWARD -p 6 -d 197.153.105.123 --dport 20274 --sport 58213 -j DROP
iptables -A test1 -p 6 -s 229.184.247.214 --dport 41600 -d 71.14.20.0/24 --sport 10210 -j ACCEPT
iptables -A OUTPUT -d 128.93.161.253 -j DROP
iptables -A INPUT -s 27.4.251.19 -j test1
iptables -A test3 -p 140 -d 113.186.76.0/24 -j ACCEPT
iptables -A test3 -p 17 --sport 18461 --dport 14226 -j DROP
iptables -A FORWARD -p 17 --sport 56235 -j ACCEPT
iptables -A test2 -p 184 -j DROP
iptables -A INPUT -p 226 -d 151.52.0.0/16 -s 50.40.31.98 -j ACCEPT
iptables -A FORWARD -p 6 --sport 15220 -j DROP
iptables -A test3 -p 17 --dport 61631 -j DROP
iptables -A OUTPUT -p 6 --dport 25393 -s 30.68.75.41 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 7401 -j ACCEPT
iptables -A INPUT -p 6 --sport 6746 -s 79.48.52.0/24 -j ACCEPT
iptables -A test3 -p 17 --sport 59711 -j ACCEPT
iptables -A test2 -p 17 --sport 25822 -d 164.0.0.0/8 -s 161.152.210.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 699 -j ACCEPT
iptables -A FORWARD -s 35.77.79.50 -j DROP
iptables -A test2 -p 17 --sport 60788 -j DROP
iptables -A test1 -p 17 -d 78.171.144.161 --sport 44014 -j DROP
iptables -A INPUT -p 17 -s 71.144.0.0/16 -d 100.7.0.0/16 --sport 64147 -j ACCEPT
iptables -A test1 -p 17 -d 44.5.67.0/24 --sport 65368 -j ACCEPT
iptables -A test2 -p 6 --sport 21390 -j ACCEPT
iptables -A INPUT -p 17 --sport 39870 -s 56.237.95.0/24 --dport 29621 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 64444 -d 193.59.96.0/24 -j ACCEPT
iptables -A FORWARD -d 118.12.219.0/24 -s 144.126.101.211 -j DROP
iptables -A FORWARD -p 6 -s 147.158.0.0/16 --sport 11676 --dport 48129 -j ACCEPT
iptables -A test2 -p 6 -s 217.58.223.0/24 -d 176.0.0.0/8 --dport 52211 -j ACCEPT
iptables -A OUTPUT -p 17 -d 136.40.119.197 --dport 43416 -j ACCEPT
iptables -A test2 -p 6 -s 36.0.0.0/8 --sport 18044 --dport 47142 -j ACCEPT
iptables -A test3 -p 6 --dport 64385 -d 190.230.22.115 -s 222.54.16.74 -j DROP
iptables -A test1 -p 6 -d 228.172.107.91 --sport 2935 -j DROP
iptables -A test3 -p 17 --sport 19835 -j DROP
iptables -A test2 -p 6 --dport 39673 -j ACCEPT
iptables -A test3 -p 6 --dport 18020 -j ACCEPT
iptables -A INPUT -p 6 --sport 4472 -j DROP
iptables -A test1 -s 234.88.86.204 -j ACCEPT
iptables -A FORWARD -p 6 -d 24.253.16.0/24 -s 179.58.106.247 --sport 22873 -j DROP
iptables -A test1 -p 17 --sport 31742 -s 192.163.63.254 -j DROP
iptables -A OUTPUT -p 6 --sport 40777 -d 113.223.148.46 --dport 25809 -j DROP
iptables -A OUTPUT -p 6 --sport 37099 -d 144.92.121.211 -j test1
iptables -A test2 -s 108.241.93.41 -p 183 -j ACCEPT
iptables -A test2 -p 6 --dport 65097 -d 247.170.188.123 -s 168.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --dport 5671 -j ACCEPT
iptables -A FORWARD -d 138.94.254.190 -s 235.191.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --sport 22720 --dport 6400 -j DROP
iptables -A test1 -p 17 -d 232.187.198.230 --dport 9810 -s 205.189.147.70 -j DROP
iptables -A test1 -p 17 -s 31.112.0.0/16 --dport 54026 -j ACCEPT
iptables -A test3 -p 6 -d 118.215.151.68 --sport 60219 -j ACCEPT
iptables -A FORWARD -p 6 -d 123.238.71.2 --sport 5721 --dport 35021 -j DROP
iptables -A test3 -p 17 -d 239.102.113.161 --sport 65454 -j DROP
iptables -A INPUT -p 17 --dport 58726 -s 246.156.0.0/16 --sport 230 -j ACCEPT
iptables -A test1 -s 163.233.201.218 -j ACCEPT
iptables -A test1 -p 6 -d 81.8.19.152 -s 52.0.0.0/8 --dport 41616 -j ACCEPT
iptables -A FORWARD -p 17 --dport 44174 --sport 43095 -d 75.123.41.174 -j ACCEPT
iptables -A INPUT -p 17 -s 178.0.0.0/8 --sport 63157 --dport 3553 -j DROP
iptables -A OUTPUT -p 17 --dport 39399 -j DROP
iptables -A test3 -p 17 --sport 52637 -d 62.34.172.39 --dport 56948 -j ACCEPT
iptables -A FORWARD -p 6 --dport 53012 -j DROP
iptables -A OUTPUT -p 17 -s 253.5.221.0/24 --dport 52988 -j ACCEPT
iptables -A INPUT -p 6 -d 53.3.40.63 --sport 50538 -s 194.13.77.198 -j ACCEPT
iptables -A INPUT -p 17 --dport 29269 -j ACCEPT
iptables -A INPUT -p 6 --dport 51638 -j ACCEPT
iptables -A test1 -d 125.213.250.103 -p 65 -j ACCEPT
iptables -A test3 -p 6 -d 6.119.38.0/24 --dport 35043 -s 197.245.234.0/24 -j ACCEPT
iptables -A test2 -p 17 -d 109.145.54.0/24 --dport 28626 --sport 31164 -j DROP
iptables -A test2 -p 17 --sport 14386 -d 63.32.0.0/16 -s 65.129.190.0/24 -j DROP
iptables -A INPUT -p 6 --sport 45499 -d 0.12.31.230 -s 125.229.0.0/16 -j ACCEPT
iptables -A test1 -p 17 -s 86.0.0.0/8 --sport 19054 -d 221.204.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 38671 --sport 27065 -j ACCEPT
iptables -A FORWARD -p 17 -s 178.49.2.247 -d 42.43.205.152 --sport 35139 -j ACCEPT
iptables -A test3 -p 6 --dport 33302 -j ACCEPT
iptables -A test2 -s 35.172.157.0/24 -j DROP
iptables -A test1 -p 17 -s 64.62.140.219 --dport 46094 -j DROP
iptables -A FORWARD -p 17 -d 110.97.78.120 --sport 10987 --dport 50534 -s 211.182.116.0/24 -j ACCEPT
iptables -A test2 -p 17 --dport 41713 -d 163.127.62.118 -s 13.113.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --sport 62174 -s 149.197.215.82 -j ACCEPT
iptables -A FORWARD -p 17 --sport 33536 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 8625 -j ACCEPT
iptables -A INPUT -p 17 -s 72.244.0.0/16 --dport 41587 -d 87.161.81.151 -j DROP
iptables -A test2 -p 6 --dport 55384 -s 210.51.6.0/24 -j DROP
iptables -A test2 -p 6 --dport 48287 --sport 36364 -s 82.174.151.250 -j DROP
iptables -A test3 -p 6 --dport 2407 -d 204.102.200.176 --sport 49944 -j DROP
iptables -A test3 -d 34.175.75.132 -j DROP
iptables -A OUTPUT -p 6 -d 93.159.255.0/24 --sport 30321 -s 91.10.0.0/16 -j DROP
iptables -A test3 -p 25 -j ACCEPT
iptables -A FORWARD -p 17 --dport 4051 -s 95.112.48.161 -j ACCEPT
iptables -A test3 -p 6 --dport 2642 -j DROP
iptables -A test3 -p 6 --sport 11068 -d 114.225.147.0/24 --dport 62037 -j DROP
iptables -A test1 -p 6 -d 166.245.165.0/24 --sport 14710 -s 73.153.124.0/24 -j DROP
iptables -A FORWARD -p 35 -d 223.100.0.0/16 -j DROP
iptables -A FORWARD -p 17 -d 132.127.89.2 --sport 44040 -s 118.10.115.172 -j ACCEPT
iptables -A INPUT -p 6 --dport 22648 --sport 12738 -s 46.158.186.0/24 -j ACCEPT
iptables -A INPUT -p 17 --sport 18112 -d 6.231.169.88 --dport 14159 -j ACCEPT
iptables -A INPUT -p 6 -d 76.182.218.0/24 --sport 64715 --dport 33894 -j ACCEPT
iptables -A test3 -p 17 --sport 46164 --dport 35303 -s 1.86.0.0/16 -j DROP
iptables -A test1 -p 17 --sport 29654 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 22453 -d 236.200.101.142 -j DROP
iptables -A test2 -p 6 -d 78.126.122.202 --sport 35528 -j ACCEPT
iptables -A INPUT -d 125.227.162.129 -p 200 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 9211 --dport 33140 -j ACCEPT
iptables -A INPUT -p 6 --sport 11900 -d 230.201.27.31 --dport 20676 -j DROP
iptables -A INPUT -p 6 --sport 33767 -d 158.155.126.0/24 -j DROP
iptables -A test3 -p 74 -s 19.20.109.94 -j ACCEPT
iptables -A INPUT -p 17 --dport 39452 --sport 44579 -j DROP
iptables -A INPUT -p 6 --sport 63226 -s 209.207.35.65 --dport 47170 -j DROP
iptables -A test2 -p 17 -s 144.192.239.215 --sport 8510 -d 9.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -d 68.74.235.0/24 -s 149.192.0.0/16 --dport 51937 -j DROP
iptables -A test3 -p 17 -s 35.34.179.0/24 -d 212.109.231.3 --sport 9074 -j DROP
iptables -A test1 -p 17 --dport 26289 -s 154.173.106.163 -j DROP
iptables -A INPUT -s 14.154.252.109 -j DROP
iptables -A test1 -p 6 -d 19.78.0.0/16 --sport 43591 -j ACCEPT
iptables -A INPUT -p 6 --sport 19089 --dport 6619 -d 18.183.213.136 -s 174.91.73.59 -j DROP
iptables -A OUTPUT -d 16.227.3.0/24 -j ACCEPT
iptables -A test3 -s 82.159.159.193 -j ACCEPT
iptables -A test1 -p 6 --sport 50599 -j DROP
iptables -A FORWARD -p 6 --dport 1959 -d 45.71.29.179 -j DROP
iptables -A INPUT -d 65.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 23815 --sport 39508 -j ACCEPT
iptables -A test1 -p 6 -d 113.4.0.0/16 -s 207.207.108.108 --sport 62229 -j DROP
iptables -A test3 -p 6 -s 35.25.146.102 -d 129.78.155.240 --dport 53728 -j DROP
iptables -A test2 -p 17 -s 70.0.0.0/8 --dport 10770 -j DROP
iptables -A INPUT -p 17 --sport 16740 --dport 8240 -d 188.244.250.26 -s 11.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --dport 28624 -s 84.0.0.0/8 -d 128.17.148.207 -j test3
iptables -A FORWARD -p 17 --dport 5656 -j DROP
iptables -A OUTPUT -p 6 --dport 41474 -s 2.166.176.36 -j DROP
iptables -A OUTPUT -p 6 --dport 33054 -d 29.132.0.0/16 -s 14.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 -d 191.0.0.0/8 --sport 60985 -s 144.1.0.0/16 -j DROP
iptables -A test2 -p 6 --dport 41532 -j ACCEPT
iptables -A test1 -p 6 --sport 40004 -s 191.219.149.122 -d 31.160.115.0/24 -j DROP
iptables -A FORWARD -s 195.101.228.146 -j test1
iptables -A OUTPUT -p 17 -d 153.61.173.0/24 --dport 38833 -s 103.235.100.0/24 -j DROP
iptables -A OUTPUT -p 6 -s 34.253.217.202 -d 37.209.218.0/24 --dport 52292 -j test3
iptables -A test1 -p 17 --dport 17395 -s 162.143.39.58 -j ACCEPT
iptables -A INPUT -p 162 -j DROP
iptables -A OUTPUT -d 63.232.194.53 -j DROP
iptables -A test3 -p 6 --sport 22287 -j DROP
iptables -A INPUT -p 17 -d 48.30.10.33 --sport 43144 -j DROP
iptables -A test2 -p 6 --sport 32579 -j ACCEPT
iptables -A test2 -p 17 --sport 59253 -s 240.224.120.18 -j ACCEPT
iptables -A test1 -s 170.236.185.68 -j ACCEPT
iptables -A test1 -p 17 -d 175.4.102.0/24 --sport 49182 -j ACCEPT
iptables -A OUTPUT -p 6 -s 199.87.27.138 --dport 12717 --sport 1796 -d 2.62.0.0/16 -j ACCEPT
iptables -A test1 -p 17 -d 141.235.141.0/24 -s 247.136.0.0/16 --dport 14979 -j ACCEPT
iptables -A test2 -s 69.238.0.0/16 -d 136.132.0.0/16 -j DROP
iptables -A test1 -p 17 -d 250.46.206.0/24 --dport 61370 -s 5.212.126.0/24 -j ACCEPT
iptables -A test3 -p 17 -d 171.178.0.0/16 --sport 4880 -s 28.0.0.0/8 -j DROP
iptables -A test3 -s 35.0.0.0/8 -j DROP
iptables -A test2 -p 17 -d 221.75.233.0/24 --dport 5292 --sport 26984 -j DROP
iptables -A test1 -p 175 -d 111.0.0.0/8 -j DROP
iptables -A test2 -p 19 -j DROP
iptables -A OUTPUT -p 6 --dport 11468 -j ACCEPT
iptables -A test1 -s 147.167.87.212 -j DROP
iptables -A OUTPUT -d 187.135.4.149 -p 40 -j ACCEPT
iptables -A FORWARD -p 6 --sport 46409 -s 153.0.0.0/8 -d 12.92.241.0/24 -j ACCEPT
iptables -A test2 -p 6 --dport 2746 -s 249.34.98.70 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 37304 -d 29.159.159.5 --sport 846 -j DROP
iptables -A INPUT -p 17 -d 41.255.0.0/16 --dport 25741 -j test2
iptables -A FORWARD -p 6 -s 19.154.127.113 -d 22.204.48.118 --sport 45446 -j DROP
iptables -A test1 -p 6 --sport 55112 -j ACCEPT
iptables -A test1 -p 6 --dport 3112 -d 200.121.159.253 -j DROP
iptables -A OUTPUT -p 6 --dport 18642 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 26085 --sport 44958 -j DROP
iptables -A test2 -p 6 --dport 51515 -s 211.145.131.65 -j ACCEPT
iptables -A INPUT -p 6 --dport 26851 -j DROP
iptables -A OUTPUT -p 6 -s 203.56.53.0/24 --sport 55786 -d 168.108.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 63196 -s 77.24.32.102 --dport 1814 -j DROP
iptables -A OUTPUT -p 17 --dport 32732 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 13207 -s 232.101.183.238 -d 90.98.157.43 -j DROP
iptables -A FORWARD -p 17 --dport 39491 -s 124.201.9.220 -j ACCEPT
iptables -A test3 -p 6 -d 95.250.0.0/16 --sport 29543 -j ACCEPT
iptables -A test1 -p 6 --sport 47846 -j DROP
iptables -A test1 -p 17 --sport 55216 -s 161.240.141.0/24 --dport 16479 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 61925 -s 50.114.224.0/24 -j DROP
iptables -A test3 -p 6 -s 113.77.43.125 --dport 24034 -j DROP
iptables -A test2 -d 227.237.136.184 -s 46.111.118.234 -j ACCEPT
iptables -A test2 -p 6 -d 255.0.0.0/8 -s 64.77.118.3 --dport 56564 -j ACCEPT
iptables -A test2 -p 6 -s 255.128.224.0/24 --sport 9195 -j ACCEPT
iptables -A test2 -p 6 --sport 49596 -s 244.202.217.113 --dport 62201 -j ACCEPT
iptables -A INPUT -p 17 --dport 5887 -j DROP
iptables -A OUTPUT -s 95.118.119.144 -j DROP
iptables -A test1 -p 6 -s 100.90.0.0/16 --sport 35176 --dport 37300 -j DROP
iptables -A test1 -p 17 -s 244.126.0.0/16 -d 1.222.123.133 --dport 12308 -j DROP
iptables -A FORWARD -p 17 --sport 44901 -j DROP
iptables -A INPUT -p 6 -d 2.100.0.0/16 -s 177.161.25.173 --dport 63644 -j DROP
iptables -A OUTPUT -s 247.55.155.139 -p 48 -j DROP
iptables -A test2 -p 6 --dport 15390 -j DROP
iptables -A INPUT -p 6 --sport 60387 -d 142.68.115.28 --dport 8533 -j ACCEPT
iptables -A INPUT -d 105.21.0.0/16 -p 31 -j ACCEPT
iptables -A test1 -d 49.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 49809 -j DROP
iptables -A FORWARD -p 6 --dport 30764 -j DROP
iptables -A test3 -p 6 --dport 48041 --sport 63289 -j ACCEPT
iptables -A test3 -p 6 -d 185.251.72.189 --dport 36025 --sport 24250 -s 20.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 8500 -j ACCEPT
iptables -A test3 -p 78 -j DROP
iptables -A test2 -p 6 --sport 22457 -d 164.90.0.0/16 -s 171.69.230.0/24 --dport 17890 -j ACCEPT
iptables -A FORWARD -p 6 --sport 39464 -j DROP
iptables -A test2 -p 6 --sport 13884 -s 145.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 -d 223.0.0.0/8 --sport 42151 -j ACCEPT
iptables -A INPUT -s 247.210.164.240 -j test1
iptables -A OUTPUT -p 17 --dport 13759 -d 40.8.165.0/24 -j ACCEPT
iptables -A test3 -p 17 -s 227.72.0.0/16 -d 157.183.177.245 --dport 59812 -j ACCEPT
iptables -A test1 -s 8.67.29.98 -p 140 -d 173.61.137.0/24 -j ACCEPT
iptables -A test3 -s 60.24.160.0/24 -j ACCEPT
iptables -A OUTPUT -s 226.131.6.187 -d 105.75.142.37 -j DROP
iptables -A INPUT -p 6 --sport 29411 -d 186.201.112.195 -j ACCEPT
iptables -A test2 -p 6 -s 152.203.0.0/16 --dport 10139 --sport 64116 -j DROP
iptables -A test3 -p 6 --sport 20982 --dport 58510 -j ACCEPT
iptables -A test3 -s 195.36.78.15 -j DROP
iptables -A OUTPUT -p 93 -j ACCEPT
iptables -A test3 -p 253 -j DROP
iptables -A test3 -p 17 --dport 57635 -d 43.238.65.15 -j DROP
iptables -A test2 -s 152.67.129.222 -p 219 -d 197.0.0.0/8 -j DROP
iptables -A test2 -p 17 --dport 49809 -j DROP
iptables -A test1 -p 17 --dport 26657 --sport 46871 -s 63.0.0.0/8 -j DROP
iptables -A test3 -p 6 --dport 2133 --sport 57626 -j ACCEPT
iptables -A FORWARD -p 6 --dport 63372 --sport 54749 -s 76.244.149.139 -j DROP
iptables -A test1 -p 17 --sport 21465 -d 126.22.28.174 --dport 52244 -j DROP
iptables -A INPUT -p 6 --dport 55071 -s 159.146.142.72 -d 220.119.145.0/24 --sport 39841 -j ACCEPT
iptables -A test1 -p 17 --dport 6877 -d 17.125.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -s 229.48.5.0/24 --dport 61572 -j DROP
iptables -A OUTPUT -s 140.178.222.96 -j DROP
iptables -A test1 -p 2 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 50849 -j DROP
iptables -A test1 -p 6 --sport 39579 -j DROP
iptables -A test1 -p 210 -j DROP
iptables -A test3 -p 6 --dport 31909 -j ACCEPT
iptables -A test2 -s 18.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -d 119.243.28.48 --sport 36878 -s 23.156.60.176 --dport 49925 -j DROP
iptables -A test2 -p 17 --sport 5678 -d 78.223.116.64 -j DROP
iptables -A INPUT -p 6 -d 142.61.111.250 --dport 37572 -j DROP
iptables -A INPUT -p 17 -s 222.243.182.199 -d 223.0.0.0/8 --sport 51532 -j ACCEPT
iptables -A OUTPUT -p 6 -d 46.106.87.104 --dport 17889 -s 218.20.184.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 5719 --sport 33418 -j DROP
iptables -A test1 -p 42 -j DROP
iptables -A test1 -p 17 --dport 18309 -d 0.39.76.151 -j DROP
iptables -A test2 -d 122.0.0.0/8 -p 155 -j DROP
iptables -A test1 -p 17 --dport 7203 --sport 12402 -j DROP
iptables -A test1 -p 6 --sport 54328 --dport 42294 -s 207.136.150.62 -j DROP
iptables -A test1 -p 211 -j DROP
iptables -A INPUT -p 6 --sport 55766 -d 112.213.178.17 -j DROP
iptables -A test1 -p 6 --sport 60422 -s 15.135.6.115 -j DROP
iptables -A test1 -p 17 --dport 38647 -d 27.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 48666 -j DROP
iptables -A test1 -p 6 --dport 62636 -j DROP
iptables -A test2 -p 17 --sport 44684 -s 123.61.150.10 --dport 58151 -d 129.117.61.93 -j DROP
iptables -A test1 -p 91 -s 110.53.151.0/24 -j DROP
iptables -A INPUT -p 6 --sport 18576 -s 184.29.189.169 --dport 30467 -j DROP
iptables -A OUTPUT -p 226 -j DROP
iptables -A OUTPUT -d 208.138.47.0/24 -s 71.0.0.0/8 -j DROP
iptables -A test3 -p 17 -d 168.110.250.42 -s 114.0.0.0/8 --dport 59507 --sport 60739 -j ACCEPT
iptables -A test1 -p 17 --dport 11090 -j DROP
iptables -A FORWARD -p 6 --dport 18217 -j DROP
iptables -A INPUT -p 214 -j DROP
iptables -A OUTPUT -p 17 --dport 43849 -d 145.52.149.89 -s 126.40.235.72 --sport 30144 -j ACCEPT
iptables -A test2 -p 17 -d 139.217.111.0/24 --dport 1786 -j DROP
iptables -A FORWARD -p 6 --sport 55359 -s 111.0.0.0/8 -j ACCEPT
iptables -A test1 -s 226.123.182.184 -d 226.141.172.8 -j ACCEPT
iptables -A INPUT -p 6 -s 160.34.193.0/24 -d 66.197.217.0/24 --dport 57540 -j ACCEPT
iptables -A test3 -p 6 -s 130.0.0.0/8 --sport 53271 -d 177.0.0.0/8 -j DROP
iptables -A test3 -p 6 -s 35.0.0.0/8 -d 194.52.183.193 --dport 59197 -j ACCEPT
iptables -A INPUT -p 17 --dport 28939 --sport 4343 -d 66.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 31292 -s 247.112.247.3 -j test1
iptables -A INPUT -p 6 --sport 35427 -d 175.89.43.202 -s 97.18.181.183 -j ACCEPT
iptables -A OUTPUT -p 6 -d 143.0.0.0/8 --dport 16111 -s 182.103.62.134 -j ACCEPT
iptables -A test2 -p 17 -d 23.94.155.41 -s 155.125.114.0/24 --sport 11871 -j DROP
iptables -A test3 -p 6 --dport 54665 -s 70.156.112.0/24 -j ACCEPT
iptables -A test2 -p 17 -d 227.19.7.17 --dport 8301 --sport 53072 -j DROP
iptables -A INPUT -d 197.254.0.0/16 -j DROP
iptables -A OUTPUT -s 94.0.0.0/8 -p 166 -j ACCEPT
iptables -A FORWARD -p 17 --dport 18370 -s 160.0.0.0/8 -d 227.208.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 -d 140.238.112.0/24 --dport 48381 -s 125.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 49940 -j DROP
iptables -A INPUT -p 6 --sport 17731 -d 72.227.36.225 --dport 918 -j DROP
iptables -A FORWARD -p 6 --sport 30177 --dport 52882 -d 194.10.99.149 -j DROP
iptables -A OUTPUT -p 6 --sport 46249 -j ACCEPT
iptables -A test2 -p 6 --sport 33971 -s 167.76.225.102 -j ACCEPT
iptables -A FORWARD -p 17 -d 184.158.111.0/24 -s 83.171.240.36 --sport 61644 -j ACCEPT
iptables -A FORWARD -p 17 --sport 56714 -s 232.1.118.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 -d 85.12.55.116 --sport 12059 --dport 54486 -j ACCEPT
iptables -A FORWARD -p 17 -d 160.60.250.57 --dport 17935 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 64309 -j DROP
iptables -A test1 -p 17 --sport 46402 -j ACCEPT
iptables -A test3 -p 6 --dport 34615 -d 189.0.0.0/8 -s 101.0.0.0/8 -j ACCEPT
iptables -A test2 -d 6.100.155.95 -p 71 -j DROP
iptables -A test3 -p 6 --dport 35964 --sport 59171 -d 211.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 37796 -j DROP
iptables -A FORWARD -p 6 -d 80.17.34.0/24 --sport 56928 -s 162.20.112.0/24 -j DROP
iptables -A test3 -p 97 -j ACCEPT
iptables -A FORWARD -p 17 --dport 53294 -s 4.172.252.0/24 --sport 2937 -j DROP
iptables -A INPUT -p 6 --sport 48316 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 35430 -d 144.241.107.61 -s 76.32.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 59009 -d 115.110.88.0/24 -j ACCEPT
iptables -A INPUT -p 6 --dport 7352 --sport 32184 -d 198.101.231.0/24 -j DROP
iptables -A FORWARD -p 6 --sport 29652 -d 132.159.199.0/24 -j DROP
iptables -A FORWARD -s 219.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --sport 42602 -s 110.215.143.206 -d 8.2.230.244 --dport 16743 -j DROP
iptables -A test1 -p 6 --sport 54622 -d 71.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 44683 -j ACCEPT
iptables -A INPUT -p 6 -d 71.206.0.0/16 --sport 57415 -j DROP
iptables -A FORWARD -p 6 --sport 20895 --dport 5870 -j DROP
iptables -A test1 -p 6 --sport 24526 -d 192.12.64.0/24 -j DROP
iptables -A INPUT -p 6 -d 235.230.41.0/24 --sport 49212 -j ACCEPT
iptables -A test2 -p 4 -s 230.128.41.206 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 23388 -s 183.0.0.0/8 -d 78.116.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -d 25.28.0.204 --dport 51760 --sport 7256 -j ACCEPT
iptables -A test2 -p 6 --sport 18235 -d 159.116.183.142 -s 161.156.60.135 --dport 18908 -j ACCEPT
iptables -A INPUT -d 135.211.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --sport 62122 -s 146.110.159.113 -d 131.238.181.226 -j DROP
iptables -A test1 -p 17 -d 86.217.0.0/16 --sport 41276 -j ACCEPT
iptables -A INPUT -p 6 -d 106.80.247.253 --sport 46262 --dport 52042 -j DROP
iptables -A INPUT -p 17 --sport 19829 -d 12.233.52.64 -j DROP
iptables -A test1 -p 17 --dport 26365 -j ACCEPT
iptables -A OUTPUT -d 178.0.0.0/8 -j DROP
iptables -A test2 -p 6 --dport 45201 -s 179.102.191.58 -j ACCEPT
iptables -A test3 -p 17 -d 44.181.230.241 --sport 8584 -j DROP
iptables -A OUTPUT -p 17 -d 215.9.105.0/24 --sport 31746 --dport 22144 -j DROP
iptables -A test3 -p 6 -d 150.0.0.0/8 --dport 61766 -j DROP
iptables -A INPUT -p 17 -d 191.224.70.165 --sport 21298 -j ACCEPT
iptables -A OUTPUT -p 6 -s 247.183.146.225 --sport 11610 -j DROP
iptables -A OUTPUT -p 17 -s 11.33.167.152 --sport 13990 --dport 8599 -j DROP
iptables -A FORWARD -p 6 -s 128.188.24.96 -d 231.39.211.109 --sport 59442 --dport 35970 -j DROP
iptables -A INPUT -p 6 -s 167.225.94.0/24 --dport 22622 -j ACCEPT
iptables -A test3 -p 6 --sport 26495 -s 13.0.0.0/8 --dport 23130 -d 254.80.179.0/24 -j DROP
iptables -A INPUT -p 17 --sport 33693 -s 7.0.0.0/8 -d 78.5.12.57 -j DROP
iptables -A FORWARD -p 6 --dport 61226 -j DROP
iptables -A OUTPUT -p 17 -d 85.158.235.185 -s 164.100.0.0/16 --dport 31844 -j DROP
iptables -A FORWARD -p 17 -s 140.219.218.15 --sport 21644 -d 45.39.129.114 -j DROP
iptables -A test1 -p 17 --sport 1188 -s 69.249.33.0/24 -d 113.44.0.0/16 -j DROP
iptables -A test1 -p 6 -s 220.33.182.46 -d 154.236.202.155 --dport 23730 -j ACCEPT
iptables -A test2 -p 17 -s 229.0.0.0/8 -d 194.224.75.175 --dport 6870 -j ACCEPT
iptables -A test1 -d 146.175.184.0/24 -s 226.22.175.0/24 -j DROP
iptables -A test3 -d 233.70.0.0/16 -p 112 -j ACCEPT
iptables -A FORWARD -p 6 --dport 41716 --sport 52187 -d 196.8.46.34 -j DROP
iptables -A OUTPUT -p 17 -d 83.253.4.173 --dport 35375 --sport 1903 -j DROP
iptables -A test3 -d 98.43.114.0/24 -j DROP
iptables -A test2 -p 6 -s 238.56.26.149 --dport 33470 -j ACCEPT
iptables -A test2 -d 15.161.1.102 -s 63.247.154.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 40441 --dport 39104 -j ACCEPT
iptables -A test3 -p 6 -s 38.124.78.0/24 --sport 26513 -d 149.123.172.172 -j ACCEPT
iptables -A FORWARD -d 161.182.91.133 -s 3.0.0.0/8 -j DROP
iptables -A test3 -p 6 --dport 55132 -j DROP
iptables -A INPUT -p 6 -s 177.151.62.66 --dport 10232 -j DROP
iptables -A INPUT -p 17 -d 52.100.234.0/24 -s 77.245.249.0/24 --dport 2708 -j DROP
iptables -A test3 -p 17 --sport 59919 -d 182.233.33.35 -j DROP
iptables -A OUTPUT -p 17 -s 232.186.165.123 --sport 27165 --dport 32275 -j test2
iptables -A FORWARD -p 128 -j ACCEPT
iptables -A INPUT -p 17 --sport 63911 -j ACCEPT
iptables -A test1 -p 6 --dport 20696 -j DROP
iptables -A INPUT -p 17 -d 175.39.94.33 --dport 7378 --sport 19311 -j ACCEPT
iptables -A test1 -s 70.17.117.0/24 -j ACCEPT
iptables -A test1 -p 6 -d 105.241.198.124 -s 173.33.73.173 --dport 64774 -j DROP
iptables -A INPUT -p 17 --sport 26438 -j DROP
iptables -A test2 -p 43 -s 198.84.48.114 -j ACCEPT
iptables -A test1 -p 6 --dport 28754 --sport 901 -d 72.210.162.76 -j ACCEPT
iptables -A INPUT -p 17 -s 8.125.173.226 --dport 10102 -j ACCEPT
iptables -A INPUT -p 17 --sport 13962 --dport 26224 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 26091 -s 231.174.201.82 -j DROP
iptables -A FORWARD -p 6 --dport 5230 -j DROP
iptables -A test1 -p 6 --sport 32241 -d 178.175.65.39 --dport 45492 -s 101.21.249.131 -j ACCEPT
iptables -A INPUT -p 6 --sport 63560 -j DROP
iptables -A OUTPUT -p 6 -s 208.0.0.0/8 -d 178.87.245.164 --sport 57879 -j DROP
iptables -A test1 -p 6 -d 36.36.107.126 --dport 19453 --sport 8926 -j ACCEPT
iptables -A test3 -p 17 -d 52.207.214.0/24 --sport 38743 --dport 31860 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 44233 -j DROP
iptables -A FORWARD -d 119.0.0.0/8 -p 243 -j ACCEPT
iptables -A FORWARD -p 17 -s 12.170.223.3 -d 243.103.185.10 --dport 63170 -j DROP
iptables -A test3 -s 192.204.174.31 -j DROP
iptables -A test2 -p 6 --dport 23339 --sport 59012 -j ACCEPT
iptables -A INPUT -p 6 -d 232.78.204.20 --sport 63044 -j ACCEPT
iptables -A test1 -p 6 -s 158.0.0.0/8 --dport 63659 -d 61.88.228.221 --sport 31902 -j ACCEPT
iptables -A test3 -d 50.209.96.246 -p 180 -s 59.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --sport 35549 -j DROP
iptables -A FORWARD -p 6 -s 155.0.0.0/8 --sport 52820 --dport 9886 -j ACCEPT
iptables -A INPUT -p 17 -d 178.246.224.35 -s 58.66.134.19 --sport 56153 --dport 62026 -j DROP
iptables -A test2 -p 17 --sport 53122 -d 90.52.196.163 --dport 15903 -j DROP
iptables -A OUTPUT -d 210.121.64.117 -j test2
iptables -A test3 -p 6 -d 200.131.91.190 --dport 49935 --sport 51588 -j ACCEPT
iptables -A test2 -p 17 -s 171.200.241.203 --dport 7515 -j DROP
iptables -A test1 -p 6 -d 14.36.47.0/24 -s 224.99.54.217 --dport 61785 -j ACCEPT
iptables -A test3 -p 17 --sport 57658 -s 152.143.57.53 -j ACCEPT
iptables -A test3 -p 41 -d 51.129.206.166 -j DROP
iptables -A test1 -p 119 -j ACCEPT
iptables -A INPUT -p 17 --dport 25033 -j DROP
iptables -A test3 -p 17 --sport 39915 --dport 39934 -j ACCEPT
iptables -A FORWARD -d 54.130.0.0/16 -j DROP
iptables -A test3 -p 17 -s 186.0.0.0/8 --dport 58472 -d 169.0.208.109 -j ACCEPT
iptables -A FORWARD -p 16 -j DROP
iptables -A OUTPUT -p 17 --sport 57564 -s 19.84.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -s 18.20.214.207 -d 20.127.45.0/24 --sport 56281 -j DROP
iptables -A test2 -p 17 --dport 41241 --sport 8954 -j ACCEPT
iptables -A test1 -p 6 --dport 29139 -j DROP
iptables -A OUTPUT -d 250.24.175.77 -p 65 -j ACCEPT
iptables -A test1 -s 115.0.0.0/8 -p 62 -j ACCEPT
iptables -A test2 -p 17 -s 2.80.104.81 --dport 9662 -d 252.140.0.0/16 -j DROP
iptables -A test2 -p 6 --dport 65503 -s 65.199.232.67 -d 133.0.0.0/8 -j DROP
iptables -A test3 -p 17 --sport 12255 --dport 41364 -j ACCEPT
iptables -A OUTPUT -p 17 -s 171.90.0.0/16 --sport 29338 -j DROP
iptables -A OUTPUT -p 17 -s 12.245.0.0/16 --sport 61428 -d 80.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 20717 -d 12.112.112.18 -s 100.188.81.75 --dport 54677 -j DROP
iptables -A OUTPUT -s 12.201.107.0/24 -j ACCEPT
iptables -A test2 -s 230.212.204.193 -j DROP
iptables -A INPUT -s 67.124.40.225 -j ACCEPT
iptables -A test3 -p 17 -s 13.20.164.57 --dport 8586 --sport 5129 -j DROP
iptables -A INPUT -s 203.37.143.31 -p 170 -j DROP
iptables -A test1 -p 17 --dport 49816 -d 110.32.0.0/16 -s 192.184.253.0/24 --sport 30519 -j ACCEPT
iptables -A FORWARD -p 6 --dport 14602 --sport 61652 -d 70.8.217.64 -j DROP
iptables -A INPUT -p 17 --dport 62718 --sport 3567 -s 59.159.130.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 40011 --dport 54684 -j DROP
iptables -A INPUT -p 17 --sport 4765 -j DROP
iptables -A test2 -s 53.242.11.4 -d 50.0.0.0/8 -p 40 -j DROP
iptables -A test1 -p 6 --sport 65428 --dport 35170 -j DROP
iptables -A INPUT -s 137.172.120.0 -d 93.38.200.154 -j DROP
iptables -A INPUT -p 17 --dport 59792 -j ACCEPT
iptables -A test3 -p 6 -s 108.70.172.126 --dport 35891 -j DROP
iptables -A OUTPUT -s 249.85.0.0/16 -d 74.18.0.0/16 -j DROP
iptables -A INPUT -p 17 -d 3.152.82.238 -s 171.92.183.180 --sport 56138 -j DROP
iptables -A OUTPUT -p 6 --dport 19409 -s 134.208.0.0/16 --sport 14832 -j ACCEPT
iptables -A INPUT -p 17 --sport 29711 -d 246.68.88.133 -s 93.214.40.237 -j DROP
iptables -A test2 -s 81.58.82.187 -d 102.71.72.139 -j ACCEPT
iptables -A test3 -s 157.130.241.94 -j ACCEPT
iptables -A test2 -p 245 -d 40.59.3.193 -s 168.209.190.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -s 95.184.134.146 --dport 46142 -d 134.159.0.0/16 --sport 12282 -j DROP
iptables -A test2 -p 17 --dport 64137 -s 153.207.111.0/24 -d 30.184.181.185 -j DROP
iptables -A FORWARD -p 17 --sport 47477 -d 157.4.247.0/24 --dport 27466 -j DROP
iptables -A OUTPUT -p 6 -d 168.141.27.236 --dport 13693 --sport 34125 -j DROP
iptables -A INPUT -p 17 --dport 60472 -j ACCEPT
iptables -A FORWARD -s 182.210.51.218 -j DROP
iptables -A INPUT -p 3 -j DROP
iptables -A test2 -p 6 --dport 12946 -s 27.211.238.233 -j DROP
iptables -A test1 -p 180 -s 218.146.195.0/24 -j DROP
iptables -A test1 -p 6 -d 172.149.0.0/16 --sport 33409 -s 31.196.50.0/24 --dport 23856 -j DROP
iptables -A test1 -s 25.170.74.22 -j DROP
iptables -A test1 -p 101 -j DROP
iptables -A FORWARD -p 6 -s 71.0.0.0/8 --sport 60054 --dport 39567 -j DROP
iptables -A test1 -p 17 --sport 27252 -s 203.252.21.202 -d 56.123.156.200 -j DROP
iptables -A FORWARD -p 6 --sport 1333 -j DROP
iptables -A FORWARD -p 17 --dport 3592 -s 113.69.193.235 -d 67.52.35.233 -j DROP
iptables -A OUTPUT -p 17 --dport 34534 -j DROP
iptables -A test1 -p 17 -s 115.215.119.93 --sport 46505 --dport 2777 -j DROP
iptables -A test2 -p 17 --dport 28810 -j ACCEPT
iptables -A test3 -p 6 --dport 16785 -s 2.224.201.26 --sport 60385 -j ACCEPT
iptables -A test3 -p 6 --dport 25165 -j DROP
iptables -A FORWARD -p 17 --dport 19095 --sport 46411 -j test1
iptables -A FORWARD -p 193 -j ACCEPT
iptables -A test3 -p 6 --dport 38241 -j ACCEPT
iptables -A OUTPUT -s 245.180.78.106 -j DROP
iptables -A test1 -p 17 -d 43.175.230.189 --sport 61485 -j DROP
iptables -A INPUT -p 17 --sport 60633 -s 130.187.9.87 -j DROP
iptables -A OUTPUT -p 6 -d 5.35.0.0/16 -s 168.204.46.160 --dport 58889 --sport 36002 -j ACCEPT
iptables -A test3 -p 17 -s 110.34.83.0/24 --dport 46033 -j ACCEPT
iptables -A test2 -s 224.93.27.66 -j ACCEPT
iptables -A test1 -s 87.154.0.0/16 -j ACCEPT
iptables -A OUTPUT -s 212.210.45.60 -j ACCEPT
iptables -A FORWARD -p 17 -d 251.133.103.230 --sport 25295 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 4369 -j ACCEPT
iptables -A FORWARD -p 17 -s 113.68.0.0/16 --dport 36110 -j ACCEPT
iptables -A test1 -d 189.236.67.44 -j ACCEPT
iptables -A test3 -p 17 --dport 58143 --sport 5618 -s 88.137.136.21 -j ACCEPT
iptables -A test3 -p 6 -s 228.0.0.0/8 --dport 703 -j DROP
iptables -A test3 -p 17 --dport 46714 -j DROP
iptables -A INPUT -p 6 --dport 3922 --sport 39350 -j DROP
iptables -A test1 -p 17 -s 8.129.147.111 --sport 46724 --dport 47272 -j ACCEPT
iptables -A test2 -p 17 --sport 51918 -d 157.72.223.9 -j ACCEPT
iptables -A FORWARD -p 17 -d 79.0.0.0/8 --sport 20840 -s 112.63.0.0/16 -j DROP
iptables -A test1 -p 6 -s 80.1.135.44 --dport 18096 --sport 41727 -j DROP
iptables -A INPUT -p 6 -d 59.181.194.178 -s 176.193.25.0/24 --sport 35732 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 16843 -j ACCEPT
iptables -A OUTPUT -s 244.167.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --sport 45450 -j ACCEPT
iptables -A INPUT -p 17 --sport 59171 -s 194.108.46.12 -d 108.56.27.80 -j test3
iptables -A INPUT -p 6 --dport 7714 -d 178.104.228.206 --sport 64210 -j ACCEPT
iptables -A test1 -p 6 -d 150.207.153.97 -s 160.0.0.0/8 --dport 27002 -j DROP
iptables -A test1 -p 17 -d 52.110.61.4 --sport 64139 --dport 18312 -j ACCEPT
iptables -A INPUT -p 17 --sport 23161 -j DROP
iptables -A test3 -p 17 -d 9.36.168.150 --sport 56623 -s 31.80.67.101 -j DROP
iptables -A test3 -p 6 -d 145.28.45.204 --sport 39964 -s 108.46.236.202 -j ACCEPT
iptables -A test2 -p 110 -j DROP
iptables -A FORWARD -p 17 --sport 30482 -d 233.192.231.115 -s 199.180.250.35 -j ACCEPT
iptables -A OUTPUT -s 227.49.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --dport 48283 -d 228.0.0.0/8 -s 186.210.0.0/16 -j DROP
iptables -A test2 -p 6 -s 34.181.128.137 --sport 46742 --dport 64970 -j ACCEPT
iptables -A FORWARD -p 6 --dport 26371 -d 58.64.187.103 -j DROP
iptables -A test1 -p 17 --dport 48486 --sport 64277 -d 230.9.42.136 -j ACCEPT
iptables -A FORWARD -p 17 --dport 46251 --sport 9626 -j ACCEPT
iptables -A INPUT -d 42.0.0.0/8 -s 14.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -s 136.0.0.0/8 -j test1
iptables -A FORWARD -p 6 --sport 62092 --dport 8514 -j ACCEPT
iptables -A test1 -p 17 --sport 11625 --dport 1172 -s 211.161.29.73 -j DROP
iptables -A FORWARD -p 17 --dport 1717 -j ACCEPT
iptables -A OUTPUT -p 6 -d 163.0.0.0/8 --sport 14292 -s 168.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --dport 9105 -d 207.75.0.0/16 -s 93.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --sport 7100 -j DROP
iptables -A OUTPUT -p 17 --sport 58328 -s 30.0.0.0/8 -j DROP
iptables -A test3 -p 178 -j DROP
iptables -A FORWARD -p 17 -s 12.57.79.0/24 --dport 43710 -j DROP
iptables -A FORWARD -p 6 -d 216.169.250.188 --dport 38751 -j DROP
iptables -A INPUT -p 6 --dport 39747 --sport 33559 -j ACCEPT
iptables -A test2 -p 6 --dport 57533 --sport 21627 -j ACCEPT
iptables -A INPUT -p 17 --sport 47426 -d 10.215.249.26 -s 111.136.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --dport 55274 -d 169.200.171.43 -j DROP
iptables -A OUTPUT -d 239.226.85.152 -j ACCEPT
iptables -A INPUT -p 17 --dport 42811 -j DROP
iptables -A test1 -p 17 --sport 37144 -j DROP
iptables -A test1 -d 209.252.0.0/16 -s 216.0.0.0/8 -p 194 -j DROP
iptables -A INPUT -d 207.0.0.0/8 -j DROP
iptables -A test1 -p 17 --sport 51374 -d 17.184.111.65 -s 84.236.167.0/24 -j DROP
iptables -A test2 -p 6 -d 107.198.59.236 --dport 58939 -j DROP
iptables -A FORWARD -p 6 -s 99.223.252.0/24 -d 128.43.0.0/16 --dport 55616 -j DROP
iptables -A test2 -p 6 --sport 15712 -d 181.178.0.0/16 -j DROP
iptables -A INPUT -p 6 --dport 12022 -s 80.0.0.0/8 -j ACCEPT
iptables -A FORWARD -d 110.57.162.62 -s 12.167.212.0/24 -j test3
iptables -A test3 -s 121.230.111.0/24 -j ACCEPT
iptables -A INPUT -p 154 -j ACCEPT
iptables -A test2 -p 47 -j DROP
iptables -A test3 -d 213.127.253.54 -p 107 -j ACCEPT
iptables -A test2 -p 17 --sport 3618 -d 165.0.0.0/8 -s 145.145.12.81 --dport 26117 -j ACCEPT
iptables -A OUTPUT -d 103.38.197.0/24 -j ACCEPT
iptables -A INPUT -p 6 -s 249.229.178.57 --dport 46392 -j ACCEPT
iptables -A FORWARD -p 17 -d 116.59.0.0/16 --dport 24971 -s 17.97.166.248 -j DROP
iptables -A FORWARD -p 17 -d 110.37.6.136 --dport 10246 -j DROP
iptables -A test3 -p 6 --dport 64395 --sport 42865 -s 196.37.80.151 -j DROP
iptables -A FORWARD -s 92.244.65.122 -j DROP
iptables -A INPUT -p 6 --sport 54001 --dport 64877 -d 193.190.18.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 9662 --sport 7969 -d 108.1.19.164 -j DROP
iptables -A INPUT -p 6 --sport 60321 -d 39.149.0.0/16 -s 170.174.214.0/24 -j DROP
iptables -A test3 -p 17 -d 195.43.5.165 --sport 1736 -j DROP
iptables -A FORWARD -p 6 --dport 15561 -s 140.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 8738 -s 4.48.174.175 --dport 2743 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 22564 -s 190.1.93.0/24 -d 223.85.7.243 -j DROP
iptables -A FORWARD -p 6 --dport 56408 -d 58.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 -d 201.135.160.234 --dport 28396 --sport 49526 -j DROP
iptables -A FORWARD -p 17 --dport 34302 -d 243.201.58.89 -j DROP
iptables -A test3 -p 6 -d 144.36.118.2 -s 171.127.0.0/16 --sport 2262 -j ACCEPT
iptables -A test1 -p 6 -s 115.224.51.60 --dport 64771 -j ACCEPT
iptables -A INPUT -p 17 --sport 33060 --dport 9393 -d 246.83.75.84 -j DROP
iptables -A OUTPUT -p 6 --sport 29572 --dport 65092 -d 127.107.74.0/24 -s 167.206.200.139 -j ACCEPT
iptables -A test1 -p 17 --sport 14070 -s 208.0.0.0/8 --dport 38363 -j DROP
iptables -A test1 -d 140.31.75.140 -j ACCEPT
iptables -A FORWARD -p 17 --dport 24991 --sport 49515 -j ACCEPT
iptables -A INPUT -p 17 --dport 1221 -j ACCEPT
iptables -A test3 -p 17 --dport 27073 --sport 55200 -s 246.38.50.56 -j ACCEPT
iptables -A OUTPUT -p 17 -s 186.0.0.0/8 -d 191.251.132.0/24 --sport 2423 -j ACCEPT
iptables -A test2 -s 137.162.67.100 -j DROP
iptables -A FORWARD -p 6 -d 62.56.18.169 --sport 37012 -j DROP
iptables -A test3 -p 17 --dport 418 -j ACCEPT
iptables -A test2 -p 17 --sport 38277 -j DROP
iptables -A test1 -p 6 -d 50.1.184.28 --dport 1713 --sport 29281 -s 46.159.23.64 -j DROP
iptables -A INPUT -p 6 --dport 40410 -j DROP
iptables -A FORWARD -p 106 -j DROP
iptables -A test2 -p 6 -s 176.66.241.0/24 -d 14.232.200.100 --sport 44570 -j DROP
iptables -A OUTPUT -p 17 --sport 57578 -j DROP
iptables -A test3 -p 17 --sport 14332 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 42096 -s 71.17.0.0/16 -d 223.65.172.248 -j DROP
iptables -A test2 -p 6 --sport 38261 -d 128.0.0.0/8 -s 134.159.158.187 -j DROP
iptables -A OUTPUT -s 105.242.16.160 -d 70.156.96.172 -j DROP
iptables -A test3 -p 6 --sport 63131 -j DROP
iptables -A INPUT -s 32.172.215.0/24 -p 32 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 59106 -j DROP
iptables -A test3 -p 17 --sport 38080 -j ACCEPT
iptables -A INPUT -p 6 --sport 58182 --dport 28186 -j ACCEPT
iptables -A test2 -p 17 --dport 940 -j ACCEPT
iptables -A test3 -p 6 --sport 23740 --dport 27247 -d 59.203.193.123 -j DROP
iptables -A OUTPUT -d 124.83.239.162 -s 114.75.157.0/24 -j DROP
iptables -A test3 -p 17 --sport 57939 -j DROP
iptables -A test1 -d 43.164.143.194 -p 115 -j ACCEPT
iptables -A test2 -d 26.214.0.0/16 -s 237.29.67.0/24 -j DROP
iptables -A FORWARD -p 17 --dport 49104 -d 226.47.38.94 -j DROP
iptables -A OUTPUT -p 170 -d 142.77.148.82 -s 66.251.209.0/24 -j ACCEPT
iptables -A test2 -s 38.26.149.9 -j ACCEPT
iptables -A test1 -p 17 -s 48.127.170.89 --sport 56231 -j DROP
iptables -A INPUT -s 29.99.0.0/16 -j DROP
iptables -A FORWARD -p 17 --sport 23163 --dport 7900 -s 175.194.51.0/24 -d 253.181.68.225 -j ACCEPT
iptables -A test3 -p 6 -d 36.176.210.41 --dport 27005 --sport 54747 -j DROP
iptables -A test1 -p 6 -d 152.247.133.49 --sport 27908 --dport 35537 -j DROP
iptables -A test3 -p 6 --dport 58423 -s 106.38.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --dport 38961 --sport 46919 -j ACCEPT
iptables -A test2 -p 6 --dport 47127 -d 238.0.39.24 -j DROP
iptables -A OUTPUT -p 6 --dport 48209 -j ACCEPT
iptables -A FORWARD -p 6 --dport 48953 -j DROP
iptables -A OUTPUT -p 58 -j ACCEPT
iptables -A test2 -p 6 -d 194.130.229.204 --dport 17853 -s 129.23.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --dport 11392 --sport 42191 -s 170.31.237.48 -j DROP
iptables -A FORWARD -p 6 --dport 18956 -d 168.108.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 18217 -d 227.93.115.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 20693 -s 10.68.125.14 -d 255.13.0.0/16 -j test3
iptables -A test2 -p 170 -d 167.44.199.62 -j ACCEPT
iptables -A test1 -p 17 --dport 23423 -s 36.168.5.119 -j ACCEPT
iptables -A INPUT -p 17 -d 13.111.29.204 --dport 12408 -s 168.249.0.0/16 -j DROP
iptables -A INPUT -d 120.245.143.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 51877 -s 98.186.28.49 -j ACCEPT
iptables -A test3 -p 17 --sport 21678 -j DROP
iptables -A test1 -p 17 --dport 47244 -j ACCEPT
iptables -A test3 -p 6 --sport 38911 --dport 55375 -j ACCEPT
iptables -A test2 -p 6 -d 67.136.178.50 --dport 31379 --sport 45839 -j ACCEPT
iptables -A test2 -p 6 -d 204.130.182.63 -s 113.248.68.97 --sport 9452 -j DROP
iptables -A OUTPUT -p 6 --dport 31266 -d 144.164.101.192 -s 105.10.217.0/24 -j DROP
iptables -A OUTPUT -p 17 --sport 36836 --dport 63988 -d 40.90.42.238 -j DROP
iptables -A OUTPUT -p 6 --sport 40278 -j ACCEPT
iptables -A FORWARD -p 211 -d 162.48.91.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 60554 -s 44.43.222.15 -j DROP
iptables -A OUTPUT -s 190.172.0.0/16 -p 48 -j ACCEPT
iptables -A test1 -p 6 --sport 3698 -j ACCEPT
iptables -A INPUT -d 93.188.218.140 -j ACCEPT
iptables -A test2 -p 17 --dport 9212 --sport 62838 -j ACCEPT
iptables -A INPUT -p 17 -d 126.230.101.231 --dport 3314 --sport 58571 -j DROP
iptables -A FORWARD -p 6 --dport 2744 -s 15.5.17.157 --sport 50347 -d 85.148.85.0/24 -j ACCEPT
iptables -A test1 -p 6 -s 116.46.68.200 --sport 30521 --dport 36791 -d 144.56.125.123 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 10815 -j DROP
iptables -A OUTPUT -p 6 --dport 18800 -j DROP
iptables -A test1 -p 17 -s 40.19.176.83 --sport 105 --dport 41400 -j DROP
iptables -A test1 -p 6 --sport 21171 -j DROP
iptables -A FORWARD -p 17 --sport 57366 -j test3
iptables -A test1 -s 124.218.87.89 -j DROP
iptables -A OUTPUT -s 91.20.188.0/24 -d 109.165.33.145 -j DROP
iptables -A test2 -p 100 -j ACCEPT
iptables -A FORWARD -p 17 --sport 51975 -d 128.0.0.0/8 -j DROP
iptables -A test3 -p 17 --sport 11187 -d 92.119.199.100 -s 18.77.12.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 27716 -d 171.114.161.76 --sport 37946 -j DROP
iptables -A OUTPUT -p 6 --sport 9050 -j DROP
iptables -A test3 -s 44.252.71.184 -j ACCEPT
iptables -A test1 -p 17 --sport 42081 -d 79.0.0.0/8 -s 52.245.86.120 -j DROP
iptables -A test3 -p 6 --dport 48188 -s 17.18.77.134 -j ACCEPT
iptables -A INPUT -p 17 -s 163.56.8.244 --sport 38503 -j ACCEPT
iptables -A test1 -s 244.180.117.174 -j ACCEPT
iptables -A test3 -p 17 --dport 62069 -d 197.188.144.167 --sport 8463 -j ACCEPT
iptables -A INPUT -s 155.163.45.100 -p 184 -j ACCEPT
iptables -A test1 -p 21 -j DROP
iptables -A FORWARD -p 17 -d 169.53.104.164 --dport 45152 --sport 31845 -j ACCEPT
iptables -A test3 -p 17 --dport 58387 -j ACCEPT
iptables -A OUTPUT -s 215.65.136.0/24 -j ACCEPT
iptables -A test2 -d 44.9.245.234 -p 162 -j DROP
iptables -A INPUT -p 6 -s 155.0.0.0/8 --sport 61762 -d 11.32.58.147 --dport 43110 -j DROP
iptables -A test1 -d 215.178.186.1 -j ACCEPT
iptables -A test2 -p 17 --dport 50826 -d 146.0.0.0/8 -j DROP
iptables -A test3 -p 17 --sport 33876 --dport 35607 -j ACCEPT
iptables -A test1 -p 17 -s 18.132.199.93 -d 229.152.234.215 --sport 59713 -j ACCEPT
iptables -A FORWARD -p 6 --sport 17747 --dport 48038 -j DROP
iptables -A test1 -p 6 --sport 53529 -s 76.45.86.9 --dport 31833 -j ACCEPT
iptables -A test3 -p 173 -d 69.234.194.130 -j DROP
iptables -A test3 -p 6 --sport 65216 -s 56.86.232.128 -j ACCEPT
iptables -A OUTPUT -p 17 -s 105.27.169.37 -d 95.236.236.17 --sport 15750 -j ACCEPT
iptables -A OUTPUT -p 6 -s 130.4.42.252 -d 23.218.10.64 --dport 36896 --sport 24216 -j ACCEPT
iptables -A test2 -p 17 -s 240.29.110.0/24 --sport 30666 -j ACCEPT
iptables -A FORWARD -p 6 -d 132.0.0.0/8 -s 123.153.33.95 --sport 18709 --dport 31267 -j ACCEPT
iptables -A test1 -p 17 --sport 53959 --dport 56206 -s 38.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --dport 49893 --sport 22101 -d 196.189.235.185 -j ACCEPT
iptables -A test2 -s 143.70.58.212 -j DROP
iptables -A OUTPUT -p 17 --sport 9530 -d 103.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 -s 223.244.130.149 --sport 50854 -j ACCEPT
iptables -A INPUT -s 240.142.219.0/24 -j DROP
iptables -A test3 -p 6 --sport 33795 --dport 10806 -j DROP
iptables -A test1 -p 6 --dport 13630 --sport 30512 -s 254.65.91.251 -j ACCEPT
iptables -A test1 -p 17 --sport 19287 -d 199.29.194.53 -s 130.55.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --dport 16268 -d 48.135.28.59 --sport 64830 -j ACCEPT
iptables -A INPUT -p 6 --sport 7030 -j DROP
iptables -A test2 -p 17 -s 131.220.11.231 --sport 58516 -j DROP
iptables -A test3 -p 116 -j DROP
iptables -A OUTPUT -p 6 --dport 62441 -j ACCEPT
iptables -A test3 -s 194.157.225.85 -j ACCEPT
iptables -A test1 -p 17 --sport 18018 -j ACCEPT
iptables -A test1 -p 17 --dport 51284 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 51859 -s 81.241.138.0/24 --dport 30861 -j DROP
iptables -A INPUT -p 6 --sport 35742 -j ACCEPT
iptables -A test1 -p 6 --sport 14960 -j DROP
iptables -A OUTPUT -p 6 --dport 34040 -d 138.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 -s 29.155.45.0/24 --dport 47290 -j ACCEPT
iptables -A test1 -p 17 -d 225.85.37.0/24 --dport 37072 -s 149.91.0.0/16 --sport 4514 -j DROP
iptables -A FORWARD -p 6 --sport 23665 --dport 9265 -d 85.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 33206 -j ACCEPT
iptables -A FORWARD -p 6 -d 145.24.95.28 --sport 43334 -j DROP
iptables -A test3 -s 137.92.242.0/24 -p 173 -j ACCEPT
iptables -A FORWARD -p 6 --sport 5021 -j ACCEPT
iptables -A FORWARD -p 6 --dport 18552 --sport 23739 -j DROP
iptables -A OUTPUT -p 161 -d 230.0.0.0/8 -s 127.128.109.0/24 -j test2
iptables -A test3 -d 19.132.188.138 -j DROP
iptables -A test3 -p 6 -s 92.233.3.0/24 -d 212.50.220.246 --dport 30473 -j DROP
iptables -A OUTPUT -p 17 -s 62.0.0.0/8 --dport 32872 --sport 33698 -j DROP
iptables -A test2 -p 6 -d 216.165.133.178 --sport 46487 -j DROP
iptables -A INPUT -p 17 -d 140.34.243.109 --dport 15686 --sport 60214 -j ACCEPT
iptables -A test1 -d 195.204.182.222 -j ACCEPT
iptables -A test1 -p 17 --dport 57143 -j ACCEPT
iptables -A test1 -p 62 -d 127.81.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 -s 241.0.0.0/8 -d 198.209.198.0/24 --dport 37361 -j DROP
iptables -A test3 -p 6 --sport 13276 --dport 48167 -j DROP
iptables -A FORWARD -p 96 -j ACCEPT
iptables -A test1 -p 17 -d 71.186.42.0/24 --sport 56949 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 48038 --sport 28012 -d 234.35.190.103 -j ACCEPT
iptables -A OUTPUT -p 17 -d 89.242.210.5 --dport 6744 --sport 46529 -j ACCEPT
iptables -A test3 -p 17 --sport 20926 --dport 22832 -j ACCEPT
iptables -A OUTPUT -s 194.156.102.0/24 -d 235.192.195.209 -j ACCEPT
iptables -A test1 -p 17 -s 149.156.195.0/24 --dport 37976 -j DROP
iptables -A test1 -d 5.0.0.0/8 -p 214 -j DROP
iptables -A INPUT -d 201.61.99.57 -s 187.167.174.66 -j test2
iptables -A test3 -s 166.135.184.0/24 -j DROP
iptables -A test1 -p 17 --dport 47413 -j ACCEPT
iptables -A test3 -s 64.144.252.124 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 32538 -s 201.22.155.57 -j ACCEPT
iptables -A OUTPUT -d 9.16.0.0/16 -j test1
iptables -A OUTPUT -p 6 -s 15.9.189.0/24 --sport 43237 -j ACCEPT
iptables -A test1 -p 6 --dport 52768 --sport 57102 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 4818 -d 123.233.102.0/24 -j ACCEPT
iptables -A test1 -p 6 -d 120.6.80.49 --dport 55196 -j ACCEPT
iptables -A INPUT -p 17 --sport 61677 --dport 32822 -j ACCEPT
iptables -A INPUT -p 17 -d 203.48.171.88 --sport 22982 -j ACCEPT
iptables -A test3 -p 17 -d 80.54.95.197 --sport 30602 -s 52.76.0.0/16 -j DROP
iptables -A test3 -p 6 --sport 41336 -s 62.25.128.0/24 -j ACCEPT
iptables -A test2 -p 17 -d 156.0.0.0/8 --sport 44294 --dport 54175 -j DROP
iptables -A FORWARD -p 17 --sport 60852 -d 105.33.120.145 -j ACCEPT
iptables -A test3 -p 6 --dport 24678 -j ACCEPT
iptables -A test3 -p 6 --dport 47205 -s 61.102.237.0/24 --sport 4467 -j ACCEPT
iptables -A test3 -p 17 -s 211.53.211.60 -d 219.0.0.0/8 --sport 46095 -j ACCEPT
iptables -A test1 -p 6 -s 164.240.0.0/16 --sport 1166 --dport 38589 -j ACCEPT
iptables -A FORWARD -d 25.129.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 -s 74.51.35.0/24 --dport 54179 --sport 56878 -j DROP
iptables -A test1 -p 17 -d 91.0.0.0/8 --dport 60848 -j ACCEPT
iptables -A FORWARD -p 17 --dport 22413 -j ACCEPT
iptables -A INPUT -p 6 --sport 17763 --dport 2439 -j DROP
iptables -A test1 -s 148.0.0.0/8 -j DROP
iptables -A test3 -p 208 -j DROP
iptables -A test3 -d 169.195.37.56 -j ACCEPT
iptables -A FORWARD -p 17 -s 156.137.18.193 --sport 35194 -j DROP
iptables -A FORWARD -p 17 -s 91.154.45.239 --sport 37876 -d 212.127.0.174 -j ACCEPT
iptables -A test3 -p 6 -s 156.153.169.209 --sport 44151 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 763 --sport 31099 -s 37.200.99.142 -j DROP
iptables -A FORWARD -p 6 --sport 63260 -d 222.0.0.0/8 -j DROP
iptables -A test2 -p 17 -d 197.172.145.59 -s 33.217.136.123 --dport 7299 -j DROP
iptables -A INPUT -p 10 -s 103.239.0.0/16 -d 149.55.179.98 -j ACCEPT
iptables -A test2 -p 17 --dport 21031 --sport 50873 -d 232.0.0.0/8 -j DROP
iptables -A INPUT -s 5.209.101.119 -j DROP
iptables -A INPUT -p 6 --sport 42280 -j ACCEPT
iptables -A test2 -d 183.80.93.152 -p 42 -j DROP
iptables -A INPUT -p 17 -d 120.66.129.46 --sport 14708 -j ACCEPT
iptables -A INPUT -d 18.6.0.0/16 -s 99.187.45.0/24 -j ACCEPT
iptables -A test3 -p 6 --dport 44682 --sport 57556 -j DROP
iptables -A test2 -p 217 -d 153.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 39283 -j DROP
iptables -A test2 -p 6 --dport 24111 --sport 12998 -j DROP
iptables -A test1 -p 187 -j DROP
iptables -A test2 -p 17 --sport 45711 -j ACCEPT
iptables -A test1 -p 17 -s 134.0.0.0/8 -d 23.197.229.123 --dport 3732 -j DROP
iptables -A OUTPUT -p 6 -s 168.248.20.0/24 -d 226.46.0.0/16 --sport 9387 --dport 52120 -j DROP
iptables -A test1 -p 6 --sport 28176 -s 91.109.171.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 55941 -j DROP
iptables -A test3 -p 6 --dport 18930 -j ACCEPT
iptables -A FORWARD -d 129.126.147.245 -p 18 -j DROP
iptables -A FORWARD -p 17 --sport 59096 --dport 39540 -d 5.19.137.72 -j DROP
iptables -A INPUT -p 6 --dport 43951 --sport 30404 -s 3.237.224.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 44455 --dport 2414 -j ACCEPT
iptables -A OUTPUT -p 6 -s 243.180.0.0/16 -d 74.0.0.0/8 --dport 24921 -j ACCEPT
iptables -A FORWARD -p 6 --sport 31760 -d 86.116.23.148 --dport 64446 -j DROP
iptables -A test3 -s 168.81.31.194 -j ACCEPT
iptables -A INPUT -s 49.240.39.125 -j DROP
iptables -A test2 -s 1.0.0.0/8 -d 184.250.110.0/24 -p 165 -j ACCEPT
iptables -A test3 -p 227 -j ACCEPT
iptables -A OUTPUT -p 17 -s 241.237.180.162 --dport 65139 -d 66.51.129.81 -j ACCEPT
iptables -A test1 -p 17 --dport 28673 -s 227.113.0.0/16 -d 135.22.27.86 -j DROP
iptables -A test1 -p 17 --dport 30609 --sport 15303 -d 201.102.215.121 -j DROP
iptables -A INPUT -p 3 -j DROP
iptables -A OUTPUT -p 17 --sport 54501 -s 95.87.225.182 -j DROP
iptables -A test3 -p 6 -d 118.0.0.0/8 -s 43.4.61.166 --dport 22719 --sport 18049 -j ACCEPT
iptables -A test1 -p 17 -d 21.0.0.0/8 --sport 50290 --dport 50598 -j ACCEPT
iptables -A test3 -p 17 -s 246.40.7.155 --dport 30127 -d 110.49.186.0/24 -j DROP
iptables -A test2 -p 6 --sport 29351 --dport 20426 -j DROP
iptables -A FORWARD -p 17 --sport 27626 -j DROP
iptables -A test2 -p 17 -d 91.98.242.212 --sport 24075 -j ACCEPT
iptables -A INPUT -p 6 --dport 12081 -j ACCEPT
iptables -A test2 -p 17 --dport 58166 -s 32.5.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --sport 54825 -d 175.0.0.0/8 -s 248.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 61221 --sport 56544 -j ACCEPT
iptables -A test2 -p 6 --dport 718 -j DROP
iptables -A test2 -s 187.50.0.0/16 -j DROP
iptables -A FORWARD -p 6 -d 57.13.30.182 --dport 15337 -s 5.0.0.0/8 -j DROP
iptables -A test3 -p 6 --dport 60123 -j ACCEPT
iptables -A test2 -s 58.221.30.53 -j DROP
iptables -A test2 -p 6 -d 153.0.0.0/8 --sport 22044 -s 161.39.170.50 -j ACCEPT
iptables -A test1 -p 72 -d 85.45.71.0/24 -j DROP
iptables -A test2 -p 17 --sport 53957 -s 12.49.0.0/16 -d 139.6.252.159 -j ACCEPT
iptables -A FORWARD -p 6 --sport 4657 -s 125.99.76.0/24 --dport 3188 -j DROP
iptables -A OUTPUT -d 148.122.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 -s 188.172.0.0/16 -d 73.29.119.106 --sport 62228 -j DROP
iptables -A test2 -p 6 --dport 8650 --sport 19909 -j DROP
iptables -A test2 -p 17 --dport 28734 -j ACCEPT
iptables -A INPUT -p 125 -j ACCEPT
iptables -A INPUT -d 77.66.202.144 -j ACCEPT
iptables -A INPUT -d 30.6.155.45 -s 53.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -d 55.44.39.35 --sport 41434 -j ACCEPT
iptables -A test1 -p 17 -s 243.6.2.55 --dport 20864 --sport 124 -j DROP
iptables -A test2 -p 6 --sport 58815 -s 153.61.21.0/24 --dport 21620 -j ACCEPT
iptables -A INPUT -p 17 --dport 28998 -s 32.13.85.184 --sport 55269 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 23146 -s 120.9.172.215 -j DROP
iptables -A test1 -p 17 -s 116.114.119.83 --sport 52284 -j ACCEPT
iptables -A INPUT -s 163.53.173.129 -p 87 -d 20.55.90.167 -j ACCEPT
iptables -A FORWARD -p 17 -d 211.79.11.0/24 --dport 28750 -s 159.161.0.0/16 -j DROP
iptables -A test1 -p 17 --dport 4606 --sport 23895 -d 228.143.166.110 -j ACCEPT
iptables -A test3 -p 17 -s 137.231.176.188 --dport 27790 -j DROP
iptables -A test2 -p 239 -j ACCEPT
iptables -A test2 -p 6 -d 251.43.54.0/24 --sport 50877 -j ACCEPT
iptables -A INPUT -d 137.69.15.141 -p 194 -j DROP
iptables -A test2 -p 108 -j ACCEPT
iptables -A OUTPUT -s 134.53.133.238 -d 107.216.128.0 -p 237 -j DROP
iptables -A test3 -p 17 --dport 17592 --sport 46629 -d 162.4.241.170 -j ACCEPT
iptables -A test3 -p 6 --dport 33946 -s 231.150.0.0/16 -j DROP
iptables -A INPUT -p 6 -s 199.231.0.0/16 -d 98.102.221.66 --sport 14843 -j ACCEPT
iptables -A INPUT -p 237 -j ACCEPT
iptables -A test2 -p 17 --dport 28860 -j DROP
iptables -A INPUT -p 6 -s 26.92.115.0/24 --sport 37343 -j DROP
iptables -A test1 -p 6 --sport 43291 -d 52.0.0.0/8 --dport 41272 -j DROP
iptables -A INPUT -p 6 --dport 55516 -s 73.21.46.0/24 -d 175.33.50.0/24 --sport 64031 -j ACCEPT
iptables -A test3 -p 6 -d 163.38.0.0/16 -s 105.18.0.0/16 --sport 26801 -j ACCEPT
iptables -A test1 -p 17 --dport 22469 --sport 9648 -d 43.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 76 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 21456 -d 99.0.0.0/8 -j DROP
iptables -A test1 -p 17 -s 127.0.0.0/8 --dport 46068 --sport 4059 -j DROP
iptables -A FORWARD -p 17 --sport 60049 -s 174.49.0.0/16 --dport 61160 -j ACCEPT
iptables -A test1 -p 17 -s 156.98.213.0/24 --sport 14091 -j DROP
iptables -A FORWARD -p 6 -s 29.141.65.81 --dport 16199 -j ACCEPT
iptables -A test1 -p 17 --sport 33523 -d 230.0.0.0/8 --dport 24171 -j ACCEPT
iptables -A test2 -p 17 --sport 50632 --dport 6582 -j ACCEPT
iptables -A FORWARD -s 131.47.212.74 -p 152 -d 37.118.253.231 -j ACCEPT
iptables -A FORWARD -p 6 --sport 61474 -s 30.11.169.140 -j ACCEPT
iptables -A INPUT -p 17 -s 60.57.221.117 --dport 53410 -j DROP
iptables -A FORWARD -p 17 -d 22.0.0.0/8 --dport 47847 -s 248.123.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 41914 --dport 45587 -j DROP
iptables -A test2 -d 219.1.173.0/24 -j DROP
iptables -A OUTPUT -d 40.236.202.209 -s 84.183.206.99 -j DROP
iptables -A OUTPUT -p 17 -d 18.170.138.172 --dport 49637 --sport 43522 -j ACCEPT
iptables -A INPUT -p 218 -j DROP
iptables -A test3 -s 7.112.0.0/16 -p 122 -d 238.82.136.234 -j DROP
iptables -A test1 -s 173.185.0.0/16 -d 153.104.133.108 -j DROP
iptables -A INPUT -p 17 -d 107.80.130.0/24 -s 55.1.205.0/24 --sport 40506 -j ACCEPT
iptables -A FORWARD -p 17 --dport 3299 -s 78.130.211.0/24 --sport 12927 -j DROP
iptables -A test3 -p 17 -s 114.121.0.0/16 --dport 24928 -j DROP
iptables -A OUTPUT -p 17 --dport 46093 -j DROP
iptables -A INPUT -p 6 -d 54.158.0.0/16 --dport 46734 -j ACCEPT
iptables -A test2 -p 17 --dport 42922 -s 33.90.25.0/24 -j ACCEPT
iptables -A test2 -p 9 -s 246.200.128.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 54775 -j DROP
iptables -A test3 -p 6 -s 63.0.0.0/8 --sport 21631 -d 227.84.38.94 -j ACCEPT
iptables -A test2 -d 75.214.66.42 -p 179 -s 246.145.229.0/24 -j DROP
iptables -A OUTPUT -p 6 -d 132.66.213.243 --sport 34260 -j ACCEPT
iptables -A test1 -p 6 -s 227.78.112.52 --dport 6594 --sport 38351 -d 198.8.0.0/16 -j DROP
iptables -A INPUT -d 27.165.212.71 -s 230.0.0.0/8 -j test1
iptables -A OUTPUT -p 6 --sport 50889 -j DROP
iptables -A test2 -p 17 --dport 4678 -d 231.197.0.0/16 -s 113.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 -s 147.16.23.42 -d 184.0.0.0/8 --dport 36824 -j DROP
iptables -A test3 -p 6 --dport 60483 -s 63.0.0.0/8 -d 120.192.48.118 -j DROP
iptables -A test3 -p 17 --dport 23942 -d 92.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --sport 24635 --dport 4969 -j DROP
iptables -A OUTPUT -p 6 --dport 23219 -s 130.75.214.94 -j DROP
iptables -A test1 -p 17 -s 101.82.35.103 --dport 59634 -d 177.65.198.8 -j ACCEPT
iptables -A test1 -p 6 --dport 40404 -d 14.194.124.71 --sport 38765 -j DROP
iptables -A test1 -p 6 --dport 65147 --sport 21967 -s 23.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --sport 61007 -j ACCEPT
iptables -A FORWARD -p 195 -d 114.102.165.80 -j DROP
iptables -A test1 -p 17 --dport 46104 --sport 31582 -j ACCEPT
iptables -A test2 -p 6 --sport 21054 -s 179.233.0.0/16 -j DROP
iptables -A test1 -p 6 --sport 1680 --dport 48357 -j DROP
iptables -A test2 -p 80 -j ACCEPT
iptables -A test3 -p 17 --sport 5226 -j ACCEPT
iptables -A test3 -p 17 --dport 56374 -s 221.131.0.0/16 --sport 55592 -j ACCEPT
iptables -A test1 -p 17 --sport 56464 --dport 19955 -j ACCEPT
iptables -A FORWARD -p 17 -d 101.0.0.0/8 --sport 5688 -s 201.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -s 157.184.124.0/24 --dport 51330 -j ACCEPT
iptables -A FORWARD -p 227 -d 32.106.32.140 -j DROP
iptables -A test3 -p 6 -s 150.199.46.0/24 --sport 36235 -j DROP
iptables -A OUTPUT -p 17 --sport 21215 -d 9.91.103.212 -s 12.64.66.94 -j ACCEPT
iptables -A FORWARD -p 6 --dport 1873 -s 24.0.0.0/8 --sport 57918 -d 71.0.144.0/24 -j DROP
iptables -A test1 -p 6 -d 105.0.0.0/8 --sport 58357 -j ACCEPT
iptables -A OUTPUT -p 186 -j DROP
iptables -A INPUT -p 17 -s 114.0.0.0/8 --dport 61907 -j DROP
iptables -A test2 -p 17 --sport 36233 -s 222.96.34.49 -d 86.31.73.203 -j ACCEPT
iptables -A test1 -p 17 --dport 19211 -s 75.126.0.0/16 --sport 28322 -j ACCEPT
iptables -A INPUT -d 99.0.0.0/8 -s 139.50.33.0/24 -p 108 -j DROP
iptables -A INPUT -p 6 -s 178.133.122.0/24 -d 67.191.35.115 --dport 42857 --sport 42743 -j ACCEPT
iptables -A INPUT -p 17 -s 23.0.0.0/8 --dport 34794 -j ACCEPT
iptables -A FORWARD -p 17 --dport 63254 -j DROP
iptables -A test1 -p 17 -d 113.253.45.0/24 --sport 34943 -j DROP
iptables -A OUTPUT -p 6 --dport 22780 -j test1
iptables -A INPUT -p 6 --sport 20484 -j DROP
iptables -A test2 -s 186.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -s 22.206.50.70 --dport 18974 -d 195.193.55.32 -j DROP
iptables -A OUTPUT -p 6 --dport 54175 -j DROP
iptables -A test2 -p 6 -s 165.115.0.0/16 --dport 8104 -d 18.209.111.181 -j DROP
iptables -A test1 -d 151.186.82.239 -j DROP
iptables -A FORWARD -p 6 --dport 7312 -s 168.51.181.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 47134 -s 77.0.0.0/8 --dport 1131 -j ACCEPT
iptables -A INPUT -d 251.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 107 -j DROP
iptables -A test3 -s 23.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 51210 -s 145.0.0.0/8 -d 139.171.0.0/16 -j ACCEPT
iptables -A test1 -s 206.216.0.0/16 -j DROP
iptables -A test2 -p 42 -s 165.0.19.105 -j DROP
iptables -A OUTPUT -s 22.0.0.0/8 -j ACCEPT
iptables -A test2 -d 31.216.145.132 -j DROP
iptables -A test3 -s 116.0.0.0/8 -p 30 -j DROP
iptables -A test3 -d 107.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 36549 -s 105.237.26.82 -d 118.0.0.0/8 -j DROP
iptables -A INPUT -d 137.193.41.30 -j ACCEPT
iptables -A FORWARD -p 6 --sport 47907 -j DROP
iptables -A test1 -p 6 -s 64.208.201.0/24 --dport 17786 -j DROP
iptables -A test3 -p 6 --sport 12776 -d 223.35.225.0/24 --dport 31191 -j DROP
iptables -A FORWARD -p 6 -d 161.178.86.0/24 --sport 717 -s 98.45.19.30 --dport 821 -j ACCEPT
iptables -A FORWARD -p 17 --dport 5786 -j ACCEPT
iptables -A INPUT -p 6 -d 238.20.237.0/24 --dport 10140 -j DROP
iptables -A FORWARD -s 142.102.0.0/16 -p 140 -j ACCEPT
iptables -A FORWARD -p 6 --dport 46142 -s 93.101.86.212 -j DROP
iptables -A INPUT -d 73.49.136.134 -j ACCEPT
iptables -A test2 -p 6 --dport 11133 -j DROP
iptables -A FORWARD -p 6 -d 19.70.0.0/16 --dport 8568 -j DROP
iptables -A OUTPUT -s 229.7.17.58 -p 207 -j DROP
iptables -A FORWARD -p 17 --sport 1615 -d 143.117.42.0/24 -j DROP
iptables -A OUTPUT -p 244 -j ACCEPT
iptables -A test3 -p 6 -s 16.0.0.0/8 -d 124.222.76.147 --dport 15660 -j DROP
iptables -A test1 -s 59.18.221.160 -j ACCEPT
iptables -A test3 -p 6 -d 204.0.0.0/8 --sport 17775 --dport 15135 -j DROP
iptables -A INPUT -p 17 --sport 64175 -d 155.49.43.118 -s 86.7.61.108 --dport 39713 -j DROP
iptables -A FORWARD -p 6 --sport 17629 -j DROP
iptables -A OUTPUT -p 6 -s 85.195.144.0/24 --sport 23803 --dport 28385 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 45035 -d 97.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 16495 -d 118.83.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 -s 220.214.186.28 --sport 56799 -d 119.57.0.0/16 -j ACCEPT
iptables -A FORWARD -s 10.247.50.104 -j ACCEPT
iptables -A FORWARD -p 17 -d 200.100.0.0/16 --dport 33445 -s 164.58.121.0/24 -j ACCEPT
iptables -A INPUT -p 6 -s 165.169.41.44 --dport 34344 -j DROP
iptables -A FORWARD -p 17 -s 184.49.221.0/24 -d 141.206.0.0/16 --dport 28856 -j DROP
iptables -A test2 -p 6 --sport 55067 -s 220.113.231.168 -d 45.0.0.0/8 --dport 44505 -j ACCEPT
iptables -A FORWARD -p 17 --sport 57771 -d 34.226.22.207 --dport 64780 -s 87.41.75.0/24 -j DROP
iptables -A test2 -d 245.117.87.223 -j DROP
iptables -A OUTPUT -s 34.233.122.82 -d 216.208.14.27 -j ACCEPT
iptables -A INPUT -d 90.187.109.0/24 -j DROP
iptables -A test3 -s 188.142.158.44 -j ACCEPT
iptables -A INPUT -p 6 --dport 11300 -d 92.199.175.221 -s 116.102.0.0/16 -j ACCEPT
iptables -A test1 -p 228 -j DROP
iptables -A FORWARD -p 17 -s 195.247.0.0/16 --sport 51218 -j DROP
iptables -A INPUT -p 6 --dport 52203 --sport 28044 -d 216.90.41.141 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 19721 -d 91.242.77.197 -s 78.0.0.0/8 -j DROP
iptables -A test1 -p 17 -s 79.254.190.232 --sport 59625 -d 74.0.0.0/8 -j DROP
iptables -A test1 -p 6 -s 129.119.60.152 -d 101.55.199.48 --sport 54083 -j DROP
iptables -A test2 -p 6 --sport 20860 -j DROP
iptables -A INPUT -p 231 -j ACCEPT
iptables -A test2 -p 6 --dport 36820 -s 63.214.2.101 -d 249.167.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 32918 -s 85.174.128.199 -j ACCEPT
iptables -A test2 -p 240 -j ACCEPT
iptables -A OUTPUT -p 17 -d 94.0.0.0/8 -s 182.220.71.232 --dport 52842 -j DROP
iptables -A FORWARD -p 6 -d 74.73.220.101 --dport 58682 -j ACCEPT
iptables -A FORWARD -p 9 -d 242.153.30.0/24 -j DROP
iptables -A OUTPUT -s 245.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 53855 -s 93.247.87.81 -d 129.237.0.0/16 -j ACCEPT
iptables -A test3 -s 195.232.162.208 -p 94 -j DROP
iptables -A test2 -p 17 -s 36.21.0.0/16 --sport 49410 -d 163.238.159.253 --dport 9531 -j ACCEPT
iptables -A FORWARD -p 17 --sport 56817 --dport 41803 -j DROP
iptables -A INPUT -d 73.208.136.208 -j ACCEPT
iptables -A test1 -p 6 -s 8.188.76.0/24 --sport 32966 -j ACCEPT
iptables -A test3 -p 6 --dport 51350 -s 90.146.177.0/24 -j DROP
iptables -A OUTPUT -s 86.188.187.0/24 -j ACCEPT
iptables -A test1 -p 17 -s 154.43.219.0/24 -d 169.104.0.0/16 --sport 55515 -j ACCEPT
iptables -A test1 -p 6 -s 163.203.7.218 --dport 9304 -j DROP
iptables -A test2 -p 17 --dport 1357 -d 128.9.202.0/24 -s 62.64.112.0/24 --sport 9363 -j ACCEPT
iptables -A test1 -p 6 --dport 49679 --sport 42782 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 65334 -j DROP
iptables -A test1 -p 94 -j ACCEPT
iptables -A OUTPUT -p 12 -d 15.35.10.76 -j DROP
iptables -A FORWARD -p 6 --sport 52961 -j ACCEPT
iptables -A FORWARD -p 6 --dport 27636 -j ACCEPT
iptables -A FORWARD -s 5.252.135.0/24 -j DROP
iptables -A INPUT -p 6 --sport 53668 -d 92.193.3.208 -j DROP
iptables -A OUTPUT -p 6 --dport 65303 --sport 19783 -j ACCEPT
iptables -A test2 -p 213 -d 81.0.0.0/8 -s 77.251.135.11 -j ACCEPT
iptables -A test2 -p 6 --sport 45541 -s 150.0.0.0/8 --dport 39120 -d 84.8.7.187 -j DROP
iptables -A test3 -s 68.234.6.27 -p 240 -j ACCEPT
iptables -A OUTPUT -p 6 -d 235.0.0.0/8 --dport 45015 -s 183.107.193.127 -j ACCEPT
iptables -A FORWARD -d 178.100.0.0/16 -s 76.123.216.0/24 -j ACCEPT
iptables -A test3 -s 33.209.57.0/24 -j DROP
iptables -A test2 -s 243.188.10.164 -j ACCEPT
iptables -A test2 -p 6 -d 234.53.0.0/16 --sport 4314 -s 46.83.139.239 -j DROP
iptables -A OUTPUT -p 6 -s 34.5.9.80 --dport 34508 -j ACCEPT
iptables -A OUTPUT -p 6 -s 234.180.250.175 -d 140.0.0.0/8 --dport 33136 -j ACCEPT
iptables -A FORWARD -p 6 --sport 1255 -j ACCEPT
iptables -A test1 -p 33 -j DROP
iptables -A test1 -p 6 -s 204.0.0.0/8 -d 33.231.90.192 --dport 16399 -j ACCEPT
iptables -A test3 -s 56.178.68.229 -p 124 -j DROP
iptables -A INPUT -s 151.0.0.0/8 -d 94.229.208.143 -p 68 -j ACCEPT
iptables -A OUTPUT -s 254.119.201.3 -j DROP
iptables -A test1 -p 6 --dport 13296 -s 231.198.115.28 -j DROP
iptables -A test1 -p 55 -d 231.150.98.32 -s 35.0.0.0/8 -j ACCEPT
iptables -A test2 -p 23 -s 189.85.80.0/24 -j DROP
iptables -A test2 -p 17 -d 215.225.171.171 --sport 15074 -j ACCEPT
iptables -A OUTPUT -p 6 -s 145.121.236.0/24 --dport 11093 --sport 16418 -j test1
iptables -A test3 -s 93.35.25.169 -d 106.239.179.0/24 -j DROP
iptables -A INPUT -p 6 --sport 30960 --dport 27445 -s 29.94.0.0/16 -d 197.118.70.239 -j ACCEPT
iptables -A test3 -p 17 -s 214.247.217.150 --sport 29726 -j DROP
iptables -A INPUT -d 160.33.51.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 8764 --sport 61925 -j DROP
iptables -A test3 -s 171.60.118.66 -d 124.233.0.112 -j DROP
iptables -A test2 -p 17 --dport 18482 -s 132.240.0.0/16 --sport 41120 -d 219.23.79.36 -j DROP
iptables -A test1 -p 6 -d 63.251.90.56 --dport 44599 --sport 1707 -j ACCEPT
iptables -A FORWARD -p 6 --dport 20458 --sport 55107 -s 201.247.59.88 -d 197.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 44309 -j DROP
iptables -A OUTPUT -p 89 -s 40.85.152.240 -j ACCEPT
iptables -A test2 -p 6 --dport 55889 --sport 45511 -d 37.94.24.79 -j DROP
iptables -A OUTPUT -p 17 --sport 33268 -s 57.198.24.118 -j ACCEPT
iptables -A test3 -p 6 --dport 2342 --sport 9870 -j DROP
iptables -A test1 -p 6 --dport 64723 -j ACCEPT
iptables -A test1 -p 17 -s 19.0.0.0/8 --sport 19451 -d 80.53.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --sport 21640 --dport 42894 -s 189.177.156.197 -d 218.49.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 27015 -s 215.98.206.0/24 --dport 54682 -j DROP
iptables -A FORWARD -s 30.152.9.203 -p 103 -j ACCEPT
iptables -A test2 -p 6 --sport 4618 -j DROP
iptables -A test2 -p 17 -s 48.179.69.0/24 -d 251.199.202.0/24 --dport 45583 --sport 32677 -j ACCEPT
iptables -A test3 -s 184.105.181.33 -j ACCEPT
iptables -A OUTPUT -p 6 -s 169.54.198.30 -d 255.169.0.0/16 --dport 4454 -j DROP
iptables -A test1 -p 6 --sport 3845 -d 208.49.235.181 -j DROP
iptables -A test3 -p 17 -s 123.104.0.0/16 --dport 48937 -j DROP
iptables -A test2 -p 6 --sport 24490 -s 97.242.0.0/16 -d 97.185.65.80 -j ACCEPT
iptables -A test1 -p 17 -s 242.145.92.45 -d 53.204.0.0/16 --sport 33414 -j DROP
iptables -A test2 -p 17 --sport 29634 -d 214.129.84.45 --dport 65457 -j DROP
iptables -A INPUT -p 6 --dport 62307 -s 7.84.181.64 -d 198.47.178.134 -j ACCEPT
iptables -A test1 -p 6 --dport 62575 -j DROP
iptables -A INPUT -p 6 --dport 59008 -s 136.0.0.0/8 -d 79.2.252.86 -j DROP
iptables -A test3 -d 53.219.255.0/24 -p 55 -j ACCEPT
iptables -A FORWARD -p 6 --dport 58680 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 13427 -s 213.254.238.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 60626 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 9560 -s 228.107.200.77 --sport 3916 -j DROP
iptables -A FORWARD -p 17 --sport 11389 -d 237.53.215.108 -j DROP
iptables -A INPUT -p 17 --sport 59308 -j ACCEPT
iptables -A test3 -s 62.118.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 25309 -s 187.26.56.0/24 -d 115.13.223.22 -j ACCEPT
iptables -A INPUT -d 60.221.179.43 -s 113.61.137.0/24 -j DROP
iptables -A test2 -p 17 -s 149.125.242.187 --sport 12228 -d 207.52.67.14 -j ACCEPT
iptables -A FORWARD -p 17 --dport 51546 -j DROP
iptables -A test1 -p 17 -d 190.167.111.0/24 --dport 42391 --sport 28298 -j ACCEPT
iptables -A INPUT -p 6 --sport 59644 --dport 44923 -s 83.4.155.152 -j ACCEPT
iptables -A test2 -p 17 -s 28.7.0.0/16 --sport 39609 -d 246.54.126.68 -j ACCEPT
iptables -A test3 -s 227.107.244.85 -j DROP
iptables -A FORWARD -p 17 --dport 11909 -d 5.210.224.130 -s 169.191.199.98 -j DROP
iptables -A OUTPUT -p 6 --sport 56718 -s 93.239.139.0/24 --dport 37047 -d 123.120.0.0/16 -j ACCEPT
iptables -A OUTPUT -s 251.252.135.101 -p 209 -j ACCEPT
iptables -A test3 -p 56 -j DROP
iptables -A test1 -p 6 --sport 21627 -j ACCEPT
iptables -A FORWARD -s 89.164.248.246 -j ACCEPT
iptables -A test3 -p 6 -s 172.0.0.0/8 --dport 53553 --sport 52403 -j DROP
iptables -A test1 -p 6 --sport 19284 --dport 20937 -j DROP
iptables -A test2 -p 219 -j DROP
iptables -A test1 -p 6 --dport 56974 -d 198.0.0.0/8 --sport 58220 -j DROP
iptables -A test1 -p 17 --dport 48374 -d 142.123.43.30 -j DROP
iptables -A INPUT -p 17 --sport 27220 -j ACCEPT
iptables -A test3 -p 17 --dport 30008 -d 64.5.155.77 --sport 55793 -j ACCEPT
iptables -A INPUT -s 224.52.67.225 -p 151 -d 149.11.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 20735 -j test1
iptables -A INPUT -p 6 --sport 6716 -j DROP
iptables -A FORWARD -s 181.221.208.88 -j DROP
iptables -A INPUT -p 156 -j ACCEPT
iptables -A FORWARD -p 17 --sport 15384 -j ACCEPT
iptables -A INPUT -p 6 -d 175.120.0.0/16 -s 226.72.182.10 --sport 5628 --dport 8167 -j DROP
iptables -A FORWARD -p 6 -d 185.110.134.172 --sport 12924 -j DROP
iptables -A INPUT -p 17 --dport 12568 -d 163.0.0.0/8 -j DROP
iptables -A FORWARD -p 57 -j ACCEPT
iptables -A FORWARD -d 49.74.232.180 -p 248 -j DROP
iptables -A OUTPUT -p 17 -s 173.170.65.0/24 -d 246.117.142.125 --sport 6057 -j ACCEPT
iptables -A test3 -p 6 --dport 63903 -d 210.105.31.77 -s 248.132.36.216 -j DROP
iptables -A test1 -p 6 --dport 2057 -d 141.101.13.0/24 -s 76.30.16.0/24 -j ACCEPT
iptables -A INPUT -p 17 --dport 24842 -s 155.208.133.228 -j ACCEPT
iptables -A test2 -p 17 -s 226.107.181.18 --sport 63798 --dport 25234 -j ACCEPT
iptables -A test3 -d 183.203.175.235 -j ACCEPT
iptables -A test3 -p 6 --dport 5556 -s 235.232.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --dport 43526 --sport 20670 -j DROP
iptables -A OUTPUT -p 6 --dport 60784 --sport 28551 -j ACCEPT
iptables -A test3 -p 6 -s 249.121.198.103 --sport 22453 -j DROP
iptables -A FORWARD -p 6 --dport 7859 --sport 59040 -j DROP
iptables -A OUTPUT -d 236.252.175.0/24 -j DROP
iptables -A test2 -d 123.233.102.0/24 -j DROP
iptables -A FORWARD -s 11.45.35.28 -j DROP
iptables -A test3 -p 17 --sport 32409 -j DROP
iptables -A test1 -p 17 -s 158.48.134.177 --dport 47422 -j DROP
iptables -A test1 -p 6 --sport 62399 -j ACCEPT
iptables -A FORWARD -p 17 --sport 5766 -s 164.182.0.0/16 -d 113.27.140.82 -j DROP
iptables -A FORWARD -p 17 --dport 46316 -j DROP
iptables -A test3 -p 81 -s 183.55.151.0/24 -j ACCEPT
iptables -A INPUT -p 246 -s 209.226.0.0/16 -j DROP
iptables -A INPUT -p 196 -j test1
iptables -A FORWARD -d 213.73.223.233 -j ACCEPT
iptables -A INPUT -p 17 -d 231.113.118.50 --sport 22075 -j DROP
iptables -A test1 -p 6 --dport 39205 -d 198.206.35.0/24 -j ACCEPT
iptables -A INPUT -s 236.141.223.6 -j DROP
iptables -A test1 -p 17 --sport 2432 --dport 21100 -j ACCEPT
iptables -A test2 -p 6 -s 135.144.0.0/16 -d 52.237.69.0/24 --sport 49051 -j DROP
iptables -A test1 -p 17 --sport 5022 -d 136.0.0.0/8 -j DROP
iptables -A test3 -p 6 --sport 26667 --dport 46656 -d 108.64.46.0/24 -j ACCEPT
iptables -A test3 -p 17 -d 237.79.227.100 --sport 29814 -j DROP
iptables -A test3 -p 17 --dport 25100 -j DROP
iptables -A OUTPUT -p 17 --dport 44869 -s 168.31.155.47 -d 209.50.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --dport 9154 -d 192.212.52.120 -j DROP
iptables -A test1 -d 90.88.230.38 -j DROP
iptables -A test2 -p 80 -s 187.2.128.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -d 148.75.34.188 --sport 6609 --dport 2477 -j ACCEPT
iptables -A test3 -p 6 --sport 26884 --dport 57586 -j ACCEPT
iptables -A test1 -p 17 --dport 28321 -s 221.117.0.0/16 -j DROP
iptables -A test2 -p 6 -d 57.21.0.0/16 --sport 56850 --dport 13084 -s 153.37.0.0/16 -j DROP
iptables -A test2 -p 6 --sport 42729 -j DROP
iptables -A test3 -p 17 --sport 40796 -j DROP
iptables -A test1 -p 17 --dport 16510 -s 167.177.193.0/24 --sport 9389 -j ACCEPT
iptables -A OUTPUT -p 17 -d 95.190.0.0/16 --sport 27659 -j DROP
iptables -A INPUT -p 6 --sport 10360 -s 104.3.102.107 -d 173.154.40.198 -j DROP
iptables -A test3 -p 17 -d 148.3.119.228 --dport 12218 -j ACCEPT
iptables -A test1 -p 17 --dport 14145 -s 134.94.105.222 -d 187.96.45.64 -j ACCEPT
iptables -A test3 -d 176.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -d 80.146.140.138 -s 144.134.0.0/16 --sport 45022 -j DROP
iptables -A OUTPUT -p 6 --dport 49237 -j ACCEPT
iptables -A FORWARD -p 6 --dport 17637 -d 76.0.0.0/8 --sport 16901 -j DROP
iptables -A test3 -p 17 -d 177.0.0.0/8 --dport 4333 -j ACCEPT
iptables -A OUTPUT -p 223 -j DROP
iptables -A test1 -p 6 -d 188.0.0.0/8 --sport 20194 -j DROP
iptables -A INPUT -d 139.181.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 12175 --dport 50494 -d 106.36.32.134 -j ACCEPT
iptables -A OUTPUT -p 17 -s 240.63.95.89 --dport 10314 --sport 6357 -j ACCEPT
iptables -A test1 -p 42 -j DROP
iptables -A test2 -p 17 --dport 25587 -d 108.42.127.71 --sport 51518 -j DROP
iptables -A test2 -p 17 --sport 18653 -s 170.0.0.0/8 -d 60.39.231.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 -s 38.145.110.89 --dport 56197 --sport 58947 -j DROP
iptables -A test1 -p 17 -d 232.247.0.0/16 --dport 34228 -s 5.228.117.236 -j DROP
iptables -A test1 -p 17 --dport 8193 -j DROP
iptables -A test2 -p 17 --sport 59 -d 22.137.236.40 -j DROP
iptables -A test2 -p 17 --dport 13213 -d 2.0.0.0/8 -s 216.113.239.111 -j ACCEPT
iptables -A FORWARD -p 6 --dport 7992 -j DROP
iptables -A INPUT -p 6 -d 41.64.167.132 --dport 49230 -j DROP
iptables -A INPUT -p 6 -s 205.41.237.83 --sport 30784 --dport 47879 -j ACCEPT
iptables -A OUTPUT -p 17 -d 254.0.0.0/8 --dport 31657 -j DROP
iptables -A INPUT -p 6 -d 5.116.136.158 --sport 19433 -s 209.5.248.164 -j ACCEPT
iptables -A FORWARD -s 236.127.66.164 -d 124.117.242.97 -j ACCEPT
iptables -A INPUT -p 6 -s 247.147.73.0/24 --dport 4421 -j ACCEPT
iptables -A test3 -d 213.128.220.238 -j ACCEPT
iptables -A FORWARD -p 17 -d 92.108.13.0/24 --dport 47439 -s 246.0.0.0/8 --sport 7874 -j test1
iptables -A test2 -p 17 --sport 46843 -d 204.231.219.0/24 -j ACCEPT
iptables -A test2 -p 6 --sport 45279 -j DROP
iptables -A OUTPUT -p 17 -d 176.121.71.0/24 --sport 55778 -j ACCEPT
iptables -A test3 -p 93 -s 91.172.139.0/24 -j DROP
iptables -A FORWARD -p 6 --dport 23042 -d 111.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 -s 118.198.239.178 --sport 28812 -j ACCEPT
iptables -A test3 -p 80 -j DROP
iptables -A test3 -d 221.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -d 140.27.212.0/24 --dport 64897 -j ACCEPT
iptables -A FORWARD -s 161.98.145.154 -j ACCEPT
iptables -A INPUT -p 6 --sport 29359 -s 118.11.16.0 -j DROP
iptables -A test2 -s 123.145.241.51 -j DROP
iptables -A OUTPUT -p 6 --sport 4218 --dport 22196 -s 250.38.190.161 -j test2
iptables -A test3 -p 6 --sport 22086 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 18097 -d 0.78.251.165 --sport 16574 -s 145.145.124.116 -j ACCEPT
iptables -A test2 -p 212 -s 10.210.114.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 64784 -j ACCEPT
iptables -A FORWARD -p 6 --sport 18069 -d 222.45.0.0/16 -j DROP
iptables -A FORWARD -p 17 -d 193.114.51.68 --dport 24325 -s 89.235.76.36 -j ACCEPT
iptables -A FORWARD -p 17 -s 255.139.254.0/24 --sport 53964 -j DROP
iptables -A OUTPUT -p 6 -d 49.252.0.0/16 --sport 13519 -s 214.219.42.199 -j ACCEPT
iptables -A FORWARD -p 6 --sport 44560 --dport 54312 -s 82.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 14560 -d 170.254.204.0/24 -s 95.9.72.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 12966 -d 120.95.205.87 -j DROP
iptables -A OUTPUT -s 122.18.0.0/16 -j test1
iptables -A test2 -p 6 --dport 791 -j DROP
iptables -A test2 -p 17 -d 143.129.0.0/16 -s 246.74.0.0/16 --sport 28815 -j ACCEPT
iptables -A INPUT -d 201.183.218.170 -p 180 -j DROP
iptables -A FORWARD -p 6 -s 232.101.248.0/24 -d 140.137.42.0/24 --dport 32049 -j DROP
iptables -A test3 -p 6 --dport 35675 -j ACCEPT
iptables -A INPUT -p 17 --sport 64028 --dport 14444 -d 155.223.6.210 -j DROP
iptables -A FORWARD -p 17 -d 83.192.247.131 --dport 61339 -s 185.0.0.0/8 --sport 20143 -j ACCEPT
iptables -A test1 -p 6 --dport 60301 -s 121.168.106.84 --sport 62651 -j ACCEPT
iptables -A test1 -p 17 --dport 47300 --sport 33787 -j DROP
iptables -A test2 -p 17 -d 136.102.0.0/16 --sport 57290 -j DROP
iptables -A test2 -p 17 --dport 57607 --sport 38441 -j ACCEPT
iptables -A test1 -p 17 --sport 47482 --dport 6137 -s 155.218.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --dport 44912 --sport 48704 -j DROP
iptables -A FORWARD -p 6 --sport 38970 -s 15.190.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 -d 133.172.232.0/24 --sport 37623 -s 113.27.0.0/16 -j DROP
iptables -A test1 -p 17 --sport 23088 -j DROP
iptables -A test3 -p 17 --sport 2653 -j DROP
iptables -A test3 -p 6 -s 190.84.81.152 --sport 20379 -j DROP
iptables -A INPUT -p 6 --dport 58402 --sport 48000 -j ACCEPT
iptables -A OUTPUT -p 43 -s 10.200.103.34 -d 15.209.23.105 -j DROP
iptables -A FORWARD -s 101.18.0.0/16 -d 227.73.212.243 -j DROP
iptables -A test2 -p 6 --sport 23945 --dport 49843 -d 95.220.0.0/16 -s 249.51.191.91 -j ACCEPT
iptables -A test1 -p 6 --sport 32712 -j DROP
iptables -A test1 -d 231.199.69.89 -j DROP
iptables -A test3 -p 6 -d 230.63.214.113 -s 7.42.57.0/24 --dport 3928 -j ACCEPT
iptables -A test2 -p 17 -s 183.6.105.226 --dport 7152 -j DROP
iptables -A test3 -p 17 -d 121.164.143.73 --sport 10467 -j DROP
iptables -A test3 -p 17 --dport 49586 --sport 26066 -j DROP
iptables -A FORWARD -p 6 --dport 42451 --sport 46642 -s 144.45.158.211 -j ACCEPT
iptables -A test2 -p 6 --sport 38875 -j DROP
iptables -A FORWARD -p 17 --dport 34906 -s 229.182.158.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -s 203.101.0.0/16 --sport 9806 -d 205.0.0.0/8 -j DROP
iptables -A test2 -d 32.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --sport 16196 -j ACCEPT
iptables -A test2 -p 6 -d 193.151.214.205 --dport 45214 --sport 16008 -j ACCEPT
iptables -A OUTPUT -p 17 -d 144.0.0.0/8 --dport 13747 -s 116.28.113.210 -j ACCEPT
iptables -A OUTPUT -p 17 -d 57.0.0.0/8 --dport 24242 -s 222.0.0.0/8 --sport 4754 -j ACCEPT
iptables -A OUTPUT -p 17 -d 164.189.0.0/16 --sport 14279 -j DROP
iptables -A test2 -p 6 -s 165.95.58.160 --sport 32544 -d 7.160.176.211 -j ACCEPT
iptables -A test2 -s 174.212.65.0/24 -j ACCEPT
iptables -A test2 -p 151 -j ACCEPT
iptables -A FORWARD -p 6 --dport 48444 -j DROP
iptables -A test2 -d 236.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --dport 2343 -j ACCEPT
iptables -A test2 -d 162.213.0.0/16 -j DROP
iptables -A test3 -p 6 -d 190.61.0.0/16 --sport 7741 -j ACCEPT
iptables -A INPUT -d 186.0.0.0/8 -s 206.183.187.249 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 39206 --dport 28455 -s 86.227.221.230 -j ACCEPT
iptables -A test3 -p 6 --sport 1861 -d 40.239.0.0/16 -s 228.17.110.196 -j DROP
iptables -A test2 -p 6 -d 221.0.0.0/8 --dport 61965 -s 45.0.0.0/8 --sport 60259 -j DROP
iptables -A test1 -p 6 --dport 7345 -j ACCEPT
iptables -A OUTPUT -p 75 -j DROP
iptables -A OUTPUT -p 0 -j DROP
iptables -A INPUT -p 6 --sport 38397 -d 39.18.59.247 -j DROP
iptables -A INPUT -p 6 --dport 59646 -j DROP
iptables -A INPUT -p 6 -d 79.0.0.0/8 --dport 59204 -s 35.193.101.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -d 71.101.0.0/16 --sport 65146 --dport 34241 -s 224.5.240.32 -j DROP
iptables -A INPUT -p 78 -j ACCEPT
iptables -A OUTPUT -p 17 -s 127.8.0.0/16 --dport 63841 -d 178.109.160.210 -j ACCEPT
iptables -A INPUT -p 17 --dport 12062 -s 90.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --dport 4782 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 15525 -s 153.137.165.56 -j test2
iptables -A INPUT -p 6 -d 118.59.172.178 --dport 41518 -j DROP
iptables -A FORWARD -d 54.67.0.0/16 -j ACCEPT
iptables -A INPUT -d 12.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 -d 20.94.0.0/16 --sport 57377 -s 101.0.0.0/8 -j ACCEPT
iptables -A INPUT -s 152.0.0.0/8 -j test2
iptables -A FORWARD -p 6 -s 98.31.183.184 --sport 31687 -d 98.136.220.248 -j ACCEPT
iptables -A test1 -p 17 --dport 32742 -d 90.188.195.0/24 -j DROP
iptables -A test1 -p 74 -j ACCEPT
iptables -A test3 -p 6 --dport 59947 --sport 24065 -j ACCEPT
iptables -A test3 -p 17 -d 29.8.0.0/16 -s 183.152.99.141 --dport 15527 -j DROP
iptables -A test1 -p 6 -d 230.253.64.148 --dport 51177 --sport 38450 -j ACCEPT
iptables -A FORWARD -p 6 -d 143.231.201.156 --sport 60774 -j DROP
iptables -A OUTPUT -p 168 -j ACCEPT
iptables -A FORWARD -p 17 -s 179.164.204.61 --dport 51033 -d 185.108.145.89 --sport 9283 -j DROP
iptables -A test2 -p 6 -d 141.70.112.235 --dport 7909 -j ACCEPT
iptables -A test3 -p 97 -d 23.149.0.0/16 -j DROP
iptables -A test1 -p 6 --dport 46447 -d 75.0.0.0/8 --sport 25005 -j DROP
iptables -A test1 -p 23 -s 248.0.0.0/8 -d 179.51.0.0/16 -j DROP
iptables -A test2 -p 6 -s 86.231.0.0/16 --dport 38845 -j ACCEPT
iptables -A INPUT -p 17 -d 136.179.3.0/24 --sport 55059 -j DROP
iptables -A FORWARD -p 6 --dport 60318 -d 52.163.2.27 -j ACCEPT
iptables -A test1 -p 17 --sport 43637 -d 71.76.24.232 --dport 48331 -j ACCEPT
iptables -A test3 -p 17 --sport 12812 -j ACCEPT
iptables -A test2 -s 177.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --sport 58984 -d 34.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --sport 10963 --dport 22554 -d 23.238.250.103 -j DROP
iptables -A FORWARD -p 190 -d 160.137.186.0/24 -s 186.248.145.71 -j DROP
iptables -A test1 -p 6 -s 174.51.0.0/16 --sport 24270 -j DROP
iptables -A test2 -p 6 -s 202.77.91.8 --dport 22536 -d 149.78.154.0/24 -j DROP
iptables -A test2 -p 17 -s 86.66.172.182 -d 188.245.191.0/24 --sport 48736 -j ACCEPT
iptables -A test3 -p 17 --dport 28079 --sport 42373 -s 28.30.6.111 -d 72.86.243.82 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 12798 -j ACCEPT
iptables -A test3 -p 6 --dport 37699 -j DROP
iptables -A INPUT -p 6 --sport 55338 -d 149.137.95.0/24 --dport 4077 -j ACCEPT
iptables -A test3 -p 6 --dport 43203 -j ACCEPT
iptables -A OUTPUT -s 228.97.122.52 -p 115 -d 178.207.34.0/24 -j test1
iptables -A INPUT -p 6 --sport 50249 -d 131.0.0.0/8 -s 176.40.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 32222 -d 174.0.0.0/8 --sport 16956 -j ACCEPT
iptables -A test1 -p 42 -s 180.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 -s 139.227.0.0/16 --dport 43942 --sport 56917 -j DROP
iptables -A OUTPUT -p 142 -j DROP
iptables -A test2 -p 17 --sport 42304 -j ACCEPT
iptables -A test1 -p 6 --dport 42058 -d 1.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 -d 72.229.149.81 --sport 52926 -j DROP
iptables -A test1 -p 6 -d 110.32.192.28 -s 101.48.124.17 --dport 39747 -j DROP
iptables -A test3 -p 17 -s 104.31.202.0/24 -d 251.254.203.0/24 --sport 59105 -j ACCEPT
iptables -A test1 -d 126.4.80.148 -s 135.161.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --sport 3592 --dport 1291 -s 235.99.40.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 53536 --dport 43660 -d 49.124.0.0/16 -s 194.83.21.241 -j ACCEPT
iptables -A test1 -p 17 --sport 52757 -s 23.210.86.151 --dport 64812 -j ACCEPT
iptables -A test2 -p 6 --sport 8956 -j DROP
iptables -A OUTPUT -p 17 --sport 30355 -j ACCEPT
iptables -A test1 -d 235.117.97.0/24 -j ACCEPT
iptables -A test1 -p 134 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 45260 --sport 21515 -j DROP
iptables -A test2 -p 17 -s 123.0.0.0/8 --sport 35737 -j DROP
iptables -A FORWARD -p 17 --sport 6383 -s 15.39.67.172 -d 3.98.237.227 -j ACCEPT
iptables -A test3 -p 17 --dport 31464 -s 103.181.35.158 -j ACCEPT
iptables -A INPUT -p 6 --sport 35648 -j ACCEPT
iptables -A INPUT -p 17 --dport 48274 -j DROP
iptables -A test1 -p 6 --sport 6883 -j ACCEPT
iptables -A test3 -p 17 --sport 45698 -s 98.57.0.144 -j DROP
iptables -A test2 -p 19 -s 170.207.240.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 16198 -d 198.77.100.197 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 36205 -s 75.81.235.0/24 -j DROP
iptables -A test1 -p 17 -s 190.72.33.2 --dport 28697 -d 242.80.138.151 -j ACCEPT
iptables -A FORWARD -p 6 -s 218.239.60.5 --sport 57178 -d 205.66.75.168 -j ACCEPT
iptables -A test1 -p 6 --sport 2492 -j DROP
iptables -A test1 -p 6 --dport 20250 -d 117.56.14.96 -j ACCEPT
iptables -A OUTPUT -p 17 -d 107.0.0.0/8 --dport 21879 -s 167.237.101.221 -j ACCEPT
iptables -A test1 -p 6 --sport 8834 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 22498 -d 100.69.0.0/16 -j DROP
iptables -A test3 -s 145.9.250.0/24 -p 87 -j ACCEPT
iptables -A OUTPUT -p 6 -d 195.239.122.212 --sport 50295 -s 118.0.0.0/8 -j ACCEPT
iptables -A test3 -p 26 -d 147.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 -s 191.0.0.0/8 --sport 12325 --dport 42328 -d 7.153.0.0/16 -j ACCEPT
iptables -A INPUT -p 81 -j test1
iptables -A FORWARD -p 6 --dport 62420 --sport 31524 -j ACCEPT
iptables -A test1 -p 17 -d 64.173.45.247 -s 160.85.0.0/16 --dport 20206 -j ACCEPT
iptables -A test2 -s 160.202.205.0/24 -d 35.0.0.0/8 -j DROP
iptables -A test2 -p 17 -d 219.24.0.0/16 -s 202.207.251.89 --sport 54913 -j DROP
iptables -A test1 -p 17 --sport 39886 -d 181.36.202.168 -j ACCEPT
iptables -A test2 -p 6 --sport 35648 -s 14.234.0.0/16 --dport 48108 -j DROP
iptables -A test3 -p 6 -d 67.0.0.0/8 -s 243.200.155.145 --sport 5925 -j DROP
iptables -A OUTPUT -p 6 --dport 21454 --sport 13380 -s 32.6.28.39 -j ACCEPT
iptables -A test3 -p 17 --sport 40750 -s 38.198.141.0/24 -j DROP
iptables -A test2 -p 6 --dport 12495 --sport 46269 -d 253.254.43.0/24 -j ACCEPT
iptables -A INPUT -p 6 --dport 10833 -j ACCEPT
iptables -A OUTPUT -s 208.38.94.136 -j ACCEPT
iptables -A OUTPUT -p 6 -s 232.224.146.0/24 --dport 13435 --sport 17775 -j DROP
iptables -A test3 -d 24.0.0.0/8 -j DROP
iptables -A test2 -p 6 --dport 44747 --sport 37378 -s 226.144.99.219 -j DROP
iptables -A test3 -p 17 -s 225.233.139.33 --sport 40600 -j ACCEPT
iptables -A INPUT -p 6 --sport 27776 -s 19.100.166.0/24 --dport 55350 -j ACCEPT
iptables -A FORWARD -p 5 -d 2.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 54741 -s 154.13.0.0/16 -j DROP
iptables -A OUTPUT -p 58 -d 137.163.79.197 -j ACCEPT
iptables -A INPUT -p 6 -d 97.154.115.122 --sport 26319 -j DROP
iptables -A INPUT -p 6 --dport 63990 --sport 50740 -s 54.55.144.0/24 -j ACCEPT
iptables -A INPUT -p 6 --sport 2257 -s 234.42.238.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 50402 -j DROP
iptables -A FORWARD -d 68.125.126.180 -p 249 -j ACCEPT
iptables -A FORWARD -p 17 --dport 42994 -d 237.141.106.166 -j test1
iptables -A test2 -p 6 --sport 1972 -s 179.0.0.0/8 --dport 50278 -j DROP
iptables -A OUTPUT -p 17 --dport 17709 --sport 33572 -j ACCEPT
iptables -A test3 -p 69 -d 43.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 -s 36.0.0.0/8 --dport 20703 -j DROP
iptables -A INPUT -p 6 --sport 15832 -s 66.88.218.72 --dport 14737 -j DROP
iptables -A INPUT -p 147 -s 219.183.83.95 -j ACCEPT
iptables -A test1 -s 149.241.122.121 -j DROP
iptables -A FORWARD -p 251 -s 253.17.227.23 -j DROP
iptables -A FORWARD -p 6 --sport 8188 -j ACCEPT
iptables -A test3 -p 17 -s 213.192.59.202 --dport 38585 --sport 33725 -j DROP
iptables -A FORWARD -p 6 -s 182.24.84.253 --dport 4411 -j DROP
iptables -A FORWARD -p 6 -d 18.70.118.48 --dport 49528 --sport 27971 -j DROP
iptables -A test2 -p 17 --dport 39876 -d 21.150.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 -s 68.0.0.0/8 --sport 50506 -j ACCEPT
iptables -A FORWARD -p 6 --sport 29991 --dport 1598 -j ACCEPT
iptables -A FORWARD -p 6 --sport 9471 --dport 8078 -d 106.0.0.0/8 -j DROP
iptables -A test1 -p 17 --dport 62624 --sport 37783 -j DROP
iptables -A test3 -s 29.0.0.0/8 -j ACCEPT
iptables -A test3 -s 192.123.0.0/16 -d 5.215.190.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 11859 -j DROP
iptables -A OUTPUT -p 6 --dport 14577 -d 28.15.0.0/24 --sport 23424 -s 122.245.239.234 -j DROP
iptables -A OUTPUT -p 17 -s 126.60.0.0/16 --dport 52593 -d 172.21.205.235 -j ACCEPT
iptables -A OUTPUT -p 6 -d 127.13.137.147 --sport 19040 -j DROP
iptables -A test2 -p 17 --sport 14374 -s 239.72.19.115 -j ACCEPT
iptables -A FORWARD -p 17 --dport 57799 -s 245.243.36.110 -j DROP
iptables -A test2 -p 17 -s 170.62.94.175 --dport 40911 -j ACCEPT
iptables -A test1 -p 40 -j DROP
iptables -A test1 -p 6 --dport 34999 -d 239.34.0.0/16 -j DROP
iptables -A FORWARD -p 6 --sport 44614 --dport 35076 -d 43.185.167.15 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 46771 -j ACCEPT
iptables -A test3 -p 17 -d 53.223.150.0/24 --sport 462 -s 75.250.51.220 -j DROP
iptables -A test3 -p 30 -j ACCEPT
iptables -A FORWARD -p 17 --dport 16791 -j DROP
iptables -A test1 -d 144.141.222.0/24 -j DROP
iptables -A INPUT -p 17 -s 145.0.0.0/8 --dport 952 -d 121.189.129.20 -j ACCEPT
iptables -A test3 -p 6 --dport 57353 -d 52.28.241.173 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 34924 -s 32.0.0.0/8 --sport 29561 -d 7.0.0.0/8 -j DROP
iptables -A INPUT -p 36 -j ACCEPT
iptables -A test3 -s 102.50.226.179 -j ACCEPT
iptables -A test3 -p 17 --dport 57916 -j DROP
iptables -A test3 -p 6 --dport 34572 -j DROP
iptables -A FORWARD -p 17 --dport 6207 --sport 43414 -s 228.56.60.0/24 -j DROP
iptables -A test2 -p 6 -s 217.0.0.0/8 --sport 8240 --dport 27788 -j DROP
iptables -A test2 -d 56.188.241.215 -j DROP
iptables -A OUTPUT -p 38 -j ACCEPT
iptables -A test2 -p 17 --sport 18678 -s 41.212.210.20 --dport 46358 -j DROP
iptables -A test1 -p 17 --sport 65065 -d 241.178.215.241 -j ACCEPT
iptables -A test1 -p 6 --dport 47813 -s 221.89.36.138 -j DROP
iptables -A OUTPUT -d 181.89.67.106 -p 213 -j ACCEPT
iptables -A test1 -p 6 --sport 10238 -j ACCEPT
iptables -A test3 -p 17 --sport 55438 -s 210.202.0.0/16 -j DROP
iptables -A test2 -p 6 --dport 47773 -d 67.6.183.0/24 -j DROP
iptables -A test3 -p 17 -s 252.75.55.73 --dport 3884 --sport 36643 -j DROP
iptables -A OUTPUT -d 239.18.212.127 -j ACCEPT
iptables -A test3 -p 17 --sport 22926 -j DROP
iptables -A FORWARD -p 17 --sport 12153 --dport 28344 -j ACCEPT
iptables -A OUTPUT -p 6 -s 55.204.203.95 --sport 8740 -j ACCEPT
iptables -A FORWARD -d 238.187.167.113 -s 136.41.199.103 -j ACCEPT
iptables -A OUTPUT -p 6 -d 102.162.15.254 --dport 37513 --sport 53739 -j ACCEPT
iptables -A INPUT -p 6 --dport 57539 -d 146.221.32.0/24 -s 238.60.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --sport 60611 --dport 10541 -s 2.29.19.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --dport 47674 --sport 48869 -s 140.229.100.0/24 -j DROP
iptables -A FORWARD -p 6 -d 211.218.107.222 -s 216.130.38.70 --dport 19944 --sport 523 -j DROP
iptables -A test3 -p 17 --sport 18035 --dport 12592 -d 32.185.0.0/16 -j ACCEPT
iptables -A test2 -d 77.34.63.173 -p 57 -j DROP
iptables -A test1 -p 6 --dport 32097 -s 204.152.223.234 -d 197.242.0.0/16 --sport 55185 -j ACCEPT
iptables -A FORWARD -p 6 --dport 7222 -d 136.132.176.130 -j ACCEPT
iptables -A INPUT -d 78.222.0.0/16 -j DROP
iptables -A OUTPUT -p 240 -j ACCEPT
iptables -A FORWARD -p 6 --sport 34359 -j ACCEPT
iptables -A test2 -p 17 --sport 48850 -d 212.250.0.0/16 --dport 32578 -j ACCEPT
iptables -A FORWARD -p 17 -s 11.168.147.17 --sport 44998 --dport 34141 -j ACCEPT
iptables -A test1 -p 6 --sport 61898 --dport 24422 -j ACCEPT
iptables -A test3 -p 17 -d 6.104.0.0/16 --sport 2805 --dport 30428 -j DROP
iptables -A OUTPUT -p 17 --sport 34449 -s 83.207.119.0/24 -d 5.225.125.249 -j ACCEPT
iptables -A test3 -p 17 --sport 39537 -s 212.124.51.201 -d 147.81.41.217 -j DROP
iptables -A test2 -p 17 -s 197.0.0.0/8 --dport 25112 -j ACCEPT
iptables -A FORWARD -p 17 -s 204.141.40.51 --sport 3955 -j DROP
iptables -A FORWARD -p 17 --dport 11267 --sport 42302 -j DROP
iptables -A OUTPUT -p 6 --dport 9402 --sport 57019 -s 87.71.70.204 -j DROP
iptables -A INPUT -p 17 -s 91.160.229.0/24 --sport 60175 -j DROP
iptables -A FORWARD -p 6 -s 235.0.0.0/8 --dport 10830 -d 254.90.1.188 --sport 30678 -j ACCEPT
iptables -A INPUT -p 252 -j DROP
iptables -A INPUT -p 17 -d 95.102.4.0/24 --dport 64984 -j DROP
iptables -A OUTPUT -p 174 -j test1
iptables -A test3 -p 6 --sport 35659 --dport 52792 -j ACCEPT
iptables -A INPUT -d 13.0.0.0/8 -s 141.0.0.0/8 -p 238 -j DROP
iptables -A FORWARD -p 6 -d 201.139.0.0/16 -s 140.0.0.0/8 --dport 25544 -j test3
iptables -A test3 -p 17 --dport 11487 -s 226.133.113.0/24 -j ACCEPT
iptables -A test3 -p 38 -j DROP
iptables -A INPUT -p 17 --dport 36903 -d 61.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 54805 -j ACCEPT
iptables -A INPUT -p 219 -j DROP
iptables -A OUTPUT -p 6 --sport 55165 -s 23.208.207.174 -j ACCEPT
iptables -A test3 -p 6 --sport 33101 -j DROP
iptables -A INPUT -p 17 --sport 33034 -d 16.52.163.27 -s 152.223.189.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 15663 -s 188.32.2.0/24 -j DROP
iptables -A test3 -p 229 -d 1.139.0.0/16 -s 37.99.3.65 -j ACCEPT
iptables -A test2 -s 173.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --dport 27510 -j ACCEPT
iptables -A test3 -p 6 --sport 20911 -s 9.94.254.208 -j DROP
iptables -A FORWARD -p 17 -s 180.0.0.0/8 -d 68.202.241.10 --sport 40502 -j ACCEPT
iptables -A test1 -p 17 --sport 46739 -d 141.26.145.0/24 -s 238.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 --sport 44427 -s 201.68.160.139 -j ACCEPT
iptables -A test2 -p 17 --dport 35679 -j ACCEPT
iptables -A INPUT -p 6 --dport 40473 --sport 19208 -j ACCEPT
iptables -A test1 -p 177 -d 37.15.31.211 -j DROP
iptables -A FORWARD -p 23 -d 59.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 8377 -d 212.0.0.0/8 --dport 34840 -j DROP
iptables -A test2 -p 17 --dport 30524 -s 252.4.1.60 -j ACCEPT
iptables -A test2 -p 6 -s 234.197.226.0/24 --dport 1663 -d 38.85.10.223 -j DROP
iptables -A OUTPUT -p 6 --dport 32450 -s 227.0.0.0/8 -d 37.35.10.0/24 -j DROP
iptables -A test3 -p 225 -j DROP
iptables -A test3 -p 17 --sport 35547 -s 179.82.15.25 -j DROP
iptables -A test1 -p 6 -d 48.64.232.0/24 --sport 35079 -s 184.24.206.0/24 -j DROP
iptables -A INPUT -p 6 --sport 9965 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 33237 -d 36.16.236.128 -s 198.107.247.117 -j DROP
iptables -A test3 -p 6 --sport 4782 -j ACCEPT
iptables -A test2 -p 17 --dport 47449 -d 187.236.0.0/16 -j DROP
iptables -A test3 -p 60 -d 103.37.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 17381 --sport 5860 -j ACCEPT
iptables -A INPUT -p 17 --sport 57938 -d 80.233.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 -d 68.127.154.11 --dport 35522 -j DROP
iptables -A FORWARD -p 6 --dport 61998 -s 245.249.86.240 -d 18.185.0.0/16 --sport 54784 -j ACCEPT
iptables -A test3 -p 233 -j DROP
iptables -A test2 -p 17 --dport 49924 -d 69.21.149.217 --sport 8115 -j DROP
iptables -A OUTPUT -p 6 --sport 38796 --dport 40759 -d 97.0.0.0/8 -j ACCEPT
iptables -A test1 -d 173.98.102.0/24 -j DROP
iptables -A test3 -p 17 -d 81.129.212.120 -s 138.63.161.57 --dport 14634 -j DROP
iptables -A test3 -p 17 -d 170.146.0.0/16 -s 93.0.0.0/8 --sport 55301 -j DROP
iptables -A test2 -p 17 -s 36.137.184.24 --dport 3912 -j DROP
iptables -A FORWARD -p 100 -j DROP
iptables -A test2 -d 164.244.0.0/16 -j DROP
iptables -A INPUT -p 17 --dport 24564 -j DROP
iptables -A INPUT -p 233 -j DROP
iptables -A FORWARD -p 17 --dport 3503 -j ACCEPT
iptables -A test3 -p 17 --sport 7219 -j ACCEPT
iptables -A INPUT -s 154.227.4.149 -j DROP
iptables -A FORWARD -p 6 -d 226.115.0.0/16 --dport 4254 --sport 32153 -j DROP
iptables -A OUTPUT -p 6 --dport 18916 -j DROP
iptables -A test1 -p 17 --dport 57975 -j DROP
iptables -A test2 -p 17 --dport 58740 --sport 49869 -s 67.46.206.109 -j DROP
iptables -A OUTPUT -p 216 -s 82.53.31.209 -j ACCEPT
iptables -A OUTPUT -p 6 -d 22.234.208.131 --sport 38403 -s 241.139.23.0/24 -j ACCEPT
iptables -A test3 -p 6 -d 176.45.136.209 -s 136.73.0.0/16 --sport 60628 --dport 6286 -j ACCEPT
iptables -A INPUT -p 17 -d 86.86.0.0/16 --sport 41297 -j DROP
iptables -A test2 -p 6 --sport 15179 --dport 42707 -d 105.236.209.5 -s 145.191.0.0/16 -j DROP
iptables -A OUTPUT -s 84.176.246.0/24 -p 205 -j ACCEPT
iptables -A test3 -p 6 --dport 44008 --sport 32846 -d 128.225.0.0/16 -s 138.187.7.60 -j ACCEPT
iptables -A test2 -d 52.59.33.225 -j DROP
iptables -A test3 -p 17 --dport 62481 -j ACCEPT
iptables -A OUTPUT -d 156.62.164.157 -p 121 -s 33.212.80.98 -j DROP
iptables -A test1 -p 17 --sport 8720 --dport 26582 -j DROP
iptables -A test2 -p 17 --sport 23875 -d 172.248.225.56 -j ACCEPT
iptables -A test2 -p 127 -j ACCEPT
iptables -A INPUT -p 6 --sport 29888 --dport 21506 -s 209.149.239.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 31516 --sport 33659 -s 180.0.0.0/8 -j ACCEPT
iptables -A test3 -s 141.24.51.87 -j ACCEPT
iptables -A INPUT -p 2 -d 101.118.245.0/24 -j ACCEPT
iptables -A INPUT -p 17 --dport 60255 -j ACCEPT
iptables -A OUTPUT -s 125.45.20.2 -j DROP
iptables -A OUTPUT -p 6 --sport 24165 -j DROP
iptables -A test1 -s 84.12.247.140 -j ACCEPT
iptables -A FORWARD -p 17 --sport 52765 -s 15.241.31.32 -d 127.112.107.2 -j DROP
iptables -A test2 -p 6 --dport 9016 -d 43.0.0.0/8 -s 182.146.212.231 -j DROP
iptables -A test1 -p 17 --sport 48937 -d 61.54.204.46 -s 5.225.182.52 -j DROP
iptables -A test3 -p 98 -j ACCEPT
iptables -A FORWARD -p 17 --dport 40829 -s 231.229.23.18 --sport 18898 -j ACCEPT
iptables -A test2 -p 17 -s 71.11.179.3 --dport 16182 --sport 60369 -j DROP
iptables -A FORWARD -s 176.102.244.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 -s 247.0.0.0/8 --sport 55523 -d 11.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -s 92.65.30.17 --sport 24190 -j ACCEPT
iptables -A INPUT -p 17 -d 63.84.209.68 --dport 25177 -j ACCEPT
iptables -A test3 -p 17 --dport 46303 -d 70.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --sport 10605 --dport 33687 -j ACCEPT
iptables -A test2 -p 17 --dport 47560 --sport 65371 -j DROP
iptables -A INPUT -p 6 --dport 19370 -s 142.0.0.0/8 --sport 35400 -j DROP
iptables -A test3 -p 17 -s 233.152.150.10 --dport 1337 --sport 14849 -j ACCEPT
iptables -A OUTPUT -s 67.143.121.20 -p 16 -j ACCEPT
iptables -A FORWARD -p 6 --dport 54800 -d 85.96.111.0/24 -s 162.230.74.91 -j DROP
iptables -A FORWARD -s 12.252.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --sport 60525 -d 48.194.49.124 -s 145.167.59.0/24 -j DROP
iptables -A INPUT -p 6 -s 79.102.74.68 --sport 23460 -j test2
iptables -A OUTPUT -d 11.94.254.222 -s 123.0.0.0/8 -j DROP
iptables -A test1 -p 17 --dport 39074 -s 205.0.0.0/8 --sport 48624 -j DROP
iptables -A FORWARD -p 6 --sport 38012 -s 32.217.79.26 -j ACCEPT
iptables -A test2 -p 17 -s 110.99.112.70 --sport 60763 -j DROP
iptables -A test1 -p 17 --sport 26112 -d 255.162.91.0/24 --dport 46178 -j DROP
iptables -A test2 -p 17 --dport 35366 -d 173.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 40800 -j ACCEPT
iptables -A test1 -p 6 --dport 36751 --sport 29919 -s 229.52.24.0/24 -j ACCEPT
iptables -A test1 -p 111 -j DROP
iptables -A OUTPUT -p 17 -d 215.144.169.0/24 --sport 12449 -j ACCEPT
iptables -A INPUT -p 17 -d 19.0.0.0/8 --sport 3456 --dport 18995 -j DROP
iptables -A test3 -p 17 --sport 40951 -d 216.13.240.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 46481 -j ACCEPT
iptables -A INPUT -p 6 --dport 19488 -s 106.138.32.69 --sport 29227 -j ACCEPT
iptables -A FORWARD -p 17 -d 70.106.173.114 --dport 24713 -s 85.185.47.98 -j ACCEPT
iptables -A test2 -s 57.92.242.210 -j DROP
iptables -A INPUT -p 6 --dport 1529 -s 66.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 --dport 44345 -j test2
iptables -A INPUT -p 6 --dport 53649 --sport 40279 -j DROP
iptables -A test1 -p 6 --sport 24737 --dport 33521 -s 104.121.219.202 -j ACCEPT
iptables -A test1 -p 243 -j ACCEPT
iptables -A test2 -p 240 -j ACCEPT
iptables -A INPUT -p 6 --sport 10813 --dport 61391 -d 88.100.125.19 -s 97.210.211.70 -j ACCEPT
iptables -A test2 -p 6 --dport 59832 -j DROP
iptables -A FORWARD -p 48 -j DROP
iptables -A FORWARD -p 188 -j ACCEPT
iptables -A FORWARD -p 6 -s 61.151.186.0/24 --dport 287 -j DROP
iptables -A OUTPUT -p 17 --sport 9876 -j DROP
iptables -A test1 -d 151.176.213.64 -j DROP
iptables -A FORWARD -p 6 -s 110.26.115.53 --sport 11518 -j DROP
iptables -A test1 -p 17 -s 29.130.63.16 --dport 47163 -d 33.37.209.0/24 -j DROP
iptables -A OUTPUT -p 6 -s 181.190.0.0/16 --sport 9480 -d 146.64.0.0/16 -j ACCEPT
iptables -A test2 -s 35.153.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 36483 -d 15.0.0.0/8 -j DROP
iptables -A test3 -p 6 --sport 3918 --dport 51448 -s 217.98.140.10 -j ACCEPT
iptables -A FORWARD -s 243.225.154.137 -j ACCEPT
iptables -A FORWARD -p 6 --dport 3328 -j ACCEPT
iptables -A test2 -p 17 --sport 57249 --dport 18429 -j DROP
iptables -A FORWARD -p 6 --dport 25624 -s 173.102.52.253 -j DROP
iptables -A INPUT -s 167.0.234.107 -j DROP
iptables -A test2 -p 17 -s 174.213.240.0/24 -d 129.96.7.155 --sport 33030 -j ACCEPT
iptables -A INPUT -d 69.185.239.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 8262 --sport 29857 -s 23.14.88.38 -j ACCEPT
iptables -A test2 -p 26 -d 202.138.224.170 -j ACCEPT
iptables -A test1 -p 17 -d 186.0.0.0/8 --dport 474 --sport 29389 -s 133.203.28.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 43598 -d 5.60.95.44 -s 113.230.45.0 -j ACCEPT
iptables -A test3 -p 6 --dport 41453 --sport 2670 -j ACCEPT
iptables -A test3 -p 17 -d 208.221.249.240 --dport 31349 -j ACCEPT
iptables -A test2 -p 6 -s 209.133.53.58 --sport 15696 -j DROP
iptables -A INPUT -p 182 -j ACCEPT
iptables -A test2 -s 105.0.0.0/8 -d 246.12.0.0/16 -j DROP
iptables -A INPUT -p 17 --sport 29431 -d 98.219.229.208 --dport 24914 -j ACCEPT
iptables -A FORWARD -s 154.51.53.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 63435 -j ACCEPT
iptables -A INPUT -s 177.166.215.151 -j DROP
iptables -A OUTPUT -p 6 --dport 27963 -d 98.1.204.155 -j DROP
iptables -A test2 -p 6 --sport 48416 -d 101.54.0.0/16 --dport 17758 -j ACCEPT
iptables -A INPUT -p 17 --dport 16501 -s 186.52.44.102 -d 201.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 -d 118.10.244.0/24 --dport 6054 -j DROP
iptables -A INPUT -p 156 -d 111.26.122.221 -j DROP
iptables -A test3 -p 6 -s 53.25.118.132 --sport 39645 -d 8.100.28.106 --dport 43576 -j DROP
iptables -A test2 -p 80 -j ACCEPT
iptables -A test1 -p 6 --dport 17145 -j DROP
iptables -A INPUT -p 17 --sport 3080 -d 249.38.168.0/24 -s 158.76.117.0/24 -j ACCEPT
iptables -A FORWARD -s 77.61.32.224 -p 1 -j ACCEPT
iptables -A FORWARD -p 17 -d 108.49.232.0/24 --sport 59995 --dport 9262 -s 151.95.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --sport 51135 -j ACCEPT
iptables -A FORWARD -p 6 --dport 24387 -d 111.153.58.15 --sport 35489 -j DROP
iptables -A test1 -p 45 -s 147.238.32.35 -j DROP
iptables -A test1 -p 17 --dport 63447 --sport 56281 -j DROP
iptables -A INPUT -p 17 -d 204.251.76.19 --sport 35962 -j test1
iptables -A OUTPUT -p 17 --sport 15068 -j ACCEPT
iptables -A test3 -p 17 -d 192.96.165.0/24 -s 109.233.128.12 --sport 47864 -j ACCEPT
iptables -A FORWARD -s 179.56.151.89 -j test3
iptables -A FORWARD -p 56 -d 201.125.149.191 -s 71.17.0.0/16 -j DROP
iptables -A FORWARD -p 6 -s 65.247.102.119 --dport 40825 -j DROP
iptables -A INPUT -d 136.89.53.245 -s 27.76.0.0/16 -j DROP
iptables -A test1 -p 6 -d 232.231.212.141 --sport 55570 -s 88.19.56.0/24 -j DROP
iptables -A INPUT -s 175.140.0.0/16 -d 202.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 63209 --dport 22821 -d 2.17.102.6 -s 232.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --dport 7969 --sport 16866 -j DROP
iptables -A OUTPUT -s 211.128.0.0/16 -j ACCEPT
iptables -A test2 -p 162 -s 101.93.30.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 52277 --dport 13246 -d 244.47.149.139 -j DROP
iptables -A INPUT -p 17 -s 211.180.86.0/24 --dport 60281 -j test3
iptables -A INPUT -p 6 -d 236.100.61.0/24 --sport 20031 -s 212.226.22.200 -j ACCEPT
iptables -A FORWARD -p 17 --dport 10132 -d 63.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 35961 -d 155.6.43.244 -j ACCEPT
iptables -A INPUT -s 124.44.0.0/16 -j test3
iptables -A test3 -p 6 --sport 20675 -j DROP
iptables -A test3 -p 17 --sport 28543 --dport 47639 -j ACCEPT
iptables -A FORWARD -p 6 --sport 5389 -d 222.119.56.35 --dport 11872 -j DROP
iptables -A OUTPUT -d 108.19.0.0/16 -p 43 -j ACCEPT
iptables -A INPUT -p 17 --dport 17289 -s 183.0.0.0/8 -j DROP
iptables -A test2 -s 182.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 23148 --sport 51813 -d 23.137.55.0/24 -j ACCEPT
iptables -A test2 -p 6 --dport 49559 --sport 51923 -s 228.153.208.225 -j DROP
iptables -A FORWARD -p 17 --sport 35896 --dport 27562 -d 143.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 -s 109.239.220.0/24 --dport 542 -j DROP
iptables -A INPUT -p 17 -d 43.175.120.79 --sport 991 -j DROP
iptables -A test1 -p 6 --dport 56329 --sport 9511 -d 35.19.213.0 -j ACCEPT
iptables -A INPUT -p 17 --sport 5345 -s 155.32.207.0/24 --dport 14644 -j ACCEPT
iptables -A test3 -s 240.215.0.0/16 -j DROP
iptables -A test3 -p 196 -s 174.77.21.175 -j DROP
iptables -A OUTPUT -p 17 --dport 9279 -s 57.127.115.64 -d 101.213.90.78 -j DROP
iptables -A INPUT -p 17 --dport 56189 -s 0.112.155.140 -d 149.69.0.0/16 -j DROP
iptables -A test1 -p 17 --dport 20959 -j ACCEPT
iptables -A INPUT -p 6 --sport 34477 -d 251.100.240.26 -s 89.39.132.202 -j ACCEPT
iptables -A test3 -p 6 -d 137.228.113.15 --dport 46863 --sport 10742 -j ACCEPT
iptables -A INPUT -p 6 --dport 29911 -j DROP
iptables -A test1 -p 6 --dport 48857 --sport 51187 -s 17.99.0.0/16 -d 50.0.0.0/8 -j DROP
iptables -A test3 -d 46.54.138.248 -j DROP
iptables -A FORWARD -p 17 --sport 56782 -d 14.193.0.0/16 -j DROP
iptables -A test1 -d 215.7.223.246 -j ACCEPT
iptables -A test3 -p 6 --sport 26071 -s 158.203.177.69 --dport 27939 -j DROP
iptables -A test1 -d 46.34.202.237 -s 230.197.231.0/24 -p 108 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 19369 -j ACCEPT
iptables -A test2 -s 218.85.0.0/16 -j ACCEPT
iptables -A test3 -p 225 -d 172.121.159.77 -j DROP
iptables -A INPUT -s 131.123.222.194 -j DROP
iptables -A test3 -p 6 -d 226.7.0.0/16 --dport 6120 --sport 30560 -j ACCEPT
iptables -A test1 -p 17 --dport 47358 --sport 50929 -j DROP
iptables -A FORWARD -p 6 --dport 21113 -j DROP
iptables -A FORWARD -p 59 -j DROP
iptables -A test3 -p 17 --dport 27956 -j DROP
iptables -A test2 -p 6 --dport 28652 --sport 29324 -s 242.254.0.0/16 -j ACCEPT
iptables -A test2 -d 116.214.133.75 -s 60.54.206.214 -p 113 -j DROP
iptables -A test2 -d 18.0.0.0/8 -p 131 -s 183.150.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --sport 32856 --dport 41877 -j ACCEPT
iptables -A INPUT -p 6 -s 182.178.232.4 --dport 17622 -d 163.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 36507 --dport 4163 -j DROP
iptables -A INPUT -p 6 --dport 61282 -j ACCEPT
iptables -A test1 -p 6 -d 71.156.44.205 --sport 25089 -j ACCEPT
iptables -A INPUT -p 6 --dport 33335 -j ACCEPT
iptables -A test2 -p 6 --dport 46364 --sport 49682 -j ACCEPT
iptables -A FORWARD -p 6 -s 239.0.0.0/8 --dport 22814 --sport 47401 -d 177.104.150.229 -j DROP
iptables -A OUTPUT -p 6 --dport 4620 -d 191.205.139.254 -s 69.141.222.64 -j ACCEPT
iptables -A test1 -p 17 --sport 23114 -s 108.143.0.0/16 -d 36.0.0.0/8 -j DROP
iptables -A test1 -p 17 -s 107.0.0.0/8 --dport 44434 -j DROP
iptables -A test3 -p 17 -s 186.203.14.72 -d 73.103.0.0/16 --dport 37616 -j DROP
iptables -A INPUT -p 167 -j DROP
iptables -A OUTPUT -p 17 --dport 12213 -s 31.255.178.0/24 -j DROP
iptables -A INPUT -p 17 -d 76.248.71.218 --dport 21140 -s 48.248.160.0/24 -j DROP
iptables -A test1 -p 17 -s 86.222.244.0/24 --dport 55036 -j ACCEPT
iptables -A test1 -p 6 -s 191.36.0.0/16 -d 80.247.179.152 --dport 34062 -j DROP
iptables -A test1 -p 6 --sport 55230 -s 242.102.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 187 -d 95.128.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 56028 -j DROP
iptables -A FORWARD -p 6 --dport 25298 --sport 43908 -d 55.15.249.0/24 -j ACCEPT
iptables -A OUTPUT -s 174.223.0.0/16 -d 25.44.220.17 -j DROP
iptables -A OUTPUT -p 6 -d 245.149.61.0/24 --sport 5528 -j DROP
iptables -A FORWARD -p 6 -d 167.14.194.88 -s 55.63.29.0/24 --sport 53247 -j DROP
iptables -A FORWARD -p 6 --sport 2883 -j DROP
iptables -A FORWARD -p 6 -s 28.1.101.15 --sport 42415 -d 91.32.49.0/24 -j DROP
iptables -A test2 -p 6 --dport 50590 --sport 44163 -s 87.3.9.121 -j ACCEPT
iptables -A FORWARD -s 153.153.45.98 -p 186 -d 116.216.48.183 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 56628 -d 10.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 -d 128.179.0.0/16 --dport 61064 -s 114.57.109.0/24 -j ACCEPT
iptables -A test2 -s 232.138.169.234 -j DROP
iptables -A INPUT -p 17 --sport 33912 --dport 44118 -d 202.122.83.154 -j ACCEPT
iptables -A OUTPUT -d 14.0.0.0/8 -p 21 -j DROP
iptables -A OUTPUT -s 47.147.205.93 -j ACCEPT
iptables -A OUTPUT -p 17 -s 159.130.167.0/24 -d 157.0.0.0/8 --dport 62875 -j ACCEPT
iptables -A FORWARD -p 17 -d 177.110.0.0/16 --dport 10238 -s 46.136.76.200 -j DROP
iptables -A OUTPUT -p 17 --dport 11271 -j ACCEPT
iptables -A OUTPUT -p 92 -d 20.101.87.232 -j ACCEPT
iptables -A OUTPUT -p 17 -s 98.148.239.0/24 --dport 62369 --sport 20215 -j ACCEPT
iptables -A test2 -p 6 -d 204.248.71.81 --dport 26884 -s 83.61.246.246 -j ACCEPT
iptables -A test3 -p 17 --sport 50624 -s 158.0.0.0/8 -j DROP
iptables -A test2 -s 8.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 55038 -d 190.40.61.238 -j DROP
iptables -A INPUT -p 6 --sport 49419 -s 213.184.81.0/24 -j test1
iptables -A INPUT -d 184.244.139.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --dport 16560 -j DROP
iptables -A INPUT -s 206.13.0.0/16 -p 140 -j DROP
iptables -A OUTPUT -p 17 -d 26.6.0.0/16 --dport 14089 -s 237.65.72.243 -j ACCEPT
iptables -A INPUT -s 132.152.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 -d 230.85.0.0/16 --sport 19237 -s 188.96.99.15 -j ACCEPT
iptables -A test3 -p 17 --sport 20096 -j ACCEPT
iptables -A test3 -p 6 -d 250.63.84.0/24 -s 82.0.0.0/8 --sport 1714 --dport 5957 -j ACCEPT
iptables -A INPUT -s 51.202.242.13 -p 147 -d 149.95.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 -s 22.110.159.0/24 --dport 55836 --sport 20753 -j DROP
iptables -A test3 -p 29 -j DROP
iptables -A test2 -p 6 -d 73.11.217.109 --dport 23071 -j DROP
iptables -A INPUT -p 6 --sport 51754 --dport 19032 -j ACCEPT
iptables -A INPUT -p 9 -j DROP
iptables -A FORWARD -p 17 --dport 32048 -j test3
iptables -A INPUT -p 17 --dport 22681 -s 51.0.0.0/8 -d 83.198.91.181 --sport 56661 -j ACCEPT
iptables -A test2 -p 6 -s 107.0.0.0/8 --dport 7578 --sport 59644 -j DROP
iptables -A FORWARD -p 17 -s 71.0.0.0/8 --dport 56434 -d 41.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -d 99.54.123.104 --dport 5151 -j ACCEPT
iptables -A OUTPUT -p 17 -s 49.87.231.40 --dport 59018 -d 238.247.232.212 -j ACCEPT
iptables -A test1 -p 17 --sport 36581 -j ACCEPT
iptables -A test1 -p 6 --dport 28173 -d 233.48.166.185 -j ACCEPT
iptables -A INPUT -p 6 --sport 22003 -j ACCEPT
iptables -A test3 -d 190.5.103.78 -p 121 -s 204.119.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --dport 45026 -j DROP
iptables -A test3 -p 17 --sport 62664 -s 205.244.235.100 -j ACCEPT
iptables -A FORWARD -p 17 --dport 14552 --sport 34685 -j ACCEPT
iptables -A test1 -p 6 -d 159.7.0.0/16 --dport 44936 --sport 34804 -j DROP
iptables -A OUTPUT -p 17 -d 247.0.0.0/8 -s 81.85.139.98 --sport 19921 -j DROP
iptables -A INPUT -p 50 -j test1
iptables -A FORWARD -p 17 --sport 5646 -s 78.252.146.238 --dport 44601 -j ACCEPT
iptables -A INPUT -p 6 -s 221.0.0.0/8 --dport 53557 -d 231.133.208.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 -s 244.0.0.0/8 --sport 28208 --dport 57052 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 64473 -s 182.194.182.8 -d 100.24.0.0/16 -j DROP
iptables -A FORWARD -p 17 -s 134.245.0.0/16 --sport 45752 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 4181 -j ACCEPT
iptables -A INPUT -p 17 -s 213.206.16.236 --sport 15724 --dport 8839 -j DROP
iptables -A test1 -p 17 -d 249.164.30.56 -s 117.174.164.0/24 --sport 13717 -j ACCEPT
iptables -A test1 -p 6 --dport 46275 --sport 8880 -s 46.9.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --sport 48251 -s 7.105.128.0/24 -j DROP
iptables -A OUTPUT -p 17 --sport 13065 -d 25.84.76.228 --dport 10031 -j DROP
iptables -A INPUT -p 6 -s 89.53.59.205 --dport 37120 --sport 63122 -j ACCEPT
iptables -A INPUT -p 6 --dport 53107 -j ACCEPT
iptables -A OUTPUT -p 6 -s 120.189.107.0/24 --dport 44696 -d 112.245.200.105 -j DROP
iptables -A INPUT -p 6 -d 76.56.180.168 --sport 15261 -s 9.73.123.0/24 -j ACCEPT
iptables -A INPUT -p 17 --sport 16064 -s 144.0.0.0/8 --dport 38418 -j ACCEPT
iptables -A INPUT -p 17 --sport 17728 -s 86.48.124.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 33634 -d 116.174.72.26 -s 81.0.0.0/8 -j DROP
iptables -A FORWARD -p 174 -s 217.244.195.56 -j ACCEPT
iptables -A test3 -p 6 --dport 8745 -s 210.0.0.0/8 -j ACCEPT
iptables -A FORWARD -d 196.159.44.0/24 -j ACCEPT
iptables -A FORWARD -d 148.138.249.211 -j DROP
iptables -A test1 -p 6 --dport 15128 --sport 12275 -d 244.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 12720 -j ACCEPT
iptables -A FORWARD -p 17 --sport 53412 -j DROP
iptables -A FORWARD -p 6 --dport 48227 -s 28.0.0.0/8 -d 191.49.106.0/24 -j DROP
iptables -A test3 -p 6 --dport 37511 -j ACCEPT
iptables -A test3 -d 102.119.21.89 -s 20.193.20.0/24 -p 19 -j ACCEPT
iptables -A test2 -p 6 -d 143.34.125.112 --dport 56340 -s 241.68.182.45 -j ACCEPT
iptables -A test2 -p 6 --sport 18463 --dport 37235 -d 237.30.200.171 -j ACCEPT
iptables -A test2 -p 6 --dport 34340 -s 224.249.0.0/16 -j DROP
iptables -A FORWARD -p 6 --dport 38917 -s 33.66.0.0/16 -d 91.61.145.185 -j DROP
iptables -A test1 -p 17 -d 124.156.0.0/16 --dport 25032 -s 177.106.39.161 -j ACCEPT
iptables -A FORWARD -p 6 --dport 10355 -j ACCEPT
iptables -A INPUT -p 6 -s 185.163.252.0/24 --dport 60241 -j DROP
iptables -A FORWARD -p 17 -d 182.73.231.60 --sport 21897 -j ACCEPT
iptables -A FORWARD -p 6 --dport 25403 --sport 61252 -j DROP
iptables -A FORWARD -p 17 -s 100.196.96.35 --sport 38475 --dport 38209 -j test3
iptables -A INPUT -p 17 --sport 3389 --dport 19974 -d 199.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -d 217.166.107.16 --dport 49277 -s 52.177.139.236 -j ACCEPT
iptables -A test1 -d 113.117.149.163 -s 103.0.0.0/8 -p 89 -j ACCEPT
iptables -A test1 -p 6 --sport 14508 --dport 65063 -s 155.209.225.221 -j DROP
iptables -A INPUT -p 17 -d 5.71.233.223 --dport 42468 -j ACCEPT
iptables -A OUTPUT -p 211 -j ACCEPT
iptables -A test2 -p 17 -d 172.198.246.140 --dport 11749 -j ACCEPT
iptables -A test2 -p 6 --sport 7290 -d 69.137.150.15 -s 179.85.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 5187 -s 17.115.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --dport 43798 -j DROP
iptables -A test3 -p 17 --dport 35728 --sport 61876 -j DROP
iptables -A test3 -s 88.152.254.247 -p 63 -j DROP
iptables -A test1 -p 6 -d 211.138.172.110 --dport 35614 -j ACCEPT
iptables -A INPUT -p 6 --sport 10034 --dport 31703 -s 104.166.146.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 31069 -j ACCEPT
iptables -A test1 -p 6 --sport 2324 -d 20.81.3.140 -s 41.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 36732 -j ACCEPT
iptables -A FORWARD -p 17 -s 143.1.0.0/16 -d 3.221.0.0/16 --dport 1354 -j DROP
iptables -A INPUT -s 153.3.87.224 -d 11.26.43.93 -j test3
iptables -A test2 -p 6 -d 170.205.75.202 --dport 51752 --sport 21880 -j ACCEPT
iptables -A test3 -p 17 --sport 21948 -d 40.40.176.0 -s 20.236.239.22 -j ACCEPT
iptables -A test3 -s 162.159.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --sport 65431 -j DROP
iptables -A OUTPUT -p 6 -s 71.10.0.0/16 --sport 56707 -d 174.253.2.201 -j DROP
iptables -A test1 -p 17 --sport 883 --dport 38981 -j DROP
iptables -A OUTPUT -p 17 -s 244.114.0.0/16 --sport 46154 -j DROP
iptables -A test2 -p 17 --sport 37696 --dport 44935 -j DROP
iptables -A test2 -p 17 --sport 29562 -j ACCEPT
iptables -A test2 -p 117 -j ACCEPT
iptables -A INPUT -p 6 --sport 61409 -s 0.47.0.0/16 -d 128.157.126.191 -j DROP
iptables -A OUTPUT -p 189 -d 246.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --dport 5129 -j DROP
iptables -A test3 -p 6 --dport 27193 -j DROP
iptables -A FORWARD -p 6 -d 172.232.190.0/24 --dport 54324 --sport 43308 -j ACCEPT
iptables -A test3 -p 17 -d 129.5.114.0/24 --sport 56255 --dport 37772 -j DROP
iptables -A test2 -p 96 -j ACCEPT
iptables -A test1 -p 88 -d 51.14.209.239 -s 175.138.103.192 -j DROP
iptables -A INPUT -p 17 -s 78.252.159.15 --sport 30842 -d 14.217.0.0/16 --dport 12219 -j ACCEPT
iptables -A FORWARD -p 6 --sport 57664 -j DROP
iptables -A test3 -p 17 -s 127.180.0.0/16 --sport 43900 --dport 4123 -j DROP
iptables -A test1 -d 223.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 5984 -j ACCEPT
iptables -A test2 -p 17 --sport 46711 --dport 8067 -d 68.238.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 48413 -j DROP
iptables -A INPUT -p 15 -j ACCEPT
iptables -A INPUT -p 17 --dport 18792 -j DROP
iptables -A INPUT -p 17 --dport 4842 -d 98.106.97.20 -j ACCEPT
iptables -A test1 -p 17 --sport 28953 -d 114.162.159.153 -j ACCEPT
iptables -A test2 -p 17 -d 116.238.0.0/16 --dport 50401 -j ACCEPT
iptables -A FORWARD -s 133.181.105.253 -j DROP
iptables -A test2 -p 17 --sport 36525 --dport 43856 -d 127.19.49.76 -j DROP
iptables -A test3 -d 72.228.239.164 -j ACCEPT
iptables -A FORWARD -p 6 -d 227.0.0.0/8 -s 45.232.0.0/16 --sport 13140 -j DROP
iptables -A test3 -d 134.84.203.99 -j ACCEPT
iptables -A test1 -p 17 -d 125.22.187.113 --dport 14412 -s 209.120.177.107 -j DROP
iptables -A test3 -p 17 --sport 56180 -j DROP
iptables -A test2 -p 17 -d 114.118.133.31 --sport 51971 -j DROP
iptables -A test1 -p 17 --dport 32740 -j DROP
iptables -A OUTPUT -p 0 -j DROP
iptables -A test3 -p 17 -d 178.99.59.61 --sport 31357 -s 197.180.192.0/24 -j DROP
iptables -A test1 -p 165 -j DROP
iptables -A FORWARD -p 17 --dport 51428 -j DROP
iptables -A INPUT -p 17 --sport 19315 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 61846 -j ACCEPT
iptables -A test1 -p 6 --dport 35803 -s 68.24.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 8207 --dport 39767 -d 41.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 -d 180.41.0.0/16 -s 217.135.71.116 --dport 29483 --sport 18809 -j DROP
iptables -A FORWARD -s 167.245.168.0/24 -j ACCEPT
iptables -A test3 -p 6 -d 35.120.223.147 --dport 30529 --sport 40579 -j ACCEPT
iptables -A test3 -p 17 --dport 36723 -s 208.0.0.0/8 --sport 1911 -j ACCEPT
iptables -A FORWARD -p 17 -s 51.234.155.38 --dport 38728 -d 148.43.198.17 -j DROP
iptables -A INPUT -s 203.198.65.3 -p 143 -j DROP
iptables -A test1 -p 17 -s 42.71.20.56 --sport 40313 -j DROP
iptables -A FORWARD -p 6 --dport 51477 -s 5.185.198.0/24 -d 90.92.184.0/24 --sport 46725 -j DROP
iptables -A FORWARD -p 6 -s 34.0.0.0/8 --sport 23921 -d 248.49.36.164 -j DROP
iptables -A test2 -p 6 -s 88.68.30.0/24 -d 98.139.130.228 --sport 12047 -j ACCEPT
iptables -A INPUT -p 17 --dport 60671 -j ACCEPT
iptables -A test2 -s 87.216.0.0/16 -j DROP
iptables -A test1 -p 17 --dport 31891 -d 103.40.73.249 -s 10.68.239.199 -j ACCEPT
iptables -A test1 -p 6 --dport 16437 -j ACCEPT
iptables -A test2 -p 6 --sport 46149 -j ACCEPT
iptables -A test2 -p 181 -s 95.171.0.0/16 -j DROP
iptables -A test3 -p 95 -j ACCEPT
iptables -A test3 -p 17 --sport 27008 -j ACCEPT
iptables -A FORWARD -s 226.0.0.0/8 -p 50 -j ACCEPT
iptables -A FORWARD -d 191.53.129.202 -j ACCEPT
iptables -A OUTPUT -d 220.150.182.36 -p 210 -j ACCEPT
iptables -A OUTPUT -s 234.120.250.160 -d 120.49.8.175 -j DROP
iptables -A OUTPUT -p 6 -s 61.145.8.0/24 --sport 55280 -j ACCEPT
iptables -A test1 -p 17 -d 48.0.0.0/8 --sport 44568 -s 3.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 61161 --sport 55733 -d 183.220.20.48 -j DROP
iptables -A test3 -d 162.244.51.92 -j ACCEPT
iptables -A test1 -p 6 --sport 44517 -j ACCEPT
iptables -A INPUT -p 17 -s 36.59.13.208 -d 249.118.245.0/24 --sport 56793 -j ACCEPT
iptables -A test3 -p 17 --dport 21164 -s 202.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 --sport 57431 -j DROP
iptables -A test1 -d 13.53.0.0/16 -s 149.173.52.198 -j ACCEPT
iptables -A FORWARD -p 17 --sport 44201 -d 212.140.23.0/24 -s 26.0.0.0/8 -j DROP
iptables -A test3 -s 186.255.0.0/16 -j ACCEPT
iptables -A test3 -p 17 -d 78.175.232.244 --sport 29666 --dport 31637 -s 14.19.28.0/24 -j DROP
iptables -A FORWARD -p 6 -d 98.162.146.239 --dport 22944 --sport 6365 -j DROP
iptables -A test3 -p 17 --dport 57977 -d 15.105.59.38 -j DROP
iptables -A test3 -p 6 -s 217.35.16.226 -d 25.184.173.45 --dport 41169 -j ACCEPT
iptables -A INPUT -p 17 --dport 19198 -s 117.212.50.0/24 -j DROP
iptables -A FORWARD -p 17 -s 241.210.109.144 -d 157.77.219.207 --sport 38757 --dport 42328 -j DROP
iptables -A FORWARD -p 17 --dport 39892 -j ACCEPT
iptables -A test3 -p 6 --sport 46228 --dport 12326 -j ACCEPT
iptables -A test2 -p 17 -d 254.53.200.0/24 --dport 28046 --sport 42209 -j ACCEPT
iptables -A test3 -p 17 --dport 35956 -j DROP
iptables -A test3 -p 6 --dport 17344 -j DROP
iptables -A INPUT -p 6 --dport 42571 -j ACCEPT
iptables -A test2 -p 6 --sport 52478 --dport 50946 -s 64.134.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --dport 43199 -j ACCEPT
iptables -A test1 -p 17 --sport 64292 --dport 43812 -d 138.126.51.251 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 46827 --dport 29604 -j ACCEPT
iptables -A INPUT -p 17 --dport 36104 -s 75.221.0.0/16 -j DROP
iptables -A INPUT -p 6 -s 100.16.253.0/24 -d 16.195.101.218 --dport 9951 -j DROP
iptables -A test2 -p 6 -d 61.44.77.29 --dport 58351 -j DROP
iptables -A OUTPUT -p 17 -d 61.191.18.0/24 -s 152.250.56.0/24 --sport 65460 -j DROP
iptables -A OUTPUT -p 6 --dport 9817 --sport 38608 -d 140.220.134.7 -j DROP
iptables -A FORWARD -p 17 --sport 58132 -s 78.120.91.0/24 -d 22.188.47.246 -j ACCEPT
iptables -A test1 -d 118.31.71.215 -j ACCEPT
iptables -A test1 -p 6 --sport 27987 --dport 46286 -d 37.127.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --sport 32735 --dport 44790 -d 189.142.13.0/24 -j DROP
iptables -A OUTPUT -p 17 -s 86.107.124.232 -d 64.0.0.0/8 --dport 30565 -j ACCEPT
iptables -A test2 -s 73.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -d 129.203.118.21 --dport 64390 -s 209.218.43.175 -j DROP
iptables -A test2 -p 6 -d 137.0.0.0/8 --dport 37299 --sport 7080 -j DROP
iptables -A test3 -p 6 -s 64.21.124.239 --dport 57377 -j DROP
iptables -A OUTPUT -p 6 --sport 23555 -d 119.133.162.0/24 --dport 58077 -j ACCEPT
iptables -A test2 -p 6 -d 55.250.52.24 --sport 8437 -j ACCEPT
iptables -A test2 -p 17 --dport 18820 -j DROP
iptables -A OUTPUT -p 17 --sport 62811 -s 112.30.0.0/16 -d 127.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -s 112.235.66.224 --dport 28576 -d 213.152.105.32 -j DROP
iptables -A test1 -p 17 -s 1.0.0.0/8 -d 8.208.47.0/24 --sport 45877 -j ACCEPT
iptables -A INPUT -p 6 --sport 14076 -d 143.180.88.198 -j ACCEPT
iptables -A test2 -p 17 --dport 42398 --sport 32051 -d 194.211.222.163 -j ACCEPT
iptables -A INPUT -p 17 -d 28.67.216.0/24 --sport 13597 -j DROP
iptables -A test3 -p 17 --dport 37273 -s 72.20.238.178 -d 222.37.106.98 -j ACCEPT
iptables -A INPUT -p 115 -d 102.48.247.238 -j DROP
iptables -A test3 -s 70.106.119.42 -d 189.155.174.88 -p 77 -j ACCEPT
iptables -A test3 -p 17 -d 177.31.96.176 --dport 56571 -s 189.9.58.0/24 -j DROP
iptables -A FORWARD -p 6 --sport 19561 --dport 30139 -s 102.1.66.113 -j DROP
iptables -A INPUT -p 6 --dport 65395 -j DROP
iptables -A test3 -p 6 -s 61.147.0.0/16 --sport 5114 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 43605 -d 62.25.158.210 -j DROP
iptables -A test1 -p 17 -d 202.193.162.0/24 --dport 41897 -j DROP
iptables -A test2 -p 17 -s 27.0.0.0/8 --dport 998 -j ACCEPT
iptables -A test2 -p 17 -s 142.85.87.69 --dport 11681 -d 110.147.236.115 -j DROP
iptables -A test2 -d 82.0.0.0/8 -p 145 -j ACCEPT
iptables -A test1 -d 119.7.49.0/24 -j DROP
iptables -A test2 -p 17 --dport 52590 -s 44.69.119.79 -d 155.221.177.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -d 66.53.161.0/24 --sport 38234 -s 126.157.137.0/24 -j DROP
iptables -A INPUT -p 6 --dport 14288 -s 203.37.233.105 -j ACCEPT
iptables -A test2 -p 17 --sport 31993 -j ACCEPT
iptables -A FORWARD -p 17 -d 36.43.0.0/16 --dport 23243 -s 183.167.234.0/24 -j ACCEPT
iptables -A INPUT -p 6 --dport 5764 -j ACCEPT
iptables -A test1 -p 6 --sport 56637 -s 102.143.8.222 -j DROP
iptables -A test3 -p 6 --sport 10761 -d 196.123.252.133 -j ACCEPT
iptables -A FORWARD -p 17 --sport 27313 -s 228.0.0.0/8 --dport 2334 -j DROP
iptables -A FORWARD -p 6 --dport 1508 -j DROP
iptables -A OUTPUT -p 6 --dport 58164 -d 101.196.42.57 -j ACCEPT
iptables -A test1 -p 17 --sport 24737 -j DROP
iptables -A INPUT -p 6 --dport 61758 -s 92.156.104.110 -j ACCEPT
iptables -A INPUT -p 17 --dport 54593 --sport 14438 -d 97.132.84.0 -s 63.222.87.202 -j ACCEPT
iptables -A OUTPUT -s 215.112.161.0/24 -j ACCEPT
iptables -A test2 -p 17 -s 235.219.82.17 --dport 11716 -j DROP
iptables -A test1 -d 215.34.77.0/24 -s 127.88.194.0/24 -j DROP
iptables -A FORWARD -p 17 --dport 44316 -d 6.226.155.152 --sport 45768 -j ACCEPT
iptables -A OUTPUT -p 6 -s 220.41.130.0/24 --dport 18069 -j DROP
iptables -A test2 -p 55 -j ACCEPT
iptables -A test1 -p 17 --sport 15886 -j DROP
iptables -A test3 -p 17 -s 144.23.137.122 --sport 52267 -j DROP
iptables -A OUTPUT -p 6 --sport 39072 --dport 18244 -s 117.123.62.17 -d 17.153.116.84 -j ACCEPT
iptables -A test3 -d 86.42.70.28 -s 50.101.53.14 -j DROP
iptables -A OUTPUT -p 6 -d 143.76.113.98 --dport 29328 --sport 7941 -j DROP
iptables -A OUTPUT -p 6 --dport 4482 -d 171.253.32.0/24 --sport 15818 -j ACCEPT
iptables -A test3 -p 216 -j DROP
iptables -A test3 -p 6 -d 64.16.7.0/24 -s 212.128.0.0/16 --sport 22060 -j DROP
iptables -A INPUT -p 6 --dport 7462 -d 123.0.0.0/8 -s 81.184.138.253 -j DROP
iptables -A test3 -p 17 --dport 61147 --sport 21204 -s 248.156.208.0/24 -j DROP
iptables -A test2 -p 17 -d 4.161.137.0/24 --dport 9286 -j DROP
iptables -A test1 -p 6 --sport 46048 --dport 41957 -d 241.207.17.0/24 -j ACCEPT
iptables -A test1 -p 28 -j ACCEPT
iptables -A test2 -p 6 -d 109.0.0.0/8 --sport 13466 -s 224.90.0.0/16 -j DROP
iptables -A INPUT -p 6 --sport 61798 -j ACCEPT
iptables -A test3 -p 6 -d 196.225.178.165 --sport 13233 -j ACCEPT
iptables -A test2 -p 6 -d 48.33.55.0/24 -s 118.126.177.149 --sport 36551 -j DROP
iptables -A test2 -p 6 --sport 55499 --dport 47325 -s 152.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --sport 24445 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 47001 -d 75.142.74.216 -j ACCEPT
iptables -A test1 -p 6 --sport 49829 -d 233.71.26.0/24 -j ACCEPT
iptables -A FORWARD -d 119.162.206.20 -j DROP
iptables -A OUTPUT -p 6 --dport 3304 -j ACCEPT
iptables -A test3 -p 6 -s 228.122.183.59 -d 89.210.200.10 --sport 38766 -j DROP
iptables -A OUTPUT -p 6 --sport 32084 -s 238.219.164.0/24 -j ACCEPT
iptables -A INPUT -p 6 --sport 62406 -s 121.170.150.249 -d 122.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --dport 24483 -j ACCEPT
iptables -A FORWARD -p 17 -d 29.34.96.186 --dport 11467 -j DROP
iptables -A test1 -p 6 --sport 55778 -s 194.165.0.0/16 --dport 1422 -d 128.32.0.0/16 -j DROP
iptables -A test1 -s 18.70.39.4 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 39175 -j DROP
iptables -A test3 -p 17 --sport 39118 --dport 41661 -j DROP
iptables -A OUTPUT -p 6 -s 47.97.178.244 -d 160.238.0.0/16 --sport 61020 -j test3
iptables -A test3 -p 113 -j ACCEPT
iptables -A INPUT -p 17 -s 108.69.22.45 --sport 14031 -j ACCEPT
iptables -A test1 -p 6 --dport 35927 -d 237.116.0.0/16 -j DROP
iptables -A test3 -p 17 --sport 20891 -j ACCEPT
iptables -A FORWARD -p 17 --dport 7477 -d 84.23.93.72 -s 197.199.157.0/24 -j DROP
iptables -A test1 -p 17 -s 0.131.175.0/24 --sport 27513 --dport 44123 -j ACCEPT
iptables -A FORWARD -p 6 -d 81.191.54.131 --sport 65173 -j ACCEPT
iptables -A test3 -d 180.117.232.0/24 -p 153 -j ACCEPT
iptables -A test1 -p 17 --dport 23457 -j ACCEPT
iptables -A FORWARD -p 17 --sport 48595 -d 114.50.0.0/16 --dport 17023 -j ACCEPT
iptables -A test3 -p 17 --sport 8083 -j DROP
iptables -A INPUT -p 17 -s 248.146.0.0/16 --sport 58984 --dport 10496 -j DROP
iptables -A test2 -s 91.145.143.155 -j DROP
iptables -A test2 -p 17 -s 210.63.159.189 --sport 7669 -j ACCEPT
iptables -A test2 -p 6 --sport 63369 -s 224.0.0.0/8 --dport 38518 -j ACCEPT
iptables -A OUTPUT -p 17 -s 37.135.161.222 --dport 25640 -j DROP
iptables -A test1 -p 84 -j ACCEPT
iptables -A test1 -p 17 -d 128.212.145.80 -s 158.250.129.226 --dport 9285 -j DROP
iptables -A test2 -p 17 --sport 2318 -d 10.243.0.0/16 -s 203.103.71.85 -j DROP
iptables -A test1 -p 17 --sport 24082 -s 55.232.103.160 -d 8.39.116.226 -j ACCEPT
iptables -A test1 -p 138 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 32779 -d 21.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --sport 22405 -d 170.216.0.0/16 -s 73.234.106.0/24 -j ACCEPT
iptables -A FORWARD -p 78 -d 245.146.37.0/24 -j ACCEPT
iptables -A test2 -s 182.51.240.126 -d 71.172.209.0/24 -j ACCEPT
iptables -A test1 -p 17 -s 105.14.170.244 --sport 31715 --dport 53033 -j DROP
iptables -A test2 -p 27 -s 59.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --sport 19652 -d 136.149.0.0/16 --dport 32420 -j ACCEPT
iptables -A test2 -p 6 --dport 64366 -d 159.0.0.0/8 -s 151.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --sport 5208 -j ACCEPT
iptables -A INPUT -p 17 --dport 53117 -d 81.195.223.91 -j DROP
iptables -A test2 -p 6 --dport 62898 -d 30.0.0.0/8 -s 228.209.43.240 -j ACCEPT
iptables -A INPUT -p 17 -s 164.189.0.0/16 --dport 6876 -d 93.155.157.69 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 22655 -j DROP
iptables -A test3 -p 6 --dport 17913 -s 175.0.0.0/8 --sport 24815 -d 148.215.0.0/16 -j DROP
iptables -A test2 -d 42.232.132.18 -j ACCEPT
iptables -A FORWARD -p 6 -d 171.0.0.0/8 --dport 21224 -j ACCEPT
iptables -A INPUT -p 17 --dport 4749 -s 62.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --dport 30400 -j ACCEPT
iptables -A FORWARD -s 8.144.196.192 -p 221 -j DROP
iptables -A FORWARD -p 250 -j DROP
iptables -A OUTPUT -d 152.37.227.24 -j DROP
iptables -A test2 -p 17 -d 158.89.101.0/24 --sport 489 --dport 38372 -j DROP
iptables -A test2 -p 6 --dport 48016 -j ACCEPT
iptables -A test1 -p 6 --sport 10449 -j DROP
iptables -A test2 -p 6 --sport 26496 -s 6.115.156.0/24 -d 221.205.144.0/24 -j DROP
iptables -A test3 -p 6 --dport 42491 --sport 24663 -s 81.136.0.0/16 -j DROP
iptables -A test1 -p 6 --sport 40395 --dport 29995 -s 115.152.144.237 -j ACCEPT
iptables -A test2 -p 17 -d 131.0.0.0/8 --dport 27121 -s 141.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 34714 --sport 36325 -j DROP
iptables -A OUTPUT -p 6 --sport 23735 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 47253 -d 246.42.189.109 --dport 1593 -j DROP
iptables -A test2 -p 6 --dport 11518 -j DROP
iptables -A test2 -p 17 --dport 9448 -j DROP
iptables -A test3 -p 17 --sport 55660 -s 126.5.0.0/16 -d 128.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 -d 75.128.66.240 -s 152.0.0.0/8 --sport 31302 -j DROP
iptables -A test2 -p 6 --dport 53960 -j DROP
iptables -A test1 -p 6 --sport 30320 -s 196.35.0.0/16 -d 134.24.121.55 -j DROP
iptables -A test1 -p 37 -j ACCEPT
iptables -A FORWARD -p 6 --sport 4538 --dport 4134 -s 194.120.2.116 -j DROP
iptables -A test2 -p 6 --sport 59153 -j DROP
iptables -A FORWARD -s 203.0.0.0/8 -j ACCEPT
iptables -A INPUT -d 122.98.0.0/16 -j DROP
iptables -A test2 -d 37.205.101.164 -j DROP
iptables -A OUTPUT -p 213 -s 135.122.0.0/16 -j ACCEPT
iptables -A test1 -d 17.253.0.0/16 -j ACCEPT
iptables -A test3 -p 17 -s 166.216.11.148 --sport 1496 -j DROP
iptables -A test3 -p 17 --sport 46165 --dport 55357 -j DROP
iptables -A FORWARD -p 6 --sport 35629 -j ACCEPT
iptables -A OUTPUT -p 132 -j ACCEPT
iptables -A test2 -p 6 -d 75.2.197.125 --dport 8072 --sport 8614 -j DROP
iptables -A test2 -d 237.65.183.150 -j DROP
iptables -A test2 -p 17 --dport 2571 --sport 49041 -d 159.127.254.251 -j DROP
iptables -A test1 -p 198 -j DROP
iptables -A FORWARD -p 6 --sport 61552 -d 46.171.93.167 -j DROP
iptables -A OUTPUT -p 17 --dport 63503 -s 247.126.144.193 -d 247.103.108.53 --sport 177 -j test1
iptables -A test3 -p 6 -d 91.241.62.64 --dport 5562 -j DROP
iptables -A test2 -p 134 -j DROP
iptables -A INPUT -p 6 -d 164.249.217.116 --sport 45761 -j DROP
iptables -A INPUT -p 17 --dport 17667 -d 118.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 -s 149.0.0.0/8 --sport 43518 -d 119.229.105.20 -j ACCEPT
iptables -A INPUT -s 200.196.0.0/16 -j test2
iptables -A test1 -s 215.0.0.0/8 -p 9 -j ACCEPT
iptables -A FORWARD -p 17 --dport 10543 --sport 39695 -s 26.103.137.190 -j ACCEPT
iptables -A test1 -p 6 -s 105.0.0.0/8 --sport 2610 --dport 23661 -j DROP
iptables -A test3 -p 17 -s 46.0.0.0/8 -d 40.25.171.141 --sport 20944 -j DROP
iptables -A test3 -p 17 -d 185.175.17.0/24 --sport 39769 -s 30.163.127.46 -j DROP
iptables -A test2 -p 17 --sport 20560 -d 14.176.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -d 213.0.0.0/8 --dport 28824 -j DROP
iptables -A INPUT -p 79 -j DROP
iptables -A INPUT -p 17 -s 117.20.0.0/16 --dport 4981 -j DROP
iptables -A test3 -p 6 -d 217.96.211.183 --dport 23079 -j DROP
iptables -A test1 -p 6 --dport 56460 -s 2.139.0.0/16 -d 158.167.89.31 -j DROP
iptables -A OUTPUT -p 6 -s 188.11.25.12 --sport 16430 -j DROP
iptables -A test1 -p 6 --sport 27838 --dport 26205 -j ACCEPT
iptables -A test1 -p 17 -d 174.243.84.217 --dport 38846 -j DROP
iptables -A OUTPUT -p 17 -s 215.101.152.0/24 --dport 61748 --sport 7214 -d 93.76.108.130 -j DROP
iptables -A FORWARD -d 204.50.97.164 -j test1
iptables -A INPUT -p 6 -d 81.96.179.230 --dport 23033 -j ACCEPT
iptables -A test2 -p 6 -d 238.56.190.61 --sport 1461 -j DROP
iptables -A test3 -p 17 --sport 43998 -j ACCEPT
iptables -A test3 -p 17 -s 175.113.63.78 -d 187.154.155.79 --sport 54676 -j ACCEPT
iptables -A OUTPUT -p 17 -s 248.139.121.27 --dport 3309 -d 222.95.0.0/16 -j DROP
iptables -A test3 -p 6 --sport 37800 -j ACCEPT
iptables -A test1 -s 118.0.0.0/8 -j ACCEPT
iptables -A test1 -d 137.23.173.48 -j DROP
iptables -A FORWARD -p 6 --dport 7624 -j ACCEPT
iptables -A test1 -p 17 --sport 7419 -j ACCEPT
iptables -A OUTPUT -p 17 -s 146.44.2.211 --dport 20999 -d 196.27.20.217 -j ACCEPT
iptables -A test2 -p 17 --dport 62838 -s 21.229.0.0/16 -j DROP
iptables -A test2 -d 47.53.175.246 -p 159 -j DROP
iptables -A test2 -p 17 --sport 17558 -d 103.170.0.0/16 --dport 51190 -s 183.28.81.162 -j ACCEPT
iptables -A FORWARD -p 17 --dport 64999 -j ACCEPT
iptables -A INPUT -p 47 -j test3
iptables -A test2 -p 17 --dport 62676 -j ACCEPT
iptables -A FORWARD -p 17 --dport 30842 -s 85.178.0.0/16 --sport 1513 -j DROP
iptables -A FORWARD -p 17 -s 226.253.225.0/24 --dport 52157 --sport 2833 -j DROP
iptables -A test2 -p 17 --sport 13645 -j DROP
iptables -A test3 -d 40.0.0.0/8 -j DROP
iptables -A FORWARD -d 67.64.206.0/24 -j ACCEPT
iptables -A test1 -p 6 -d 161.201.108.127 -s 165.44.5.104 --dport 38482 -j ACCEPT
iptables -A INPUT -d 236.162.213.240 -j ACCEPT
iptables -A FORWARD -p 17 --sport 24513 -j test2
iptables -A FORWARD -p 17 --dport 30642 -j DROP
iptables -A OUTPUT -p 205 -d 152.0.0.0/8 -s 246.56.37.0/24 -j DROP
iptables -A test3 -d 191.117.200.124 -j DROP
iptables -A INPUT -p 6 --dport 42943 -s 66.227.159.0/24 -j DROP
iptables -A test3 -s 214.246.87.167 -j DROP
iptables -A INPUT -p 17 --dport 18852 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 5627 -d 244.250.79.0/24 -j DROP
iptables -A OUTPUT -p 217 -d 180.88.238.234 -j DROP
iptables -A INPUT -p 6 --sport 56180 --dport 55776 -s 239.37.131.140 -d 203.223.246.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 40129 -d 99.194.208.209 --sport 29029 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 40070 --sport 10080 -j DROP
iptables -A INPUT -s 225.30.174.98 -j ACCEPT
iptables -A test2 -p 6 --dport 13176 -s 24.6.250.201 -d 27.0.0.0/16 --sport 57409 -j ACCEPT
iptables -A test1 -p 6 --sport 57244 --dport 4072 -j DROP
iptables -A INPUT -p 30 -j DROP
iptables -A OUTPUT -p 17 --sport 59619 -d 58.219.193.0/24 -s 31.141.61.135 -j DROP
iptables -A test1 -p 17 -d 184.192.94.80 --dport 36890 -j ACCEPT
iptables -A test1 -p 6 --dport 8996 -d 140.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 -d 197.111.129.0/24 --dport 19036 -j DROP
iptables -A INPUT -p 17 --sport 5423 -j ACCEPT
iptables -A OUTPUT -p 17 -d 4.0.0.0/8 --dport 44864 --sport 28982 -j ACCEPT
iptables -A INPUT -p 6 --sport 5765 -d 243.26.38.213 -s 132.241.0.0/16 -j DROP
iptables -A FORWARD -d 160.167.174.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 63304 -j ACCEPT
iptables -A test1 -d 205.0.0.0/8 -s 59.96.51.0/24 -p 160 -j ACCEPT
iptables -A test1 -p 6 --sport 53130 -j DROP
iptables -A test2 -p 6 -d 192.247.188.7 --dport 34612 --sport 62249 -j ACCEPT
iptables -A FORWARD -p 6 --sport 38526 --dport 7281 -d 14.59.214.92 -j ACCEPT
iptables -A test1 -s 24.44.137.209 -j DROP
iptables -A INPUT -p 17 --sport 27189 -s 47.165.0.0/16 -d 145.248.204.0/24 -j DROP
iptables -A test2 -p 6 --dport 54130 -d 160.0.0.0/8 --sport 36615 -j ACCEPT
iptables -A test1 -p 233 -j DROP
iptables -A test1 -p 17 --sport 43815 -j ACCEPT
iptables -A test2 -p 6 --dport 21995 -j ACCEPT
iptables -A test3 -p 17 --dport 6201 -d 76.220.72.36 -s 51.243.206.0/24 -j ACCEPT
iptables -A test2 -p 17 -d 47.173.94.196 --sport 8111 --dport 21103 -j DROP
iptables -A test1 -p 237 -j DROP
iptables -A OUTPUT -p 17 --sport 49310 -s 60.78.224.143 -j ACCEPT
iptables -A test1 -p 254 -s 215.4.133.33 -j ACCEPT
iptables -A FORWARD -p 17 --sport 7961 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 27485 -j ACCEPT
iptables -A test1 -p 6 -s 124.0.0.0/8 --dport 32390 -d 168.1.134.83 -j DROP
iptables -A FORWARD -p 11 -s 134.56.0.0/16 -d 199.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 47139 --dport 9548 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 18523 -j DROP
iptables -A test2 -p 6 --sport 64244 -j DROP
iptables -A FORWARD -p 6 --sport 23314 -d 52.207.95.67 -j test1
iptables -A test2 -s 71.179.168.0/24 -j DROP
iptables -A test2 -s 58.0.0.0/8 -j DROP
iptables -A test2 -s 7.133.0.0/16 -d 244.10.51.249 -p 79 -j ACCEPT
iptables -A FORWARD -d 24.0.0.0/8 -s 9.251.254.0/24 -j DROP
iptables -A FORWARD -d 22.189.240.55 -s 208.196.163.168 -j ACCEPT
iptables -A OUTPUT -p 251 -j ACCEPT
iptables -A test3 -s 117.0.0.0/8 -j DROP
iptables -A OUTPUT -d 126.54.181.183 -p 169 -j DROP
iptables -A test2 -d 48.192.128.121 -j ACCEPT
iptables -A test3 -p 150 -d 191.235.120.233 -j DROP
iptables -A FORWARD -p 6 --sport 46321 --dport 51414 -s 108.87.239.149 -j test2
iptables -A FORWARD -p 6 --dport 49428 -j DROP
iptables -A FORWARD -p 17 -d 168.167.253.225 --sport 34071 -j DROP
iptables -A FORWARD -p 17 --sport 45690 --dport 42672 -j test1
iptables -A OUTPUT -s 220.31.58.0/24 -j DROP
iptables -A FORWARD -p 6 --dport 19531 --sport 34299 -s 116.17.196.72 -d 72.131.89.5 -j DROP
iptables -A FORWARD -p 6 --sport 12207 -d 95.95.155.85 --dport 32322 -j ACCEPT
iptables -A test3 -p 17 --sport 15779 -j ACCEPT
iptables -A FORWARD -p 17 --sport 52831 --dport 11505 -j DROP
iptables -A OUTPUT -p 6 --dport 57284 -j ACCEPT
iptables -A test3 -p 17 --sport 55933 -d 66.77.71.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 12703 -j ACCEPT
iptables -A test3 -p 166 -j ACCEPT
iptables -A OUTPUT -d 16.0.0.0/8 -j DROP
iptables -A test2 -p 6 --dport 53565 -d 183.171.2.23 --sport 64578 -j ACCEPT
iptables -A test2 -p 6 -d 7.19.0.0/16 --dport 37147 -j DROP
iptables -A test3 -s 140.0.0.0/8 -j ACCEPT
iptables -A test3 -s 16.245.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 23966 --sport 3335 -s 94.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 -s 60.0.0.0/8 --dport 4255 -d 89.50.168.157 --sport 56574 -j ACCEPT
iptables -A INPUT -d 61.81.165.0/24 -j ACCEPT
iptables -A OUTPUT -d 103.199.0.0/16 -s 18.54.248.206 -j test1
iptables -A OUTPUT -p 6 --sport 23797 -s 188.251.186.181 --dport 60290 -j DROP
iptables -A test1 -p 17 -d 245.26.0.0/16 --sport 34556 -j ACCEPT
iptables -A FORWARD -s 173.69.56.83 -j DROP
iptables -A test1 -p 17 -d 238.45.200.79 --sport 16177 -j DROP
iptables -A test3 -p 17 --sport 6219 -s 62.93.244.165 -j DROP
iptables -A OUTPUT -s 213.105.0.0/16 -j DROP
iptables -A INPUT -d 247.211.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 33109 -s 84.132.217.0/24 -j DROP
iptables -A INPUT -p 6 -s 92.10.160.146 --sport 15712 -j ACCEPT
iptables -A FORWARD -p 17 -s 8.217.99.190 --sport 54313 -d 76.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 -s 226.80.253.172 --sport 14642 -j DROP
iptables -A FORWARD -p 17 --sport 27186 -j ACCEPT
iptables -A FORWARD -p 6 --sport 3080 -s 7.165.131.0/24 --dport 37742 -j DROP
iptables -A OUTPUT -p 17 --sport 63231 -j DROP
iptables -A FORWARD -p 17 --sport 19113 --dport 17194 -d 118.168.0.0/16 -s 26.64.63.159 -j DROP
iptables -A FORWARD -p 17 -s 162.195.235.134 --sport 31441 --dport 803 -j ACCEPT
iptables -A FORWARD -p 17 -d 199.192.105.91 --sport 43649 -j DROP
iptables -A OUTPUT -p 17 -d 166.97.226.0/24 --sport 29532 --dport 16907 -j test2
iptables -A OUTPUT -p 17 -d 189.152.2.66 --dport 42817 --sport 25623 -j DROP
iptables -A test1 -p 6 --sport 55664 --dport 36482 -s 0.14.35.63 -j DROP
iptables -A OUTPUT -p 17 -s 68.222.0.0/16 --sport 50294 -j ACCEPT
iptables -A test1 -p 17 --sport 15782 -j DROP
iptables -A FORWARD -p 6 --sport 21866 -j ACCEPT
iptables -A FORWARD -p 6 --dport 38790 -d 109.86.178.164 --sport 10387 -j ACCEPT
iptables -A OUTPUT -s 96.159.0.0/16 -d 135.169.64.115 -j ACCEPT
iptables -A FORWARD -p 6 --sport 29336 -d 249.100.175.185 --dport 14151 -s 251.116.134.213 -j ACCEPT
iptables -A INPUT -p 17 --sport 25176 --dport 1979 -j DROP
iptables -A test2 -p 6 --dport 43685 -s 67.0.0.0/8 -d 182.153.86.224 -j DROP
iptables -A OUTPUT -p 97 -j DROP
iptables -A test3 -p 6 --dport 30822 -j DROP
iptables -A INPUT -p 17 --sport 17124 --dport 108 -j ACCEPT
iptables -A test1 -p 6 --sport 49473 -s 29.72.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 -d 250.57.181.154 --sport 63673 -s 224.139.195.206 -j DROP
iptables -A test1 -p 6 -s 60.191.0.0/16 --sport 36256 --dport 30961 -j DROP
iptables -A FORWARD -p 6 --dport 52529 -d 2.156.182.214 -s 242.224.0.0/16 -j DROP
iptables -A FORWARD -d 51.188.237.249 -p 198 -j ACCEPT
iptables -A test3 -p 138 -s 170.243.77.187 -d 127.118.156.0/24 -j DROP
iptables -A OUTPUT -p 6 --sport 3185 -d 253.1.151.94 -s 47.86.37.122 -j ACCEPT
iptables -A test3 -p 6 --dport 29407 -d 98.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --dport 14689 -s 203.29.0.0/16 -j ACCEPT
iptables -A test2 -s 108.0.0.0/8 -p 75 -j DROP
iptables -A test2 -p 6 -s 47.217.0.0/16 --sport 31537 -d 219.0.0.0/8 -j DROP
iptables -A test2 -p 17 --dport 8343 --sport 64815 -j DROP
iptables -A FORWARD -p 6 -d 137.183.47.0/24 --dport 50621 -j DROP
iptables -A test2 -p 17 --dport 63243 --sport 9140 -s 246.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 28097 -d 1.180.214.158 -j DROP
iptables -A INPUT -p 6 -s 15.34.128.0/24 --dport 26596 -j DROP
iptables -A OUTPUT -p 17 --sport 24339 -j ACCEPT
iptables -A INPUT -p 6 --dport 43307 --sport 59619 -j DROP
iptables -A OUTPUT -p 6 --sport 4809 -j DROP
iptables -A FORWARD -p 17 -d 103.98.110.228 --sport 56686 -j DROP
iptables -A INPUT -p 6 --sport 1433 -j DROP
iptables -A INPUT -p 17 --sport 39120 -d 132.208.98.0/24 -j ACCEPT
iptables -A OUTPUT -s 240.132.131.244 -j DROP
iptables -A test3 -p 17 --dport 49673 -j ACCEPT
iptables -A FORWARD -p 17 --sport 31016 -d 139.0.0.0/8 -s 153.100.155.0/24 -j DROP
iptables -A test2 -s 136.21.25.146 -d 123.52.226.0/24 -j ACCEPT
iptables -A test3 -p 6 -d 22.68.114.79 --dport 83 -j DROP
iptables -A test1 -p 6 --sport 26936 --dport 1526 -s 11.0.0.0/8 -j DROP
iptables -A test1 -p 6 --dport 54020 -d 131.95.236.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 27486 -j ACCEPT
iptables -A FORWARD -p 136 -j ACCEPT
iptables -A FORWARD -d 28.75.142.163 -s 134.214.169.0/24 -p 59 -j ACCEPT
iptables -A test1 -s 218.0.0.0/8 -j DROP
iptables -A test2 -p 17 -s 6.131.236.119 --dport 62223 --sport 51751 -j DROP
iptables -A test1 -p 17 --dport 18911 -s 228.201.131.174 -d 45.220.167.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 6998 -d 213.9.106.0/24 --dport 64337 -j DROP
iptables -A INPUT -p 6 --dport 40036 -j ACCEPT
iptables -A OUTPUT -p 17 -d 94.189.228.22 --sport 53837 -j DROP
iptables -A FORWARD -d 77.65.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 17996 -j DROP
iptables -A FORWARD -s 54.79.182.223 -j ACCEPT
iptables -A INPUT -p 17 --dport 62064 -j DROP
iptables -A test2 -s 130.0.0.0/8 -d 48.223.122.48 -p 183 -j ACCEPT
iptables -A test1 -p 65 -j ACCEPT
iptables -A INPUT -p 6 -s 45.201.108.103 --dport 1949 --sport 38508 -j ACCEPT
iptables -A test3 -p 103 -j DROP
iptables -A test1 -p 17 --dport 33987 -j DROP
iptables -A test3 -p 17 --dport 39357 -j DROP
iptables -A OUTPUT -p 6 --sport 34177 -d 103.0.0.0/8 --dport 33402 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 43202 -j ACCEPT
iptables -A test2 -p 17 --dport 2300 -s 217.0.0.0/8 -d 2.142.175.225 -j ACCEPT
iptables -A test3 -p 6 -d 93.180.0.0/16 --dport 27664 -j DROP
iptables -A INPUT -p 17 -d 63.220.123.184 -s 14.206.0.0/16 --sport 12551 -j ACCEPT
iptables -A OUTPUT -s 87.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --sport 10847 -j DROP
iptables -A test3 -p 17 --sport 15907 -s 76.75.120.165 -d 58.202.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --dport 34462 -s 141.167.62.65 -d 180.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --dport 61741 --sport 1337 -s 63.171.110.163 -j ACCEPT
iptables -A INPUT -p 6 --sport 51818 -j ACCEPT
iptables -A INPUT -p 17 --sport 11676 -d 83.91.251.16 -j DROP
iptables -A test3 -p 17 -d 81.87.200.0/24 -s 235.0.0.0/8 --dport 4590 --sport 13482 -j ACCEPT
iptables -A test1 -p 17 --dport 9214 -j DROP
iptables -A FORWARD -p 6 --dport 23292 -j DROP
iptables -A test1 -p 6 --sport 40588 --dport 56451 -d 131.122.199.61 -j DROP
iptables -A test1 -p 17 -s 76.203.51.184 --dport 2916 -d 228.39.21.0/24 -j DROP
iptables -A INPUT -p 17 --dport 18252 -s 90.15.214.69 -d 136.231.30.0/24 --sport 50853 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 31746 -d 83.17.0.0/16 --sport 28027 -j DROP
iptables -A INPUT -p 17 --dport 52021 --sport 22007 -j DROP
iptables -A test2 -s 169.0.0.0/8 -p 65 -j DROP
iptables -A test2 -p 82 -j DROP
iptables -A test2 -p 17 --sport 51496 --dport 7476 -s 209.86.131.3 -d 19.242.0.0/16 -j ACCEPT
iptables -A test1 -p 17 -s 103.83.15.179 --sport 64082 -d 54.129.0.254 -j ACCEPT
iptables -A test3 -p 17 --dport 4024 -d 152.243.9.128 -j ACCEPT
iptables -A test3 -p 17 -s 140.208.147.222 --dport 41746 -j DROP
iptables -A FORWARD -d 20.137.0.0/16 -p 115 -j DROP
iptables -A OUTPUT -p 17 --sport 46486 -j DROP
iptables -A test1 -p 6 -d 252.203.100.161 --dport 21613 --sport 55363 -j ACCEPT
iptables -A test2 -s 22.0.0.0/8 -p 62 -d 214.93.121.0/24 -j ACCEPT
iptables -A test3 -d 7.147.56.189 -p 142 -j DROP
iptables -A test1 -p 17 --dport 38391 -s 85.58.185.0/24 --sport 20692 -j ACCEPT
iptables -A test2 -p 17 --dport 5100 -s 152.97.77.117 -j DROP
iptables -A FORWARD -p 17 --dport 11088 -j test1
iptables -A INPUT -p 17 --dport 29325 -d 227.93.84.0/24 -j DROP
iptables -A test2 -p 6 --sport 64823 -j ACCEPT
iptables -A FORWARD -p 17 --sport 54015 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 55405 -j ACCEPT
iptables -A test2 -p 17 --sport 28452 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 48284 -s 118.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 186 -j ACCEPT
iptables -A test3 -p 6 --dport 39005 -s 25.113.5.3 -j DROP
iptables -A FORWARD -p 6 --dport 10630 -j DROP
iptables -A test3 -p 17 --dport 49688 -d 63.226.208.0/24 -j ACCEPT
iptables -A test2 -p 17 -d 56.159.180.0/24 --dport 14512 -s 122.97.224.73 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 53752 --dport 35429 -j ACCEPT
iptables -A test2 -p 17 -d 121.4.87.168 --sport 20413 -j ACCEPT
iptables -A INPUT -p 17 --sport 28827 -j ACCEPT
iptables -A test3 -p 17 --dport 63689 -d 108.0.0.0/8 -s 251.37.80.229 -j DROP
iptables -A test3 -p 6 --dport 31769 --sport 31873 -s 245.54.101.0/24 -j ACCEPT
iptables -A test1 -p 6 -s 251.0.0.0/8 --dport 16072 -j DROP
iptables -A test2 -p 6 -d 46.225.151.88 -s 91.0.154.14 --sport 22178 -j ACCEPT
iptables -A FORWARD -p 6 --dport 28178 -d 40.9.148.131 --sport 63132 -s 46.252.71.249 -j DROP
iptables -A test2 -p 6 -s 13.153.148.159 --sport 27058 -j DROP
iptables -A INPUT -p 17 -s 244.53.201.112 --sport 18540 -d 1.243.0.0/16 -j DROP
iptables -A INPUT -s 47.222.133.219 -p 23 -j DROP
iptables -A FORWARD -d 167.0.0.0/8 -p 190 -j ACCEPT
iptables -A INPUT -p 6 --dport 41196 -j ACCEPT
iptables -A INPUT -d 225.248.39.49 -j DROP
iptables -A INPUT -p 6 --sport 62863 -d 17.87.176.185 -s 111.243.27.0/24 -j DROP
iptables -A OUTPUT -p 6 --sport 57585 -j DROP
iptables -A test1 -p 17 --sport 56890 -d 18.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --sport 32042 -d 83.36.0.0/16 -j DROP
iptables -A test3 -p 6 --sport 41406 -j ACCEPT
iptables -A test2 -p 6 -s 244.183.242.0/24 --sport 16570 -j ACCEPT
iptables -A INPUT -p 6 --dport 25598 -j ACCEPT
iptables -A test3 -p 17 --sport 10375 -j DROP
iptables -A OUTPUT -p 17 -s 107.0.0.0/8 --dport 57619 -j DROP
iptables -A INPUT -p 123 -s 252.62.141.137 -d 106.223.26.0/24 -j DROP
iptables -A test2 -p 17 --sport 52490 -j DROP
iptables -A INPUT -s 213.62.182.0/24 -p 131 -d 194.164.19.182 -j DROP
iptables -A OUTPUT -d 240.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 17894 --sport 61713 -j ACCEPT
iptables -A test2 -d 172.93.143.36 -p 155 -j DROP
iptables -A test1 -p 17 -d 71.170.0.0/16 --sport 26268 -s 119.0.0.0/8 --dport 166 -j DROP
iptables -A test3 -p 6 --sport 38469 -d 220.245.1.0/24 -j DROP
iptables -A test1 -p 17 --sport 44477 -j DROP
iptables -A test3 -p 17 --dport 51711 -j DROP
iptables -A FORWARD -s 180.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --dport 41778 -j DROP
iptables -A test1 -p 6 -d 106.103.187.147 --sport 55795 -j ACCEPT
iptables -A FORWARD -d 110.28.229.109 -s 155.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 32814 -s 219.22.0.0/16 -d 140.123.202.72 -j test3
iptables -A FORWARD -p 6 -s 220.151.190.250 --dport 19766 --sport 37737 -j ACCEPT
iptables -A test3 -p 17 --dport 16906 --sport 37544 -d 116.57.79.143 -j DROP
iptables -A FORWARD -p 17 --dport 63971 -j ACCEPT
iptables -A FORWARD -p 17 -s 229.14.22.164 --sport 43921 -j DROP
iptables -A FORWARD -s 105.73.18.0/24 -d 99.5.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --sport 37267 -s 5.241.230.67 --dport 30874 -j ACCEPT
iptables -A FORWARD -d 87.34.180.36 -j DROP
iptables -A test1 -p 17 --dport 65435 -j ACCEPT
iptables -A FORWARD -p 6 -s 197.24.13.89 --dport 53210 -d 149.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --sport 60802 -d 21.65.0.0/16 --dport 62979 -s 197.80.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -d 173.105.191.202 -s 14.35.0.0/16 --sport 10179 -j DROP
iptables -A test3 -p 6 --sport 25785 -d 116.74.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 -d 30.107.73.22 --dport 60041 -s 126.73.92.99 -j DROP
iptables -A OUTPUT -p 6 --dport 40629 -j DROP
iptables -A OUTPUT -p 17 -s 24.0.0.0/8 --sport 29341 --dport 46293 -j ACCEPT
iptables -A INPUT -p 6 --sport 21193 -d 48.89.128.209 -j ACCEPT
iptables -A test2 -p 17 -s 175.86.105.48 --dport 27375 -d 175.0.0.0/8 --sport 28716 -j ACCEPT
iptables -A FORWARD -p 17 --dport 25674 -d 192.246.198.0/24 -s 204.178.36.2 -j DROP
iptables -A test3 -p 6 --sport 19174 -s 116.79.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --sport 39242 -s 75.119.171.0/24 -j DROP
iptables -A test2 -p 17 --dport 14925 --sport 841 -j ACCEPT
iptables -A test1 -p 6 --sport 98 -j DROP
iptables -A FORWARD -p 17 --sport 51361 -s 32.148.165.227 --dport 14750 -j ACCEPT
iptables -A test2 -p 17 -d 159.107.165.244 --dport 10345 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 13510 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 15782 --dport 45368 -j test2
iptables -A test2 -p 17 -d 151.0.0.0/8 --dport 56874 -s 229.81.37.28 -j ACCEPT
iptables -A FORWARD -p 17 --dport 20168 -j DROP
iptables -A FORWARD -d 251.0.0.0/8 -j test1
iptables -A test2 -p 6 --sport 48985 -d 128.6.0.0/16 -s 163.56.0.0/16 -j DROP
iptables -A FORWARD -p 17 --sport 37493 --dport 58941 -d 149.0.0.0/8 -j ACCEPT
iptables -A test3 -d 30.176.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --sport 36792 -d 211.153.23.123 -j ACCEPT
iptables -A test3 -s 217.33.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --sport 54294 -j DROP
iptables -A OUTPUT -s 69.24.226.0/24 -p 23 -j ACCEPT
iptables -A test2 -p 6 -s 146.49.228.1 -d 225.167.122.195 --sport 30680 --dport 18926 -j DROP
iptables -A test3 -p 17 -s 80.164.253.0/24 --sport 15147 --dport 31185 -j ACCEPT
iptables -A FORWARD -p 17 -d 23.64.0.0/16 --dport 59721 -j DROP
iptables -A INPUT -p 17 -s 147.255.0.0/16 --dport 46404 -j DROP
iptables -A test1 -p 17 --dport 13220 -j DROP
iptables -A OUTPUT -p 73 -s 217.189.158.212 -d 36.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --dport 61407 -d 2.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 10162 -s 253.185.65.115 --sport 52669 -j ACCEPT
iptables -A test1 -p 17 -s 197.105.77.239 --sport 36534 --dport 25346 -j DROP
iptables -A INPUT -p 6 -s 35.34.0.0/16 --dport 42173 -j DROP
iptables -A test2 -p 17 --sport 7031 -d 6.17.215.53 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 2431 --dport 63825 -j ACCEPT
iptables -A test1 -d 12.161.0.0/16 -j DROP
iptables -A FORWARD -d 66.0.0.0/8 -j DROP
iptables -A test3 -p 6 -s 214.28.96.185 --dport 55411 --sport 45285 -j ACCEPT
iptables -A INPUT -p 17 --sport 47433 -j test2
iptables -A test3 -p 17 --dport 35368 -j ACCEPT
iptables -A INPUT -p 6 --sport 59669 -j DROP
iptables -A FORWARD -p 17 --sport 57985 -j DROP
iptables -A test1 -p 6 --dport 13832 -s 200.0.0.0/8 -j DROP
iptables -A test2 -p 17 -d 48.242.205.244 --sport 34315 --dport 18928 -j ACCEPT
iptables -A test3 -p 17 --dport 51730 --sport 37274 -j ACCEPT
iptables -A test3 -p 6 --dport 49886 -s 108.213.61.23 --sport 1056 -j DROP
iptables -A test2 -p 17 --dport 50723 -j ACCEPT
iptables -A OUTPUT -p 17 -s 169.239.22.23 -d 13.33.201.145 --sport 47169 -j DROP
iptables -A INPUT -p 17 --dport 59658 -j ACCEPT
iptables -A test3 -p 17 --dport 16480 -s 157.250.64.50 -j ACCEPT
iptables -A test3 -d 106.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --dport 50190 --sport 39033 -j DROP
iptables -A test1 -p 17 -d 159.44.0.0/16 -s 163.0.0.0/8 --dport 26672 -j DROP
iptables -A OUTPUT -p 6 --sport 48982 -d 133.99.2.149 -s 210.78.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --dport 61399 -d 148.174.173.118 -s 33.117.203.0/24 -j DROP
iptables -A INPUT -p 6 -s 127.144.190.169 --sport 36240 -j DROP
iptables -A FORWARD -p 6 --sport 39345 -d 16.0.0.0/8 -j ACCEPT
iptables -A test1 -p 27 -d 10.22.113.130 -j DROP
iptables -A FORWARD -p 6 -s 240.89.33.22 -d 59.240.18.164 --dport 1962 -j DROP
iptables -A test1 -s 52.73.180.0/24 -d 114.219.59.234 -j ACCEPT
iptables -A INPUT -p 17 --dport 1654 -s 224.66.73.0/24 -d 216.209.0.0/16 -j ACCEPT
iptables -A test1 -s 137.188.0.0/16 -j DROP
iptables -A test3 -p 107 -s 55.232.10.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -s 245.210.132.59 --dport 33663 -j ACCEPT
iptables -A test1 -p 17 --dport 25357 --sport 44352 -j DROP
iptables -A OUTPUT -p 17 --sport 53122 -d 68.97.48.41 -j DROP
iptables -A INPUT -p 241 -j ACCEPT
iptables -A OUTPUT -p 17 -s 186.207.0.0/16 --sport 5127 -j test1
iptables -A test1 -p 17 --dport 21284 -d 14.22.41.202 -j DROP
iptables -A INPUT -d 223.49.248.54 -s 65.109.206.231 -j test1
iptables -A test3 -p 6 -s 37.14.214.4 --dport 61276 --sport 51403 -d 57.204.227.139 -j DROP
iptables -A INPUT -p 17 -s 227.177.123.39 --dport 16599 -d 120.32.180.122 -j ACCEPT
iptables -A FORWARD -p 6 --sport 7041 -s 95.195.231.72 -d 88.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -s 20.155.0.0/16 --dport 23555 -d 18.116.197.0/24 -j DROP
iptables -A INPUT -p 17 --dport 13980 -s 130.103.181.195 -j DROP
iptables -A test3 -s 140.223.66.5 -j DROP
iptables -A test2 -d 18.143.214.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 3070 -j ACCEPT
iptables -A test1 -p 6 --dport 9464 -d 218.0.0.0/8 -s 193.213.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 59162 --sport 37440 -d 136.114.230.217 -j test3
iptables -A OUTPUT -p 17 -d 243.85.0.0/16 --sport 27791 -j DROP
iptables -A test3 -p 6 -s 218.54.232.113 --dport 55066 -d 239.144.90.242 -j DROP
iptables -A test1 -p 177 -s 174.89.152.110 -j DROP
iptables -A FORWARD -p 6 -d 80.0.0.0/8 --dport 39374 -j ACCEPT
iptables -A test1 -p 17 --dport 12010 -j ACCEPT
iptables -A OUTPUT -p 6 -d 208.171.45.145 -s 106.0.0.0/8 --sport 41551 -j DROP
iptables -A test3 -p 6 --sport 32010 -j ACCEPT
iptables -A FORWARD -s 78.186.6.90 -d 123.79.103.116 -j ACCEPT
iptables -A test3 -p 17 --dport 19890 -s 1.178.0.0/16 -d 2.106.25.0/24 -j ACCEPT
iptables -A test3 -d 66.171.197.27 -j ACCEPT
iptables -A test2 -p 6 --sport 47043 -j DROP
iptables -A INPUT -p 6 --dport 52995 --sport 42735 -s 127.179.189.38 -j ACCEPT
iptables -A INPUT -s 95.135.211.63 -d 85.28.237.138 -j DROP
iptables -A FORWARD -s 50.4.14.222 -j DROP
iptables -A INPUT -p 17 -s 215.24.0.0/16 --sport 30443 -j DROP
iptables -A test2 -d 73.194.245.4 -s 150.52.236.140 -j DROP
iptables -A OUTPUT -p 6 --dport 34212 -d 63.0.0.0/8 --sport 64154 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 51150 -j ACCEPT
iptables -A INPUT -p 17 -s 236.242.163.0/24 --dport 25916 --sport 41677 -j DROP
iptables -A test3 -p 6 -s 96.102.0.0/16 -d 216.147.197.0/24 --dport 13100 --sport 42982 -j ACCEPT
iptables -A FORWARD -p 17 -d 38.220.0.0/16 --sport 2344 -j DROP
iptables -A test3 -p 6 --dport 37696 -d 104.168.97.0/24 -s 5.63.94.125 -j DROP
iptables -A test2 -p 17 --dport 9104 -s 173.101.148.37 -j DROP
iptables -A test1 -d 148.135.206.207 -j DROP
iptables -A test2 -p 190 -j DROP
iptables -A test2 -p 6 -s 97.85.82.53 --dport 51585 -d 242.195.0.0/16 --sport 60450 -j ACCEPT
iptables -A test2 -p 139 -j ACCEPT
iptables -A test1 -d 198.164.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 146 -j DROP
iptables -A OUTPUT -p 6 -s 166.0.0.0/8 --dport 40166 -j DROP
iptables -A test3 -p 17 -s 202.203.8.12 --sport 40080 -j ACCEPT
iptables -A test1 -p 6 --sport 2942 --dport 23309 -s 26.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 40537 -s 105.183.56.224 -d 179.0.0.0/8 --sport 35643 -j ACCEPT
iptables -A FORWARD -p 6 -d 158.74.127.128 --sport 42148 --dport 24353 -j ACCEPT
iptables -A test1 -p 17 -d 6.0.0.0/8 -s 69.72.253.31 --sport 11802 -j DROP
iptables -A test2 -p 6 -d 107.31.219.0/24 --dport 26036 -j ACCEPT
iptables -A test3 -p 79 -j ACCEPT
iptables -A test2 -d 146.67.138.6 -j DROP
iptables -A test2 -d 229.7.205.9 -p 90 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 44217 -j DROP
iptables -A test2 -p 17 --sport 25305 -j DROP
iptables -A OUTPUT -p 6 -s 142.173.52.0/24 --dport 39237 -j ACCEPT
iptables -A OUTPUT -d 19.154.76.0/24 -p 107 -j DROP
iptables -A OUTPUT -p 248 -j ACCEPT
iptables -A test3 -p 17 -s 184.196.13.131 -d 156.0.0.0/8 --sport 23515 -j ACCEPT
iptables -A test3 -p 17 --dport 6220 -j ACCEPT
iptables -A INPUT -p 6 --sport 31611 --dport 13563 -j DROP
iptables -A test2 -p 17 -d 7.57.0.0/16 --sport 13364 -s 188.140.202.164 -j DROP
iptables -A test1 -p 17 --sport 36637 -j ACCEPT
iptables -A test2 -p 17 --dport 1769 -j ACCEPT
iptables -A FORWARD -p 17 --sport 6360 --dport 47183 -j DROP
iptables -A INPUT -p 6 --dport 48309 -d 82.0.0.0/8 -j DROP
iptables -A test3 -p 6 --dport 30975 -j DROP
iptables -A FORWARD -p 17 --dport 46622 --sport 9430 -j ACCEPT
iptables -A test1 -p 17 --sport 36532 -j DROP
iptables -A test1 -p 6 -d 76.198.0.0/16 --dport 61912 -j DROP
iptables -A test3 -p 17 --sport 29010 --dport 4671 -d 208.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --sport 62050 -j ACCEPT
iptables -A test3 -p 6 --sport 51110 --dport 61823 -s 253.51.214.20 -j ACCEPT
iptables -A test2 -s 64.230.150.99 -d 121.133.8.0/24 -p 34 -j ACCEPT
iptables -A INPUT -p 95 -s 244.237.50.96 -j test2
iptables -A test2 -p 6 --dport 52245 -d 246.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -d 222.0.0.0/8 --sport 15372 -j DROP
iptables -A test1 -s 115.155.109.139 -j ACCEPT
iptables -A OUTPUT -p 17 -d 163.245.51.20 --sport 62408 -j DROP
iptables -A test3 -d 81.193.35.168 -j ACCEPT
iptables -A INPUT -p 17 --sport 45665 --dport 47856 -j ACCEPT
iptables -A INPUT -p 17 -d 170.102.57.236 --dport 33566 -s 133.90.202.132 -j DROP
iptables -A FORWARD -p 6 --dport 47399 --sport 37129 -d 181.217.165.34 -j DROP
iptables -A test3 -p 6 --sport 19068 -j ACCEPT
iptables -A OUTPUT -p 199 -j ACCEPT
iptables -A test1 -p 6 -d 191.0.0.0/8 --sport 62377 -j DROP
iptables -A test2 -p 17 -s 159.6.161.82 --dport 3249 --sport 37656 -j DROP
iptables -A test3 -s 146.251.42.38 -p 135 -d 146.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 64558 --dport 40414 -s 61.16.190.74 -j ACCEPT
iptables -A test2 -p 17 -d 34.102.224.243 --dport 31298 -j ACCEPT
iptables -A test3 -p 6 --sport 60428 -j ACCEPT
iptables -A test2 -p 6 --dport 8054 -d 124.86.183.0/24 --sport 32638 -s 150.160.214.0/24 -j ACCEPT
iptables -A INPUT -p 115 -j ACCEPT
iptables -A FORWARD -s 79.27.10.253 -j ACCEPT
iptables -A test2 -p 6 --dport 47381 --sport 39910 -s 230.229.0.0/16 -d 110.115.86.78 -j ACCEPT
iptables -A test2 -p 17 -d 208.156.226.3 --dport 18891 -j ACCEPT
iptables -A test1 -s 114.113.251.254 -j ACCEPT
iptables -A test3 -s 104.210.0.0/16 -j DROP
iptables -A test2 -p 17 --sport 9313 -j ACCEPT
iptables -A test2 -p 6 -s 215.22.109.0/24 --sport 41152 --dport 17083 -j ACCEPT
iptables -A test2 -p 17 --sport 32355 -s 78.54.158.17 -d 46.0.0.0/8 -j DROP
iptables -A INPUT -p 143 -j ACCEPT
iptables -A OUTPUT -p 17 -d 67.241.90.107 --dport 29820 -j ACCEPT
iptables -A FORWARD -p 17 --sport 39367 -j ACCEPT
iptables -A test1 -s 89.50.104.251 -j ACCEPT
iptables -A test2 -d 27.0.0.0/8 -p 221 -s 24.35.112.252 -j ACCEPT
iptables -A test2 -p 17 -s 238.22.205.75 --sport 22704 --dport 32089 -j DROP
iptables -A OUTPUT -p 6 -d 12.114.221.0/24 --sport 19243 -s 17.133.185.227 --dport 12393 -j DROP
iptables -A test1 -p 17 -s 14.221.200.133 --sport 26590 --dport 15011 -j ACCEPT
iptables -A OUTPUT -p 6 -s 74.254.142.77 --sport 33712 -d 146.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --dport 51095 --sport 59130 -d 172.171.54.253 -j DROP
iptables -A FORWARD -p 17 --dport 50128 -j DROP
iptables -A FORWARD -p 6 -d 43.195.172.0/24 --dport 28510 --sport 19149 -j DROP
iptables -A test3 -p 17 -d 97.20.52.155 --sport 20282 -s 63.232.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 50 -d 195.205.17.63 -s 16.121.50.245 -j ACCEPT
iptables -A test3 -d 6.210.140.0/24 -s 158.0.0.0/8 -p 191 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 47887 -s 55.147.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --sport 41856 -d 182.3.175.92 -s 91.132.202.34 -j test2
iptables -A test3 -p 6 -s 11.116.102.39 --dport 5337 -j DROP
iptables -A FORWARD -p 2 -d 226.130.237.71 -j ACCEPT
iptables -A INPUT -d 100.134.202.198 -j DROP
iptables -A test1 -p 17 -d 149.187.0.0/16 -s 174.187.3.212 --dport 64145 -j DROP
iptables -A INPUT -p 6 --dport 34939 -j ACCEPT
iptables -A test1 -p 17 --dport 19949 -d 50.0.0.0/8 -s 2.8.161.125 -j ACCEPT
iptables -A test1 -d 187.17.121.0/24 -j DROP
iptables -A test3 -p 17 --sport 27256 -s 159.0.0.0/8 --dport 30150 -j DROP
iptables -A test1 -p 17 --dport 30772 --sport 56339 -j ACCEPT
iptables -A test2 -p 17 --sport 20286 -d 86.189.64.0/24 --dport 11517 -j ACCEPT
iptables -A test1 -p 17 -s 84.60.214.162 --dport 17707 -j DROP
iptables -A test1 -p 17 --dport 54736 -d 1.0.0.0/8 -j DROP
iptables -A test1 -d 240.192.0.0/16 -j DROP
iptables -A test1 -p 6 --dport 17586 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 21180 --sport 61571 -j DROP
iptables -A INPUT -p 6 --sport 20243 -s 82.174.107.170 -d 197.167.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 13967 -j DROP
iptables -A test2 -p 6 -d 140.79.231.0/24 -s 41.209.128.116 --dport 43820 -j ACCEPT
iptables -A test1 -d 21.0.0.0/8 -j DROP
iptables -A test2 -d 98.11.193.0/24 -p 229 -j DROP
iptables -A test2 -s 182.155.215.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 31146 -d 7.41.133.14 -j ACCEPT
iptables -A test2 -p 6 --sport 56585 -j DROP
iptables -A FORWARD -p 6 -d 136.168.178.0/24 -s 19.188.188.214 --sport 60375 --dport 50886 -j ACCEPT
iptables -A test1 -p 123 -j DROP
iptables -A test2 -p 6 --sport 59322 --dport 15014 -s 177.7.0.0/16 -j ACCEPT
iptables -A test1 -p 254 -d 85.146.69.71 -s 17.112.223.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 21487 -j ACCEPT
iptables -A INPUT -p 6 --sport 20635 -j test1
iptables -A test2 -p 17 --sport 48311 -s 129.127.107.187 -d 168.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --sport 25402 -d 161.177.0.0/16 --dport 37853 -s 154.255.0.0/16 -j ACCEPT
iptables -A test1 -p 17 -d 77.125.66.165 --sport 14625 -s 116.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --sport 57729 -s 30.253.48.16 --dport 12544 -j test3
iptables -A test1 -p 17 -s 112.0.0.0/8 -d 193.65.243.0/24 --sport 57441 -j ACCEPT
iptables -A FORWARD -p 17 -d 139.197.235.12 --sport 64159 -s 167.210.126.0/24 -j ACCEPT
iptables -A test1 -p 17 -d 129.121.0.0/16 --sport 23550 --dport 26666 -s 100.175.32.88 -j ACCEPT
iptables -A test3 -d 107.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --dport 51217 -j ACCEPT
iptables -A test3 -p 6 -d 154.179.10.19 -s 148.148.95.79 --dport 25406 -j DROP
iptables -A test2 -p 6 --sport 29007 -s 133.198.41.0/24 -d 60.13.0.0/16 -j DROP
iptables -A FORWARD -p 17 --sport 48539 -j ACCEPT
iptables -A FORWARD -p 6 --dport 34492 -j DROP
iptables -A test2 -p 17 --dport 61293 -s 103.249.216.179 -j ACCEPT
iptables -A INPUT -p 17 -d 156.66.211.0/24 --sport 11800 --dport 36400 -j DROP
iptables -A test3 -p 17 -s 151.0.0.0/8 --dport 25914 -d 96.58.109.151 -j ACCEPT
iptables -A INPUT -d 179.0.0.0/8 -s 56.84.83.23 -j DROP
iptables -A OUTPUT -p 6 --dport 36574 -d 158.168.165.32 -j ACCEPT
iptables -A test2 -p 17 -s 142.138.224.245 --dport 25452 --sport 64791 -j ACCEPT
iptables -A test3 -p 17 --sport 31378 -s 204.122.95.74 -d 241.51.0.0/16 -j ACCEPT
iptables -A FORWARD -d 51.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 -d 141.242.155.180 --dport 64957 -j DROP
iptables -A FORWARD -s 232.141.164.0/24 -j DROP
iptables -A test3 -p 6 -d 177.121.228.0/24 --sport 36623 -j DROP
iptables -A test1 -p 6 --dport 28028 -d 40.150.64.0/24 -j ACCEPT
iptables -A INPUT -p 17 --dport 35075 -j test2
iptables -A test3 -p 17 --dport 26866 -s 103.1.232.208 -j ACCEPT
iptables -A FORWARD -p 17 --sport 17771 -s 24.245.198.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --sport 821 -d 143.57.180.6 -s 43.184.132.153 -j DROP
iptables -A INPUT -p 17 --sport 42644 -j ACCEPT
iptables -A test1 -p 173 -j ACCEPT
iptables -A test1 -s 48.219.0.93 -p 22 -j DROP
iptables -A FORWARD -p 6 -s 135.5.64.63 --sport 60807 --dport 36076 -j ACCEPT
iptables -A INPUT -d 52.15.232.151 -j DROP
iptables -A INPUT -s 162.101.26.101 -j DROP
iptables -A FORWARD -p 6 --dport 39000 -s 146.23.74.48 -d 160.4.194.148 -j test2
iptables -A test2 -p 6 -d 53.231.72.0/24 --sport 24695 -j DROP
iptables -A test3 -p 6 -s 227.4.171.210 --sport 41774 -j DROP
iptables -A OUTPUT -p 6 -s 77.187.196.0/24 --dport 20339 -j ACCEPT
iptables -A test2 -p 17 --dport 13150 -j DROP
iptables -A FORWARD -p 6 -d 159.228.20.222 --dport 34352 --sport 30000 -j DROP
iptables -A INPUT -p 17 --dport 18449 -s 145.140.188.74 --sport 35260 -d 118.15.46.149 -j ACCEPT
iptables -A test1 -p 6 --dport 17367 -s 72.90.0.0/16 --sport 56621 -j ACCEPT
iptables -A test3 -p 17 --dport 32863 -d 242.171.210.176 --sport 11417 -j DROP
iptables -A FORWARD -p 17 -d 206.140.43.119 -s 15.0.0.0/8 --sport 40263 -j DROP
iptables -A test1 -p 6 -d 239.163.131.106 --sport 21662 --dport 1426 -s 212.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 57675 --sport 43014 -j ACCEPT
iptables -A OUTPUT -p 17 -d 116.232.174.165 --dport 31940 -s 251.15.185.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --dport 15490 -j test3
iptables -A test2 -p 6 --dport 7315 -d 81.241.179.0/24 --sport 63041 -j DROP
iptables -A test3 -p 17 -d 5.68.163.0/24 -s 63.158.30.152 --dport 48576 -j DROP
iptables -A test1 -s 134.164.248.72 -d 4.181.0.0/16 -p 80 -j DROP
iptables -A test1 -p 6 -s 220.139.134.18 -d 145.163.65.114 --sport 20831 -j ACCEPT
iptables -A FORWARD -p 6 -s 245.72.11.94 --sport 50772 -j DROP
iptables -A INPUT -p 17 -d 116.54.8.41 --dport 32112 -j DROP
iptables -A test3 -p 17 -s 120.0.0.0/8 --dport 46471 -d 117.58.200.150 -j ACCEPT
iptables -A test2 -p 17 --dport 56916 -s 97.222.222.139 -j DROP
iptables -A test3 -p 6 -d 74.0.157.0/24 --sport 57092 -s 25.155.85.179 -j ACCEPT
iptables -A test3 -p 6 --dport 14814 --sport 18229 -j ACCEPT
iptables -A test3 -p 17 --sport 62552 -s 164.2.0.0/16 --dport 62917 -d 59.62.148.143 -j ACCEPT
iptables -A test1 -p 78 -j ACCEPT
iptables -A test3 -p 6 --sport 54365 -s 236.198.187.123 -j ACCEPT
iptables -A FORWARD -p 6 --sport 21372 -j test3
iptables -A test1 -d 118.3.90.148 -j DROP
iptables -A test3 -s 226.42.0.0/16 -j ACCEPT
iptables -A test3 -d 128.0.0.0/8 -p 204 -j ACCEPT
iptables -A FORWARD -p 17 -s 3.47.52.44 --dport 53078 -d 252.128.205.0/24 -j DROP
iptables -A OUTPUT -p 17 --dport 2907 -j DROP
iptables -A test3 -p 6 --sport 48925 -s 226.23.235.94 -j DROP
iptables -A test2 -d 71.195.0.0/16 -j ACCEPT
iptables -A test1 -d 246.100.73.60 -p 185 -j DROP
iptables -A FORWARD -p 6 --sport 10320 -j ACCEPT
iptables -A INPUT -p 6 -s 172.39.178.229 --sport 50931 --dport 36624 -j DROP
iptables -A FORWARD -d 210.175.136.0/24 -j DROP
iptables -A test2 -p 17 --dport 23765 -j ACCEPT
iptables -A test3 -p 17 --sport 9733 -s 176.0.0.0/8 -j DROP
iptables -A test3 -p 6 --sport 26878 -s 27.193.72.158 -j DROP
iptables -A test1 -p 17 --dport 9050 -d 248.161.57.242 -s 151.211.135.7 -j DROP
iptables -A test2 -p 17 -s 172.38.190.165 --dport 54830 -j ACCEPT
iptables -A test1 -p 72 -d 36.187.116.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --sport 11799 -s 181.0.0.0/8 --dport 20578 -j ACCEPT
iptables -A test1 -p 17 --sport 45802 -d 187.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 --sport 4451 -j ACCEPT
iptables -A OUTPUT -p 17 -s 56.0.0.0/8 --sport 37478 -j DROP
iptables -A test3 -p 6 --sport 6729 -j DROP
iptables -A FORWARD -p 17 -s 17.107.0.0/16 --sport 20785 -d 123.222.156.138 -j DROP
iptables -A test2 -p 6 --sport 37071 -s 94.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --dport 7554 -j ACCEPT
iptables -A test1 -d 26.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 11366 -j DROP
iptables -A INPUT -d 214.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 54290 -j DROP
iptables -A test2 -p 69 -j ACCEPT
iptables -A FORWARD -p 17 -d 138.102.95.0/24 --dport 18781 -j ACCEPT
iptables -A OUTPUT -p 17 -s 189.8.75.180 --sport 9315 -j ACCEPT
iptables -A test3 -p 6 -s 249.171.242.0/24 -d 55.179.143.121 --dport 13911 -j ACCEPT
iptables -A INPUT -p 17 --dport 42473 -s 216.128.178.0/24 -j ACCEPT
iptables -A INPUT -p 17 --dport 17109 -s 236.58.42.108 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 14377 -s 235.162.0.0/16 -d 215.14.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 3192 --sport 12976 -d 96.158.60.0/24 -j DROP
iptables -A OUTPUT -s 246.2.0.0/16 -p 12 -j DROP
iptables -A test2 -p 17 --dport 34270 -j DROP
iptables -A test3 -p 17 -s 112.172.166.0/24 --dport 11098 -j DROP
iptables -A INPUT -d 234.165.27.23 -p 27 -s 12.159.177.128 -j ACCEPT
iptables -A INPUT -p 17 -s 156.232.0.0/16 --sport 13021 -j DROP
iptables -A test3 -p 17 -s 217.247.109.0/24 --dport 37235 -d 78.95.9.0/24 -j DROP
iptables -A OUTPUT -p 6 --sport 37336 -j ACCEPT
iptables -A test1 -p 17 -s 1.83.230.77 --dport 49871 -d 151.211.104.62 -j DROP
iptables -A test2 -p 17 --dport 18648 -j ACCEPT
iptables -A test3 -s 78.85.163.0/24 -j DROP
iptables -A OUTPUT -s 105.0.0.0/8 -d 144.0.0.0/8 -j ACCEPT
iptables -A test3 -s 171.0.0.0/8 -p 4 -d 61.64.83.165 -j ACCEPT
iptables -A test1 -p 6 -d 169.0.0.0/8 --sport 24323 -s 105.88.14.81 -j DROP
iptables -A FORWARD -p 6 --dport 14448 -d 252.143.62.86 -s 62.56.231.130 -j ACCEPT
iptables -A test2 -p 17 --dport 23056 -j ACCEPT
iptables -A OUTPUT -p 17 -d 56.0.0.0/8 -s 121.63.142.0/24 --dport 9641 -j DROP
iptables -A test2 -d 51.241.146.121 -p 21 -j DROP
iptables -A test2 -p 6 --dport 18314 -j ACCEPT
iptables -A OUTPUT -p 17 -s 248.185.250.0/24 --dport 5209 --sport 56741 -j DROP
iptables -A OUTPUT -p 17 -d 35.28.187.51 --dport 57870 -j ACCEPT
iptables -A test1 -p 17 --dport 46268 --sport 10522 -s 254.207.102.4 -j ACCEPT
iptables -A OUTPUT -p 6 -d 198.206.0.93 --sport 24643 -j ACCEPT
iptables -A INPUT -p 156 -d 48.200.153.142 -s 61.57.216.233 -j DROP
iptables -A test3 -p 17 --sport 52824 -d 31.35.118.0/24 -j DROP
iptables -A FORWARD -p 17 -s 109.230.143.0/24 -d 57.0.0.0/8 --sport 47901 -j ACCEPT
iptables -A FORWARD -p 6 --dport 29886 -s 71.196.0.0/16 -d 130.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --sport 2311 -j ACCEPT
iptables -A test2 -p 17 --sport 63193 -s 120.32.0.0/16 --dport 64034 -j DROP
iptables -A FORWARD -p 6 --dport 39005 -j DROP
iptables -A test1 -p 6 --sport 1656 -s 127.192.0.0/16 --dport 40755 -j ACCEPT
iptables -A test1 -p 17 -s 186.243.175.186 -d 131.0.0.0/8 --dport 29334 -j DROP
iptables -A test1 -p 208 -j DROP
iptables -A test3 -p 47 -j DROP
iptables -A OUTPUT -s 31.191.135.224 -d 129.185.25.232 -p 153 -j DROP
iptables -A test2 -p 6 -s 52.108.166.107 --sport 46295 -d 59.80.185.236 -j ACCEPT
iptables -A FORWARD -p 6 --dport 12795 -s 63.69.8.174 --sport 24186 -j DROP
iptables -A test2 -p 6 --dport 45139 --sport 52128 -s 28.62.196.0/24 -d 124.225.226.189 -j ACCEPT
iptables -A test2 -p 6 -d 100.0.0.0/8 --sport 59604 -j DROP
iptables -A test2 -p 123 -s 235.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 -s 135.0.0.0/8 -d 235.67.6.212 --sport 23632 -j DROP
iptables -A INPUT -s 59.58.234.133 -j ACCEPT
iptables -A FORWARD -s 165.0.0.0/8 -j test3
iptables -A OUTPUT -p 6 -s 167.7.151.42 --sport 57757 --dport 60459 -j DROP
iptables -A FORWARD -p 6 --dport 43309 -d 40.141.198.26 -s 181.254.167.210 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 15127 --dport 53684 -d 222.169.131.0/24 -j DROP
iptables -A test3 -s 65.251.31.244 -j ACCEPT
iptables -A test3 -p 6 --sport 6314 -s 56.28.227.229 --dport 4186 -j DROP
iptables -A FORWARD -d 119.71.0.0/16 -j DROP
iptables -A test2 -p 6 --dport 21211 -j ACCEPT
iptables -A test1 -p 17 --sport 4257 -s 242.101.74.0/24 -j ACCEPT
iptables -A test1 -p 6 -s 233.142.0.0/16 --sport 31568 -d 88.165.132.140 -j DROP
iptables -A INPUT -p 17 --dport 31511 -s 90.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 20413 -d 132.31.138.0/24 -j ACCEPT
iptables -A test3 -p 17 -s 92.119.63.0/24 --sport 58328 --dport 13210 -j DROP
iptables -A test2 -p 17 -d 174.79.15.111 --sport 11842 -s 58.43.171.180 -j DROP
iptables -A FORWARD -p 17 --dport 33826 -d 148.138.90.196 -s 21.155.93.0/24 -j DROP
iptables -A test3 -d 174.21.68.225 -s 61.132.128.92 -j DROP
iptables -A test3 -p 6 --dport 23126 -s 124.82.143.219 -j ACCEPT
iptables -A INPUT -p 6 -d 35.0.0.0/8 --sport 3213 --dport 5336 -j DROP
iptables -A test2 -p 6 --dport 62536 -j DROP
iptables -A OUTPUT -p 17 --dport 50891 -j ACCEPT
iptables -A test1 -p 130 -j DROP
iptables -A test1 -p 17 --sport 38365 --dport 9937 -d 47.11.0.0/16 -s 7.152.159.164 -j DROP
iptables -A test3 -p 17 --sport 19401 -s 213.8.254.141 -d 120.113.86.165 -j ACCEPT
iptables -A FORWARD -p 17 --dport 49699 -d 63.108.96.48 --sport 48786 -j DROP
iptables -A FORWARD -p 17 --sport 27755 -s 196.137.190.0/24 --dport 62176 -j ACCEPT
iptables -A FORWARD -s 224.200.23.61 -d 152.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --dport 24522 -s 252.19.77.242 --sport 25904 -j ACCEPT
iptables -A test2 -p 6 -s 172.253.168.106 --sport 9302 --dport 54442 -j DROP
iptables -A test1 -p 17 --sport 10376 --dport 13263 -d 120.119.78.11 -j DROP
iptables -A FORWARD -p 6 --sport 37859 -s 238.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 41737 -d 109.135.0.0/16 --dport 43337 -j ACCEPT
iptables -A INPUT -p 6 --dport 58937 -s 107.80.216.36 -d 176.153.117.0/24 --sport 28059 -j DROP
iptables -A test2 -p 17 -s 246.155.94.219 --sport 4598 -j ACCEPT
iptables -A INPUT -p 17 --dport 54539 --sport 4953 -s 230.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 -d 232.242.52.186 --sport 54274 -j ACCEPT
iptables -A test1 -d 82.0.0.0/8 -p 4 -j DROP
iptables -A OUTPUT -p 17 -d 71.20.0.0/16 --sport 59883 -s 129.37.248.80 -j DROP
iptables -A test1 -s 211.23.0.0/16 -j ACCEPT
iptables -A INPUT -s 97.0.0.0/8 -j DROP
iptables -A test3 -p 17 -d 51.0.0.0/8 --sport 26520 -s 249.62.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --sport 13375 -j DROP
iptables -A INPUT -p 17 -d 197.241.158.74 --sport 28898 --dport 30867 -j DROP
iptables -A INPUT -p 17 --sport 442 -j ACCEPT
iptables -A FORWARD -p 17 --dport 12233 -j ACCEPT
iptables -A test1 -p 17 --sport 2446 -j DROP
iptables -A test3 -p 17 --dport 2369 --sport 2153 -j DROP
iptables -A test2 -p 6 -s 6.204.250.0/24 --sport 39197 --dport 50430 -j DROP
iptables -A test3 -p 17 --sport 35898 -d 159.205.0.0/16 -j DROP
iptables -A test2 -s 74.0.0.0/8 -p 253 -j ACCEPT
iptables -A test1 -p 17 --sport 36213 -s 13.0.0.0/8 -d 79.18.52.208 -j DROP
iptables -A OUTPUT -p 17 --dport 54014 -s 179.28.8.0/24 --sport 26911 -d 221.28.226.148 -j DROP
iptables -A test3 -p 6 --sport 22884 -s 66.198.56.236 -j DROP
iptables -A test1 -p 17 --dport 22884 -d 238.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 -s 67.149.12.152 --dport 4962 -d 202.47.83.144 --sport 34986 -j ACCEPT
iptables -A test3 -p 6 -s 206.114.225.230 --sport 59267 -j ACCEPT
iptables -A FORWARD -p 17 --sport 26930 -j test2
iptables -A test2 -d 27.226.181.0/24 -p 138 -j DROP
iptables -A INPUT -s 253.124.0.0/16 -p 91 -j DROP
iptables -A test3 -p 6 --dport 14877 -s 119.55.209.6 --sport 47724 -j ACCEPT
iptables -A test2 -p 17 --dport 32194 -j ACCEPT
iptables -A OUTPUT -p 17 -d 203.88.0.0/16 --sport 12099 -s 124.158.76.0/24 -j ACCEPT
iptables -A INPUT -p 17 --sport 40198 --dport 16069 -d 139.142.81.120 -j DROP
iptables -A test3 -p 17 --dport 64972 -d 129.103.0.0/16 -j DROP
iptables -A test1 -p 6 -s 237.104.128.247 -d 77.122.44.0/24 --dport 9218 -j DROP
iptables -A INPUT -d 248.63.0.0/16 -s 166.15.0.0/16 -p 112 -j ACCEPT
iptables -A test2 -p 17 -d 160.223.183.0/24 -s 167.84.66.19 --sport 15874 --dport 13438 -j DROP
iptables -A test1 -p 17 --dport 47440 -j ACCEPT
iptables -A INPUT -p 6 --dport 14289 --sport 6999 -s 114.245.0.0/16 -j DROP
iptables -A test3 -p 201 -j DROP
iptables -A test3 -p 6 --sport 4786 -j DROP
iptables -A test1 -s 6.249.110.137 -j DROP
iptables -A test3 -p 17 --dport 61848 -j DROP
iptables -A test3 -p 6 --sport 7625 --dport 24845 -s 25.91.0.0/16 -j DROP
iptables -A test2 -p 17 --sport 38940 -s 209.39.202.16 -j ACCEPT
iptables -A test2 -p 17 --sport 28682 -d 168.11.200.45 -j ACCEPT
iptables -A test1 -p 6 --sport 44395 -d 15.0.0.0/8 -j DROP
iptables -A FORWARD -s 235.22.111.214 -j ACCEPT
iptables -A OUTPUT -p 6 -s 119.0.0.0/8 --sport 46628 -j ACCEPT
iptables -A test2 -p 6 -d 204.231.63.99 -s 242.68.0.0/16 --dport 64613 -j DROP
iptables -A INPUT -p 6 --dport 17952 --sport 44306 -j ACCEPT
iptables -A test1 -p 6 --dport 65375 -s 188.36.69.116 --sport 21848 -j ACCEPT
iptables -A INPUT -s 51.73.150.0/24 -j ACCEPT
iptables -A test3 -p 6 --sport 1619 --dport 38915 -s 230.131.194.234 -j DROP
iptables -A OUTPUT -p 6 --sport 7190 -j ACCEPT
iptables -A test1 -s 1.52.127.0/24 -j ACCEPT
iptables -A test2 -p 6 --sport 9350 -d 56.0.0.0/8 -s 149.128.0.0/16 --dport 7704 -j DROP
iptables -A test3 -p 17 --dport 679 -j DROP
iptables -A test2 -p 6 --sport 40871 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 27527 -j DROP
iptables -A test3 -p 17 -s 69.72.0.0/16 -d 242.0.0.0/8 --dport 64432 --sport 5397 -j DROP
iptables -A OUTPUT -p 6 -d 144.0.207.0/24 --dport 12103 -j DROP
iptables -A FORWARD -p 6 --sport 54221 -j ACCEPT
iptables -A test2 -p 17 --sport 9533 -j DROP
iptables -A test2 -p 6 --dport 32510 --sport 24483 -j DROP
iptables -A OUTPUT -p 6 -d 44.225.214.0/24 --sport 63611 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 15294 -d 43.11.228.0/24 -j ACCEPT
iptables -A test3 -p 6 -s 221.224.145.190 --dport 41694 --sport 20611 -j DROP
iptables -A test1 -p 67 -d 64.113.221.51 -j DROP
iptables -A test1 -p 6 -d 57.209.221.0/24 --dport 22668 --sport 65120 -j ACCEPT
iptables -A FORWARD -p 6 --dport 19041 -d 75.241.226.52 -s 253.246.27.237 -j DROP
iptables -A test3 -p 17 -s 145.194.33.227 --dport 1965 -j ACCEPT
iptables -A test1 -p 17 --sport 19049 -s 177.12.64.8 -d 144.211.181.151 -j DROP
iptables -A FORWARD -p 17 -d 120.186.236.162 --dport 26455 -j DROP
iptables -A test3 -p 6 --dport 5976 -s 3.241.164.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --sport 19474 -j DROP
iptables -A INPUT -p 6 --dport 63122 -d 8.85.56.0/24 -s 26.201.63.232 -j DROP
iptables -A test2 -s 45.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 -s 168.85.220.219 --sport 46848 --dport 46756 -j DROP
iptables -A test2 -p 17 -s 83.77.0.0/16 -d 220.132.71.226 --sport 41626 -j DROP
iptables -A test1 -p 6 --dport 30865 --sport 15322 -j DROP
iptables -A OUTPUT -p 6 --dport 17707 --sport 15379 -j ACCEPT
iptables -A test1 -p 17 --sport 20129 -j DROP
iptables -A INPUT -p 6 --dport 54078 -d 164.113.0.0/16 -s 18.23.92.60 -j DROP
iptables -A FORWARD -d 244.135.203.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --sport 22625 -s 167.156.59.0/24 -j DROP
iptables -A test2 -p 17 --sport 53827 -d 28.249.25.0/24 -j DROP
iptables -A test1 -p 6 -s 5.0.0.0/8 --dport 56569 --sport 38591 -j ACCEPT
iptables -A FORWARD -p 17 --dport 45923 -s 206.0.0.0/8 --sport 9610 -j ACCEPT
iptables -A test3 -p 6 --dport 57932 -j ACCEPT
iptables -A test3 -s 217.178.17.253 -j ACCEPT
iptables -A INPUT -p 6 -d 167.118.161.0/24 --dport 13923 -j ACCEPT
iptables -A test1 -p 6 -s 222.26.183.0/24 --sport 10219 -d 112.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -d 76.89.99.0/24 --sport 20656 -s 174.243.137.0/24 -j DROP
iptables -A test1 -p 6 -s 182.10.174.0/24 -d 13.225.115.163 --sport 37876 -j ACCEPT
iptables -A FORWARD -p 17 --dport 1328 -j ACCEPT
iptables -A test2 -p 17 --dport 9906 -s 206.0.0.0/8 -d 115.106.63.33 -j DROP
iptables -A test2 -p 17 -d 40.211.0.0/16 --dport 6852 -s 248.95.121.113 -j ACCEPT
iptables -A INPUT -p 17 -d 234.78.50.155 --sport 33554 -j ACCEPT
iptables -A FORWARD -d 20.19.226.0/24 -s 76.253.0.0/16 -p 41 -j ACCEPT
iptables -A INPUT -p 31 -j DROP
iptables -A INPUT -p 6 -d 209.56.136.129 --sport 60177 -s 182.56.167.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --dport 14407 -j ACCEPT
iptables -A test1 -p 17 -s 92.128.157.201 --sport 33443 -d 10.134.114.231 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 2750 --dport 33792 -j ACCEPT
iptables -A test1 -p 6 --dport 40028 -j DROP
iptables -A OUTPUT -p 17 --sport 33402 -d 189.115.178.133 -s 119.36.17.143 -j ACCEPT
iptables -A test2 -p 17 --dport 52343 -d 39.0.0.0/8 -j DROP
iptables -A test3 -p 17 -s 42.65.146.253 --dport 47834 -j ACCEPT
iptables -A INPUT -p 17 -s 86.0.0.0/8 --sport 28233 -j DROP
iptables -A FORWARD -p 6 -s 199.211.86.0/24 -d 51.70.92.163 --dport 14117 -j DROP
iptables -A FORWARD -p 17 --dport 26851 -d 94.0.0.0/8 --sport 64048 -j DROP
iptables -A OUTPUT -p 17 --dport 53678 -j DROP
iptables -A test1 -p 17 --sport 14601 -s 211.170.221.252 -d 87.183.1.0/24 -j DROP
iptables -A test3 -p 6 --dport 28328 -s 137.82.83.248 --sport 13226 -j ACCEPT
iptables -A FORWARD -p 6 --dport 54870 --sport 26497 -j ACCEPT
iptables -A INPUT -d 99.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 62561 -s 191.234.0.0/16 -j test1
iptables -A test1 -s 155.23.61.12 -j ACCEPT
iptables -A test1 -p 17 --dport 55892 -s 251.170.240.0/24 -j DROP
iptables -A test1 -p 6 --dport 56890 -j ACCEPT
iptables -A test2 -p 17 -s 2.0.101.144 -d 135.67.24.164 --sport 38167 -j ACCEPT
iptables -A test2 -p 6 -s 175.250.194.0/24 --sport 52232 -j DROP
iptables -A test3 -p 184 -j DROP
iptables -A test1 -p 6 --dport 43693 -j ACCEPT
iptables -A test3 -p 17 -d 117.43.88.128 --sport 45861 --dport 42997 -j DROP
iptables -A test3 -d 111.176.134.68 -s 39.197.228.0/24 -j DROP
iptables -A test1 -d 244.202.136.200 -p 121 -s 100.197.221.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --dport 33936 -j ACCEPT
iptables -A test1 -p 17 -s 97.57.232.209 --dport 63035 --sport 13826 -j DROP
iptables -A test2 -p 6 --sport 34692 -j ACCEPT
iptables -A OUTPUT -p 17 -d 31.237.153.149 --sport 33057 --dport 46127 -j test1
iptables -A test1 -s 30.26.179.253 -j ACCEPT
iptables -A test1 -p 6 --dport 741 --sport 7717 -j DROP
iptables -A INPUT -s 204.23.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 53631 --sport 6876 -j DROP
iptables -A FORWARD -d 41.172.109.89 -j ACCEPT
iptables -A INPUT -p 42 -j DROP
iptables -A INPUT -d 18.0.0.0/8 -s 202.16.121.0/24 -p 163 -j ACCEPT
iptables -A INPUT -p 17 --dport 62309 --sport 44485 -j ACCEPT
iptables -A FORWARD -p 6 --dport 31675 --sport 48613 -d 234.21.6.25 -j DROP
iptables -A OUTPUT -p 6 --dport 15290 -s 143.67.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --sport 3140 -d 121.0.0.0/8 --dport 13601 -j DROP
iptables -A INPUT -p 17 -s 31.202.177.42 -d 205.73.0.0/16 --dport 52405 -j DROP
iptables -A test3 -p 17 -s 152.107.235.239 -d 138.0.0.0/8 --sport 33861 -j ACCEPT
iptables -A test1 -p 128 -j ACCEPT
iptables -A FORWARD -s 15.79.228.133 -j test2
iptables -A INPUT -s 184.48.1.253 -j ACCEPT
iptables -A FORWARD -d 90.252.180.145 -s 22.154.227.108 -j ACCEPT
iptables -A test3 -p 17 --sport 44371 --dport 1760 -s 63.15.140.162 -j ACCEPT
iptables -A OUTPUT -d 81.193.53.130 -p 195 -j DROP
iptables -A test1 -p 17 -s 177.90.81.69 --dport 5103 -d 5.132.226.116 -j ACCEPT
iptables -A test3 -p 6 --sport 18069 --dport 37941 -d 149.0.0.0/8 -s 163.216.250.1 -j ACCEPT
iptables -A test3 -p 6 -s 132.11.0.0/16 -d 90.132.198.30 --dport 8078 -j ACCEPT
iptables -A INPUT -d 232.243.89.81 -j ACCEPT
iptables -A test3 -p 6 -s 196.77.138.0/24 --sport 25886 --dport 55947 -j ACCEPT
iptables -A test2 -p 17 --dport 43783 -s 112.131.34.127 -j ACCEPT
iptables -A FORWARD -s 156.243.95.54 -p 110 -d 42.218.153.19 -j ACCEPT
iptables -A test2 -p 17 --sport 40563 -j DROP
iptables -A INPUT -p 6 -d 75.155.191.75 --sport 14500 --dport 29899 -s 182.0.0.0/8 -j DROP
iptables -A test2 -p 75 -j DROP
iptables -A test2 -s 142.121.143.168 -p 58 -j DROP
iptables -A test2 -p 6 --sport 2401 -d 7.81.99.43 -s 56.58.126.189 --dport 11789 -j ACCEPT
iptables -A FORWARD -p 6 --sport 35613 -j test3
iptables -A INPUT -p 6 -d 156.167.191.225 --dport 52997 -j DROP
iptables -A FORWARD -p 6 --sport 43540 -s 194.4.0.0/16 --dport 65155 -d 110.124.68.182 -j ACCEPT
iptables -A test3 -p 17 --dport 9719 -d 137.119.69.0/24 -j DROP
iptables -A test1 -d 196.50.81.217 -j ACCEPT
iptables -A test1 -p 17 --dport 16983 -j ACCEPT
iptables -A test1 -p 17 --dport 53689 -d 83.178.0.0/16 --sport 2131 -j DROP
iptables -A INPUT -p 17 --dport 59727 -d 94.64.44.0/24 --sport 7318 -j ACCEPT
iptables -A INPUT -p 76 -d 9.3.2.0/24 -s 5.147.170.60 -j ACCEPT
iptables -A INPUT -p 17 --dport 59858 -s 180.9.141.95 -d 121.112.183.236 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 54041 -j ACCEPT
iptables -A INPUT -p 17 --dport 62275 -j ACCEPT
iptables -A OUTPUT -d 42.99.215.112 -p 65 -j ACCEPT
iptables -A test3 -p 6 --sport 2357 --dport 65316 -s 193.97.86.155 -j DROP
iptables -A test2 -p 230 -j ACCEPT
iptables -A test3 -p 6 --dport 3536 -j DROP
iptables -A OUTPUT -p 6 --sport 19337 --dport 18702 -d 32.33.27.187 -j ACCEPT
iptables -A INPUT -d 102.164.187.95 -s 119.184.132.8 -j ACCEPT
iptables -A INPUT -p 163 -d 209.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --dport 5887 -d 149.5.215.224 --sport 54690 -j DROP
iptables -A test3 -p 6 --sport 32444 --dport 59089 -j DROP
iptables -A test3 -p 6 --sport 17216 -s 202.0.0.0/8 -d 206.147.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 -s 204.88.119.91 --sport 64030 -d 91.90.120.42 -j DROP
iptables -A test3 -p 6 --sport 3894 -j DROP
iptables -A FORWARD -p 17 --dport 62921 -s 145.88.226.207 -j DROP
iptables -A test2 -p 6 --sport 27130 -s 30.148.126.185 -j ACCEPT
iptables -A test3 -s 35.30.237.0/24 -j ACCEPT
iptables -A test2 -p 17 -d 177.246.193.13 --sport 60064 -s 85.155.3.52 -j ACCEPT
iptables -A INPUT -p 195 -j DROP
iptables -A test2 -p 192 -j ACCEPT
iptables -A test2 -d 202.125.40.212 -s 47.169.77.0/24 -p 189 -j ACCEPT
iptables -A test2 -p 17 --dport 17862 -j ACCEPT
iptables -A OUTPUT -p 17 -s 134.139.107.208 -d 10.234.249.174 --dport 54979 -j DROP
iptables -A INPUT -p 6 --dport 9922 -j DROP
iptables -A INPUT -p 17 --sport 33655 -d 57.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -s 56.0.0.0/8 --sport 33061 --dport 22943 -j ACCEPT
iptables -A test1 -p 17 -d 74.252.227.180 --dport 2546 -s 90.49.116.0/24 -j DROP
iptables -A test3 -d 70.75.18.106 -s 246.39.0.0/16 -j DROP
iptables -A test2 -p 6 --dport 62489 -s 140.176.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --sport 2075 -j DROP
iptables -A test2 -p 6 --dport 59442 -s 217.211.41.0/24 -j DROP
iptables -A test2 -p 17 --dport 47869 -j ACCEPT
iptables -A INPUT -p 223 -j DROP
iptables -A FORWARD -p 17 --dport 450 -s 180.0.0.0/8 -d 206.69.161.80 -j ACCEPT
iptables -A test3 -p 6 --sport 15759 -s 180.179.0.0/16 -j DROP
iptables -A test3 -p 17 --sport 28325 -d 103.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -d 136.43.0.0/16 --dport 35750 -j DROP
iptables -A test1 -p 6 --dport 10137 --sport 3253 -s 76.248.214.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 11537 -d 207.220.88.0/24 -s 21.156.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --dport 60781 -j ACCEPT
iptables -A test2 -p 6 -s 188.193.172.65 -d 243.24.0.0/16 --dport 55453 --sport 42308 -j DROP
iptables -A INPUT -p 196 -s 217.111.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -d 57.209.8.51 -s 254.202.105.0/24 --dport 52431 -j DROP
iptables -A test3 -p 6 --sport 38375 -s 37.220.53.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 7167 -d 142.0.0.0/8 -s 22.162.2.15 -j DROP
iptables -A test3 -d 147.180.0.0/16 -j DROP
iptables -A test3 -p 17 -s 204.81.91.184 --sport 48112 --dport 32591 -j DROP
iptables -A test1 -d 75.24.246.216 -p 136 -j DROP
iptables -A test3 -p 6 -d 171.147.15.189 --dport 52846 -j DROP
iptables -A INPUT -p 6 -s 43.224.186.98 -d 74.2.141.71 --sport 37565 -j DROP
iptables -A INPUT -d 169.158.40.0/24 -j DROP
iptables -A test2 -s 101.181.136.116 -p 154 -d 106.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --sport 43984 --dport 3608 -j DROP
iptables -A test1 -p 6 --sport 10284 -s 194.77.107.17 -j DROP
iptables -A test1 -p 17 --sport 10706 -s 214.49.36.0/24 --dport 54794 -j DROP
iptables -A test3 -p 17 --sport 16205 -s 115.139.68.230 --dport 1032 -d 229.93.103.232 -j DROP
iptables -A OUTPUT -p 17 -d 192.145.135.35 -s 190.100.90.162 --sport 55283 -j DROP
iptables -A test3 -p 17 --sport 31554 -j DROP
iptables -A test2 -p 64 -j ACCEPT
iptables -A test1 -p 6 -d 217.124.64.84 --dport 56025 -s 11.249.86.97 -j DROP
iptables -A INPUT -p 6 -d 163.193.102.104 --dport 50827 --sport 17307 -j DROP
iptables -A INPUT -p 17 --dport 43234 --sport 33525 -j DROP
iptables -A test2 -p 6 --dport 15022 -d 124.254.0.0/16 -j DROP
iptables -A test3 -s 224.138.198.251 -j ACCEPT
iptables -A test1 -p 6 -s 120.178.215.0/24 --dport 20021 --sport 11023 -j ACCEPT
iptables -A test2 -p 6 -d 239.58.155.233 --dport 60771 -j ACCEPT
iptables -A test2 -p 17 --dport 27275 -s 237.181.184.33 --sport 60587 -j ACCEPT
iptables -A test2 -p 6 --dport 26361 --sport 49768 -j ACCEPT
iptables -A test1 -p 6 -s 108.0.0.0/8 --dport 44166 -d 97.136.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 33775 -j ACCEPT
iptables -A test1 -p 82 -d 244.231.160.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 38887 -s 232.29.193.140 --dport 47166 -d 138.163.131.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 55675 -s 4.4.187.52 -d 156.71.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 56639 -j DROP
iptables -A OUTPUT -p 17 --dport 5325 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 28073 -j DROP
iptables -A OUTPUT -s 112.0.0.0/8 -j ACCEPT
iptables -A test1 -d 55.130.0.0/16 -p 218 -j ACCEPT
iptables -A test3 -s 244.50.135.21 -j ACCEPT
iptables -A test2 -p 6 --dport 57704 -d 192.102.241.125 -s 37.194.147.159 -j ACCEPT
iptables -A INPUT -p 6 -d 171.20.221.197 --dport 21340 -j DROP
iptables -A test3 -d 109.227.85.100 -j ACCEPT
iptables -A test3 -p 6 --sport 10953 -d 158.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 23816 -s 245.239.165.153 --sport 61268 -d 55.0.0.0/8 -j DROP
iptables -A test1 -p 17 -d 81.24.40.250 -s 30.165.126.0/24 --dport 41168 -j ACCEPT
iptables -A INPUT -p 6 --dport 5893 -j DROP
iptables -A FORWARD -p 6 -s 180.242.88.41 --sport 61633 -j ACCEPT
iptables -A test2 -d 61.58.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 46922 -s 44.0.0.0/8 -d 124.153.151.90 -j DROP
iptables -A INPUT -d 163.0.0.0/8 -j DROP
iptables -A test2 -p 6 -d 195.174.228.0/24 -s 214.225.0.0/16 --sport 53954 -j ACCEPT
iptables -A INPUT -p 6 --sport 4603 -s 69.224.205.137 -d 105.0.0.0/8 -j DROP
iptables -A OUTPUT -d 234.44.0.0/16 -j DROP
iptables -A test1 -s 115.215.189.0/24 -p 226 -j ACCEPT
iptables -A OUTPUT -p 34 -j DROP
iptables -A test3 -p 6 -d 80.58.226.56 --sport 49347 --dport 14019 -j ACCEPT
iptables -A INPUT -p 6 --dport 59432 -j ACCEPT
iptables -A test2 -p 6 --dport 14950 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 24198 -d 69.165.81.82 -s 17.233.28.206 -j DROP
iptables -A INPUT -p 6 --dport 31781 -j ACCEPT
iptables -A test1 -p 6 --sport 64754 --dport 16382 -s 115.134.50.0/24 -j DROP
iptables -A test3 -p 17 -s 23.105.142.108 --sport 28962 -d 156.31.238.6 -j DROP
iptables -A OUTPUT -p 6 --sport 3394 -j DROP
iptables -A OUTPUT -p 6 --dport 25864 -d 31.44.146.224 --sport 18594 -s 35.173.48.170 -j ACCEPT
iptables -A test2 -s 235.195.170.0/24 -j DROP
iptables -A OUTPUT -p 156 -d 44.94.0.0/16 -j ACCEPT
iptables -A test3 -p 17 -s 75.188.52.70 --dport 49376 -d 4.44.86.148 -j ACCEPT
iptables -A OUTPUT -p 6 -s 122.94.46.0/24 -d 33.0.0.0/8 --sport 24929 -j ACCEPT
iptables -A test1 -p 6 -d 51.37.0.0/16 --dport 28765 -j DROP
iptables -A INPUT -p 17 --sport 42588 -j DROP
iptables -A test3 -p 6 -s 191.247.230.0/24 -d 116.245.0.87 --dport 60208 -j ACCEPT
iptables -A FORWARD -p 17 --dport 34840 -s 180.120.202.218 -j DROP
iptables -A test2 -p 17 --sport 52000 --dport 61268 -d 235.34.232.96 -j ACCEPT
iptables -A test3 -p 6 --sport 60423 -j DROP
iptables -A OUTPUT -d 204.0.0.0/8 -p 247 -j ACCEPT
iptables -A INPUT -p 6 --sport 35649 -s 63.86.0.0/16 --dport 42064 -j DROP
iptables -A INPUT -s 89.184.0.0/16 -j ACCEPT
iptables -A INPUT -p 160 -j DROP
iptables -A OUTPUT -p 6 --dport 52369 -d 83.211.165.227 --sport 52346 -s 51.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 57385 -s 142.93.13.215 -d 199.5.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --sport 8602 -j ACCEPT
iptables -A test3 -d 5.113.63.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -s 253.129.230.0/24 --dport 21456 -j DROP
iptables -A test2 -p 17 --sport 59235 -d 157.228.96.106 -j ACCEPT
iptables -A test3 -p 82 -s 32.35.36.214 -j ACCEPT
iptables -A INPUT -p 17 --sport 4850 -d 45.18.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -s 182.18.194.196 --sport 35366 -d 229.25.107.244 -j DROP
iptables -A FORWARD -p 17 -s 64.126.93.0/24 -d 196.141.174.39 --dport 49458 -j ACCEPT
iptables -A test1 -s 33.137.189.62 -d 112.220.8.203 -j DROP
iptables -A FORWARD -p 6 --dport 64851 --sport 54915 -j DROP
iptables -A test1 -s 117.12.0.0/16 -j DROP
iptables -A test3 -p 17 --sport 33840 -j DROP
iptables -A FORWARD -d 82.122.245.104 -p 232 -j DROP
iptables -A test1 -p 17 --sport 44887 -d 162.246.209.0/24 -s 106.39.109.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 43292 -j DROP
iptables -A FORWARD -p 17 -s 254.165.167.188 --sport 22465 --dport 18160 -j DROP
iptables -A FORWARD -p 6 --sport 11481 -j ACCEPT
iptables -A test3 -s 83.239.75.237 -j DROP
iptables -A test3 -p 6 --sport 58391 -d 114.20.127.69 -j ACCEPT
iptables -A INPUT -p 17 --sport 31018 -s 105.76.147.0/24 -d 65.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -s 172.0.0.0/8 --sport 52304 --dport 37363 -j ACCEPT
iptables -A OUTPUT -p 6 -s 188.0.0.0/8 --dport 4830 -j DROP
iptables -A test2 -p 17 -d 58.144.9.237 --sport 41362 -j ACCEPT
iptables -A INPUT -p 17 --sport 10201 -j DROP
iptables -A INPUT -p 17 -s 88.0.0.0/8 --sport 31741 -j ACCEPT
iptables -A FORWARD -p 17 --sport 36436 -d 46.168.98.0 -j ACCEPT
iptables -A test3 -p 6 --dport 19223 --sport 20889 -s 207.2.39.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 43539 -j DROP
iptables -A test1 -d 140.0.0.0/8 -j DROP
iptables -A test1 -d 41.225.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --dport 54366 -j ACCEPT
iptables -A test1 -p 6 --sport 40138 -j ACCEPT
iptables -A test1 -p 17 -d 29.148.73.209 --sport 40025 --dport 6486 -j ACCEPT
iptables -A test1 -d 184.0.0.0/8 -p 0 -s 14.127.24.80 -j DROP
iptables -A test1 -p 6 --dport 871 -s 135.179.0.0/16 --sport 53037 -j DROP
iptables -A OUTPUT -p 6 -d 30.54.73.84 -s 27.39.0.0/16 --sport 27522 --dport 14941 -j DROP
iptables -A OUTPUT -p 6 --sport 62537 -j DROP
iptables -A OUTPUT -p 17 --dport 35291 -j DROP
iptables -A FORWARD -p 6 --dport 18051 -s 92.231.167.148 -d 155.0.0.0/8 -j test3
iptables -A test3 -p 17 -s 36.51.62.218 --dport 29792 -j DROP
iptables -A FORWARD -p 17 --dport 31903 -d 165.146.66.105 -s 203.49.176.219 -j DROP
iptables -A FORWARD -p 6 --dport 4378 -j ACCEPT
iptables -A test1 -p 6 -d 143.0.0.0/8 --dport 7908 -j DROP
iptables -A INPUT -p 6 --dport 22945 -d 201.202.43.99 -j ACCEPT
iptables -A test3 -p 17 --dport 35698 --sport 20875 -d 184.159.145.195 -j ACCEPT
iptables -A OUTPUT -s 131.0.0.0/8 -j DROP
iptables -A FORWARD -p 29 -j ACCEPT
iptables -A test1 -p 30 -s 46.221.87.129 -j ACCEPT
iptables -A test2 -p 6 -d 152.30.18.0/24 --sport 64921 -j DROP
iptables -A OUTPUT -p 17 -d 189.113.101.46 --sport 64192 -j test3
iptables -A test3 -p 17 --dport 31316 -j DROP
iptables -A INPUT -s 100.103.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 -d 2.92.19.187 -s 83.163.248.0/24 --sport 62048 -j DROP
iptables -A INPUT -p 6 --sport 27023 -s 233.32.0.0/16 -j DROP
iptables -A test2 -p 17 -d 176.140.0.0/16 --sport 35896 -j ACCEPT
iptables -A FORWARD -p 6 --sport 45930 -d 87.62.169.222 --dport 42328 -s 85.247.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --dport 21436 --sport 59028 -j ACCEPT
iptables -A test1 -d 70.250.10.183 -p 19 -j DROP
iptables -A INPUT -s 33.0.0.0/8 -j DROP
iptables -A INPUT -d 94.181.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --sport 62786 --dport 18360 -j ACCEPT
iptables -A OUTPUT -d 82.229.136.141 -j ACCEPT
iptables -A test1 -p 17 --sport 31387 -s 115.96.101.56 -d 199.0.0.0/8 -j ACCEPT
iptables -A INPUT -s 15.79.70.150 -d 4.63.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --dport 63618 --sport 29742 -j ACCEPT
iptables -A INPUT -p 17 --dport 45734 -j DROP
iptables -A OUTPUT -p 6 --sport 27308 -j ACCEPT
iptables -A INPUT -p 6 -s 48.95.0.0/16 --sport 6104 -d 184.249.0.0/16 -j DROP
iptables -A test3 -p 6 --sport 63758 -d 119.136.223.198 -j DROP
iptables -A test3 -d 140.52.81.156 -j DROP
iptables -A test2 -d 114.50.168.234 -j DROP
iptables -A test3 -p 69 -d 74.195.217.0/24 -j ACCEPT
iptables -A test3 -s 52.205.55.30 -d 4.174.200.0/24 -j DROP
iptables -A test3 -p 6 --dport 49668 -s 247.131.242.222 -j ACCEPT
iptables -A FORWARD -p 142 -d 18.88.71.201 -j ACCEPT
iptables -A FORWARD -p 17 --dport 52826 -j ACCEPT
iptables -A test1 -d 231.29.58.132 -s 10.206.62.208 -p 154 -j ACCEPT
iptables -A test3 -p 17 --dport 4251 -j DROP
iptables -A INPUT -p 17 --dport 30981 -d 188.0.0.0/8 -s 216.133.119.252 -j DROP
iptables -A test1 -p 6 --dport 60462 -j ACCEPT
iptables -A OUTPUT -s 205.48.230.12 -j ACCEPT
iptables -A test3 -p 139 -j DROP
iptables -A test2 -p 6 -d 235.68.8.184 --dport 29561 --sport 20566 -s 90.226.225.0/24 -j DROP
iptables -A INPUT -p 17 -d 181.0.31.228 --sport 26735 --dport 21222 -j ACCEPT
iptables -A OUTPUT -p 178 -j DROP
iptables -A test2 -p 6 --dport 46098 --sport 44455 -j DROP
iptables -A INPUT -p 6 -s 153.141.190.133 --sport 46953 --dport 48574 -j DROP
iptables -A INPUT -p 17 --dport 3971 -s 222.58.17.185 -j ACCEPT
iptables -A INPUT -p 17 --sport 62001 --dport 15408 -s 130.71.209.19 -d 206.88.0.0/16 -j test1
iptables -A test3 -p 6 -s 39.219.0.0/16 --sport 13310 --dport 44412 -j ACCEPT
iptables -A test3 -p 17 -s 26.182.242.194 -d 109.125.0.0/16 --sport 12476 -j DROP
iptables -A FORWARD -p 6 --dport 12564 -d 107.241.191.0/24 -s 48.133.101.54 -j test1
iptables -A INPUT -p 6 -d 203.163.132.0/24 --sport 26208 -s 76.154.24.218 -j ACCEPT
iptables -A test3 -d 224.230.139.181 -s 221.164.241.244 -j ACCEPT
iptables -A FORWARD -s 237.229.103.120 -j DROP
iptables -A OUTPUT -p 17 --dport 41583 --sport 36789 -s 233.10.206.97 -d 151.144.67.224 -j DROP
iptables -A FORWARD -p 17 --sport 56499 -j ACCEPT
iptables -A OUTPUT -p 6 -s 151.159.249.0/24 --dport 15467 -d 172.77.0.0/16 -j DROP
iptables -A test2 -s 55.40.117.3 -d 21.144.37.141 -j ACCEPT
iptables -A test1 -p 6 --sport 40457 -s 82.86.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --dport 17809 -d 168.146.46.145 -s 76.83.28.30 --sport 40153 -j DROP
iptables -A test2 -p 17 --sport 44810 -s 231.0.0.0/8 -j DROP
iptables -A OUTPUT -p 78 -j DROP
iptables -A INPUT -p 6 --sport 28077 -j DROP
iptables -A test3 -p 17 --dport 5256 -d 41.226.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 -d 158.215.16.205 --dport 34845 --sport 60937 -j DROP
iptables -A test2 -p 17 -d 69.0.0.0/8 --dport 53143 --sport 1347 -j DROP
iptables -A test3 -p 6 --dport 62219 --sport 34337 -j DROP
iptables -A test1 -p 6 --sport 7973 -j ACCEPT
iptables -A test3 -p 85 -s 125.241.240.143 -d 102.161.0.0/16 -j DROP
iptables -A OUTPUT -p 54 -j ACCEPT
iptables -A INPUT -p 17 -s 67.24.64.76 -d 207.214.81.229 --dport 63000 --sport 61198 -j DROP
iptables -A FORWARD -p 131 -j ACCEPT
iptables -A test2 -p 6 --dport 9899 --sport 56897 -s 41.135.108.145 -j ACCEPT
iptables -A INPUT -p 17 --sport 14578 -j ACCEPT
iptables -A test1 -p 6 -s 158.0.0.0/8 --dport 27092 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 6433 -d 114.136.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 -s 217.165.236.153 --dport 12221 --sport 53265 -j DROP
iptables -A OUTPUT -s 17.90.196.172 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 396 -j ACCEPT
iptables -A test1 -p 6 --sport 41002 -d 10.14.163.208 -j DROP
iptables -A INPUT -p 6 -s 24.58.35.5 --sport 61089 --dport 43897 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 58075 -d 128.161.133.120 -s 96.165.104.115 -j ACCEPT
iptables -A test3 -d 44.91.108.120 -p 38 -j ACCEPT
iptables -A FORWARD -p 6 -d 108.13.5.231 --sport 61637 -s 94.0.0.0/8 -j DROP
iptables -A test1 -p 6 --sport 31375 --dport 2345 -j ACCEPT
iptables -A test3 -s 204.10.91.95 -j ACCEPT
iptables -A FORWARD -d 86.78.110.0/24 -j DROP
iptables -A FORWARD -s 92.251.147.0/24 -j ACCEPT
iptables -A INPUT -s 25.182.134.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --dport 47737 --sport 61189 -s 88.201.241.170 -d 112.205.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --dport 56285 -s 103.101.220.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 -d 77.95.222.0/24 --sport 36524 -j DROP
iptables -A FORWARD -p 6 --dport 64008 -d 42.234.140.23 -j DROP
iptables -A test2 -s 229.106.26.0/24 -j DROP
iptables -A FORWARD -s 130.0.0.0/8 -p 166 -j DROP
iptables -A FORWARD -p 17 --sport 1048 --dport 59845 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 57197 -d 243.6.187.0/24 --sport 44134 -j ACCEPT
iptables -A test2 -p 218 -j DROP
iptables -A test3 -p 6 --dport 9042 --sport 5542 -j DROP
iptables -A INPUT -p 17 --dport 59744 -s 214.216.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --sport 27861 -j DROP
iptables -A test3 -p 6 --dport 8363 -d 250.248.252.4 -s 208.121.182.0/24 -j DROP
iptables -A test3 -p 144 -s 98.54.34.70 -j DROP
iptables -A INPUT -p 8 -d 179.107.73.110 -j DROP
iptables -A FORWARD -s 245.0.0.0/8 -d 227.8.160.220 -j test3
iptables -A INPUT -p 6 -d 157.0.0.0/8 --sport 21399 -j DROP
iptables -A FORWARD -p 6 -s 164.202.177.182 --sport 14587 -d 174.249.202.228 -j DROP
iptables -A test1 -p 6 --dport 53020 --sport 21802 -s 9.242.62.215 -j DROP
iptables -A test1 -p 6 --dport 37371 -j DROP
iptables -A test2 -p 6 --dport 38038 -d 164.48.27.139 -j ACCEPT
iptables -A FORWARD -s 68.25.62.220 -j ACCEPT
iptables -A test3 -p 6 --dport 99 -s 151.223.90.223 -j DROP
iptables -A OUTPUT -p 17 --dport 49455 -j ACCEPT
iptables -A test2 -p 17 -d 34.130.216.254 -s 185.160.122.210 --dport 62914 --sport 5544 -j ACCEPT
iptables -A INPUT -s 121.105.222.158 -d 234.202.234.66 -j ACCEPT
iptables -A OUTPUT -p 17 -s 229.128.96.167 -d 82.174.2.0/24 --dport 45946 -j DROP
iptables -A OUTPUT -d 241.205.11.212 -j ACCEPT
iptables -A INPUT -p 17 --dport 50582 --sport 8761 -d 101.121.0.0/16 -j DROP
iptables -A test1 -p 6 -s 189.92.207.28 --sport 33991 -j ACCEPT
iptables -A test2 -p 6 --dport 55216 --sport 6747 -j ACCEPT
iptables -A test3 -s 248.0.0.0/8 -j DROP
iptables -A test3 -s 168.219.246.76 -j DROP
iptables -A test2 -p 17 --sport 40738 -j DROP
iptables -A OUTPUT -p 17 -s 248.78.0.0/16 --dport 61030 -j ACCEPT
iptables -A test2 -p 47 -j DROP
iptables -A OUTPUT -p 17 --dport 20551 -s 83.176.212.128 -d 195.17.152.165 -j ACCEPT
iptables -A test3 -p 17 -s 72.109.152.0/24 --dport 27592 --sport 13114 -j ACCEPT
iptables -A OUTPUT -s 88.207.0.0/16 -d 205.85.84.0/24 -j test2
iptables -A INPUT -p 6 -s 200.101.1.75 -d 155.129.36.0/24 --dport 41615 -j ACCEPT
iptables -A FORWARD -p 6 --sport 59816 -j DROP
iptables -A OUTPUT -s 124.17.0.0/16 -j DROP
iptables -A INPUT -p 6 --sport 38806 -j ACCEPT
iptables -A INPUT -d 244.0.0.0/8 -j test1
iptables -A test3 -p 6 -d 32.163.49.81 --dport 58993 -j DROP
iptables -A FORWARD -p 17 --sport 43827 -s 122.242.65.11 -j ACCEPT
iptables -A test3 -p 17 --sport 45906 -s 8.192.243.187 -j DROP
iptables -A INPUT -p 6 --dport 728 -j ACCEPT
iptables -A INPUT -p 6 --sport 48576 --dport 42748 -s 40.0.0.0/8 -j ACCEPT
iptables -A test2 -d 6.237.73.123 -j ACCEPT
iptables -A test3 -p 17 -d 0.151.0.0/16 -s 62.0.0.0/8 --dport 49108 -j DROP
iptables -A OUTPUT -p 6 -s 148.174.242.18 --sport 43020 -j ACCEPT
iptables -A INPUT -p 17 -d 247.12.0.0/16 -s 114.0.0.0/8 --sport 2060 -j DROP
iptables -A OUTPUT -p 17 --dport 19416 -j ACCEPT
iptables -A test3 -p 6 -s 190.28.60.0/24 --dport 49499 -d 226.215.176.174 -j ACCEPT
iptables -A test3 -p 93 -j DROP
iptables -A INPUT -p 17 --dport 12847 -j DROP
iptables -A test1 -p 6 -d 236.0.0.0/8 --sport 37042 -s 139.221.146.0/24 --dport 3525 -j DROP
iptables -A FORWARD -p 6 -s 156.131.0.0/16 --dport 43616 -d 76.208.161.0/24 -j ACCEPT
iptables -A test2 -p 6 --sport 27743 -j DROP
iptables -A test2 -p 17 -s 10.26.39.83 --sport 8174 -j DROP
iptables -A INPUT -p 17 --sport 981 -s 19.94.77.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 55934 -j DROP
iptables -A test1 -p 6 --sport 54275 --dport 17280 -s 242.134.45.4 -j ACCEPT
iptables -A test3 -p 6 -s 208.0.0.0/8 --sport 24364 -j ACCEPT
iptables -A INPUT -p 17 --dport 6606 -j DROP
iptables -A OUTPUT -p 17 --sport 57662 --dport 46758 -j DROP
iptables -A test3 -p 6 -s 77.223.0.0/16 --dport 3207 -j ACCEPT
iptables -A test3 -p 17 --dport 49500 -j DROP
iptables -A FORWARD -p 6 --sport 12089 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 39835 -j ACCEPT
iptables -A test2 -p 17 --dport 37411 --sport 46784 -s 67.37.135.134 -j DROP
iptables -A test1 -p 17 -d 172.248.97.203 --sport 17092 -s 69.98.7.0/24 --dport 35498 -j ACCEPT
iptables -A INPUT -p 17 --dport 65318 -d 250.0.0.0/8 -j DROP
iptables -A test2 -p 17 --sport 53890 -d 120.21.176.115 -s 146.108.178.238 -j DROP
iptables -A FORWARD -p 17 --dport 5840 -d 200.174.173.100 -j ACCEPT
iptables -A test2 -s 172.8.65.89 -j DROP
iptables -A test1 -d 121.213.24.6 -j ACCEPT
iptables -A FORWARD -p 6 --sport 7234 -j DROP
iptables -A test2 -s 223.61.212.123 -j DROP
iptables -A test2 -p 6 -s 244.131.154.252 --sport 56821 -j ACCEPT
iptables -A OUTPUT -p 6 -d 65.53.166.213 -s 115.99.146.26 --sport 24578 -j DROP
iptables -A test3 -p 17 --dport 46582 -s 62.147.178.184 -j ACCEPT
iptables -A test3 -p 17 --dport 28665 -d 210.61.0.0/16 --sport 43399 -j ACCEPT
iptables -A FORWARD -p 17 --sport 12675 -j DROP
iptables -A test2 -s 175.129.137.149 -j ACCEPT
iptables -A OUTPUT -p 6 -d 61.66.182.166 --sport 24531 -s 177.71.174.80 -j ACCEPT
iptables -A INPUT -p 17 --dport 26058 -s 113.236.231.0/24 -j DROP
iptables -A FORWARD -d 187.143.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --dport 3376 -j DROP
iptables -A test1 -p 17 -s 155.0.0.0/8 --sport 28485 --dport 34156 -j DROP
iptables -A test1 -p 6 --sport 3051 -s 72.0.0.0/8 -j DROP
iptables -A test1 -p 17 --sport 1694 -d 230.12.203.180 --dport 29277 -j DROP
iptables -A test3 -p 6 --dport 63963 -j ACCEPT
iptables -A test1 -d 130.234.216.147 -s 219.228.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --sport 40182 -d 95.4.204.69 -j ACCEPT
iptables -A test3 -p 17 --dport 34743 -s 139.121.45.48 -d 14.221.117.0/24 -j ACCEPT
iptables -A test2 -s 225.66.0.0/16 -d 230.0.0.0/8 -p 242 -j DROP
iptables -A OUTPUT -p 17 --sport 31196 --dport 10703 -j DROP
iptables -A test3 -p 6 --sport 6622 -s 38.223.206.234 --dport 18831 -d 249.207.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -d 247.129.108.13 --dport 50778 -s 127.201.22.0/24 -j DROP
iptables -A INPUT -p 17 -s 17.136.0.0/16 --dport 41015 -j DROP
iptables -A INPUT -s 232.74.0.0/16 -j DROP
iptables -A test1 -p 6 --dport 32491 -d 107.178.52.0/24 -j DROP
iptables -A test2 -p 6 --sport 38806 --dport 33511 -j ACCEPT
iptables -A INPUT -p 6 -s 56.204.85.76 --sport 42758 -d 10.94.54.0/24 -j DROP
iptables -A INPUT -p 6 --dport 50617 --sport 54123 -s 46.24.147.0/24 -j test1
iptables -A test3 -s 184.97.56.101 -j DROP
iptables -A test2 -d 238.32.52.56 -s 135.241.189.203 -p 252 -j DROP
iptables -A OUTPUT -p 6 --dport 19309 -j DROP
iptables -A test2 -p 6 --sport 36274 -j ACCEPT
iptables -A test3 -p 6 --dport 59401 --sport 5621 -d 210.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --sport 63094 --dport 30112 -s 81.34.168.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 5058 -s 4.0.0.0/8 -d 197.129.192.0/24 -j DROP
iptables -A INPUT -p 6 -s 84.5.80.101 --dport 10413 -d 212.210.237.217 -j DROP
iptables -A test1 -p 6 --dport 59748 -j DROP
iptables -A test2 -p 6 --dport 62410 -d 34.84.38.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 17981 -j ACCEPT
iptables -A FORWARD -d 242.89.72.75 -s 4.118.29.40 -j DROP
iptables -A INPUT -p 6 --dport 12982 -j ACCEPT
iptables -A FORWARD -s 173.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 55097 -j DROP
iptables -A test1 -p 17 --dport 60768 -j DROP
iptables -A FORWARD -s 252.54.167.69 -j ACCEPT
iptables -A test3 -p 6 -d 137.0.0.0/8 --sport 29674 --dport 14864 -s 184.170.0.0/16 -j DROP
iptables -A test1 -p 6 --dport 32755 -j ACCEPT
iptables -A test1 -d 141.156.147.129 -p 167 -s 254.60.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 61899 --sport 14431 -j ACCEPT
iptables -A test3 -p 6 -d 109.20.64.0/24 --sport 60460 -j DROP
iptables -A OUTPUT -p 17 -s 240.62.191.238 --dport 34317 -j DROP
iptables -A INPUT -p 17 -s 168.51.49.0/24 -d 197.10.8.40 --sport 50876 -j ACCEPT
iptables -A test2 -s 31.193.161.216 -j ACCEPT
iptables -A test2 -p 6 -d 43.0.0.0/8 -s 121.142.224.48 --sport 41985 -j DROP
iptables -A test2 -p 6 --dport 5989 -d 1.0.0.0/8 -s 122.42.252.0/24 -j DROP
iptables -A test3 -p 17 --sport 10686 -d 132.254.0.0/16 -j ACCEPT
iptables -A test1 -s 79.181.199.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 27466 --sport 8503 -d 253.41.82.192 -j DROP
iptables -A test1 -p 17 --dport 52292 -d 7.110.199.143 -s 20.0.0.0/8 -j ACCEPT
iptables -A test1 -p 37 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 58032 -j DROP
iptables -A OUTPUT -d 9.217.73.21 -s 147.23.0.0/16 -p 181 -j ACCEPT
iptables -A test1 -p 17 --dport 55501 -d 118.106.0.0/16 -j DROP
iptables -A test2 -p 17 -d 45.0.0.0/8 -s 188.0.0.0/8 --dport 29488 --sport 56836 -j DROP
iptables -A test3 -p 17 --dport 50135 --sport 46290 -j DROP
iptables -A test1 -p 17 -s 7.127.228.0/24 --sport 42081 --dport 6757 -j ACCEPT
iptables -A OUTPUT -p 10 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 16358 -d 64.21.14.196 --dport 33276 -j ACCEPT
iptables -A test2 -p 6 --dport 10499 -j DROP
iptables -A test2 -p 17 --sport 61214 -d 118.43.76.83 -j ACCEPT
iptables -A FORWARD -d 253.164.9.179 -j DROP
iptables -A test1 -p 216 -d 226.131.218.198 -j DROP
iptables -A test3 -p 17 --sport 8542 --dport 39651 -j ACCEPT
iptables -A test3 -p 6 -s 50.15.133.47 --sport 3526 -j ACCEPT
iptables -A test1 -p 17 -d 239.51.0.0/16 --dport 14269 -s 117.7.118.73 --sport 34039 -j DROP
iptables -A test3 -p 6 --sport 5253 -j ACCEPT
iptables -A INPUT -p 14 -s 237.183.0.0/16 -j ACCEPT
iptables -A test1 -p 12 -j DROP
iptables -A test2 -p 215 -j ACCEPT
iptables -A FORWARD -p 6 --dport 42300 -d 143.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 -d 154.155.203.7 --dport 55189 -j ACCEPT
iptables -A test2 -p 6 -d 89.121.0.0/16 --sport 59724 -j DROP
iptables -A test1 -p 6 --sport 51866 -j ACCEPT
iptables -A FORWARD -p 6 --sport 29511 -j DROP
iptables -A INPUT -p 6 --dport 64801 -j DROP
iptables -A FORWARD -p 6 --dport 19406 -s 35.0.0.0/8 --sport 54250 -j DROP
iptables -A test1 -p 6 -s 38.0.0.0/8 --sport 36584 --dport 12331 -j ACCEPT
iptables -A INPUT -p 17 --sport 774 --dport 7371 -d 143.253.91.160 -j ACCEPT
iptables -A test2 -p 17 --sport 19794 -s 44.173.39.191 -d 207.66.117.232 -j DROP
iptables -A test1 -p 17 --dport 38616 -j ACCEPT
iptables -A test2 -p 6 --dport 63073 --sport 60075 -s 83.175.3.153 -j ACCEPT
iptables -A FORWARD -p 6 --dport 47568 --sport 31636 -s 106.47.253.221 -j DROP
iptables -A OUTPUT -p 6 --sport 22027 --dport 47102 -s 223.226.89.203 -d 128.245.153.132 -j ACCEPT
iptables -A test2 -p 17 --dport 21448 -d 171.244.18.0/24 --sport 4908 -j DROP
iptables -A test3 -p 17 --sport 24264 -j ACCEPT
iptables -A test1 -p 17 --sport 15353 -j DROP
iptables -A OUTPUT -p 6 --dport 6691 -d 123.193.0.0/16 --sport 9268 -j DROP
iptables -A test3 -p 6 -s 21.0.0.0/8 --dport 3688 -j DROP
iptables -A test1 -p 17 -d 98.179.0.0/16 -s 34.140.170.0/24 --dport 53793 -j DROP
iptables -A INPUT -p 6 --sport 6444 --dport 37947 -j DROP
iptables -A test3 -p 17 --sport 39619 -s 188.237.155.185 -j ACCEPT
iptables -A test1 -p 17 --sport 24617 -s 183.130.98.48 -d 157.230.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --dport 54267 -d 210.44.7.0/24 -s 99.156.175.140 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 58212 -s 214.184.86.147 -d 92.158.151.114 -j DROP
iptables -A test2 -p 6 --dport 5466 -s 69.149.233.0/24 -j DROP
iptables -A INPUT -p 17 -d 66.0.0.0/8 -s 250.149.182.225 --dport 34363 --sport 9091 -j ACCEPT
iptables -A test1 -p 6 -s 192.187.0.0/16 --sport 42997 -d 179.214.39.124 -j ACCEPT
iptables -A INPUT -p 17 -s 44.103.198.182 -d 84.0.0.0/8 --sport 47104 -j ACCEPT
iptables -A test3 -p 6 --dport 48679 -j ACCEPT
iptables -A INPUT -p 17 --sport 24735 -s 5.58.0.0/16 -j DROP
iptables -A test1 -s 67.103.0.0/16 -d 234.178.105.207 -j DROP
iptables -A OUTPUT -p 17 --dport 2655 -s 81.103.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -s 82.172.79.0/24 --sport 11386 -d 88.175.13.175 -j DROP
iptables -A test2 -p 6 -d 84.150.63.198 --dport 36712 -j ACCEPT
iptables -A test2 -p 6 --sport 30438 --dport 37573 -s 132.18.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --sport 49908 --dport 10437 -s 152.191.61.2 -j DROP
iptables -A INPUT -p 17 --sport 15643 --dport 41240 -d 2.119.144.130 -j DROP
iptables -A test2 -p 17 --sport 48026 --dport 48271 -j DROP
iptables -A INPUT -p 17 --sport 22678 -d 246.33.234.61 -j DROP
iptables -A test3 -p 17 -d 19.249.110.0/24 --dport 1048 -s 220.247.103.37 --sport 39103 -j DROP
iptables -A test1 -p 17 -d 33.229.33.15 --dport 43061 -s 191.206.147.173 -j ACCEPT
iptables -A OUTPUT -p 76 -s 105.56.174.0/24 -j DROP
iptables -A INPUT -p 6 --sport 55222 --dport 56481 -j ACCEPT
iptables -A test1 -p 107 -d 156.92.32.152 -s 77.74.0.0/16 -j ACCEPT
iptables -A FORWARD -p 66 -d 137.244.0.0/16 -j ACCEPT
iptables -A test2 -d 253.80.159.229 -s 229.26.101.186 -j DROP
iptables -A test3 -p 6 -d 36.42.142.149 -s 63.202.50.6 --sport 60093 -j ACCEPT
iptables -A test1 -p 211 -d 140.235.149.127 -s 245.0.0.0/8 -j DROP
iptables -A test3 -p 6 --sport 10779 -s 136.64.0.0/16 -d 94.0.0.0/8 --dport 22058 -j DROP
iptables -A FORWARD -p 238 -d 81.166.211.230 -j DROP
iptables -A test2 -d 39.14.230.176 -j ACCEPT
iptables -A FORWARD -p 6 -s 27.102.40.59 --dport 14620 -j ACCEPT
iptables -A INPUT -p 6 -s 191.5.236.43 --sport 41 --dport 31515 -j ACCEPT
iptables -A INPUT -s 2.83.19.117 -j DROP
iptables -A test1 -p 6 -d 28.89.0.0/16 --dport 30012 --sport 32407 -j DROP
iptables -A INPUT -p 130 -d 161.219.249.0/24 -j DROP
iptables -A FORWARD -d 110.0.0.0/8 -p 255 -s 168.99.168.141 -j ACCEPT
iptables -A test3 -d 41.226.49.114 -j ACCEPT
iptables -A test1 -p 135 -s 169.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 -d 69.67.69.0/24 --dport 43916 --sport 6317 -s 192.12.0.0/16 -j DROP
iptables -A test2 -p 6 --sport 22629 -j ACCEPT
iptables -A test1 -p 17 --sport 42738 -j ACCEPT
iptables -A test3 -p 17 --dport 61936 --sport 25001 -s 118.87.97.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --dport 26800 -j ACCEPT
iptables -A OUTPUT -p 18 -j DROP
iptables -A INPUT -p 6 -s 142.194.116.8 -d 81.95.0.0/16 --sport 58569 -j DROP
iptables -A test2 -p 17 -s 85.71.16.47 --dport 17374 -j DROP
iptables -A INPUT -d 195.190.214.200 -j ACCEPT
iptables -A test1 -p 6 --dport 26838 --sport 45597 -s 214.9.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -s 165.113.90.231 -d 121.182.68.221 --sport 897 -j DROP
iptables -A OUTPUT -p 6 --dport 40280 -d 137.174.200.238 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 10971 --sport 16829 -d 228.31.129.108 -j DROP
iptables -A OUTPUT -p 17 --dport 4090 --sport 10063 -j DROP
iptables -A INPUT -p 17 --sport 54927 -d 17.127.25.0/24 -j ACCEPT
iptables -A test1 -d 197.149.143.226 -j DROP
iptables -A INPUT -p 6 --dport 25235 --sport 36587 -j ACCEPT
iptables -A FORWARD -p 6 --dport 39536 -s 205.76.0.0/16 -d 95.135.252.135 -j ACCEPT
iptables -A INPUT -p 17 -d 200.228.63.0/24 --dport 28598 -j DROP
iptables -A test1 -p 17 --dport 35317 -d 21.172.126.187 -s 3.171.233.160 -j ACCEPT
iptables -A test3 -p 17 --dport 10488 -d 127.251.210.0/24 --sport 31148 -j ACCEPT
iptables -A test3 -p 6 --dport 40603 -s 115.140.5.136 -d 59.99.214.129 -j DROP
iptables -A FORWARD -p 17 --dport 54468 -d 88.244.227.61 -j ACCEPT
iptables -A INPUT -p 17 -s 192.184.0.0/16 --dport 56595 -j DROP
iptables -A FORWARD -p 17 --sport 60520 -s 76.221.112.0/24 -j DROP
iptables -A OUTPUT -d 58.0.0.0/8 -j DROP
iptables -A test3 -s 152.200.90.126 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 47016 -d 160.139.193.35 -j DROP
iptables -A FORWARD -p 6 --sport 41445 -d 48.219.163.0/24 --dport 297 -j DROP
iptables -A test2 -p 17 --sport 43584 --dport 3707 -d 108.196.71.13 -s 180.239.108.131 -j ACCEPT
iptables -A test2 -p 6 --dport 49437 -d 1.137.230.159 -j DROP
iptables -A test2 -p 17 -s 79.0.0.0/8 -d 114.234.188.0/24 --sport 56184 -j DROP
iptables -A test3 -p 6 --sport 8674 -d 80.185.208.252 -s 100.227.95.23 -j ACCEPT
iptables -A OUTPUT -p 6 -d 253.23.163.187 --sport 51152 -j ACCEPT
iptables -A INPUT -p 6 -d 217.72.96.36 --dport 34667 -s 40.106.181.69 -j DROP
iptables -A OUTPUT -p 6 --sport 20792 -d 49.74.234.0/24 --dport 48213 -j DROP
iptables -A INPUT -p 6 --dport 24568 -s 10.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 31016 --dport 18738 -s 61.209.53.117 -d 19.243.188.244 -j DROP
iptables -A test3 -p 6 -d 120.80.252.165 -s 146.0.0.0/8 --dport 26486 -j ACCEPT
iptables -A test3 -p 6 --sport 57356 --dport 47723 -s 28.169.137.0/24 -j DROP
iptables -A FORWARD -p 6 --dport 12110 -d 102.210.8.0/24 --sport 54174 -j DROP
iptables -A test3 -p 17 --sport 18294 --dport 53665 -d 94.89.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -d 52.19.207.0/24 --dport 7118 -s 132.101.94.0/24 -j ACCEPT
iptables -A OUTPUT -p 2 -d 176.31.244.117 -s 6.85.0.0/16 -j test2
iptables -A test3 -s 214.0.0.0/8 -p 148 -j ACCEPT
iptables -A INPUT -p 6 -s 5.234.185.1 -d 99.101.86.63 --dport 10464 -j ACCEPT
iptables -A test3 -d 112.38.102.251 -s 230.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --sport 14256 -j ACCEPT
iptables -A test1 -p 6 --sport 25830 -j DROP
iptables -A test3 -p 20 -j DROP
iptables -A FORWARD -p 6 -s 128.57.0.0/16 --dport 37085 -j DROP
iptables -A FORWARD -p 17 --sport 26593 -j DROP
iptables -A test1 -p 17 --sport 21323 -j DROP
iptables -A test3 -s 67.158.133.175 -j ACCEPT
iptables -A test3 -s 214.54.201.126 -j DROP
iptables -A test3 -d 78.176.103.66 -j DROP
iptables -A OUTPUT -s 233.173.74.119 -j ACCEPT
iptables -A test2 -p 17 --sport 32435 -s 173.26.9.118 -j DROP
iptables -A test3 -d 23.132.203.191 -s 149.189.0.0/16 -j DROP
iptables -A test3 -p 17 --sport 4312 -s 155.9.189.227 -j DROP
iptables -A OUTPUT -d 74.251.56.71 -s 163.249.130.6 -j DROP
iptables -A test1 -p 178 -d 57.0.0.0/8 -s 180.151.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 -s 175.165.160.87 --dport 20050 -d 140.74.58.236 -j ACCEPT
iptables -A test3 -p 17 --dport 50408 -j DROP
iptables -A test3 -p 6 --dport 36035 -d 242.143.149.31 --sport 9408 -j ACCEPT
iptables -A FORWARD -p 17 -s 5.97.116.201 --sport 34157 --dport 45687 -d 226.134.29.185 -j DROP
iptables -A OUTPUT -p 6 -s 176.0.0.0/8 --sport 17383 -d 247.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --sport 26400 -j ACCEPT
iptables -A test3 -p 17 --dport 60443 --sport 50979 -s 245.0.0.0/8 -j DROP
iptables -A test3 -p 6 --dport 20320 -s 97.75.0.0/16 -d 152.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 42976 -d 206.95.0.0/16 --sport 25772 -j ACCEPT
iptables -A OUTPUT -d 64.38.120.20 -j DROP
iptables -A OUTPUT -s 169.164.102.72 -d 69.112.246.73 -j ACCEPT
iptables -A INPUT -p 17 --dport 58377 -d 222.140.29.196 --sport 8341 -s 25.0.0.0/8 -j DROP
iptables -A test1 -p 243 -d 78.188.237.27 -s 29.83.99.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 -s 192.89.83.216 --sport 19662 -d 143.110.0.0/16 --dport 37958 -j DROP
iptables -A OUTPUT -s 62.76.0.0/16 -d 46.136.171.84 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 22383 -d 157.48.100.118 --sport 55285 -j DROP
iptables -A test1 -p 6 --sport 55365 -d 42.213.88.0/24 -s 237.143.214.114 -j ACCEPT
iptables -A OUTPUT -p 17 -s 20.0.0.0/8 --dport 38902 -j ACCEPT
iptables -A test3 -s 48.147.0.0/16 -j DROP
iptables -A test3 -p 17 --dport 50340 --sport 47856 -s 112.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 1604 -d 243.169.242.39 -j test1
iptables -A INPUT -p 6 --sport 25764 -j ACCEPT
iptables -A FORWARD -p 6 -d 199.236.243.75 --dport 4417 -j ACCEPT
iptables -A test2 -p 17 -d 203.151.22.14 --sport 15297 -s 168.31.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 35135 -j DROP
iptables -A test2 -p 6 -d 110.191.230.92 --dport 52387 -s 100.224.54.209 -j ACCEPT
iptables -A FORWARD -p 17 -d 191.202.250.232 --sport 58953 -j DROP
iptables -A test3 -s 81.0.0.0/8 -j DROP
iptables -A test1 -p 6 --sport 45960 -j DROP
iptables -A FORWARD -p 6 --sport 52323 -j ACCEPT
iptables -A FORWARD -d 164.204.206.104 -j ACCEPT
iptables -A test1 -p 6 --dport 54018 -j ACCEPT
iptables -A test2 -p 223 -s 26.159.26.20 -j ACCEPT
iptables -A test2 -p 17 -d 230.184.186.10 --dport 20298 -s 169.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 -s 153.220.148.253 --dport 32094 --sport 8353 -j DROP
iptables -A test1 -p 17 --dport 37841 --sport 1483 -s 45.179.54.0/24 -j DROP
iptables -A test1 -p 6 --dport 63674 -j DROP
iptables -A test2 -p 17 --dport 55625 --sport 42287 -d 90.238.35.8 -j DROP
iptables -A FORWARD -p 17 --sport 29830 -s 63.0.0.0/8 --dport 46235 -j DROP
iptables -A FORWARD -p 6 -s 192.55.17.0/24 --dport 60113 -j test2
iptables -A test3 -d 17.144.0.0/16 -s 3.59.71.71 -j ACCEPT
iptables -A FORWARD -p 234 -s 178.151.108.19 -j DROP
iptables -A test1 -d 173.77.253.30 -p 49 -j DROP
iptables -A OUTPUT -p 6 --dport 54109 -d 73.39.247.43 --sport 48313 -s 84.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --sport 38667 -d 200.10.5.0/24 -j DROP
iptables -A INPUT -d 125.5.116.0/24 -p 55 -j DROP
iptables -A FORWARD -p 6 -d 101.5.0.0/16 --dport 42512 -s 152.0.0.0/8 -j DROP
iptables -A FORWARD -d 236.0.0.0/8 -s 141.183.38.164 -j ACCEPT
iptables -A INPUT -p 17 --sport 24301 -d 214.176.134.247 -s 174.1.247.164 --dport 48185 -j ACCEPT
iptables -A test3 -p 6 --sport 8720 -j ACCEPT
iptables -A OUTPUT -p 17 -s 19.0.0.0/8 --sport 36595 -j DROP
iptables -A test3 -p 17 -s 86.208.12.195 -d 84.131.244.17 --sport 50320 -j ACCEPT
iptables -A test1 -d 121.31.114.43 -j ACCEPT
iptables -A test1 -p 6 --dport 28471 -s 1.216.134.125 --sport 5046 -j ACCEPT
iptables -A INPUT -d 182.225.205.0/24 -j ACCEPT
iptables -A FORWARD -d 117.23.135.0/24 -j DROP
iptables -A test2 -p 6 --sport 60988 -d 221.69.62.61 -s 200.0.0.0/8 --dport 57467 -j DROP
iptables -A test1 -p 6 -s 47.144.51.60 --sport 34895 -j ACCEPT
iptables -A test1 -p 17 -s 39.187.233.83 --sport 19320 -d 185.180.52.81 -j ACCEPT
iptables -A test3 -p 6 --dport 29094 -d 204.217.50.0/24 -j ACCEPT
iptables -A test3 -p 17 --sport 59660 -s 127.0.0.0/8 -j DROP
iptables -A test3 -p 6 --sport 10273 -s 169.62.143.85 -j ACCEPT
iptables -A test2 -p 17 -s 79.0.0.0/8 --dport 51430 -j ACCEPT
iptables -A test3 -p 6 --sport 5713 -j ACCEPT
iptables -A OUTPUT -p 17 -s 212.0.0.0/8 -d 69.12.208.206 --dport 54326 --sport 59936 -j DROP
iptables -A test1 -p 17 --dport 41300 --sport 46488 -j DROP
iptables -A test3 -d 41.212.226.51 -p 155 -s 227.33.212.156 -j DROP
iptables -A FORWARD -p 6 -d 212.84.6.0/24 --dport 58340 -s 0.20.58.0/24 -j DROP
iptables -A test2 -p 17 --sport 52019 --dport 65323 -d 93.127.181.229 -j ACCEPT
iptables -A test1 -d 35.129.7.233 -j ACCEPT
iptables -A FORWARD -p 6 --dport 53283 --sport 34826 -s 146.166.112.62 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 49158 -s 111.131.0.0/16 --sport 24471 -j ACCEPT
iptables -A INPUT -p 17 -s 33.0.0.0/8 --sport 18898 --dport 16825 -j DROP
iptables -A OUTPUT -p 17 --dport 57960 -d 95.210.214.119 -j ACCEPT
iptables -A test1 -p 6 -s 191.245.225.176 --sport 25870 -j DROP
iptables -A FORWARD -p 17 -d 25.77.0.0/16 -s 242.0.0.0/8 --sport 13783 --dport 48366 -j DROP
iptables -A test1 -p 17 -d 232.0.0.0/8 --sport 13866 -s 7.237.61.45 -j DROP
iptables -A OUTPUT -p 17 --dport 343 -j DROP
iptables -A FORWARD -p 17 --sport 37955 --dport 31639 -s 62.222.161.118 -j ACCEPT
iptables -A test1 -p 6 --dport 35435 -j ACCEPT
iptables -A FORWARD -s 95.212.0.0/16 -j ACCEPT
iptables -A test3 -d 89.225.131.0/24 -p 186 -j ACCEPT
iptables -A test1 -p 17 --sport 62141 -j ACCEPT
iptables -A test3 -p 17 --sport 41120 -j DROP
iptables -A INPUT -p 203 -j DROP
iptables -A FORWARD -p 17 --sport 4464 -s 136.24.120.43 -j ACCEPT
iptables -A FORWARD -s 182.79.209.174 -j ACCEPT
iptables -A INPUT -p 6 --sport 8564 -s 135.47.201.112 --dport 34504 -j ACCEPT
iptables -A test3 -d 226.57.0.0/16 -p 94 -s 139.76.190.193 -j DROP
iptables -A test2 -p 165 -d 236.0.0.0/8 -s 73.129.116.0/24 -j DROP
iptables -A test3 -p 17 -d 69.169.66.14 --dport 33600 -j DROP
iptables -A test1 -p 17 --sport 8482 --dport 61188 -d 205.241.177.67 -j ACCEPT
iptables -A FORWARD -p 6 --sport 17434 -j ACCEPT
iptables -A test3 -p 6 --dport 20286 --sport 7575 -j ACCEPT
iptables -A test3 -p 6 --sport 17657 -s 174.36.87.166 -j DROP
iptables -A FORWARD -p 6 --dport 59834 -d 83.14.222.100 --sport 20742 -j DROP
iptables -A test1 -p 6 -d 174.184.65.162 -s 73.0.0.0/8 --dport 6603 -j DROP
iptables -A INPUT -p 17 -s 75.28.0.0/16 -d 148.243.144.37 --dport 62735 -j ACCEPT
iptables -A test1 -p 6 --dport 9431 -d 110.20.117.27 --sport 52829 -j ACCEPT
iptables -A test3 -s 57.49.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 35211 -j ACCEPT
iptables -A test3 -p 5 -j DROP
iptables -A FORWARD -p 6 --sport 22257 -j DROP
iptables -A test3 -p 17 -d 12.172.57.142 -s 131.143.88.0/24 --dport 49917 --sport 53063 -j ACCEPT
iptables -A test1 -p 6 --sport 1531 --dport 62930 -j DROP
iptables -A FORWARD -p 6 -d 39.0.0.0/8 --sport 32596 -j ACCEPT
iptables -A INPUT -p 17 -s 26.237.15.25 -d 117.204.169.163 --dport 64379 -j DROP
iptables -A OUTPUT -d 189.114.182.21 -s 134.27.136.0/24 -j DROP
iptables -A INPUT -d 123.47.109.90 -p 78 -j DROP
iptables -A test3 -p 6 -d 244.87.0.0/16 --sport 16946 -j ACCEPT
iptables -A FORWARD -p 6 -s 168.25.0.0/16 --sport 49086 --dport 23381 -j DROP
iptables -A INPUT -p 17 --sport 34320 -d 200.57.95.24 --dport 34271 -j ACCEPT
iptables -A OUTPUT -s 39.135.246.0/24 -j DROP
iptables -A FORWARD -p 17 -d 138.161.20.218 --dport 57778 -j test3
iptables -A test3 -p 6 --sport 23333 -d 153.24.0.0/16 --dport 44001 -s 88.80.0.0/16 -j ACCEPT
iptables -A test3 -p 17 -s 43.0.0.0/8 --sport 5507 -d 144.122.0.0/16 -j ACCEPT
iptables -A test1 -d 95.158.63.152 -j ACCEPT
iptables -A test3 -p 17 -s 140.52.15.0/24 --sport 55500 -j DROP
iptables -A test3 -s 228.17.20.246 -j ACCEPT
iptables -A test2 -p 17 --dport 62819 --sport 55371 -d 54.173.22.226 -j ACCEPT
iptables -A FORWARD -p 131 -j test2
iptables -A test2 -p 6 -d 113.10.244.93 --dport 954 -j DROP
iptables -A test3 -p 6 -s 202.236.117.0/24 --sport 64174 --dport 4124 -j DROP
iptables -A OUTPUT -p 17 --dport 28836 -j ACCEPT
iptables -A test3 -p 17 --dport 48784 -d 114.207.37.58 -j ACCEPT
iptables -A test1 -d 159.149.26.55 -j ACCEPT
iptables -A INPUT -p 6 -d 194.6.0.0/16 --sport 22166 -s 64.44.30.82 -j DROP
iptables -A test1 -s 110.130.77.16 -j DROP
iptables -A test2 -p 17 --sport 57776 -s 183.86.185.121 --dport 31642 -j ACCEPT
iptables -A FORWARD -p 17 -d 156.254.0.0/16 -s 71.3.242.253 --sport 36543 -j ACCEPT
iptables -A test1 -p 6 -s 92.249.90.190 --sport 5031 --dport 34034 -d 211.66.0.0/16 -j DROP
iptables -A test3 -p 229 -j ACCEPT
iptables -A test3 -s 37.34.69.51 -j DROP
iptables -A test2 -p 17 --dport 1378 --sport 37152 -s 151.92.155.33 -j DROP
iptables -A test3 -p 6 --dport 49994 --sport 35987 -d 82.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 --sport 19532 -s 44.20.5.185 -d 248.224.253.217 -j ACCEPT
iptables -A FORWARD -p 185 -j DROP
iptables -A FORWARD -p 6 -s 22.197.92.4 --sport 36026 -j DROP
iptables -A test1 -p 202 -s 132.193.60.73 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 61547 --sport 4273 -s 167.199.210.64 -j DROP
iptables -A test1 -s 63.241.43.142 -j DROP
iptables -A FORWARD -s 171.77.141.230 -j DROP
iptables -A test2 -p 6 -d 37.33.137.77 --dport 220 --sport 48650 -j DROP
iptables -A test2 -p 85 -s 255.57.213.0/24 -d 22.119.14.0/24 -j ACCEPT
iptables -A test3 -p 6 --sport 58386 --dport 16746 -j ACCEPT
iptables -A OUTPUT -d 69.19.224.143 -j ACCEPT
iptables -A FORWARD -p 6 -s 141.251.146.245 --sport 19310 -j ACCEPT
iptables -A test3 -p 17 --sport 8461 -j DROP
iptables -A test1 -d 200.100.119.210 -s 163.242.177.229 -j DROP
iptables -A FORWARD -p 17 -d 88.77.116.10 --sport 4506 --dport 10800 -j DROP
iptables -A test3 -d 231.112.128.88 -j ACCEPT
iptables -A test1 -d 97.177.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 47921 --sport 5702 -j ACCEPT
iptables -A test2 -p 234 -j DROP
iptables -A INPUT -p 17 --sport 24735 -j ACCEPT
iptables -A test1 -p 6 --dport 41547 -d 203.223.25.191 -s 79.0.0.0/8 -j DROP
iptables -A test2 -p 17 --dport 6402 -s 152.108.30.76 -d 37.138.142.243 --sport 23355 -j ACCEPT
iptables -A FORWARD -p 17 -s 158.4.167.80 --sport 39943 -j DROP
iptables -A OUTPUT -p 6 -d 182.99.223.0/24 -s 140.0.0.0/8 --sport 34386 -j ACCEPT
iptables -A test1 -p 6 -s 72.181.145.187 --dport 20624 -j ACCEPT
iptables -A test3 -p 17 --sport 47172 --dport 31638 -d 95.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -s 86.30.71.0/24 -j test1
iptables -A test1 -p 6 --dport 37138 -j DROP
iptables -A test2 -s 100.213.235.140 -j ACCEPT
iptables -A test2 -p 6 --sport 24111 -s 89.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 64428 --sport 18049 -s 24.6.151.36 -j DROP
iptables -A FORWARD -p 6 --sport 40645 -j DROP
iptables -A test2 -p 13 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 61782 -j ACCEPT
iptables -A test2 -p 6 -s 138.87.0.0/16 --dport 9904 --sport 47040 -j ACCEPT
iptables -A test2 -p 254 -j ACCEPT
iptables -A test2 -d 131.210.189.115 -p 226 -s 25.201.160.150 -j DROP
iptables -A test3 -d 122.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 46506 -d 142.150.35.0/24 -j ACCEPT
iptables -A INPUT -p 17 --dport 64408 -j DROP
iptables -A test3 -p 6 -d 125.119.245.126 --sport 18917 -s 94.184.128.200 -j DROP
iptables -A OUTPUT -p 6 --dport 28085 --sport 29383 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 11831 --dport 8502 -j DROP
iptables -A test2 -p 6 --dport 55120 --sport 35503 -s 156.169.137.178 -j DROP
iptables -A FORWARD -p 6 --sport 60759 -d 44.155.249.18 -j ACCEPT
iptables -A test3 -p 6 --dport 42004 --sport 6841 -j DROP
iptables -A OUTPUT -p 17 --dport 45726 -j ACCEPT
iptables -A test1 -p 6 --dport 42646 -j ACCEPT
iptables -A FORWARD -p 6 --dport 17772 --sport 38526 -j DROP
iptables -A test3 -s 172.225.151.0/24 -p 89 -j DROP
iptables -A test1 -p 17 -s 157.0.0.0/8 --sport 48088 -j DROP
iptables -A test1 -p 17 --dport 6266 -s 88.92.123.182 -j DROP
iptables -A OUTPUT -p 18 -j ACCEPT
iptables -A test3 -d 75.97.4.116 -p 53 -j ACCEPT
iptables -A test2 -p 17 -d 30.131.0.0/16 -s 177.47.246.18 --sport 3834 -j ACCEPT
iptables -A FORWARD -p 6 --sport 54927 -s 188.135.122.0/24 -d 157.0.0.0/8 --dport 7576 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 57299 --dport 32193 -j DROP
iptables -A test1 -s 61.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -d 229.219.169.0/24 --dport 17744 --sport 41478 -j ACCEPT
iptables -A OUTPUT -s 44.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -s 153.221.178.52 --sport 47283 -j DROP
iptables -A test1 -p 17 --sport 61777 -d 3.64.145.129 -j DROP
iptables -A FORWARD -p 6 --dport 39139 -j DROP
iptables -A test3 -p 6 --dport 64064 -j DROP
iptables -A test3 -p 17 -s 208.59.144.111 --sport 34386 -j ACCEPT
iptables -A test1 -p 17 --sport 32661 --dport 30836 -j DROP
iptables -A INPUT -p 6 -d 83.220.25.228 --dport 13471 -j ACCEPT
iptables -A test3 -p 17 -s 124.18.199.220 --dport 35263 -j DROP
iptables -A INPUT -p 17 --dport 57508 -j ACCEPT
iptables -A test2 -p 6 --sport 18794 -s 81.126.152.0/24 --dport 50620 -j ACCEPT
iptables -A INPUT -d 44.101.160.229 -j DROP
iptables -A OUTPUT -p 6 --dport 64239 -j DROP
iptables -A test1 -p 17 --sport 21169 --dport 62797 -d 207.0.0.0/8 -s 41.168.130.0/24 -j ACCEPT
iptables -A test3 -p 6 -s 113.0.0.0/8 --sport 38046 -j ACCEPT
iptables -A test1 -p 6 --sport 56917 -j ACCEPT
iptables -A FORWARD -p 6 --dport 951 -j ACCEPT
iptables -A FORWARD -d 119.245.24.94 -j test2
iptables -A test2 -p 17 -d 26.0.0.0/8 --dport 31981 -s 189.62.153.125 -j ACCEPT
iptables -A test2 -p 6 --dport 55237 -j ACCEPT
iptables -A test2 -d 186.219.171.79 -j DROP
iptables -A test3 -p 17 -s 63.23.0.0/16 --dport 16524 -j ACCEPT
iptables -A test2 -p 17 --dport 12253 --sport 36108 -j ACCEPT
iptables -A test2 -d 237.159.122.73 -p 155 -j ACCEPT
iptables -A test3 -d 26.217.0.0/16 -j DROP
iptables -A test2 -p 6 --dport 33699 -d 91.214.197.78 -j DROP
iptables -A test1 -p 17 --sport 34524 -d 103.155.40.141 --dport 53780 -j ACCEPT
iptables -A test2 -p 6 --dport 47108 -j ACCEPT
iptables -A test1 -p 6 --sport 26148 -j ACCEPT
iptables -A test2 -d 112.162.206.0/24 -j ACCEPT
iptables -A INPUT -p 6 -s 70.226.0.0/16 -d 247.133.30.0/24 --sport 4817 -j ACCEPT
iptables -A FORWARD -p 17 --sport 58426 -s 174.99.214.22 -j ACCEPT
iptables -A test2 -p 17 --dport 65054 --sport 53885 -d 107.221.86.80 -j DROP
iptables -A test1 -p 6 --sport 9019 -j DROP
iptables -A test2 -d 125.189.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 15964 -s 162.187.114.62 --dport 20418 -j DROP
iptables -A INPUT -p 17 --dport 11929 --sport 21571 -d 236.62.168.152 -j DROP
iptables -A OUTPUT -p 6 --dport 64996 --sport 39401 -j ACCEPT
iptables -A INPUT -p 6 -s 79.39.0.0/16 -d 249.144.217.141 --dport 23514 -j ACCEPT
iptables -A OUTPUT -p 6 -d 230.14.80.139 --dport 50890 -j ACCEPT
iptables -A test3 -d 111.63.142.0/24 -j ACCEPT
iptables -A test2 -p 17 --dport 64528 --sport 24985 -d 169.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 21324 -j DROP
iptables -A test2 -p 17 -d 78.42.83.79 --dport 25850 -s 90.0.0.0/8 -j ACCEPT
iptables -A FORWARD -s 249.0.0.0/8 -d 251.109.180.155 -p 49 -j ACCEPT
iptables -A test1 -p 17 -d 185.0.0.0/8 --sport 64097 -s 210.254.27.159 -j DROP
iptables -A FORWARD -p 6 --dport 40577 --sport 5446 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 43279 -j DROP
iptables -A test3 -p 17 -s 61.143.68.0/24 --dport 58227 --sport 34131 -j ACCEPT
iptables -A test2 -p 17 --dport 46510 --sport 40776 -j DROP
iptables -A test3 -p 6 -s 116.11.14.231 --dport 22295 -d 154.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 --sport 49310 -j DROP
iptables -A test2 -p 6 -s 119.216.208.8 -d 176.83.80.177 --sport 33309 -j DROP
iptables -A OUTPUT -p 17 --sport 39168 -d 174.0.0.0/8 -s 142.191.52.0/24 -j ACCEPT
iptables -A INPUT -p 17 --dport 63056 -j test1
iptables -A INPUT -p 17 -d 135.142.238.184 --dport 8016 -j test1
iptables -A INPUT -d 86.155.165.115 -p 112 -j ACCEPT
iptables -A FORWARD -d 138.150.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --dport 27202 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 24508 -s 135.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 --sport 34334 -s 155.0.0.0/8 --dport 18754 -j DROP
iptables -A OUTPUT -p 6 --sport 11946 -s 78.126.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 25415 -j ACCEPT
iptables -A test3 -p 17 --dport 12147 --sport 29697 -d 175.191.167.0/24 -s 251.184.159.251 -j ACCEPT
iptables -A FORWARD -p 6 --sport 28180 -d 120.111.251.197 -j DROP
iptables -A OUTPUT -p 6 -d 178.73.60.244 --dport 19858 -s 52.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 -s 81.104.179.82 --dport 47195 --sport 55267 -j DROP
iptables -A FORWARD -s 98.125.0.0/16 -p 96 -j DROP
iptables -A INPUT -p 17 --dport 7646 -s 216.211.82.0/24 -d 66.0.0.0/8 -j DROP
iptables -A test2 -p 6 --sport 32876 -d 237.0.0.0/8 -j ACCEPT
iptables -A test3 -d 237.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 -d 8.0.132.0/24 --dport 57389 -s 203.251.12.0/24 --sport 39407 -j ACCEPT
iptables -A test2 -s 88.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 39374 --sport 32943 -j ACCEPT
iptables -A test1 -d 228.0.163.0/24 -j ACCEPT
iptables -A test1 -p 103 -d 7.17.0.0/16 -s 15.118.212.148 -j DROP
iptables -A test2 -p 6 --sport 942 -j DROP
iptables -A FORWARD -p 6 --dport 30190 -d 210.230.87.159 -s 146.82.88.81 --sport 11177 -j ACCEPT
iptables -A FORWARD -p 6 --dport 47458 --sport 8589 -d 197.244.0.0/16 -j DROP
iptables -A OUTPUT -p 20 -j DROP
iptables -A test3 -p 6 -d 245.244.225.101 --dport 22073 --sport 36410 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 54328 --dport 14810 -j ACCEPT
iptables -A test3 -p 6 --sport 1644 -j ACCEPT
iptables -A OUTPUT -p 17 -d 119.115.245.55 --sport 32275 -j DROP
iptables -A INPUT -d 60.4.55.217 -j DROP
iptables -A FORWARD -s 128.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --sport 3178 -j test1
iptables -A test3 -p 17 -d 212.10.160.164 -s 103.62.241.0/24 --dport 10761 -j DROP
iptables -A test1 -d 174.5.168.60 -s 164.28.0.0/16 -j DROP
iptables -A test3 -p 17 -d 37.4.234.146 --sport 20734 -j ACCEPT
iptables -A test1 -p 6 --dport 45267 -d 0.107.239.1 -j DROP
iptables -A test1 -p 17 -s 119.0.0.0/8 -d 90.0.0.0/8 --sport 10141 -j ACCEPT
iptables -A test2 -d 29.49.130.95 -j ACCEPT
iptables -A INPUT -p 84 -d 83.223.36.164 -j ACCEPT
iptables -A test2 -p 6 -d 172.120.27.97 --dport 9035 -s 110.1.93.86 -j ACCEPT
iptables -A INPUT -p 6 -d 100.7.0.0/16 --sport 51084 -j test2
iptables -A FORWARD -p 6 -d 229.218.202.110 --sport 51647 -j ACCEPT
iptables -A test3 -p 6 --dport 41716 -j ACCEPT
iptables -A FORWARD -p 17 -d 14.40.188.51 --dport 24139 --sport 35874 -j test2
iptables -A INPUT -p 6 -s 42.0.0.0/8 --dport 36148 -j ACCEPT
iptables -A test1 -p 6 --sport 29745 -d 156.183.135.89 --dport 13994 -j DROP
iptables -A test3 -p 6 --sport 43957 -d 110.0.0.0/8 --dport 33148 -j ACCEPT
iptables -A test1 -p 17 --sport 48526 -s 114.147.75.231 -d 251.35.80.122 -j ACCEPT
iptables -A test3 -s 75.6.0.0/16 -d 223.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --sport 29697 -j ACCEPT
iptables -A test3 -p 6 -s 61.111.53.42 --sport 31099 -d 240.158.0.0/16 -j DROP
iptables -A test2 -p 17 --sport 44551 -d 69.0.0.0/8 -s 149.219.162.0/24 --dport 34358 -j DROP
iptables -A FORWARD -p 17 --sport 6962 -d 8.0.0.0/8 -s 166.15.33.77 -j ACCEPT
iptables -A OUTPUT -p 17 -s 187.76.186.161 --dport 10420 -d 255.67.214.0/24 --sport 8018 -j DROP
iptables -A test3 -p 6 -s 27.36.176.77 --dport 26280 -d 76.38.146.155 --sport 36467 -j DROP
iptables -A test3 -s 9.179.170.82 -d 87.162.182.7 -p 24 -j DROP
iptables -A INPUT -p 6 -d 23.249.0.0/16 --sport 36734 -j DROP
iptables -A test3 -p 165 -d 195.42.150.142 -s 143.243.0.0/16 -j DROP
iptables -A INPUT -p 40 -j DROP
iptables -A test2 -p 6 --dport 6111 --sport 24613 -j ACCEPT
iptables -A OUTPUT -p 17 -d 62.34.95.252 --dport 33822 --sport 35437 -j ACCEPT
iptables -A INPUT -p 17 -s 45.124.105.38 -d 230.0.0.0/8 --dport 18845 -j DROP
iptables -A FORWARD -p 6 -s 220.0.0.0/8 -d 134.68.6.0/24 --dport 52712 -j ACCEPT
iptables -A test2 -p 17 -d 17.0.0.0/8 --sport 2875 -j DROP
iptables -A test3 -s 88.0.0.0/8 -j ACCEPT
iptables -A test3 -s 31.234.197.78 -d 9.107.66.206 -j DROP
iptables -A test3 -s 224.46.0.0/16 -p 190 -j ACCEPT
iptables -A test2 -p 17 --dport 33282 -j DROP
iptables -A test3 -p 6 --sport 63527 -j ACCEPT
iptables -A INPUT -p 17 -d 218.243.70.19 --dport 60067 -j DROP
iptables -A test2 -p 6 -s 83.188.207.0/24 --dport 51668 -j ACCEPT
iptables -A OUTPUT -d 114.124.216.16 -j ACCEPT
iptables -A test3 -p 6 -d 18.0.0.0/8 --dport 14346 --sport 53831 -s 241.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --dport 54104 --sport 43724 -j DROP
iptables -A INPUT -p 17 --dport 12358 -j ACCEPT
iptables -A test2 -s 218.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --dport 20046 -s 176.137.57.156 --sport 42868 -j ACCEPT
iptables -A INPUT -p 17 -d 194.184.244.95 --sport 38913 --dport 51573 -j ACCEPT
iptables -A test3 -p 17 --dport 29563 -s 45.30.61.133 -j ACCEPT
iptables -A test3 -p 17 --dport 22601 -d 82.4.186.155 -s 3.57.0.0/16 -j DROP
iptables -A test1 -p 17 --sport 47805 --dport 20580 -d 181.0.0.0/8 -j DROP
iptables -A FORWARD -s 133.110.14.141 -j test3
iptables -A test1 -p 17 --sport 32867 -s 142.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 -d 242.25.254.159 --dport 49318 -j ACCEPT
iptables -A test1 -p 6 --dport 18164 -j ACCEPT
iptables -A OUTPUT -p 17 -s 178.200.17.120 --sport 15744 -j ACCEPT
iptables -A FORWARD -p 6 --sport 52605 -j ACCEPT
iptables -A test2 -s 36.148.40.82 -j DROP
iptables -A test1 -p 6 -s 73.237.62.65 --dport 62115 -j DROP
iptables -A test3 -p 119 -s 44.69.140.61 -j DROP
iptables -A OUTPUT -p 17 -s 48.168.0.0/16 --dport 17307 -d 152.201.0.0/16 -j DROP
iptables -A test2 -p 17 -s 12.106.143.184 --sport 46836 -d 229.38.113.105 --dport 56203 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 60161 -j ACCEPT
iptables -A test2 -p 17 --sport 8226 -s 48.0.0.0/8 --dport 44746 -j DROP
iptables -A INPUT -p 17 -s 222.0.0.0/8 --sport 5868 -d 91.119.0.0/16 -j ACCEPT
iptables -A test2 -p 6 -s 101.0.0.0/8 --sport 6222 -j DROP
iptables -A OUTPUT -p 6 --sport 11028 -j DROP
iptables -A INPUT -p 17 --sport 41766 -s 49.137.121.89 -j ACCEPT
iptables -A INPUT -p 6 --dport 20949 -s 70.97.0.0/16 -j DROP
iptables -A INPUT -d 92.251.116.190 -s 63.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -s 23.43.229.135 --dport 21270 -j DROP
iptables -A INPUT -p 17 -d 201.0.0.0/8 -s 98.31.0.0/16 --dport 42267 -j DROP
iptables -A OUTPUT -p 6 --dport 8607 -s 25.95.191.0/24 --sport 26190 -j ACCEPT
iptables -A INPUT -p 23 -j ACCEPT
iptables -A test1 -p 6 --dport 50735 -d 180.81.116.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -d 211.0.40.242 --sport 41894 -s 122.62.0.0/16 -j ACCEPT
iptables -A test1 -s 27.62.136.0/24 -j DROP
iptables -A FORWARD -d 39.218.143.190 -j ACCEPT
iptables -A FORWARD -p 6 -s 53.191.0.0/16 --sport 44788 -j DROP
iptables -A FORWARD -p 17 -s 83.174.0.0/16 -d 242.201.144.119 --sport 56395 -j ACCEPT
iptables -A test1 -p 17 --sport 46645 -j DROP
iptables -A FORWARD -p 6 --sport 15629 --dport 39014 -d 251.196.240.127 -j ACCEPT
iptables -A test2 -p 6 --sport 61695 -j DROP
iptables -A test3 -p 17 --sport 10637 -s 84.235.132.62 --dport 38019 -j DROP
iptables -A FORWARD -p 6 --sport 35231 -s 31.234.0.0/16 -j DROP
iptables -A FORWARD -p 6 --dport 26464 --sport 59175 -j ACCEPT
iptables -A test2 -p 6 -d 165.22.13.158 -s 181.155.74.0/24 --sport 45233 -j ACCEPT
iptables -A OUTPUT -p 46 -d 139.222.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --dport 31103 -d 3.0.0.0/8 -s 83.11.48.12 -j DROP
iptables -A FORWARD -p 6 --dport 13268 -d 21.167.151.0/24 -s 195.79.205.164 -j ACCEPT
iptables -A test2 -p 17 --dport 33808 --sport 15240 -j ACCEPT
iptables -A INPUT -p 17 --sport 34777 --dport 30104 -d 196.143.47.54 -j ACCEPT
iptables -A test1 -d 97.27.0.0/16 -s 144.206.149.0/24 -j DROP
iptables -A FORWARD -p 6 --dport 24027 -s 95.138.174.0/24 -j DROP
iptables -A FORWARD -p 17 --dport 54339 -d 131.136.156.169 --sport 18119 -j DROP
iptables -A INPUT -p 17 --dport 15059 --sport 59302 -d 242.211.0.0/16 -j DROP
iptables -A test3 -p 17 --dport 36962 -j DROP
iptables -A INPUT -p 17 -s 76.95.42.230 -d 75.168.31.27 --sport 28106 --dport 51544 -j ACCEPT
iptables -A test2 -p 17 --sport 35857 -s 0.0.0.0/8 -j DROP
iptables -A test3 -d 163.227.153.176 -j ACCEPT
iptables -A FORWARD -d 129.237.0.0/16 -j ACCEPT
iptables -A test1 -d 73.244.248.167 -p 15 -j ACCEPT
iptables -A INPUT -p 6 --sport 31062 --dport 33661 -j ACCEPT
iptables -A FORWARD -s 67.167.0.0/16 -j DROP
iptables -A test1 -p 6 --sport 26484 -d 89.81.204.98 -j DROP
iptables -A OUTPUT -p 6 -d 42.87.208.133 --dport 55741 --sport 13965 -j DROP
iptables -A FORWARD -p 6 --sport 49504 -j DROP
iptables -A test3 -p 6 -s 17.0.0.0/8 -d 198.0.0.0/8 --sport 40698 -j ACCEPT
iptables -A INPUT -p 8 -s 6.150.5.118 -j DROP
iptables -A test3 -s 100.0.0.0/8 -j DROP
iptables -A test1 -d 217.218.0.0/16 -j ACCEPT
iptables -A test1 -d 86.212.0.0/16 -p 83 -j ACCEPT
iptables -A test1 -p 17 --sport 59798 -j ACCEPT
iptables -A test3 -p 6 --dport 52398 --sport 47877 -j ACCEPT
iptables -A INPUT -p 17 --sport 58616 -d 162.179.0.0/16 -s 202.201.98.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 29070 -s 243.143.105.234 --sport 50083 -d 89.11.0.0/16 -j DROP
iptables -A OUTPUT -p 101 -s 221.64.93.193 -j ACCEPT
iptables -A INPUT -p 17 --sport 31045 -j ACCEPT
iptables -A test1 -p 17 --dport 12435 --sport 47353 -j DROP
iptables -A FORWARD -p 17 --sport 19761 -s 55.38.104.87 -j DROP
iptables -A INPUT -p 6 --sport 25976 -d 37.47.37.57 -j ACCEPT
iptables -A test1 -p 6 -d 100.116.162.64 --sport 10868 --dport 31675 -j ACCEPT
iptables -A test1 -p 6 -s 200.11.0.0/16 --sport 1203 -d 228.0.0.0/8 -j DROP
iptables -A test3 -p 6 --dport 12490 -d 142.232.54.34 -j DROP
iptables -A INPUT -p 17 -d 42.47.46.168 --dport 32535 -s 4.196.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --sport 31615 -j ACCEPT
iptables -A test3 -s 44.152.134.12 -j ACCEPT
iptables -A INPUT -p 17 -s 83.150.102.203 --sport 13286 -d 58.138.221.0/24 -j ACCEPT
iptables -A INPUT -p 6 --sport 53312 --dport 6566 -s 130.82.235.149 -j ACCEPT
iptables -A INPUT -p 6 -s 229.92.11.0/24 --dport 38493 -d 49.81.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --sport 26698 -d 187.204.62.247 -j test1
iptables -A test2 -p 6 --dport 44213 --sport 65420 -j ACCEPT
iptables -A test1 -p 17 --dport 6260 --sport 45294 -j ACCEPT
iptables -A test2 -p 6 --dport 17549 -j DROP
iptables -A test3 -p 6 --dport 36452 -j ACCEPT
iptables -A INPUT -s 174.0.69.179 -j ACCEPT
iptables -A INPUT -s 47.200.227.190 -d 165.175.52.36 -j DROP
iptables -A FORWARD -p 17 -s 240.88.142.79 --dport 8817 -j DROP
iptables -A INPUT -p 17 --sport 45788 -j DROP
iptables -A INPUT -p 17 -s 180.106.193.161 --sport 26589 -d 101.2.238.51 -j DROP
iptables -A INPUT -d 35.145.0.0/16 -j DROP
iptables -A test2 -p 17 -s 189.76.63.0/24 --dport 48624 --sport 15288 -d 34.56.76.193 -j DROP
iptables -A test1 -p 17 --dport 323 -s 168.179.11.23 -j DROP
iptables -A FORWARD -p 17 --sport 22523 -s 184.194.184.171 --dport 42264 -j DROP
iptables -A INPUT -s 246.205.110.179 -j ACCEPT
iptables -A test3 -p 17 --dport 9768 --sport 227 -d 137.143.103.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 45143 -j ACCEPT
iptables -A test3 -p 6 --dport 43919 -s 209.129.180.0/24 -j ACCEPT
iptables -A INPUT -s 58.227.197.210 -j DROP
iptables -A test3 -s 143.0.0.0/8 -j DROP
iptables -A test2 -p 17 --dport 35275 -j ACCEPT
iptables -A test1 -p 17 -d 76.231.165.156 --sport 25248 --dport 38874 -j ACCEPT
iptables -A test3 -p 17 -d 186.0.0.0/8 --sport 59855 -s 45.134.0.0/16 -j ACCEPT
iptables -A test3 -p 17 -s 82.140.226.155 -d 10.104.0.0/16 --sport 20487 -j DROP
iptables -A OUTPUT -p 6 --sport 19673 --dport 27701 -j ACCEPT
iptables -A test1 -p 6 --sport 24494 -s 137.186.214.0/24 -j DROP
iptables -A test2 -s 173.100.211.0/24 -p 212 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 61608 -s 181.19.100.236 -j test2
iptables -A test3 -d 109.251.199.11 -p 90 -j ACCEPT
iptables -A INPUT -p 17 --sport 56609 --dport 1256 -d 159.152.64.0/24 -s 97.241.126.179 -j ACCEPT
iptables -A test1 -d 118.143.174.233 -j DROP
iptables -A INPUT -p 17 --dport 27628 -d 232.39.0.0/16 --sport 42053 -j ACCEPT
iptables -A INPUT -s 80.155.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -d 153.75.9.62 -s 97.82.236.4 --dport 55180 -j DROP
iptables -A OUTPUT -p 17 -d 53.138.175.81 --dport 19695 -j ACCEPT
iptables -A INPUT -p 17 --dport 30440 -d 155.167.66.251 -s 91.200.169.49 -j ACCEPT
iptables -A test2 -p 6 --sport 29795 --dport 37848 -s 254.182.155.131 -d 192.74.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --dport 47677 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 64899 -j ACCEPT
iptables -A FORWARD -p 6 --sport 23580 -j test3
iptables -A INPUT -p 6 --dport 38646 -j ACCEPT
iptables -A FORWARD -p 17 --sport 29688 -j DROP
iptables -A test2 -p 17 --dport 44116 --sport 10334 -j DROP
iptables -A test2 -p 17 --sport 30493 -s 239.223.69.26 --dport 2565 -j DROP
iptables -A OUTPUT -p 124 -s 115.215.110.190 -j ACCEPT
iptables -A test1 -s 174.72.170.236 -j ACCEPT
iptables -A test3 -p 17 --sport 22104 --dport 13180 -s 67.143.76.119 -j ACCEPT
iptables -A FORWARD -p 6 --sport 50225 -s 54.61.177.117 -j ACCEPT
iptables -A test1 -p 6 -s 200.146.0.0/16 -d 82.123.0.0/16 --dport 36297 -j ACCEPT
iptables -A test2 -p 6 -s 233.249.221.0/24 --dport 64251 --sport 5465 -j DROP
iptables -A FORWARD -p 17 -d 217.149.199.242 --sport 26779 -j ACCEPT
iptables -A FORWARD -p 17 --dport 37930 -s 224.0.0.0/8 -d 145.0.0.0/8 -j DROP
iptables -A test2 -p 17 --sport 14124 -d 83.200.93.0/24 --dport 16912 -j ACCEPT
iptables -A INPUT -d 50.114.201.229 -p 95 -j DROP
iptables -A test3 -p 6 -s 0.0.0.0/8 -d 46.26.57.144 --sport 25719 -j DROP
iptables -A FORWARD -p 6 --sport 61135 -d 110.141.143.166 -j ACCEPT
iptables -A INPUT -p 6 --dport 15374 -j ACCEPT
iptables -A test3 -p 17 --dport 13354 -j ACCEPT
iptables -A INPUT -p 6 --dport 39224 --sport 24421 -d 92.0.0.0/8 -j DROP
iptables -A test1 -s 206.145.0.0/16 -j DROP
iptables -A test2 -d 223.19.136.0/24 -s 70.238.46.25 -p 48 -j DROP
iptables -A INPUT -p 6 -d 80.171.219.169 --dport 27086 -j DROP
iptables -A test2 -p 17 -d 4.120.88.87 --sport 52848 -j DROP
iptables -A test2 -p 6 --dport 4117 -j ACCEPT
iptables -A FORWARD -p 17 --sport 4439 -j ACCEPT
iptables -A test3 -p 17 --sport 10459 -j DROP
iptables -A FORWARD -d 90.138.124.0/24 -j DROP
iptables -A INPUT -p 17 -d 55.151.233.159 --sport 12416 -j DROP
iptables -A test2 -p 17 -s 235.41.189.1 --sport 55795 -j ACCEPT
iptables -A FORWARD -p 6 -d 248.177.0.0/16 -s 2.184.157.176 --sport 61824 --dport 10419 -j DROP
iptables -A test3 -p 17 --sport 39769 -j DROP
iptables -A INPUT -p 6 --dport 31401 --sport 34043 -s 55.95.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --sport 32025 -j DROP
iptables -A test3 -p 17 --sport 34011 -d 223.0.0.0/8 -s 126.4.66.211 -j ACCEPT
iptables -A FORWARD -p 150 -j ACCEPT
iptables -A test1 -p 17 -s 29.174.213.45 --dport 41776 -j DROP
iptables -A test3 -p 158 -j DROP
iptables -A OUTPUT -p 6 -s 205.3.0.0/16 --sport 35699 --dport 18016 -d 80.44.12.132 -j ACCEPT
iptables -A test2 -d 197.29.153.198 -p 1 -j ACCEPT
iptables -A test3 -s 204.214.13.146 -d 128.98.176.0/24 -p 181 -j DROP
iptables -A test1 -p 17 -d 48.8.218.0/24 --sport 2552 --dport 13936 -s 197.164.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 66 -j ACCEPT
iptables -A FORWARD -p 17 --sport 13792 --dport 17645 -j DROP
iptables -A test3 -p 6 --dport 25363 -s 212.118.209.0/24 -j ACCEPT
iptables -A INPUT -p 17 --sport 14742 --dport 50917 -j DROP
iptables -A test3 -p 6 -s 249.33.223.209 --dport 29238 -d 102.66.177.131 --sport 19058 -j DROP
iptables -A OUTPUT -p 17 -d 174.31.172.215 --sport 42271 -j DROP
iptables -A FORWARD -p 17 -d 128.194.201.65 --dport 38371 -j ACCEPT
iptables -A OUTPUT -s 54.201.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --dport 13610 --sport 19814 -j DROP
iptables -A FORWARD -p 6 --sport 42437 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 17205 -j ACCEPT
iptables -A test3 -p 17 -s 246.134.0.0/16 --dport 10806 -j DROP
iptables -A test3 -p 17 --dport 4126 -j DROP
iptables -A test1 -p 17 -s 116.67.37.0/24 --dport 38632 -d 241.65.244.223 -j ACCEPT
iptables -A OUTPUT -p 17 -d 151.0.0.0/8 --dport 29823 -j DROP
iptables -A INPUT -p 87 -d 149.63.0.0/16 -s 155.87.177.0/24 -j test2
iptables -A test1 -p 131 -s 84.0.0.0/8 -j DROP
iptables -A test2 -p 6 --sport 65534 -d 183.93.5.0/24 --dport 36970 -j DROP
iptables -A test2 -p 6 -d 55.14.222.167 -s 249.253.111.173 --dport 37577 -j DROP
iptables -A test1 -p 6 --sport 62382 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 13188 -j ACCEPT
iptables -A FORWARD -p 6 --dport 18188 -s 207.5.54.113 -j test3
iptables -A test2 -p 6 -s 231.238.13.127 --dport 62865 -j DROP
iptables -A test1 -p 6 --sport 816 -s 103.0.0.0/8 -d 194.0.0.0/8 --dport 330 -j DROP
iptables -A FORWARD -p 17 --sport 23328 -j ACCEPT
iptables -A INPUT -s 183.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 -d 190.55.105.172 --dport 3494 -j DROP
iptables -A test2 -p 6 -s 205.175.63.189 --dport 55159 -d 89.223.150.229 -j DROP
iptables -A test3 -d 178.42.254.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 27097 --dport 63260 -s 244.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 -d 160.187.157.0/24 --sport 55626 --dport 62993 -j test3
iptables -A OUTPUT -p 17 --dport 3349 -j ACCEPT
iptables -A test2 -p 17 --sport 42726 -d 67.135.221.250 -j DROP
iptables -A OUTPUT -p 17 --dport 30829 --sport 1653 -j DROP
iptables -A INPUT -d 64.26.242.0/24 -p 181 -j test2
iptables -A test1 -p 17 -d 252.102.101.0/24 --sport 29673 -j ACCEPT
iptables -A test1 -p 17 --sport 48042 -s 230.210.205.126 -j DROP
iptables -A OUTPUT -p 17 --sport 30780 -j DROP
iptables -A test2 -p 17 --dport 12762 -s 136.75.0.0/16 -d 81.116.144.14 --sport 61919 -j ACCEPT
iptables -A test1 -p 167 -s 66.169.108.107 -j DROP
iptables -A test2 -p 17 --sport 14149 -s 196.75.48.60 -d 62.83.147.0/24 --dport 26688 -j ACCEPT
iptables -A test2 -p 6 -d 21.0.0.0/8 --sport 18436 --dport 4141 -j ACCEPT
iptables -A FORWARD -p 17 --sport 60663 -j DROP
iptables -A test1 -s 203.41.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 13766 --sport 15311 -s 44.244.66.27 -j DROP
iptables -A INPUT -p 6 --dport 3401 --sport 51507 -s 225.163.6.0/24 -d 240.110.196.11 -j DROP
iptables -A test2 -d 83.243.221.84 -p 185 -j ACCEPT
iptables -A OUTPUT -p 6 -d 189.199.148.187 --sport 17693 --dport 8130 -s 83.40.67.0/24 -j DROP
iptables -A OUTPUT -p 17 --dport 19588 --sport 34354 -d 67.11.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 30860 -s 22.123.126.176 --dport 49625 -j DROP
iptables -A test1 -p 6 --sport 29960 -d 232.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 -s 244.52.0.0/16 --sport 31431 --dport 58342 -j DROP
iptables -A test3 -p 17 --sport 59678 -d 9.52.76.221 --dport 26181 -j DROP
iptables -A test2 -d 250.211.245.108 -s 57.30.123.32 -j ACCEPT
iptables -A INPUT -p 6 --dport 36697 -j ACCEPT
iptables -A test3 -p 6 --sport 62188 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 39136 -s 239.0.0.0/8 -j ACCEPT
iptables -A test2 -s 3.203.0.0/16 -j DROP
iptables -A OUTPUT -d 253.91.30.64 -p 115 -j DROP
iptables -A test2 -d 138.158.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 35968 --dport 56309 -j DROP
iptables -A OUTPUT -p 17 --sport 34405 -j DROP
iptables -A test2 -p 6 --dport 16356 --sport 37913 -d 99.103.0.0/16 -j DROP
iptables -A test1 -p 6 -s 75.136.127.30 -d 191.0.0.0/8 --dport 61791 -j ACCEPT
iptables -A FORWARD -p 224 -j ACCEPT
iptables -A test3 -s 44.204.182.205 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 35468 --sport 10994 -j ACCEPT
iptables -A FORWARD -p 17 -d 230.233.190.97 --sport 31474 --dport 8877 -j DROP
iptables -A test2 -d 152.246.0.0/16 -j DROP
iptables -A test2 -p 6 -s 121.239.0.0/16 --dport 59520 -d 159.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 212 -j ACCEPT
iptables -A OUTPUT -p 6 -d 43.158.93.39 --sport 32432 -j ACCEPT
iptables -A test2 -p 17 --sport 46328 -d 146.242.0.0/16 --dport 7274 -j DROP
iptables -A OUTPUT -p 6 --sport 4626 --dport 31948 -d 119.0.156.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 13480 --sport 33351 -s 217.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --dport 49436 -j ACCEPT
iptables -A test3 -p 17 -d 83.44.221.195 --dport 55732 -s 13.0.0.0/8 -j DROP
iptables -A INPUT -p 17 -d 163.0.0.0/8 -s 116.14.125.30 --sport 1248 -j DROP
iptables -A FORWARD -p 17 --dport 10006 -s 242.189.175.205 -j ACCEPT
iptables -A test1 -p 6 -d 96.105.0.0/16 --dport 28714 -s 230.204.219.10 -j DROP
iptables -A INPUT -s 88.236.0.0/16 -j test2
iptables -A INPUT -p 6 --sport 25426 -j DROP
iptables -A test2 -d 208.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --sport 37987 -s 45.137.173.40 --dport 6119 -d 136.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --sport 60924 -s 24.151.18.232 -d 162.238.205.194 -j ACCEPT
iptables -A test3 -p 197 -d 194.61.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 36507 -j DROP
iptables -A INPUT -p 6 -s 183.76.0.0/16 --sport 63164 --dport 764 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 25348 --dport 5430 -s 35.232.237.0/24 -j DROP
iptables -A OUTPUT -p 17 -d 205.15.170.0/24 --dport 21435 -j DROP
iptables -A FORWARD -p 6 --sport 61650 -j ACCEPT
iptables -A test2 -p 6 --sport 28644 -j DROP
iptables -A test3 -p 17 --dport 61314 -j DROP
iptables -A test2 -p 6 -d 15.30.152.138 --sport 45574 --dport 23163 -s 32.91.240.70 -j ACCEPT
iptables -A INPUT -p 6 -s 232.225.106.18 --dport 61256 -d 102.116.232.182 --sport 54054 -j ACCEPT
iptables -A test3 -p 17 --sport 17402 --dport 34063 -d 2.226.254.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 64248 -d 67.0.0.0/8 -j DROP
iptables -A test3 -d 94.222.44.103 -s 106.229.20.223 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 47005 -s 68.235.91.138 -j ACCEPT
iptables -A FORWARD -s 51.28.0.0/16 -j DROP
iptables -A FORWARD -p 6 --dport 14409 -j ACCEPT
iptables -A FORWARD -p 6 --sport 62178 -s 167.108.203.175 --dport 51083 -j DROP
iptables -A INPUT -p 17 -d 216.240.112.0/24 --sport 23407 -j ACCEPT
iptables -A FORWARD -p 6 -d 212.0.0.0/8 --dport 63443 --sport 4196 -s 235.94.123.51 -j ACCEPT
iptables -A OUTPUT -p 6 -s 128.121.63.101 --sport 761 --dport 9859 -j ACCEPT
iptables -A test3 -p 17 --sport 4578 -j ACCEPT
iptables -A INPUT -p 6 --sport 20143 --dport 3276 -d 127.244.0.0/16 -s 227.0.0.0/8 -j DROP
iptables -A test1 -p 17 -d 212.204.249.0/24 -s 102.34.130.116 --sport 30121 -j DROP
iptables -A FORWARD -p 17 --dport 35441 -j DROP
iptables -A test1 -p 17 --dport 56207 -d 75.8.145.189 -j ACCEPT
iptables -A INPUT -p 17 -d 171.104.0.0/16 --sport 48569 -s 28.217.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 41635 --dport 29083 -j DROP
iptables -A OUTPUT -p 17 --dport 26168 -s 73.112.51.169 -j DROP
iptables -A OUTPUT -p 17 --dport 62753 -d 199.18.164.67 -s 14.20.41.65 --sport 54201 -j DROP
iptables -A FORWARD -p 6 --dport 50215 -j ACCEPT
iptables -A test1 -p 17 --dport 51945 --sport 630 -j DROP
iptables -A test2 -p 6 -s 129.144.12.0/24 --sport 49608 --dport 42277 -j ACCEPT
iptables -A test3 -p 6 --sport 24108 -j ACCEPT
iptables -A test3 -s 88.230.0.0/16 -d 212.218.252.247 -p 168 -j ACCEPT
iptables -A FORWARD -p 121 -s 198.192.210.0/24 -j ACCEPT
iptables -A test1 -p 82 -j DROP
iptables -A test1 -p 17 --dport 12972 -j DROP
iptables -A test3 -p 6 -s 5.161.60.0/24 --sport 21758 -j DROP
iptables -A OUTPUT -p 17 --dport 1975 -d 44.58.250.159 -s 71.91.42.97 -j DROP
iptables -A test1 -p 6 --sport 40617 -j DROP
iptables -A OUTPUT -p 170 -d 175.0.0.0/8 -j ACCEPT
iptables -A INPUT -d 190.27.203.0/24 -s 90.58.0.0/16 -j DROP
iptables -A test1 -p 17 --dport 57922 -j DROP
iptables -A FORWARD -p 17 -s 220.0.0.0/8 --sport 10839 -d 125.89.0.0/16 --dport 42314 -j DROP
iptables -A INPUT -p 248 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 59985 -s 19.244.226.46 --sport 21213 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 50374 --dport 62356 -j DROP
iptables -A FORWARD -p 17 --sport 19320 -d 35.58.194.0/24 -s 144.238.32.50 -j DROP
iptables -A INPUT -p 6 --sport 7510 -j ACCEPT
iptables -A INPUT -p 6 --sport 33145 -d 230.28.19.28 -s 182.0.0.0/8 --dport 22013 -j ACCEPT
iptables -A FORWARD -p 6 -s 210.31.0.0/16 --sport 63867 -j DROP
iptables -A test3 -d 206.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --sport 48157 --dport 24579 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 54187 -s 111.155.253.209 -j ACCEPT
iptables -A test1 -d 114.204.0.0/16 -s 242.0.0.0/8 -j DROP
iptables -A test2 -s 129.197.103.4 -j DROP
iptables -A INPUT -p 6 -s 159.202.224.6 -d 100.246.0.0/16 --dport 31869 -j ACCEPT
iptables -A FORWARD -p 6 -s 66.86.55.70 --sport 52859 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 24278 -j DROP
iptables -A INPUT -p 17 --sport 18760 --dport 41393 -j DROP
iptables -A test2 -p 6 -s 219.0.0.0/8 --sport 54680 --dport 50804 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 9572 --sport 40644 -j ACCEPT
iptables -A test1 -s 101.124.174.0/24 -d 229.186.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 -d 247.18.82.25 --sport 21057 -s 92.232.230.0/24 -j test1
iptables -A test2 -p 17 --sport 53735 -j ACCEPT
iptables -A FORWARD -p 17 -s 198.0.0.0/8 --sport 50939 -d 59.0.0.0/8 -j DROP
iptables -A test1 -p 6 --sport 23925 -s 50.0.0.0/8 -j ACCEPT
iptables -A test1 -d 142.3.234.160 -p 34 -j ACCEPT
iptables -A INPUT -p 17 -d 127.145.175.139 -s 87.168.117.96 --dport 11138 -j DROP
iptables -A FORWARD -p 17 -d 2.75.63.245 --dport 59090 -j test1
iptables -A test2 -p 6 --dport 20692 -j DROP
iptables -A test1 -d 45.188.150.18 -p 168 -s 78.89.18.222 -j ACCEPT
iptables -A test3 -s 134.0.0.0/8 -j DROP
iptables -A test3 -s 128.196.224.0/24 -j DROP
iptables -A INPUT -p 6 -s 71.200.0.0/16 --sport 49435 --dport 46386 -j test2
iptables -A INPUT -p 6 -s 24.235.43.243 -d 103.141.0.0/16 --sport 63792 -j ACCEPT
iptables -A INPUT -s 70.146.165.0/24 -d 229.212.79.35 -j DROP
iptables -A test3 -p 17 -s 110.0.0.0/8 --dport 36098 --sport 22626 -j DROP
iptables -A FORWARD -p 6 --sport 30378 --dport 56577 -j ACCEPT
iptables -A test1 -p 17 --dport 11767 --sport 51540 -j DROP
iptables -A INPUT -d 192.101.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 --sport 2074 -d 87.0.0.0/8 -s 77.230.0.0/16 -j DROP
iptables -A test2 -p 17 -d 111.213.228.9 -s 73.85.0.0/16 --dport 51387 -j ACCEPT
iptables -A FORWARD -p 6 -s 208.103.0.0/16 -d 173.68.183.176 --sport 3932 -j DROP
iptables -A test2 -p 17 --dport 23016 -d 41.73.172.4 -j DROP
iptables -A FORWARD -p 17 --dport 24883 -s 138.151.0.0/16 -j test1
iptables -A FORWARD -p 17 --dport 43844 -d 43.70.40.212 -j ACCEPT
iptables -A test2 -p 6 -d 203.50.223.192 -s 70.43.188.32 --dport 27994 -j ACCEPT
iptables -A test2 -p 17 --sport 5327 -j ACCEPT
iptables -A test3 -p 141 -s 207.240.156.91 -d 62.49.117.253 -j DROP
iptables -A OUTPUT -p 17 --sport 49428 -d 138.142.93.242 -s 58.107.250.242 -j DROP
iptables -A OUTPUT -p 6 --sport 43388 -j ACCEPT
iptables -A FORWARD -p 17 --sport 13348 --dport 28383 -j DROP
iptables -A test1 -p 6 --sport 59909 -d 254.107.132.96 -j DROP
iptables -A INPUT -p 17 -s 216.0.0.0/8 --sport 34532 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 51689 --sport 8952 -s 94.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 -d 8.68.243.0/24 --sport 39430 -j DROP
iptables -A test2 -p 6 --dport 40526 -s 88.153.33.227 -j DROP
iptables -A OUTPUT -p 6 --dport 19755 -j ACCEPT
iptables -A OUTPUT -p 183 -j DROP
iptables -A test2 -d 131.224.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 6921 --dport 397 -d 186.171.209.0/24 -j DROP
iptables -A test2 -p 17 --dport 44362 --sport 39476 -s 143.141.180.233 -j ACCEPT
iptables -A test1 -p 17 -s 91.0.0.0/8 --dport 8958 --sport 59701 -j ACCEPT
iptables -A test1 -p 17 -d 67.168.198.171 --sport 17498 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 10165 --sport 45281 -d 88.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 652 --sport 46577 -j DROP
iptables -A INPUT -p 17 --sport 19605 --dport 48744 -j DROP
iptables -A OUTPUT -p 17 --dport 56147 -d 66.98.8.134 -j DROP
iptables -A FORWARD -p 17 --sport 16307 -s 106.28.237.122 -d 150.246.209.180 -j DROP
iptables -A test1 -p 17 -d 191.103.0.0/16 --dport 3238 --sport 27251 -j ACCEPT
iptables -A test1 -p 17 --sport 44994 --dport 51004 -d 196.22.107.0/24 -j DROP
iptables -A OUTPUT -p 224 -j DROP
iptables -A test3 -p 6 -s 195.0.0.0/8 -d 160.35.244.25 --dport 7518 -j DROP
iptables -A test2 -d 142.117.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 54211 -j ACCEPT
iptables -A test1 -p 6 --sport 30582 -s 211.218.231.23 --dport 6515 -j DROP
iptables -A OUTPUT -p 6 --sport 46462 --dport 10171 -s 15.231.135.0/24 -j ACCEPT
iptables -A OUTPUT -p 23 -s 94.170.9.71 -j ACCEPT
iptables -A test2 -p 6 --dport 29693 --sport 44004 -d 113.198.41.0/24 -j ACCEPT
iptables -A test2 -p 72 -j ACCEPT
iptables -A test2 -p 17 -s 230.133.0.0/16 -d 17.227.231.177 --dport 5847 -j DROP
iptables -A FORWARD -p 17 --dport 1228 -j DROP
iptables -A FORWARD -p 6 --sport 28084 -d 133.44.26.133 -s 23.181.62.5 -j DROP
iptables -A OUTPUT -p 6 --sport 64972 -s 87.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --dport 8526 -s 121.113.0.0/16 --sport 2436 -j DROP
iptables -A FORWARD -s 127.131.4.240 -j ACCEPT
iptables -A FORWARD -d 131.0.0.0/8 -p 10 -s 179.14.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --dport 203 -j ACCEPT
iptables -A test1 -p 17 -s 216.45.0.0/16 --dport 33378 -j ACCEPT
iptables -A FORWARD -p 17 -d 154.201.184.163 --dport 33039 -j ACCEPT
iptables -A test2 -p 17 -s 136.111.0.0/16 --dport 59754 -d 3.98.121.5 -j ACCEPT
iptables -A INPUT -d 238.234.19.225 -j ACCEPT
iptables -A test1 -p 17 --sport 52182 -j DROP
iptables -A FORWARD -p 6 -d 192.138.115.62 -s 28.0.0.0/8 --dport 20852 -j DROP
iptables -A OUTPUT -p 17 -d 116.91.126.251 -s 23.182.174.13 --sport 52406 -j DROP
iptables -A test2 -p 6 -d 20.105.158.0/24 --dport 54438 --sport 33038 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 46908 -d 198.199.0.0/16 --dport 63856 -j ACCEPT
iptables -A INPUT -p 17 --dport 53160 -d 45.0.0.0/8 --sport 27376 -j ACCEPT
iptables -A test2 -p 6 --sport 46873 -j DROP
iptables -A test1 -p 73 -j DROP
iptables -A test1 -p 6 -s 94.237.9.140 --sport 38007 -d 42.192.166.87 -j ACCEPT
iptables -A test3 -p 164 -d 195.194.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --sport 64667 -s 56.8.147.250 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 51859 --dport 25886 -d 138.203.0.0/16 -j ACCEPT
iptables -A test1 -p 17 -s 239.90.89.84 --dport 59824 -j DROP
iptables -A test3 -p 206 -j DROP
iptables -A test2 -p 6 --sport 29175 -s 136.77.196.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 8598 -d 50.0.0.0/8 -j DROP
iptables -A test1 -p 6 --dport 60629 --sport 63902 -s 59.7.120.243 -j ACCEPT
iptables -A test3 -p 17 -s 200.63.65.83 --sport 34683 -j DROP
iptables -A FORWARD -p 200 -j DROP
iptables -A INPUT -p 17 --sport 32716 -j DROP
iptables -A test2 -p 6 -s 167.199.77.0/24 --dport 27351 --sport 8098 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 3884 -j ACCEPT
iptables -A test1 -p 17 --dport 47043 -j ACCEPT
iptables -A test3 -p 6 --dport 61958 -j DROP
iptables -A test3 -p 6 --dport 64798 --sport 48845 -s 25.109.199.193 -j ACCEPT
iptables -A FORWARD -s 3.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 --sport 46997 --dport 10642 -s 158.213.122.137 -j DROP
iptables -A test2 -p 6 --sport 17746 -d 130.185.62.0/24 -s 189.83.0.0/16 -j DROP
iptables -A OUTPUT -d 96.41.63.0/24 -p 189 -j DROP
iptables -A test3 -p 6 --sport 63583 -j DROP
iptables -A test1 -p 6 --dport 19242 -d 242.71.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 13 -j DROP
iptables -A test1 -p 17 --dport 16693 -s 248.97.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 -d 77.64.180.0/24 --sport 6948 -j ACCEPT
iptables -A INPUT -s 136.236.37.84 -p 203 -d 137.143.189.167 -j DROP
iptables -A FORWARD -p 6 -d 19.208.158.148 --dport 27365 -j ACCEPT
iptables -A test2 -d 126.247.144.42 -s 153.118.120.131 -j DROP
iptables -A test1 -p 17 -s 254.84.0.0/16 --dport 16561 -j DROP
iptables -A FORWARD -p 6 --dport 46239 -s 4.180.184.14 --sport 45432 -j DROP
iptables -A test3 -p 17 -s 246.167.73.156 --sport 50747 -d 106.129.44.17 -j DROP
iptables -A test2 -p 117 -s 75.88.0.0/16 -j DROP
iptables -A test1 -s 255.175.0.0/16 -d 107.30.225.161 -j DROP
iptables -A FORWARD -p 17 --dport 15532 -d 205.246.0.0/16 -j DROP
iptables -A test1 -s 159.203.0.0/16 -d 71.0.0.0/8 -j DROP
iptables -A INPUT -p 17 -d 208.17.60.142 --sport 6620 -j ACCEPT
iptables -A INPUT -p 17 --dport 29335 -d 203.140.142.253 --sport 20393 -j ACCEPT
iptables -A test2 -p 6 -s 49.0.0.0/8 -d 58.233.172.0/24 --dport 31225 -j ACCEPT
iptables -A FORWARD -p 6 -d 185.92.63.132 --dport 25298 --sport 41674 -j ACCEPT
iptables -A test2 -p 6 -d 72.171.169.162 --dport 18886 --sport 41901 -j DROP
iptables -A FORWARD -p 17 --dport 31649 -s 107.0.0.0/8 -j test1
iptables -A test1 -p 6 --sport 22360 -s 30.98.84.99 -j ACCEPT
iptables -A test2 -p 17 --dport 2486 -s 205.0.0.0/8 -j DROP
iptables -A test1 -d 32.212.70.3 -j ACCEPT
iptables -A test1 -p 6 -d 212.185.0.0/16 --dport 23914 --sport 47020 -j DROP
iptables -A OUTPUT -p 17 --sport 54625 -j ACCEPT
iptables -A INPUT -p 6 --dport 55348 -s 86.222.251.213 --sport 57755 -j test2
iptables -A FORWARD -p 17 --dport 37719 -j ACCEPT
iptables -A INPUT -s 232.0.0.0/8 -j DROP
iptables -A OUTPUT -p 17 -s 38.0.0.0/8 --dport 49342 --sport 4030 -j ACCEPT
iptables -A test1 -p 173 -s 12.249.5.93 -j DROP
iptables -A test2 -p 98 -d 0.188.0.0/16 -j DROP
iptables -A INPUT -p 17 -s 50.49.88.166 --sport 28253 -j ACCEPT
iptables -A test2 -p 6 --dport 32056 -d 224.192.188.0/24 --sport 3010 -j ACCEPT
iptables -A test2 -s 133.175.127.53 -j ACCEPT
iptables -A INPUT -d 38.161.47.140 -s 161.148.114.0/24 -j DROP
iptables -A test1 -p 6 --dport 24940 -d 57.110.30.134 -j ACCEPT
iptables -A test3 -p 6 --dport 56015 -s 171.131.63.254 --sport 25553 -j ACCEPT
iptables -A test1 -p 6 --dport 11060 -d 154.132.0.0/16 -s 35.253.213.0/24 -j DROP
iptables -A test1 -p 17 --dport 49896 -j DROP
iptables -A test1 -p 17 -s 199.123.26.0/24 --sport 17606 -j DROP
iptables -A FORWARD -p 160 -d 45.148.254.183 -j DROP
iptables -A OUTPUT -p 6 --dport 39692 -s 145.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 11721 --sport 32641 -j ACCEPT
iptables -A FORWARD -p 17 --dport 45306 -j ACCEPT
iptables -A test1 -p 6 --dport 64649 -s 113.0.0.0/8 -d 150.166.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -d 63.0.0.0/8 --dport 40911 --sport 44974 -j DROP
iptables -A test1 -p 6 --sport 33879 --dport 54369 -j DROP
iptables -A OUTPUT -p 133 -j test2
iptables -A OUTPUT -p 17 --sport 17539 -j ACCEPT
iptables -A test2 -d 235.210.22.113 -j DROP
iptables -A FORWARD -p 17 --sport 3942 --dport 14438 -j DROP
iptables -A INPUT -d 80.0.0.0/8 -j DROP
iptables -A test3 -s 125.10.252.198 -j DROP
iptables -A test3 -p 17 --sport 31211 -j DROP
iptables -A test3 -p 17 --sport 50032 -j ACCEPT
iptables -A FORWARD -p 108 -d 6.29.167.77 -j DROP
iptables -A test1 -p 17 --dport 58295 -d 44.60.148.0/24 -j DROP
iptables -A test3 -p 17 -d 186.231.0.0/16 --dport 6717 -s 134.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 29328 --sport 63181 -j DROP
iptables -A test2 -p 6 --dport 14991 -j ACCEPT
iptables -A test3 -p 17 --dport 33502 -s 119.51.0.0/16 -d 184.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 22562 -j ACCEPT
iptables -A INPUT -p 17 --dport 60754 -s 233.193.0.0/16 -j DROP
iptables -A test3 -p 17 --dport 33097 -j DROP
iptables -A FORWARD -p 6 -s 60.40.92.0/24 --dport 41478 -j ACCEPT
iptables -A FORWARD -p 17 --sport 19084 -d 58.16.112.118 --dport 60025 -j DROP
iptables -A INPUT -s 86.66.244.0/24 -j test2
iptables -A test2 -p 17 -s 90.60.0.0/16 --dport 1223 -j ACCEPT
iptables -A INPUT -p 6 --dport 51451 --sport 63909 -d 32.125.84.128 -s 197.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --sport 48294 --dport 7471 -d 174.129.56.183 -j DROP
iptables -A OUTPUT -p 17 --dport 13991 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 30569 -j DROP
iptables -A OUTPUT -p 6 --sport 40043 --dport 27494 -j ACCEPT
iptables -A test2 -p 17 --sport 9076 -s 115.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --sport 4959 -s 188.182.107.21 -j ACCEPT
iptables -A FORWARD -p 17 --dport 13910 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 21958 -j ACCEPT
iptables -A test3 -p 6 --sport 16829 -d 173.191.47.153 --dport 56706 -j ACCEPT
iptables -A INPUT -p 17 --dport 59495 -d 233.210.228.220 -j ACCEPT
iptables -A test3 -s 197.152.82.187 -j DROP
iptables -A OUTPUT -p 17 --sport 34046 --dport 46932 -d 220.71.250.39 -j ACCEPT
iptables -A test3 -p 6 --sport 47157 -s 228.48.84.127 -j DROP
iptables -A test3 -s 23.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --dport 61874 -j test1
iptables -A INPUT -p 6 -s 177.230.253.149 --dport 43150 -d 160.63.147.164 -j DROP
iptables -A test2 -p 17 -s 95.0.0.0/8 --sport 16854 -d 173.212.206.0/24 -j DROP
iptables -A test2 -p 6 --sport 57721 -s 46.98.190.252 --dport 46827 -j DROP
iptables -A test3 -p 6 --sport 12489 -j ACCEPT
iptables -A test3 -p 17 -d 184.111.70.140 --sport 24160 -j ACCEPT
iptables -A test1 -d 8.93.32.191 -s 77.191.82.72 -p 162 -j DROP
iptables -A test2 -p 17 -s 205.209.0.0/16 -d 200.204.93.193 --sport 11212 -j ACCEPT
iptables -A test3 -p 6 -d 201.126.38.0/24 -s 63.107.99.247 --dport 43709 -j DROP
iptables -A test1 -p 17 --dport 64835 -j DROP
iptables -A test2 -d 98.241.175.0/24 -p 235 -j DROP
iptables -A INPUT -p 6 --dport 41196 -j DROP
iptables -A OUTPUT -s 127.74.129.89 -d 195.0.0.0/8 -p 176 -j ACCEPT
iptables -A test1 -p 6 --sport 23629 --dport 31010 -j ACCEPT
iptables -A test3 -p 6 --sport 33503 -j ACCEPT
iptables -A test1 -p 17 --sport 16053 --dport 56700 -j DROP
iptables -A OUTPUT -p 6 --dport 14532 -s 164.15.203.164 --sport 32784 -j ACCEPT
iptables -A FORWARD -p 6 --sport 12611 -d 238.105.219.119 --dport 46962 -j DROP
iptables -A test1 -p 6 -d 250.35.107.177 -s 42.218.0.0/16 --sport 56856 -j ACCEPT
iptables -A INPUT -p 6 --sport 24000 --dport 9626 -j test3
iptables -A test1 -s 168.12.0.0/16 -d 177.102.70.197 -j DROP
iptables -A test2 -s 156.64.0.0/16 -p 174 -j ACCEPT
iptables -A FORWARD -p 17 -d 17.75.64.157 --dport 12006 -s 33.0.0.0/8 -j ACCEPT
iptables -A test3 -d 239.0.0.0/8 -p 184 -j ACCEPT
iptables -A test1 -p 17 -d 142.104.28.135 --dport 23121 -j ACCEPT
iptables -A test1 -p 6 --dport 19089 -s 27.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 51076 -d 211.5.250.0/24 -j DROP
iptables -A OUTPUT -p 17 --sport 41521 -d 102.0.0.0/8 -s 158.59.255.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --dport 3227 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 3164 -j ACCEPT
iptables -A OUTPUT -p 17 -d 89.65.226.152 -s 50.94.0.0/16 --sport 2848 -j DROP
iptables -A FORWARD -p 6 --dport 27139 -d 217.29.0.0/16 -s 168.65.0.0/16 -j DROP
iptables -A INPUT -p 17 -d 252.8.218.0/24 --sport 33980 -j ACCEPT
iptables -A test3 -p 17 --sport 64571 --dport 51836 -d 88.104.189.250 -j ACCEPT
iptables -A test3 -p 141 -j ACCEPT
iptables -A INPUT -p 17 -d 117.59.139.77 --dport 15998 --sport 63708 -j ACCEPT
iptables -A FORWARD -d 182.197.0.0/16 -s 230.111.73.253 -p 76 -j DROP
iptables -A test1 -p 17 -s 45.252.192.122 --sport 5035 -j ACCEPT
iptables -A test1 -p 6 --sport 31409 -d 178.141.158.12 -j ACCEPT
iptables -A FORWARD -p 17 --dport 59898 -d 241.46.0.0/16 -s 219.193.128.221 -j DROP
iptables -A INPUT -s 98.51.25.0/24 -p 118 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 44925 -s 114.3.119.0/24 --sport 36227 -j DROP
iptables -A INPUT -p 6 --dport 46065 -s 184.0.0.0/8 -d 90.100.0.0/16 -j ACCEPT
iptables -A test2 -p 157 -d 6.162.147.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --dport 31262 --sport 15791 -d 232.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -s 205.0.0.0/8 --sport 17634 -j test3
iptables -A test1 -s 31.136.239.47 -p 94 -d 108.42.0.0/16 -j DROP
iptables -A INPUT -p 6 --dport 14981 -s 171.239.96.253 --sport 48856 -j test1
iptables -A test2 -p 6 --dport 30925 -j DROP
iptables -A test2 -p 141 -j ACCEPT
iptables -A test1 -p 17 -s 92.190.104.3 -d 234.0.0.0/8 --sport 61924 -j ACCEPT
iptables -A test3 -s 176.38.107.97 -d 92.111.0.0/16 -j DROP
iptables -A FORWARD -d 26.0.0.0/8 -j DROP
iptables -A test2 -s 92.103.12.185 -p 23 -j DROP
iptables -A test3 -p 6 --dport 47895 -s 39.138.72.155 -j ACCEPT
iptables -A test3 -p 6 --dport 1690 -j ACCEPT
iptables -A test3 -p 6 -d 149.0.0.0/8 --sport 54346 -j DROP
iptables -A FORWARD -p 6 --sport 29122 --dport 23847 -d 65.105.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --dport 32223 -s 8.0.0.0/8 --sport 19290 -j DROP
iptables -A FORWARD -p 6 --dport 29277 -j DROP
iptables -A INPUT -p 6 -s 239.105.184.202 --dport 56715 --sport 44822 -j ACCEPT
iptables -A INPUT -p 6 -s 123.140.230.0/24 --sport 10927 -d 23.177.62.246 --dport 3335 -j ACCEPT
iptables -A FORWARD -p 6 -s 106.233.221.215 --sport 47809 -j DROP
iptables -A FORWARD -p 17 --sport 387 --dport 15610 -s 121.58.179.131 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 31118 --dport 29104 -j DROP
iptables -A test1 -s 98.0.0.0/8 -j DROP
iptables -A test1 -p 17 --sport 20809 -j DROP
iptables -A test2 -p 96 -j ACCEPT
iptables -A INPUT -p 17 -s 109.58.15.186 -d 141.197.0.0/24 --dport 26931 --sport 59728 -j ACCEPT
iptables -A FORWARD -d 164.0.0.0/8 -p 170 -j DROP
iptables -A test2 -p 6 --sport 9941 -j ACCEPT
iptables -A OUTPUT -p 17 -s 155.46.27.81 --dport 11209 -j DROP
iptables -A FORWARD -p 6 -d 136.72.6.0/24 --sport 39687 -s 102.142.228.224 -j DROP
iptables -A INPUT -p 17 --sport 7494 -j DROP
iptables -A FORWARD -d 228.214.239.135 -j ACCEPT
iptables -A test2 -d 133.208.158.232 -s 162.171.131.242 -p 19 -j ACCEPT
iptables -A test2 -p 6 --dport 9390 -j ACCEPT
iptables -A test3 -p 6 --dport 49865 -d 164.0.0.0/8 --sport 28175 -j ACCEPT
iptables -A test2 -p 6 --dport 4973 -s 207.124.10.0/24 -j DROP
iptables -A test1 -p 17 -s 247.210.210.223 --dport 28484 --sport 3147 -j ACCEPT
iptables -A test2 -p 17 -s 4.0.0.0/8 --sport 55814 -j ACCEPT
iptables -A FORWARD -p 6 -s 193.250.15.12 -d 192.224.0.0/16 --sport 35007 -j ACCEPT
iptables -A INPUT -p 17 -s 237.248.212.9 --dport 55368 -j ACCEPT
iptables -A INPUT -d 88.209.243.29 -j ACCEPT
iptables -A test1 -p 6 -s 135.159.0.0/16 --sport 24129 -j ACCEPT
iptables -A test2 -p 17 --dport 20926 -d 149.125.172.0/24 --sport 35834 -j DROP
iptables -A test2 -p 6 --dport 59642 --sport 4319 -j DROP
iptables -A FORWARD -s 201.217.119.142 -p 23 -j ACCEPT
iptables -A test1 -p 153 -j DROP
iptables -A INPUT -d 87.59.218.254 -j ACCEPT
iptables -A INPUT -d 49.64.30.0/24 -p 114 -j ACCEPT
iptables -A test3 -p 17 -s 32.254.15.69 -d 136.8.219.137 --sport 40613 -j ACCEPT
iptables -A INPUT -p 6 --dport 45931 -d 26.211.84.0/24 -s 138.225.147.89 -j ACCEPT
iptables -A test2 -p 6 --sport 59467 -j ACCEPT
iptables -A INPUT -p 17 --sport 58773 --dport 26251 -j ACCEPT
iptables -A test2 -p 17 --sport 24533 -s 234.83.33.0/24 -d 190.128.91.202 --dport 9621 -j ACCEPT
iptables -A test2 -p 17 -d 251.165.0.0/16 -s 38.38.163.24 --dport 8919 -j DROP
iptables -A FORWARD -p 17 -s 44.123.48.224 --sport 19964 -j DROP
iptables -A FORWARD -p 17 --sport 64932 -s 209.21.0.0/16 --dport 40878 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 8587 -j ACCEPT
iptables -A test3 -p 17 --sport 29346 -s 225.0.0.0/8 -d 81.167.0.0/16 -j DROP
iptables -A INPUT -p 6 -d 206.224.170.103 --dport 13036 -j test3
iptables -A OUTPUT -s 141.143.170.62 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 14084 --dport 36964 -d 18.186.209.94 -j ACCEPT
iptables -A test2 -p 17 --dport 44920 -s 243.12.52.11 --sport 45124 -j DROP
iptables -A test3 -d 168.38.136.198 -j ACCEPT
iptables -A test3 -p 6 --sport 39798 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 14669 -s 205.154.100.0/24 -d 219.92.67.0/24 -j DROP
iptables -A test1 -p 17 --dport 61119 --sport 28718 -d 55.62.221.125 -j DROP
iptables -A test3 -d 176.0.0.0/8 -s 185.78.244.143 -j ACCEPT
iptables -A test2 -d 111.55.223.58 -p 212 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 52117 -j DROP
iptables -A test2 -s 94.188.15.224 -j ACCEPT
iptables -A test3 -p 17 -s 161.78.0.0/16 --dport 46919 -j DROP
iptables -A test1 -p 17 --sport 628 -d 75.54.199.240 --dport 23236 -j DROP
iptables -A test1 -p 17 -s 188.82.208.63 -d 87.40.133.204 --sport 8028 -j DROP
iptables -A INPUT -p 59 -j DROP
iptables -A test3 -p 6 -s 53.92.111.197 --sport 27532 -j DROP
iptables -A test2 -p 6 --sport 6621 --dport 65444 -s 92.17.193.83 -j DROP
iptables -A test3 -p 17 --dport 18126 --sport 60207 -d 137.150.152.131 -s 29.237.0.0/16 -j DROP
iptables -A test3 -p 6 -s 153.0.0.0/8 --sport 43882 -j ACCEPT
iptables -A FORWARD -p 6 -s 135.212.117.143 --dport 35866 -j ACCEPT
iptables -A test1 -p 17 --dport 57601 -j ACCEPT
iptables -A FORWARD -p 17 -s 146.0.0.0/8 --dport 58535 -d 18.219.217.0/24 -j ACCEPT
iptables -A test1 -s 127.88.40.160 -p 228 -j ACCEPT
iptables -A INPUT -p 6 --dport 12108 --sport 1074 -j DROP
iptables -A FORWARD -p 209 -d 33.110.15.16 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 32655 -s 165.248.99.219 -d 227.241.122.94 --sport 55649 -j ACCEPT
iptables -A test3 -p 6 --sport 54774 -d 236.36.197.0/24 -j DROP
iptables -A FORWARD -p 17 -d 13.51.41.0/24 --sport 62611 -j ACCEPT
iptables -A FORWARD -d 149.185.222.180 -s 225.21.227.182 -j ACCEPT
iptables -A OUTPUT -s 73.142.42.131 -j ACCEPT
iptables -A INPUT -p 6 --dport 13981 -d 45.171.189.94 -j DROP
iptables -A OUTPUT -p 17 --dport 34363 -d 4.113.0.0/16 -s 133.193.83.69 -j DROP
iptables -A test3 -d 22.77.58.167 -s 138.53.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --sport 53870 --dport 26277 -j ACCEPT
iptables -A test1 -d 211.0.0.0/8 -j DROP
iptables -A test1 -p 17 -s 37.28.24.35 --dport 39528 --sport 5368 -j DROP
iptables -A FORWARD -p 6 -s 79.195.156.144 -d 79.104.84.0/24 --sport 9040 -j ACCEPT
iptables -A FORWARD -p 17 -s 139.239.252.46 -d 220.254.0.0/16 --dport 43759 -j ACCEPT
iptables -A test2 -s 189.178.164.36 -j ACCEPT
iptables -A test3 -p 6 --dport 49867 -d 153.177.57.1 -s 68.251.196.0/24 -j ACCEPT
iptables -A test2 -p 6 -s 224.78.0.0/16 --dport 30441 --sport 57860 -j DROP
iptables -A test3 -p 96 -j ACCEPT
iptables -A test2 -p 17 -s 222.97.201.69 --sport 58070 --dport 27502 -j ACCEPT
iptables -A FORWARD -p 17 --sport 36550 -d 7.0.0.0/8 -s 51.39.0.0/16 --dport 64445 -j DROP
iptables -A FORWARD -p 6 --sport 43095 -j DROP
iptables -A FORWARD -p 220 -j DROP
iptables -A FORWARD -p 6 --sport 7719 -s 89.38.0.0/16 -d 216.170.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 60784 -j DROP
iptables -A FORWARD -p 6 -s 113.104.0.0/16 --dport 45931 --sport 32275 -j test2
iptables -A OUTPUT -p 154 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 48496 -j ACCEPT
iptables -A test1 -p 6 --sport 19865 -j DROP
iptables -A test1 -d 84.252.198.162 -j DROP
iptables -A test1 -s 229.70.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --dport 48723 -d 73.126.200.56 -s 240.51.0.0/16 --sport 23975 -j ACCEPT
iptables -A INPUT -p 6 --sport 23074 -j DROP
iptables -A test3 -p 52 -j ACCEPT
iptables -A FORWARD -p 6 -s 241.196.148.0/24 --sport 26012 --dport 48426 -j ACCEPT
iptables -A FORWARD -s 127.0.0.0/8 -d 28.125.0.0/16 -j ACCEPT
iptables -A test3 -s 119.128.72.0/24 -p 247 -j DROP
iptables -A INPUT -s 29.231.131.162 -j DROP
iptables -A INPUT -s 176.105.74.171 -j DROP
iptables -A test2 -s 197.217.173.0/24 -j DROP
iptables -A test2 -p 17 --sport 52344 -s 3.44.66.34 --dport 53019 -j DROP
iptables -A INPUT -p 6 -d 57.215.64.0/24 --dport 10020 -j ACCEPT
iptables -A test1 -p 6 -d 199.205.55.222 -s 66.145.168.100 --sport 3043 -j DROP
iptables -A test1 -d 58.0.0.0/8 -p 110 -j DROP
iptables -A test1 -s 196.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 30135 -d 229.145.26.163 -j DROP
iptables -A INPUT -p 6 --dport 43937 -d 143.70.213.60 --sport 986 -j DROP
iptables -A test1 -p 6 --sport 32456 -j DROP
iptables -A OUTPUT -s 48.216.224.118 -p 31 -d 196.123.0.0/16 -j ACCEPT
iptables -A FORWARD -p 17 --sport 13598 -s 24.40.176.0/24 --dport 54186 -j DROP
iptables -A test1 -p 6 -s 156.26.188.73 --sport 37755 -j DROP
iptables -A test1 -p 6 --sport 18792 --dport 32114 -d 10.198.103.114 -j ACCEPT
iptables -A test1 -p 6 --sport 57350 -j DROP
iptables -A test3 -p 6 -d 43.0.0.0/8 --sport 20217 -j ACCEPT
iptables -A test1 -p 6 --sport 53095 -d 132.223.65.94 -j ACCEPT
iptables -A test2 -p 17 -d 62.103.213.87 --dport 27820 --sport 27241 -j DROP
iptables -A test3 -p 17 --dport 45203 -d 97.209.175.16 -j ACCEPT
iptables -A INPUT -p 6 --sport 14475 -d 212.245.0.0/16 -s 246.19.95.196 -j DROP
iptables -A OUTPUT -s 91.191.0.0/16 -j ACCEPT
iptables -A test3 -p 17 -d 136.29.0.0/16 --dport 52185 -j ACCEPT
iptables -A FORWARD -s 144.252.12.206 -d 121.0.0.0/8 -j DROP
iptables -A test3 -p 52 -s 208.149.77.71 -j ACCEPT
iptables -A test2 -s 149.142.0.0/16 -p 199 -j DROP
iptables -A FORWARD -p 17 --sport 21453 -j ACCEPT
iptables -A FORWARD -p 6 --dport 31510 -s 41.58.0.0/16 -j DROP
iptables -A test3 -p 6 --sport 51331 -d 62.209.241.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 47249 --sport 26316 -s 58.164.69.0/24 -j DROP
iptables -A FORWARD -p 6 -s 242.89.26.61 --sport 55453 -j DROP
iptables -A INPUT -s 114.0.0.0/8 -j DROP
iptables -A test3 -p 6 -d 0.175.0.0/16 -s 183.42.70.34 --sport 14421 --dport 17181 -j ACCEPT
iptables -A OUTPUT -d 39.17.124.73 -p 4 -j DROP
iptables -A OUTPUT -p 6 --sport 46078 -j ACCEPT
iptables -A test2 -p 17 --sport 9532 -d 224.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -d 150.27.117.204 --dport 53468 -s 52.114.186.10 --sport 37668 -j DROP
iptables -A OUTPUT -s 8.141.157.185 -d 93.229.0.0/16 -j ACCEPT
iptables -A test3 -s 64.17.79.224 -j DROP
iptables -A test1 -p 6 -d 7.233.191.201 --dport 52406 -s 221.75.72.0/24 -j ACCEPT
iptables -A INPUT -p 17 --sport 13804 -j ACCEPT
iptables -A FORWARD -p 17 --dport 15756 -s 218.0.0.0/8 -d 41.51.42.237 -j DROP
iptables -A FORWARD -p 17 --sport 58088 -d 234.117.194.27 -s 118.7.35.54 -j DROP
iptables -A test3 -p 17 -d 227.110.247.0/24 --dport 62871 -j ACCEPT
iptables -A INPUT -d 170.0.0.0/8 -s 108.86.228.174 -j ACCEPT
iptables -A test2 -p 6 --dport 2352 -s 221.186.55.105 --sport 38053 -d 29.245.189.203 -j DROP
iptables -A test3 -d 219.120.118.146 -p 234 -j DROP
iptables -A FORWARD -p 17 --dport 8400 --sport 15897 -d 223.170.197.201 -j ACCEPT
iptables -A test1 -p 17 -s 61.0.0.0/8 --sport 14947 -j ACCEPT
iptables -A test2 -p 6 -s 99.255.134.0/24 -d 29.86.0.0/16 --dport 16298 --sport 63169 -j DROP
iptables -A FORWARD -p 17 --dport 53116 -s 60.200.212.0/24 -d 231.26.231.210 -j DROP
iptables -A test2 -p 6 --sport 18489 -s 248.228.0.0/16 -d 83.32.48.97 --dport 17160 -j DROP
iptables -A test3 -p 6 -d 111.84.129.0/24 --sport 45758 -s 116.98.224.169 -j ACCEPT
iptables -A test2 -p 6 -d 121.125.143.127 --dport 13519 -s 145.122.70.0/24 -j DROP
iptables -A test2 -p 6 --dport 47751 --sport 29413 -j DROP
iptables -A FORWARD -p 144 -j ACCEPT
iptables -A INPUT -p 6 --dport 19183 -j DROP
iptables -A test3 -p 6 --sport 43053 -s 227.108.64.0/24 -d 88.187.146.235 -j DROP
iptables -A test2 -p 17 --dport 56489 -j DROP
iptables -A test1 -p 17 --sport 59011 -d 92.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 53018 -s 153.114.174.225 --sport 22644 -d 72.65.0.0/16 -j ACCEPT
iptables -A test3 -p 6 -s 136.120.142.221 --sport 3558 --dport 63684 -d 207.0.0.0/8 -j DROP
iptables -A INPUT -s 189.122.12.243 -j ACCEPT
iptables -A test3 -p 17 --dport 34814 --sport 43398 -d 213.47.0.0/16 -j DROP
iptables -A test3 -p 17 --sport 60615 -s 13.0.0.0/8 --dport 48168 -j DROP
iptables -A OUTPUT -p 6 -s 137.46.155.78 --dport 10642 -d 197.71.0.0/16 -j DROP
iptables -A test1 -p 6 -s 140.0.0.0/8 -d 194.139.136.21 --sport 53917 -j DROP
iptables -A test1 -p 6 -d 97.141.252.0/24 -s 35.0.0.0/8 --dport 32773 -j ACCEPT
iptables -A OUTPUT -p 6 -s 185.253.123.43 --dport 28381 --sport 18968 -d 32.60.64.8 -j ACCEPT
iptables -A FORWARD -p 6 -d 93.35.30.134 --dport 54072 -s 88.23.222.64 -j ACCEPT
iptables -A INPUT -p 17 --dport 36346 -j ACCEPT
iptables -A test3 -p 17 --sport 46705 -s 123.181.150.0/24 --dport 38156 -j ACCEPT
iptables -A FORWARD -p 17 --sport 57023 -j DROP
iptables -A INPUT -p 17 -s 51.202.118.253 --dport 23606 -j ACCEPT
iptables -A test1 -p 17 -s 192.153.69.0/24 -d 47.0.0.0/8 --sport 49405 -j ACCEPT
iptables -A test1 -d 175.115.120.196 -s 167.134.21.43 -j ACCEPT
iptables -A test1 -s 191.141.175.206 -p 169 -j ACCEPT
iptables -A INPUT -p 186 -d 139.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 57092 -s 225.69.78.249 --sport 10016 -j ACCEPT
iptables -A OUTPUT -s 29.157.0.0/16 -j DROP
iptables -A test2 -p 6 --sport 33977 -j DROP
iptables -A FORWARD -s 4.201.170.49 -d 217.252.95.0/24 -j DROP
iptables -A test2 -p 6 --dport 25557 --sport 51422 -j ACCEPT
iptables -A OUTPUT -s 186.21.0.0/16 -d 99.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --dport 14267 -d 82.46.177.62 -j DROP
iptables -A test1 -p 17 --sport 41729 -d 230.0.0.0/8 -j ACCEPT
iptables -A test1 -p 110 -s 157.113.170.191 -d 160.129.151.0/24 -j DROP
iptables -A test1 -p 6 --dport 58195 -s 10.61.230.51 --sport 51830 -j ACCEPT
iptables -A INPUT -p 17 --sport 61108 --dport 25382 -j DROP
iptables -A INPUT -p 6 -s 53.0.0.0/8 --sport 34045 --dport 32661 -j ACCEPT
iptables -A test2 -s 119.125.201.211 -d 183.121.0.0/16 -j DROP
iptables -A test1 -p 17 --sport 9137 -s 209.119.200.206 -j DROP
iptables -A INPUT -p 6 --dport 6541 --sport 54301 -s 35.109.142.4 -j DROP
iptables -A test3 -p 17 --sport 33791 -d 84.234.0.0/16 --dport 28924 -s 96.183.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --sport 41408 --dport 28873 -j ACCEPT
iptables -A test1 -p 6 --sport 40724 -s 76.0.0.0/8 --dport 32477 -j ACCEPT
iptables -A FORWARD -p 6 --dport 35898 -j ACCEPT
iptables -A INPUT -p 6 --dport 42966 -j DROP
iptables -A test1 -p 17 -s 141.33.138.0/24 --sport 31543 --dport 33987 -d 135.0.0.0/8 -j DROP
iptables -A test3 -p 17 --sport 25782 -j ACCEPT
iptables -A test1 -p 6 --sport 17239 -j ACCEPT
iptables -A INPUT -p 6 --sport 19959 -j DROP
iptables -A FORWARD -p 6 -s 107.0.0.0/8 --dport 50120 -j DROP
iptables -A test3 -p 250 -j ACCEPT
iptables -A INPUT -p 6 --dport 21451 -d 163.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 -s 154.0.0.0/8 --sport 56297 --dport 12931 -j DROP
iptables -A test1 -p 17 -d 206.168.103.72 --sport 4656 -s 127.79.212.14 --dport 57167 -j DROP
iptables -A INPUT -p 178 -j DROP
iptables -A OUTPUT -p 6 -s 67.124.0.0/16 --sport 10675 --dport 18336 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 48171 -s 129.87.146.167 -d 177.137.99.0/24 -j DROP
iptables -A test3 -p 17 -d 179.48.116.67 -s 158.73.0.0/16 --dport 54069 --sport 12069 -j DROP
iptables -A test1 -s 180.221.76.66 -j DROP
iptables -A test2 -p 225 -j DROP
iptables -A FORWARD -p 231 -s 83.237.50.117 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 50200 -d 12.84.0.0/16 -s 81.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -s 222.75.128.247 -d 102.19.173.46 --sport 3035 -j ACCEPT
iptables -A test1 -s 8.243.237.185 -j ACCEPT
iptables -A test2 -d 119.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 29765 -j ACCEPT
iptables -A test2 -p 6 --sport 50225 --dport 62013 -j DROP
iptables -A test2 -p 6 --sport 13455 -d 212.110.245.8 -j DROP
iptables -A INPUT -d 147.230.0.0/16 -j ACCEPT
iptables -A test1 -p 17 -d 90.0.0.0/8 -s 178.0.0.0/8 --dport 11152 -j ACCEPT
iptables -A test3 -p 17 --dport 51677 -s 246.117.66.37 --sport 60186 -j DROP
iptables -A INPUT -p 17 -s 208.128.230.58 --sport 12877 --dport 17333 -j ACCEPT
iptables -A test3 -s 15.75.140.127 -d 46.130.187.16 -p 205 -j ACCEPT
iptables -A INPUT -p 17 -d 175.12.245.212 -s 133.28.26.110 --dport 19596 -j DROP
iptables -A INPUT -p 17 --sport 31050 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 30601 -j test2
iptables -A FORWARD -p 17 --dport 52974 --sport 46068 -j ACCEPT
iptables -A OUTPUT -p 17 -s 172.198.161.0/24 -d 90.132.51.244 --sport 49269 -j DROP
iptables -A FORWARD -p 17 --sport 12096 -s 5.11.0.0/16 -j DROP
iptables -A test1 -p 178 -j DROP
iptables -A FORWARD -p 6 --dport 20948 -s 221.242.51.57 -d 24.139.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 28271 --dport 3242 -s 247.158.67.0/24 -j DROP
iptables -A test1 -p 6 --dport 36485 --sport 34886 -s 181.149.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --sport 39738 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 25528 -s 41.204.234.0/24 -d 183.0.0.0/8 -j ACCEPT
iptables -A test3 -p 59 -j ACCEPT
iptables -A OUTPUT -p 17 -d 117.48.36.73 -s 59.244.0.0/16 --dport 10880 -j ACCEPT
iptables -A test2 -s 12.127.21.0/24 -p 155 -j ACCEPT
iptables -A OUTPUT -p 17 -d 0.14.221.177 --dport 46698 --sport 39890 -j ACCEPT
iptables -A test2 -s 69.211.166.0/24 -p 63 -j ACCEPT
iptables -A FORWARD -p 17 -s 211.0.0.0/8 -d 101.0.0.0/8 --sport 37861 -j DROP
iptables -A test2 -p 17 -s 84.0.0.0/8 --dport 11646 -d 206.159.247.0/24 --sport 24295 -j DROP
iptables -A test1 -p 17 --sport 43909 -j ACCEPT
iptables -A test1 -p 6 --dport 50673 -j DROP
iptables -A test1 -p 6 -d 101.83.244.180 --dport 30992 -j ACCEPT
iptables -A test1 -p 17 --sport 8926 -j ACCEPT
iptables -A test1 -p 56 -j DROP
iptables -A FORWARD -p 6 -s 67.108.124.0/24 --dport 47081 -j DROP
iptables -A OUTPUT -p 17 -d 199.209.0.0/16 --sport 31926 -j DROP
iptables -A test3 -p 6 --dport 43500 -s 192.0.0.0/8 -d 138.219.175.157 -j DROP
iptables -A INPUT -p 6 -d 122.17.148.227 --sport 63310 -j test3
iptables -A test1 -p 17 --sport 50780 -s 143.11.148.235 -j DROP
iptables -A INPUT -p 17 -s 156.152.109.0/24 --sport 1183 -j test3
iptables -A test1 -p 17 --sport 30895 -j ACCEPT
iptables -A INPUT -p 62 -s 23.0.0.0/8 -j DROP
iptables -A INPUT -d 105.216.5.245 -p 31 -s 39.21.121.0/24 -j DROP
iptables -A test3 -p 17 --dport 24305 -s 108.0.0.0/8 -d 77.25.35.173 -j DROP
iptables -A test3 -p 17 -s 71.194.255.0/24 --dport 8107 -j ACCEPT
iptables -A test2 -p 17 --sport 29359 --dport 56094 -d 205.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 -s 136.51.0.0/16 --dport 19667 --sport 27288 -j ACCEPT
iptables -A test3 -p 6 -s 180.0.0.0/8 --dport 36615 -d 110.117.41.10 -j ACCEPT
iptables -A test1 -p 17 --sport 49440 --dport 64790 -s 138.5.255.0/24 -j DROP
iptables -A test1 -p 17 --dport 15141 -d 208.49.137.0/24 -s 106.0.0.0/8 -j ACCEPT
iptables -A test2 -s 190.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --sport 19644 --dport 49897 -s 126.162.46.45 -j DROP
iptables -A INPUT -p 17 --sport 44852 -j DROP
iptables -A INPUT -p 6 --sport 3779 -d 44.116.49.107 -s 210.51.0.0/16 --dport 65089 -j DROP
iptables -A test3 -p 6 -s 204.177.0.0/16 --sport 1256 --dport 46154 -j DROP
iptables -A test3 -p 17 --dport 16539 -d 119.1.217.0/24 -s 156.176.92.0/24 -j DROP
iptables -A FORWARD -p 6 --sport 61504 -s 55.211.43.0/24 --dport 56551 -j DROP
iptables -A FORWARD -p 6 --dport 53820 -d 155.175.145.0/24 -j DROP
iptables -A OUTPUT -p 6 -s 118.242.145.0/24 --dport 6832 -d 255.239.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 -s 147.0.0.0/8 --dport 55542 -d 194.0.0.0/8 -j test3
iptables -A test2 -p 6 --sport 46440 -d 235.98.52.67 -j ACCEPT
iptables -A OUTPUT -p 180 -j ACCEPT
iptables -A test3 -p 17 -d 18.110.162.0/24 --sport 43974 -s 142.139.122.86 --dport 57691 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 61257 -s 202.0.0.0/8 --sport 56482 -j ACCEPT
iptables -A OUTPUT -p 17 -d 219.80.247.111 --sport 31491 --dport 4097 -j ACCEPT
iptables -A OUTPUT -d 36.201.104.190 -j DROP
iptables -A INPUT -p 6 -s 86.17.0.0/16 --dport 56144 -j DROP
iptables -A test3 -p 17 -d 181.125.210.182 --sport 62476 -s 126.0.0.0/8 -j ACCEPT
iptables -A FORWARD -d 35.0.0.0/8 -s 37.20.45.0/24 -j ACCEPT
iptables -A test1 -s 228.233.147.0/24 -j DROP
iptables -A test3 -p 6 --dport 64654 --sport 29714 -j DROP
iptables -A INPUT -d 230.17.86.253 -j DROP
iptables -A INPUT -p 6 --sport 4379 -s 170.121.155.252 -d 225.100.215.215 -j DROP
iptables -A INPUT -p 6 --dport 5663 --sport 33149 -s 241.36.60.164 -j test1
iptables -A FORWARD -s 251.51.116.17 -p 61 -j DROP
iptables -A FORWARD -p 17 -d 172.153.180.138 -s 46.65.38.76 --dport 61975 -j ACCEPT
iptables -A test1 -p 17 --dport 10504 -s 34.200.86.19 -j DROP
iptables -A FORWARD -p 6 --sport 56570 -d 7.236.13.137 --dport 58554 -j DROP
iptables -A test2 -s 11.0.0.0/8 -j ACCEPT
iptables -A FORWARD -s 12.63.103.34 -j DROP
iptables -A test3 -p 6 --sport 29234 --dport 9206 -s 254.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --sport 9533 -j DROP
iptables -A FORWARD -p 6 --sport 6198 -s 205.85.209.8 -j ACCEPT
iptables -A test2 -p 6 --dport 21860 -j DROP
iptables -A test1 -p 6 --sport 12660 -s 217.192.221.221 -j ACCEPT
iptables -A FORWARD -d 113.14.202.41 -s 227.62.236.61 -j ACCEPT
iptables -A INPUT -s 28.204.190.0/24 -j DROP
iptables -A test2 -p 17 --sport 15986 -s 229.49.158.172 --dport 24021 -j DROP
iptables -A INPUT -d 239.163.236.23 -p 80 -j ACCEPT
iptables -A test1 -p 6 --sport 10903 -j ACCEPT
iptables -A test3 -p 17 -d 60.0.0.0/8 --dport 21692 -j ACCEPT
iptables -A OUTPUT -s 206.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 19042 -s 217.178.0.0/16 --sport 29163 -j DROP
iptables -A test1 -p 6 --sport 19234 -j ACCEPT
iptables -A FORWARD -p 6 --sport 43378 --dport 58076 -d 0.53.146.69 -j DROP
iptables -A FORWARD -d 92.107.138.139 -s 179.5.71.58 -j ACCEPT
iptables -A INPUT -p 6 -d 75.229.74.75 --sport 16394 --dport 8300 -s 100.132.113.87 -j DROP
iptables -A OUTPUT -p 6 --sport 23700 -s 100.61.0.0/16 -j DROP
iptables -A FORWARD -p 6 -s 46.9.172.61 -d 113.147.94.0/24 --sport 8671 -j ACCEPT
iptables -A FORWARD -p 6 --dport 35617 --sport 62954 -d 19.233.183.153 -s 135.0.0.0/8 -j DROP
iptables -A test3 -p 6 -s 225.247.57.36 --dport 38794 -j ACCEPT
iptables -A INPUT -p 17 --dport 53627 -d 192.131.0.0/16 -j DROP
iptables -A test1 -s 166.25.76.115 -p 126 -d 208.28.0.0/16 -j DROP
iptables -A test1 -s 203.107.234.165 -j DROP
iptables -A OUTPUT -p 17 -d 245.0.0.0/8 --dport 58128 -j test3
iptables -A FORWARD -s 3.168.215.0/24 -j ACCEPT
iptables -A test1 -p 17 -d 123.235.125.69 --sport 27208 -s 173.234.229.5 -j ACCEPT
iptables -A test1 -p 192 -j DROP
iptables -A test3 -p 17 --sport 28103 -j ACCEPT
iptables -A OUTPUT -p 17 -s 137.1.92.0/24 --dport 32549 -j ACCEPT
iptables -A OUTPUT -d 181.201.178.188 -s 68.108.67.199 -p 38 -j ACCEPT
iptables -A FORWARD -p 6 --sport 41874 --dport 8347 -d 84.0.0.0/8 -j DROP
iptables -A test2 -p 17 --sport 46305 -j ACCEPT
iptables -A OUTPUT -p 6 -d 178.55.153.240 --dport 36625 -j DROP
iptables -A test3 -d 48.97.197.243 -j ACCEPT
iptables -A test2 -p 17 -d 119.96.60.0/24 --dport 7770 --sport 6866 -j ACCEPT
iptables -A INPUT -p 237 -j DROP
iptables -A test2 -d 57.196.212.169 -j ACCEPT
iptables -A test1 -p 6 --sport 14722 --dport 48493 -j DROP
iptables -A FORWARD -p 17 --sport 15875 --dport 6627 -d 101.31.144.0/24 -j ACCEPT
iptables -A FORWARD -s 140.1.121.0/24 -j DROP
iptables -A INPUT -p 6 --dport 15485 -d 53.0.0.0/8 --sport 29624 -s 169.217.151.105 -j ACCEPT
iptables -A test1 -p 6 --dport 19825 -j DROP
iptables -A OUTPUT -p 6 -d 165.12.45.0/24 --sport 4909 -j ACCEPT
iptables -A test2 -p 6 -d 109.4.0.0/16 -s 192.0.0.0/8 --dport 25845 -j DROP
iptables -A FORWARD -p 6 --sport 50294 -s 139.30.250.81 -j test2
iptables -A test2 -p 17 --dport 42094 --sport 52170 -s 187.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --sport 33444 -d 59.32.0.0/16 -j DROP
iptables -A test1 -p 86 -s 56.62.53.14 -j DROP
iptables -A OUTPUT -p 6 --dport 25801 -d 108.31.241.153 -s 133.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --sport 24744 --dport 59976 -d 90.108.228.215 -j DROP
iptables -A test2 -s 1.155.115.157 -j DROP
iptables -A test3 -p 17 --sport 34909 -s 151.244.159.217 -j DROP
iptables -A test3 -p 6 --sport 56157 -d 134.211.204.0/24 --dport 54670 -j DROP
iptables -A test3 -p 17 -d 165.0.0.0/8 --sport 36076 -j DROP
iptables -A test2 -p 17 -d 188.251.199.11 --sport 60250 --dport 29818 -j ACCEPT
iptables -A test2 -p 6 -d 38.202.162.0/24 --sport 2855 -s 192.94.0.0/16 --dport 14077 -j ACCEPT
iptables -A test2 -p 6 -d 54.181.0.0/16 --dport 59844 --sport 64421 -j DROP
iptables -A test1 -p 6 --sport 62751 -d 0.202.85.173 -j DROP
iptables -A FORWARD -p 17 --dport 18405 --sport 27043 -j ACCEPT
iptables -A INPUT -p 17 -d 13.196.0.0/16 --sport 47409 -j ACCEPT
iptables -A FORWARD -p 6 --sport 29269 -d 76.25.173.109 -j test2
iptables -A OUTPUT -p 6 --sport 57454 --dport 9890 -d 114.222.179.54 -j DROP
iptables -A test1 -p 17 -s 167.62.115.81 --sport 50296 -j DROP
iptables -A FORWARD -p 17 --sport 62142 --dport 27036 -d 211.0.0.0/8 -s 66.33.39.141 -j DROP
iptables -A test1 -s 159.230.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 7269 -j ACCEPT
iptables -A INPUT -p 17 --dport 44412 -j DROP
iptables -A test1 -p 17 -d 213.213.236.0/24 --dport 7770 -j ACCEPT