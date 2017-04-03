iptables -N test1
iptables -N test2
iptables -N test3
iptables -A test2 -p 122 -s 222.121.18.196 -d 193.155.238.219 -j ACCEPT
iptables -A INPUT -p 6 --dport 47691 -j DROP
iptables -A test1 -p 228 -s 238.50.191.47 -j ACCEPT
iptables -A test3 -d 0.61.243.61 -j DROP
iptables -A test3 -p 198 -j ACCEPT
iptables -A test2 -p 6 --sport 51117 -d 199.251.58.23 -s 112.140.129.111 -j DROP
iptables -A INPUT -p 6 -d 186.235.201.246 --dport 21492 --sport 32173 -j ACCEPT
iptables -A INPUT -p 6 -s 31.94.75.227 -d 157.114.149.0/24 --sport 3407 -j DROP
iptables -A test1 -p 6 -d 141.16.0.0/16 --sport 19586 -s 98.212.54.0/24 -j DROP
iptables -A INPUT -p 6 --sport 19213 -j DROP
iptables -A test1 -s 14.135.219.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 27723 -d 35.216.160.163 -j DROP
iptables -A test3 -s 24.248.188.23 -j DROP
iptables -A test3 -p 17 --sport 65409 -d 72.205.125.123 --dport 27583 -j DROP
iptables -A test2 -p 17 -d 250.205.163.7 --sport 41689 -s 134.193.8.167 -j ACCEPT
iptables -A INPUT -p 17 --sport 13972 -s 96.98.133.33 -j DROP
iptables -A test2 -p 6 --sport 59443 -j DROP
iptables -A INPUT -p 168 -j ACCEPT
iptables -A FORWARD -p 201 -s 15.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 62017 -j ACCEPT
iptables -A FORWARD -d 242.0.0.0/8 -j DROP
iptables -A test2 -p 17 --sport 57982 -j DROP
iptables -A test1 -p 6 --sport 39041 --dport 401 -j DROP
iptables -A OUTPUT -p 17 --dport 47641 -s 76.15.119.20 -j ACCEPT
iptables -A test2 -p 17 --sport 27476 --dport 38888 -j DROP
iptables -A INPUT -p 17 --dport 30255 -j ACCEPT
iptables -A test1 -d 116.0.0.0/8 -s 126.178.120.198 -j ACCEPT
iptables -A OUTPUT -p 6 -d 86.194.5.61 --sport 22549 --dport 52022 -s 208.195.29.82 -j DROP
iptables -A test1 -p 6 --sport 32053 -d 44.172.73.75 --dport 891 -j ACCEPT
iptables -A FORWARD -p 17 --sport 13443 --dport 62881 -j DROP
iptables -A test1 -p 17 --sport 1591 -d 115.165.96.0/24 --dport 16072 -j ACCEPT
iptables -A test3 -p 17 --dport 62834 -s 32.90.169.55 -j ACCEPT
iptables -A INPUT -p 97 -j ACCEPT
iptables -A test2 -p 6 --dport 32269 -d 121.120.26.0/24 -j DROP
iptables -A OUTPUT -p 17 -d 82.0.0.0/8 --sport 35839 -j ACCEPT
iptables -A INPUT -d 243.53.246.20 -j ACCEPT
iptables -A INPUT -p 6 --sport 27302 --dport 10032 -d 243.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --dport 25943 -s 212.254.0.0/16 --sport 31456 -j DROP
iptables -A test2 -p 239 -j ACCEPT
iptables -A test3 -p 6 -s 83.40.0.0/16 --dport 59483 -j ACCEPT
iptables -A test2 -p 6 -d 30.205.0.0/16 --sport 37193 -j ACCEPT
iptables -A test1 -p 17 --sport 38260 -d 241.0.0.0/8 -j DROP
iptables -A test1 -p 17 --dport 58279 --sport 41362 -d 49.37.91.19 -j ACCEPT
iptables -A test3 -p 6 --dport 18130 -j DROP
iptables -A FORWARD -p 17 -s 242.32.49.149 -d 48.151.130.111 --sport 39016 -j DROP
iptables -A test3 -p 17 --dport 28537 --sport 41701 -d 139.145.247.48 -j DROP
iptables -A test3 -p 6 --dport 9100 --sport 18394 -d 167.50.153.0/24 -j ACCEPT
iptables -A test2 -s 59.228.67.0/24 -p 245 -j ACCEPT
iptables -A INPUT -p 17 --dport 56373 -s 137.60.174.251 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 31753 -d 62.0.0.0/8 -s 8.221.0.0/16 -j DROP
iptables -A test1 -p 17 -d 164.91.122.115 --dport 25979 -j ACCEPT
iptables -A test2 -p 17 -s 43.0.0.0/8 --dport 47983 -j DROP
iptables -A FORWARD -p 6 --dport 54637 -j ACCEPT
iptables -A OUTPUT -p 17 -s 159.161.35.120 --dport 31478 -j ACCEPT
iptables -A FORWARD -p 17 -s 248.29.93.111 --sport 25497 -j DROP
iptables -A test2 -p 6 --sport 30015 --dport 43978 -j DROP
iptables -A test3 -p 17 --dport 1797 -s 40.0.0.0/8 -d 212.0.0.0/8 -j DROP
iptables -A test3 -p 196 -d 39.0.0.0/8 -j ACCEPT
iptables -A test1 -p 159 -j ACCEPT
iptables -A test1 -p 6 --sport 63025 -s 97.116.82.0/24 -j DROP
iptables -A test3 -p 6 --dport 25354 -j ACCEPT
iptables -A OUTPUT -p 6 -d 127.66.151.176 --dport 30387 -s 105.236.149.85 --sport 37136 -j DROP
iptables -A FORWARD -p 17 --sport 38501 --dport 31891 -s 52.165.202.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 12945 -s 155.53.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --sport 25198 --dport 22018 -j DROP
iptables -A FORWARD -p 17 -d 66.0.0.0/8 --sport 34562 -j DROP
iptables -A FORWARD -p 6 --sport 21585 -s 249.124.142.21 --dport 50552 -j DROP
iptables -A OUTPUT -p 17 --sport 30155 -s 102.10.62.0/24 -j ACCEPT
iptables -A test3 -p 6 -d 27.0.0.0/8 --dport 49435 -j ACCEPT
iptables -A OUTPUT -p 17 -s 15.39.70.172 --sport 39990 -d 76.48.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 25232 -d 27.0.0.0/8 -j ACCEPT
iptables -A test3 -d 233.134.0.0/16 -p 164 -j ACCEPT
iptables -A FORWARD -p 6 -s 105.147.0.0/16 --dport 54016 -d 145.40.167.123 -j ACCEPT
iptables -A test3 -d 209.205.0.0/16 -p 151 -j DROP
iptables -A OUTPUT -p 17 --dport 37273 -j ACCEPT
iptables -A INPUT -s 75.194.91.96 -j ACCEPT
iptables -A FORWARD -d 88.20.50.145 -p 216 -j DROP
iptables -A test3 -p 6 --dport 2710 -j DROP
iptables -A OUTPUT -p 17 -d 243.232.80.152 --dport 60044 -j DROP
iptables -A OUTPUT -p 6 --dport 30338 -d 133.0.0.0/8 -s 164.0.0.0/8 -j DROP
iptables -A test1 -p 6 -d 124.130.100.182 --dport 20726 -s 209.74.99.0/24 -j ACCEPT
iptables -A test3 -p 222 -j ACCEPT
iptables -A test3 -p 6 --dport 28945 -j DROP
iptables -A test2 -d 73.247.117.235 -j ACCEPT
iptables -A INPUT -p 17 --dport 60265 -d 81.0.0.0/8 -j DROP
iptables -A test2 -p 17 --dport 32117 -s 0.97.0.0/16 -j DROP
iptables -A OUTPUT -p 6 -s 241.21.43.0/24 --sport 39983 --dport 48796 -j ACCEPT
iptables -A test2 -d 163.116.0.0/16 -p 163 -j DROP
iptables -A INPUT -p 188 -j DROP
iptables -A test1 -p 17 --dport 27501 --sport 27351 -d 49.53.244.9 -j ACCEPT
iptables -A OUTPUT -p 17 -d 23.1.110.118 -s 208.0.0.0/8 --dport 49991 -j DROP
iptables -A FORWARD -p 6 --sport 13670 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 36497 --sport 42626 -j DROP
iptables -A test3 -d 222.70.236.245 -s 112.102.1.88 -j ACCEPT
iptables -A OUTPUT -s 28.0.0.0/8 -j ACCEPT
iptables -A INPUT -d 254.157.246.129 -j DROP
iptables -A INPUT -p 6 -d 223.0.0.0/8 --dport 13057 -j ACCEPT
iptables -A test1 -p 17 -d 204.206.126.0/24 --sport 48161 -j ACCEPT
iptables -A INPUT -p 17 --dport 47276 -s 38.71.143.133 -j ACCEPT
iptables -A INPUT -p 17 --dport 46902 -j ACCEPT
iptables -A INPUT -p 3 -j DROP
iptables -A test3 -p 17 --sport 15 --dport 53261 -j ACCEPT
iptables -A test2 -s 192.22.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 -s 220.217.173.152 -d 71.111.241.0/24 --dport 40805 -j ACCEPT
iptables -A test1 -p 17 --dport 33210 -j DROP
iptables -A test3 -p 141 -s 251.44.128.0/24 -j ACCEPT
iptables -A test2 -s 234.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -s 85.22.148.215 --dport 14134 -j ACCEPT
iptables -A FORWARD -p 6 --sport 18548 -j test2
iptables -A OUTPUT -s 1.23.113.229 -j ACCEPT
iptables -A INPUT -p 6 --dport 14900 -j ACCEPT
iptables -A test2 -p 17 --dport 43431 -d 193.230.68.111 -j DROP
iptables -A FORWARD -p 30 -j ACCEPT
iptables -A test1 -s 240.135.173.159 -p 221 -j ACCEPT
iptables -A test1 -p 6 --dport 52715 -j ACCEPT
iptables -A FORWARD -p 17 --sport 29735 --dport 62678 -j DROP
iptables -A test2 -d 44.83.0.0/16 -j ACCEPT
iptables -A test3 -p 17 -d 156.125.207.108 --sport 28225 -j DROP
iptables -A test2 -p 6 -d 3.198.126.0/24 --dport 15465 --sport 2678 -s 248.136.221.0/24 -j ACCEPT
iptables -A test2 -p 6 -s 113.193.189.185 --sport 1085 -j ACCEPT
iptables -A test3 -p 6 --dport 36472 -j DROP
iptables -A test1 -p 17 --dport 15958 -d 33.22.140.29 -j ACCEPT
iptables -A OUTPUT -d 75.52.0.0/16 -s 179.122.82.192 -p 87 -j DROP
iptables -A INPUT -p 169 -j ACCEPT
iptables -A test1 -p 17 --dport 14923 -j DROP
iptables -A FORWARD -p 6 --sport 43569 -d 44.194.110.156 -j ACCEPT
iptables -A test1 -d 172.243.170.228 -p 181 -s 129.227.0.0/16 -j ACCEPT
iptables -A FORWARD -p 162 -j ACCEPT
iptables -A test1 -p 6 -d 158.25.162.135 --dport 50269 --sport 24019 -s 253.163.138.0/24 -j ACCEPT
iptables -A test3 -p 17 -d 205.0.0.0/8 --dport 48302 --sport 63596 -j ACCEPT
iptables -A INPUT -p 17 --sport 15072 --dport 45196 -s 142.165.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 -s 139.210.66.0/24 --dport 26320 -j ACCEPT
iptables -A test1 -p 25 -j DROP
iptables -A test1 -p 6 --sport 6905 -j DROP
iptables -A test2 -p 6 -d 196.0.0.0/8 --dport 47750 --sport 12959 -j DROP
iptables -A OUTPUT -p 17 -s 10.169.241.232 --sport 47150 -j DROP
iptables -A INPUT -p 17 --sport 61649 --dport 2578 -j DROP
iptables -A FORWARD -p 17 --sport 38368 -s 98.0.0.0/8 --dport 10350 -j ACCEPT
iptables -A OUTPUT -d 72.140.206.12 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 57494 --sport 38007 -s 159.102.232.20 -j DROP
iptables -A test1 -d 136.9.178.218 -p 97 -j ACCEPT
iptables -A test3 -p 6 -s 131.180.21.43 --dport 50134 -d 7.202.193.0/24 -j DROP
iptables -A FORWARD -p 17 --dport 46946 -j DROP
iptables -A test2 -p 17 --sport 63594 -d 244.33.0.0/16 -s 120.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -d 150.4.204.106 --sport 62837 --dport 33819 -j ACCEPT
iptables -A OUTPUT -d 111.195.0.0/16 -p 137 -s 172.120.110.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 50084 -s 172.119.99.241 --dport 52710 -j DROP
iptables -A test1 -p 44 -d 46.79.121.202 -j ACCEPT
iptables -A OUTPUT -p 6 -s 162.32.136.107 --sport 19872 -d 58.73.102.212 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 35965 --dport 26437 -s 253.102.94.15 -j DROP
iptables -A OUTPUT -d 193.0.0.0/8 -j DROP
iptables -A test2 -p 6 --dport 63539 -s 37.50.74.103 -j ACCEPT
iptables -A INPUT -p 17 --dport 14189 -s 90.53.211.153 --sport 54483 -j DROP
iptables -A FORWARD -p 6 --sport 2868 -s 163.229.170.181 -j DROP
iptables -A test3 -d 194.63.51.127 -j DROP
iptables -A INPUT -d 149.243.79.152 -j ACCEPT
iptables -A test1 -p 91 -j ACCEPT
iptables -A test3 -p 6 --sport 33758 -s 36.0.0.0/8 -d 195.225.164.90 --dport 54715 -j DROP
iptables -A INPUT -p 17 -d 123.0.0.0/8 --dport 27920 -j ACCEPT
iptables -A test1 -p 17 --dport 4512 -s 24.99.0.0/16 --sport 54661 -j DROP
iptables -A INPUT -p 17 -d 182.69.131.148 --dport 19850 -j DROP
iptables -A test3 -p 6 --sport 10909 -d 67.0.0.0/8 -j DROP
iptables -A FORWARD -d 127.202.160.210 -j DROP
iptables -A INPUT -p 6 -s 173.179.188.0/24 --sport 6283 --dport 37294 -j DROP
iptables -A test2 -p 17 --dport 32877 -j ACCEPT
iptables -A INPUT -p 6 --dport 12034 -j ACCEPT
iptables -A test3 -p 17 --sport 40146 -s 212.0.0.0/8 -j ACCEPT
iptables -A test2 -d 117.73.83.0/24 -p 85 -j ACCEPT
iptables -A FORWARD -p 6 --sport 2748 -j DROP
iptables -A test3 -p 6 --dport 16191 -j DROP
iptables -A test2 -s 35.75.171.53 -j ACCEPT
iptables -A FORWARD -p 17 --dport 64315 -s 166.140.229.180 -j DROP
iptables -A INPUT -p 6 -s 226.212.0.0/16 --dport 34122 -d 25.173.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 8874 -s 101.17.146.33 -d 61.0.0.0/8 -j DROP
iptables -A OUTPUT -s 13.253.145.30 -p 201 -d 51.251.156.5 -j ACCEPT
iptables -A test1 -s 225.0.0.0/8 -j DROP
iptables -A INPUT -p 148 -j ACCEPT
iptables -A FORWARD -p 6 --sport 26634 -d 184.0.0.0/8 --dport 47560 -j DROP
iptables -A test3 -p 6 -d 52.170.0.0/16 --sport 34866 -j ACCEPT
iptables -A OUTPUT -p 6 -d 162.166.140.192 --sport 61576 --dport 52402 -j ACCEPT
iptables -A INPUT -p 17 --sport 19212 -j test1
iptables -A test3 -p 17 --dport 14316 --sport 64196 -d 44.225.212.101 -j ACCEPT
iptables -A OUTPUT -p 17 -d 120.0.0.0/8 --sport 53635 --dport 4742 -j ACCEPT
iptables -A test2 -d 3.70.143.162 -s 68.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 -d 213.230.224.220 --dport 30483 -j ACCEPT
iptables -A FORWARD -p 6 --sport 46207 -j ACCEPT
iptables -A INPUT -p 17 -d 166.223.107.246 --sport 10524 -s 13.238.222.133 -j ACCEPT
iptables -A test3 -d 66.142.69.136 -j ACCEPT
iptables -A OUTPUT -p 17 -s 171.0.0.0/8 --sport 29792 --dport 1286 -j ACCEPT
iptables -A test2 -p 17 --sport 21253 -j DROP
iptables -A test1 -p 17 -s 233.0.0.0/8 -d 13.6.83.151 --dport 17610 --sport 9691 -j ACCEPT
iptables -A test3 -p 17 -d 66.250.201.51 --dport 53120 --sport 1745 -j DROP
iptables -A test3 -p 17 -d 195.0.0.0/8 -s 242.146.0.0/16 --sport 43913 -j ACCEPT
iptables -A FORWARD -p 17 --dport 20954 -j DROP
iptables -A FORWARD -p 6 -d 111.198.169.36 --sport 12412 --dport 50852 -j DROP
iptables -A test2 -p 6 --sport 16571 -j ACCEPT
iptables -A test1 -p 6 -s 185.40.191.157 --dport 65244 -j DROP
iptables -A test3 -p 72 -j ACCEPT
iptables -A INPUT -p 6 -d 33.192.62.189 -s 12.73.29.0/24 --sport 36909 -j DROP
iptables -A test3 -p 6 -d 184.53.210.101 -s 165.185.0.0/16 --dport 64096 -j DROP
iptables -A test2 -p 17 --dport 59628 -d 197.66.0.0/16 -s 44.192.14.20 -j DROP
iptables -A test1 -p 6 --sport 64981 --dport 25423 -s 29.183.117.94 -d 167.226.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 29800 -s 13.71.0.0/16 -d 71.0.0.0/8 -j test3
iptables -A test1 -s 224.242.98.86 -d 48.200.180.157 -j ACCEPT
iptables -A test3 -p 6 -d 248.81.0.0/16 --sport 45825 -s 88.230.0.0/16 -j DROP
iptables -A OUTPUT -d 81.101.0.0/16 -p 107 -j ACCEPT
iptables -A test3 -p 109 -s 52.238.144.209 -j DROP
iptables -A FORWARD -d 48.71.67.165 -j DROP
iptables -A FORWARD -s 82.236.0.0/16 -p 32 -j ACCEPT
iptables -A test1 -s 72.182.224.112 -j ACCEPT
iptables -A test2 -s 112.206.147.0/24 -d 5.93.161.35 -j DROP
iptables -A OUTPUT -p 17 --sport 26449 -j test2
iptables -A OUTPUT -p 17 -s 228.96.193.153 -d 176.21.0.0/16 --dport 21743 -j DROP
iptables -A FORWARD -p 6 --dport 53590 -d 251.165.202.117 --sport 46253 -j DROP
iptables -A INPUT -p 6 -d 143.19.163.176 --dport 28036 -s 236.130.0.0/16 -j DROP
iptables -A test2 -p 17 -d 25.22.235.28 -s 31.113.234.247 --dport 40828 -j DROP
iptables -A FORWARD -d 252.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -d 16.0.0.0/8 -s 156.0.0.0/8 --sport 46070 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 19038 -d 96.14.247.73 -j DROP
iptables -A FORWARD -p 17 --sport 4718 -j ACCEPT
iptables -A test1 -p 17 -d 181.0.94.132 --sport 55437 -j ACCEPT
iptables -A test1 -s 44.171.215.0/24 -j DROP
iptables -A test3 -d 92.177.96.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -d 169.64.117.0/24 --sport 5345 -j DROP
iptables -A test3 -s 185.138.195.250 -d 147.200.250.162 -j DROP
iptables -A test2 -p 6 -d 222.85.50.209 --dport 14345 -j ACCEPT
iptables -A test1 -p 17 --sport 56444 -j ACCEPT
iptables -A INPUT -p 17 -s 226.48.39.32 --sport 7618 -j ACCEPT
iptables -A OUTPUT -s 159.48.63.112 -j ACCEPT
iptables -A FORWARD -p 6 --sport 41471 --dport 19345 -j ACCEPT
iptables -A test1 -p 193 -s 175.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -d 177.222.219.100 -s 148.186.0.0/16 --dport 64798 -j ACCEPT
iptables -A FORWARD -p 17 -d 29.0.0.0/8 --dport 2792 -s 9.0.0.0/8 --sport 61396 -j DROP
iptables -A FORWARD -p 17 --sport 8272 -s 184.171.210.0/24 --dport 20226 -j ACCEPT
iptables -A FORWARD -p 17 -d 248.58.166.182 --dport 24871 -j test1
iptables -A test3 -p 6 -d 228.150.59.85 --sport 4650 -j DROP
iptables -A test2 -p 17 -s 243.53.119.137 --dport 22410 -j DROP
iptables -A test1 -p 6 -s 34.245.120.194 --dport 53252 -j DROP
iptables -A OUTPUT -p 17 --dport 22768 -j ACCEPT
iptables -A FORWARD -p 6 --dport 11879 -d 206.248.149.49 -j ACCEPT
iptables -A test3 -p 17 --sport 51961 -s 72.56.234.0/24 -j DROP
iptables -A test2 -s 139.237.0.0/16 -p 151 -j DROP
iptables -A test1 -p 6 --sport 55498 -s 231.248.136.95 --dport 22603 -j ACCEPT
iptables -A FORWARD -p 6 --sport 63090 -j ACCEPT
iptables -A test3 -p 17 --dport 13515 --sport 4424 -j ACCEPT
iptables -A test2 -d 38.24.28.95 -j DROP
iptables -A FORWARD -p 6 -d 9.91.56.168 -s 128.98.127.140 --sport 46692 -j DROP
iptables -A INPUT -p 17 --dport 29661 --sport 40033 -j ACCEPT
iptables -A test1 -p 6 --sport 56251 --dport 46842 -j ACCEPT
iptables -A test1 -p 17 --sport 63234 -s 162.0.0.0/8 -j DROP
iptables -A test2 -p 6 --sport 64765 -d 145.223.0.0/16 --dport 26787 -s 109.70.223.0/24 -j ACCEPT
iptables -A test3 -p 17 --sport 55839 --dport 2132 -j DROP
iptables -A FORWARD -d 207.59.29.124 -j ACCEPT
iptables -A INPUT -p 6 --dport 15953 -d 106.11.43.21 --sport 53882 -j ACCEPT
iptables -A test3 -p 17 --dport 55886 --sport 33041 -j DROP
iptables -A INPUT -p 17 --sport 9766 -j test2
iptables -A test2 -p 6 --sport 32645 -j DROP
iptables -A INPUT -p 17 --sport 58128 -d 232.1.116.32 --dport 12062 -j ACCEPT
iptables -A test3 -p 17 --dport 38656 --sport 48167 -d 65.72.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 9086 -d 21.184.145.149 --sport 10140 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 38345 -d 90.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 -d 166.250.109.155 --sport 41503 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 61551 -d 95.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 5949 -d 238.125.243.0/24 -s 178.236.103.15 -j ACCEPT
iptables -A FORWARD -p 17 --sport 28199 --dport 3587 -d 186.14.53.138 -j DROP
iptables -A OUTPUT -p 6 -d 114.0.0.0/8 --sport 5299 --dport 16622 -j DROP
iptables -A test1 -p 6 --dport 42101 -d 178.97.74.21 --sport 63485 -j DROP
iptables -A test2 -p 17 --sport 54316 -s 41.57.0.0/16 -d 142.98.125.96 -j ACCEPT
iptables -A FORWARD -p 17 --dport 40170 --sport 65246 -s 209.70.155.44 -j test3
iptables -A OUTPUT -p 17 -d 56.57.0.0/16 --dport 26793 --sport 54954 -j ACCEPT
iptables -A test3 -p 17 -s 185.161.0.0/16 --dport 12052 --sport 11981 -j ACCEPT
iptables -A FORWARD -p 17 --dport 63676 --sport 16009 -d 11.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --dport 42333 -d 174.116.192.0/24 -j DROP
iptables -A test3 -p 17 --sport 47733 -s 14.210.199.0/24 -j ACCEPT
iptables -A test3 -s 46.0.0.0/8 -p 48 -j ACCEPT
iptables -A test1 -p 6 --sport 13227 -j ACCEPT
iptables -A INPUT -p 17 --dport 43578 -j ACCEPT
iptables -A test3 -p 17 --dport 60163 -j DROP
iptables -A test1 -p 6 --dport 17544 -d 59.252.78.32 --sport 50197 -j DROP
iptables -A test2 -p 6 --sport 55792 -s 172.0.0.0/8 -j DROP
iptables -A test1 -s 22.184.18.0/24 -d 15.243.197.0/24 -j DROP
iptables -A test3 -s 50.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --sport 53583 --dport 16439 -d 138.106.163.88 -j ACCEPT
iptables -A test1 -p 6 -d 68.159.130.189 -s 51.45.179.0/24 --sport 45521 -j DROP
iptables -A test2 -s 30.135.0.0/16 -j DROP
iptables -A test3 -p 17 --sport 57567 --dport 1206 -j DROP
iptables -A INPUT -p 17 --sport 35962 -d 75.137.149.204 -s 186.147.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 16093 -j DROP
iptables -A FORWARD -s 38.0.0.0/8 -j DROP
iptables -A INPUT -s 177.101.180.81 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 21101 --sport 23653 -j DROP
iptables -A test3 -p 6 --sport 26628 --dport 31351 -j DROP
iptables -A test1 -p 6 -s 35.161.227.53 --dport 64465 -j ACCEPT
iptables -A test1 -p 17 --dport 10289 -d 149.98.112.41 -j DROP
iptables -A FORWARD -p 6 -d 34.204.19.239 -s 136.37.119.0 --dport 41227 --sport 57254 -j ACCEPT
iptables -A test3 -p 6 --sport 30131 -s 81.67.124.44 --dport 22431 -d 195.45.39.0/24 -j ACCEPT
iptables -A test3 -p 6 -s 67.215.131.0/24 --sport 23606 -j DROP
iptables -A OUTPUT -p 6 -d 41.10.0.0/16 -s 211.0.0.0/8 --dport 23763 -j DROP
iptables -A test3 -p 17 -d 74.172.90.153 --dport 64974 --sport 29671 -j DROP
iptables -A test1 -p 17 --dport 23558 -j DROP
iptables -A FORWARD -p 163 -j DROP
iptables -A test3 -p 17 --sport 39022 -j DROP
iptables -A FORWARD -p 17 -d 156.0.0.0/8 --sport 20739 -j DROP
iptables -A FORWARD -p 17 --dport 54072 -d 249.172.4.79 -j ACCEPT
iptables -A test2 -p 6 --sport 7327 -d 26.140.49.0/24 -s 174.16.216.254 --dport 8059 -j DROP
iptables -A FORWARD -p 17 --dport 47918 -d 21.246.241.0/24 --sport 28022 -j DROP
iptables -A test1 -p 6 -d 148.0.0.0/8 --sport 42291 --dport 40022 -s 194.20.0.94 -j DROP
iptables -A test3 -p 6 --dport 20432 -j DROP
iptables -A INPUT -p 17 --sport 58008 -s 43.0.0.0/8 --dport 51541 -j ACCEPT
iptables -A OUTPUT -p 17 -s 135.126.100.181 --dport 27780 -j DROP
iptables -A INPUT -p 17 --sport 43873 -d 69.171.42.27 -j DROP
iptables -A OUTPUT -s 255.0.0.0/8 -j DROP
iptables -A test3 -p 6 -d 184.75.147.144 --sport 5970 --dport 7209 -j DROP
iptables -A OUTPUT -p 6 --dport 11841 -j DROP
iptables -A OUTPUT -p 17 -d 47.0.0.0/8 -s 123.8.36.0/24 --sport 35779 -j ACCEPT
iptables -A test1 -p 17 --dport 44700 -s 226.104.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 46587 -d 40.80.0.0/16 -s 140.192.118.0/24 -j DROP
iptables -A test1 -p 6 --sport 10029 -j ACCEPT
iptables -A INPUT -p 17 --dport 4170 -j test3
iptables -A INPUT -p 6 --dport 35334 -d 9.74.51.209 -j test2
iptables -A FORWARD -d 228.0.0.0/16 -j DROP
iptables -A FORWARD -p 6 --sport 25681 -d 104.122.0.0/16 -s 204.183.13.20 -j DROP
iptables -A test1 -p 17 --sport 37255 -s 74.157.100.0/24 --dport 59168 -d 28.69.0.0/16 -j ACCEPT
iptables -A test1 -s 173.59.16.49 -j DROP
iptables -A OUTPUT -p 6 -s 159.0.0.0/8 --dport 13663 --sport 4499 -j DROP
iptables -A test3 -p 6 --sport 46938 -d 162.89.193.154 -j DROP
iptables -A FORWARD -s 4.8.40.0/24 -j DROP
iptables -A OUTPUT -s 84.166.147.195 -j DROP
iptables -A FORWARD -p 6 --dport 51340 -s 206.14.76.147 -j ACCEPT
iptables -A FORWARD -p 17 -d 32.94.122.6 --sport 51054 -s 129.105.27.149 -j ACCEPT
iptables -A test2 -p 6 --sport 24227 -s 62.189.85.31 -j DROP
iptables -A test3 -p 190 -j ACCEPT
iptables -A FORWARD -p 17 -s 219.224.0.0/16 --sport 50143 -j ACCEPT
iptables -A test1 -p 4 -j DROP
iptables -A INPUT -p 6 --sport 7181 -d 211.37.60.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 39913 -d 193.128.213.105 -j DROP
iptables -A test1 -p 6 -s 237.30.115.0/24 --sport 36733 -j ACCEPT
iptables -A OUTPUT -p 245 -d 215.232.108.188 -j DROP
iptables -A test3 -p 102 -s 150.155.21.147 -j DROP
iptables -A OUTPUT -p 6 --dport 52912 -s 184.193.159.12 -j DROP
iptables -A FORWARD -p 17 --sport 60306 -s 74.23.160.128 --dport 54228 -j DROP
iptables -A test2 -p 17 --dport 1689 --sport 21391 -d 153.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -d 64.39.22.0/24 --dport 22171 -j DROP
iptables -A test3 -p 6 --dport 39612 -d 68.69.119.235 --sport 33282 -j DROP
iptables -A test3 -p 6 --dport 27667 -d 63.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --sport 5624 -s 18.0.0.0/8 -j DROP
iptables -A test2 -p 6 --sport 28648 -j DROP
iptables -A OUTPUT -p 17 -s 131.245.234.213 --sport 11633 -d 241.78.24.157 -j ACCEPT
iptables -A INPUT -d 254.213.0.0/16 -j DROP
iptables -A test3 -p 17 --dport 38937 -d 50.40.0.0/16 --sport 38322 -s 61.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --sport 24985 -j DROP
iptables -A OUTPUT -p 17 --sport 36431 --dport 7983 -j ACCEPT
iptables -A FORWARD -p 6 --dport 2995 -j ACCEPT
iptables -A test2 -d 144.193.20.141 -j DROP
iptables -A FORWARD -p 6 -d 178.182.93.0/24 --dport 14310 -s 172.213.77.0/24 --sport 34971 -j ACCEPT
iptables -A test3 -p 6 -d 210.186.133.30 -s 50.36.109.43 --sport 31867 -j ACCEPT
iptables -A test3 -p 17 --sport 38330 --dport 64308 -j ACCEPT
iptables -A FORWARD -p 17 -d 150.139.224.74 -s 130.165.190.0/24 --sport 44776 -j ACCEPT
iptables -A INPUT -p 6 -s 228.172.51.171 --sport 34618 --dport 42383 -j DROP
iptables -A test1 -p 17 --dport 15256 -j DROP
iptables -A test3 -p 17 --dport 18510 -s 38.237.223.15 -d 53.158.0.0/16 -j DROP
iptables -A test1 -p 6 -d 201.24.243.197 --sport 58267 -j ACCEPT
iptables -A FORWARD -p 17 --sport 51112 -d 240.102.161.102 --dport 54365 -j DROP
iptables -A OUTPUT -p 6 -s 230.29.173.0/24 --sport 8612 -j ACCEPT
iptables -A test2 -d 226.70.0.0/16 -j ACCEPT
iptables -A test1 -p 6 -s 183.0.0.0/8 --dport 33688 -j ACCEPT
iptables -A FORWARD -p 6 --dport 55187 --sport 53195 -j ACCEPT
iptables -A INPUT -p 54 -s 167.88.216.214 -j ACCEPT
iptables -A test1 -p 6 --sport 20609 -j DROP
iptables -A FORWARD -p 6 --sport 16243 --dport 7365 -j ACCEPT
iptables -A test2 -p 17 --sport 10334 -j DROP
iptables -A test2 -p 6 --dport 6081 -s 73.200.161.0/24 --sport 63789 -j ACCEPT
iptables -A INPUT -p 6 -d 78.21.17.168 -s 58.33.21.0/24 --sport 6945 -j DROP
iptables -A OUTPUT -s 8.117.201.209 -j ACCEPT
iptables -A test3 -p 34 -j DROP