iptables -N test1
iptables -N test2
iptables -N test3
iptables -A OUTPUT -p 17 -s 151.250.4.171 --sport 19705 -j DROP
iptables -A FORWARD -p 17 --dport 17324 -s 117.129.246.0/24 --sport 45012 -j DROP
iptables -A test2 -p 6 -d 249.203.86.135 --dport 27009 -s 171.250.68.0/24 -j ACCEPT
iptables -A test2 -p 6 --sport 10352 --dport 33067 -d 82.174.179.137 -j DROP
iptables -A FORWARD -p 6 -d 95.95.190.238 --sport 21329 -j ACCEPT
iptables -A OUTPUT -p 6 -d 163.220.83.233 --sport 13392 -j ACCEPT
iptables -A test3 -p 6 --sport 46317 -d 58.44.0.0/16 --dport 64777 -j DROP
iptables -A OUTPUT -p 176 -j DROP
iptables -A test2 -d 45.231.0.0/16 -j DROP
iptables -A test3 -p 17 --dport 19513 -s 139.0.0.0/8 --sport 65100 -j DROP
iptables -A test3 -p 6 -s 11.133.246.231 --dport 63324 --sport 7588 -j DROP
iptables -A test2 -p 17 --dport 27106 -s 35.233.236.0/24 -j DROP
iptables -A OUTPUT -d 95.226.93.140 -j ACCEPT
iptables -A FORWARD -p 35 -j DROP
iptables -A INPUT -p 17 -d 206.31.117.24 --dport 42526 --sport 59445 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 26237 -j DROP
iptables -A test1 -d 236.27.185.30 -s 179.44.0.0/16 -j DROP
iptables -A test1 -p 17 --dport 36756 --sport 12298 -s 109.113.224.247 -j ACCEPT
iptables -A FORWARD -s 109.30.4.252 -p 227 -d 4.131.172.165 -j DROP
iptables -A test2 -p 6 -d 36.212.234.0/24 --sport 19115 -s 54.187.240.78 -j ACCEPT
iptables -A test2 -p 6 -d 46.167.104.11 -s 44.248.0.0/16 --dport 50450 --sport 13942 -j ACCEPT
iptables -A test1 -p 6 -s 43.52.29.0/24 -d 195.48.0.0/16 --dport 35455 -j DROP
iptables -A OUTPUT -p 17 --dport 28489 -s 169.89.15.0/24 -j ACCEPT
iptables -A INPUT -p 17 -s 69.202.178.119 --dport 38740 --sport 14726 -j DROP
iptables -A test2 -d 74.197.0.0/16 -j DROP
iptables -A test2 -p 6 -d 24.111.32.199 -s 230.0.0.0/8 --sport 64028 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 2236 -d 39.33.63.209 -s 127.155.211.105 -j ACCEPT
iptables -A INPUT -s 9.254.53.0/24 -p 49 -j DROP
iptables -A FORWARD -p 6 -s 96.0.0.0/8 --dport 31647 -d 97.241.46.0/24 -j DROP
iptables -A FORWARD -s 96.64.192.0/24 -j DROP
iptables -A test1 -p 17 --sport 34544 -j DROP
iptables -A OUTPUT -p 17 --sport 55749 -j ACCEPT
iptables -A INPUT -p 6 -s 219.18.161.173 --sport 28929 --dport 60656 -j DROP
iptables -A test1 -p 129 -j DROP
iptables -A test3 -p 201 -j DROP
iptables -A test1 -p 6 --sport 25171 --dport 52853 -s 158.76.214.76 -j ACCEPT
iptables -A test3 -p 6 -s 11.89.170.211 --dport 63885 -j ACCEPT
iptables -A FORWARD -d 226.174.0.0/16 -j ACCEPT
iptables -A FORWARD -s 134.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 44857 -j DROP
iptables -A test2 -p 17 -s 211.203.18.254 --sport 27579 -j DROP
iptables -A OUTPUT -p 17 -d 108.116.0.0/16 --dport 25332 -j ACCEPT
iptables -A INPUT -p 6 --dport 33278 -j DROP
iptables -A INPUT -p 17 --dport 30705 -d 192.156.213.0/24 -s 52.35.4.191 -j ACCEPT
iptables -A test3 -p 6 --sport 1142 -d 252.0.0.0/8 -j DROP
iptables -A test1 -p 6 -s 15.70.111.98 -d 117.94.0.0/16 --sport 59023 -j ACCEPT
iptables -A OUTPUT -d 156.125.187.178 -j DROP
iptables -A test1 -p 0 -j DROP
iptables -A FORWARD -p 198 -j DROP
iptables -A OUTPUT -p 17 --sport 25993 -d 240.0.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 8992 -d 14.197.84.225 --dport 3228 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 65352 -j ACCEPT
iptables -A test1 -s 243.72.236.0/24 -d 48.90.126.170 -j ACCEPT
iptables -A test2 -p 17 --sport 40089 --dport 47476 -j DROP
iptables -A FORWARD -s 46.15.197.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 14977 -j ACCEPT
iptables -A test1 -p 17 --sport 5175 -s 4.40.0.211 --dport 1816 -j ACCEPT
iptables -A OUTPUT -p 233 -j ACCEPT
iptables -A test3 -p 6 --sport 19174 -s 4.0.0.0/8 -d 156.24.0.0/16 -j DROP
iptables -A test1 -d 111.175.95.68 -s 216.203.177.0/24 -j ACCEPT
iptables -A test2 -p 17 --dport 48169 --sport 22177 -d 58.77.75.42 -j DROP
iptables -A test3 -p 6 --sport 2070 -j ACCEPT
iptables -A OUTPUT -p 17 -d 94.122.0.0/16 --sport 47190 -j ACCEPT
iptables -A test2 -p 17 -d 58.10.22.231 --dport 60192 -j DROP
iptables -A test3 -d 53.0.0.0/8 -j DROP
iptables -A test1 -p 17 -d 138.82.137.28 --dport 32594 --sport 17381 -j DROP
iptables -A OUTPUT -p 17 --sport 46466 --dport 12230 -j DROP
iptables -A FORWARD -p 17 -s 98.35.0.0/16 -d 201.194.7.0/24 --sport 21301 -j DROP
iptables -A test1 -p 6 --sport 15422 -d 202.0.0.0/8 --dport 36894 -s 96.136.152.0/24 -j DROP
iptables -A test1 -p 6 --dport 15391 -s 5.0.0.0/8 -j DROP
iptables -A test2 -p 17 --sport 29480 -j DROP
iptables -A test3 -p 17 --sport 30203 --dport 51254 -j ACCEPT
iptables -A FORWARD -p 6 --sport 10473 -s 95.233.120.245 -j DROP
iptables -A test2 -p 17 --dport 22963 -s 8.15.194.23 -j DROP
iptables -A test3 -p 6 --dport 3410 -s 246.117.67.0/24 -j ACCEPT
iptables -A test3 -p 120 -s 133.67.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --dport 37543 -d 57.154.0.0/16 --sport 13069 -j DROP
iptables -A test3 -p 17 --sport 57276 -d 208.214.28.149 --dport 40392 -s 30.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 -s 204.193.195.229 --dport 37713 --sport 11140 -j DROP
iptables -A test1 -p 17 --dport 19370 -j DROP
iptables -A test3 -p 6 -s 22.9.62.12 --sport 17011 -d 233.49.140.235 -j ACCEPT
iptables -A test2 -p 17 --dport 692 -j ACCEPT
iptables -A INPUT -p 6 --dport 28229 -s 161.0.0.0/8 -j ACCEPT
iptables -A FORWARD -d 114.95.151.30 -j ACCEPT
iptables -A FORWARD -d 125.177.25.129 -j DROP
iptables -A INPUT -s 91.96.58.102 -d 13.128.0.0/16 -j DROP
iptables -A test1 -d 203.100.0.0/16 -p 31 -j ACCEPT
iptables -A test1 -p 6 -s 47.158.58.0/24 -d 246.183.233.131 --dport 5716 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 38075 -d 42.246.20.0/24 --dport 47257 -j ACCEPT
iptables -A test1 -p 17 --dport 6713 -j DROP
iptables -A test1 -p 6 -s 127.113.76.61 --sport 24559 -j ACCEPT
iptables -A INPUT -p 245 -s 144.206.0.0/16 -j DROP
iptables -A INPUT -p 6 --sport 54537 -j ACCEPT
iptables -A FORWARD -p 6 -d 245.161.102.233 --dport 18843 -j ACCEPT
iptables -A INPUT -d 1.248.249.119 -j DROP
iptables -A test1 -p 6 --dport 40122 -s 99.238.216.0/24 -d 184.46.224.15 -j DROP
iptables -A test1 -s 60.215.164.0/24 -j DROP
iptables -A INPUT -p 17 --dport 48263 -j ACCEPT
iptables -A FORWARD -p 89 -s 30.15.214.207 -j DROP
iptables -A test3 -p 17 --sport 30541 -s 216.82.0.0/16 -d 53.108.183.187 --dport 10678 -j ACCEPT
iptables -A FORWARD -p 17 -s 208.154.0.0/16 --dport 56227 -j ACCEPT
iptables -A test1 -p 6 --dport 16059 -j ACCEPT
iptables -A FORWARD -p 242 -j DROP
iptables -A test2 -p 69 -d 192.48.194.167 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 32428 -d 63.105.226.74 -s 21.127.150.247 -j DROP
iptables -A test1 -s 87.175.77.22 -j DROP
iptables -A test2 -p 17 --sport 30853 -j ACCEPT
iptables -A OUTPUT -p 6 -s 200.108.179.0/24 --dport 1718 -j ACCEPT
iptables -A INPUT -p 17 --sport 6988 --dport 58921 -d 248.46.116.48 -j DROP
iptables -A test3 -p 17 --dport 31370 -s 176.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --dport 7913 -j ACCEPT
iptables -A test1 -p 17 --dport 58531 -d 227.81.214.40 -j ACCEPT
iptables -A test2 -p 44 -j DROP
iptables -A test3 -p 2 -j DROP
iptables -A test1 -p 17 --dport 1821 -d 178.59.68.0/24 -j ACCEPT
iptables -A test1 -p 38 -d 130.204.130.222 -j ACCEPT
iptables -A INPUT -p 6 --sport 25399 -d 143.36.6.26 -j DROP
iptables -A FORWARD -p 6 --sport 13854 -j ACCEPT
iptables -A INPUT -p 17 --sport 64410 -j DROP
iptables -A test3 -p 17 -d 28.36.0.0/16 --dport 49756 --sport 2173 -j ACCEPT
iptables -A INPUT -p 6 --sport 57169 -j DROP
iptables -A OUTPUT -p 17 --dport 760 -d 142.56.100.0/24 -s 164.213.209.222 -j DROP
iptables -A test1 -d 156.47.0.0/16 -s 157.92.70.225 -j DROP
iptables -A FORWARD -p 6 --sport 15326 -j ACCEPT
iptables -A OUTPUT -p 6 -d 221.114.80.91 --sport 9666 -j DROP
iptables -A test3 -p 17 --sport 60372 --dport 46809 -d 89.22.54.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 31485 --dport 26298 -s 172.0.0.0/8 -d 203.38.98.81 -j DROP
iptables -A INPUT -p 17 --dport 16488 -s 47.25.8.80 -j ACCEPT
iptables -A INPUT -d 24.179.208.7 -j ACCEPT
iptables -A test3 -p 6 -d 183.73.113.58 -s 60.223.0.0/16 --dport 13682 -j DROP
iptables -A test1 -p 6 --sport 6658 -d 140.78.0.0/16 -s 136.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 50988 -d 118.6.0.0/16 -s 110.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 17329 -j DROP
iptables -A INPUT -p 6 --dport 48788 -d 182.0.0.0/16 -s 117.114.78.0/24 -j DROP
iptables -A FORWARD -s 236.4.246.0/24 -p 125 -j DROP
iptables -A test3 -s 49.0.0.0/8 -j DROP
iptables -A test2 -p 6 --sport 11484 -j DROP
iptables -A test2 -p 17 -d 70.42.206.183 --sport 10902 -j DROP
iptables -A test3 -p 6 --dport 56885 -s 92.139.93.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 6752 --dport 47130 -s 50.39.127.83 -j DROP
iptables -A test3 -p 17 -d 65.195.120.145 --dport 58862 -j DROP
iptables -A FORWARD -p 17 -d 252.185.89.9 --dport 27715 -j DROP
iptables -A FORWARD -p 17 -d 28.141.178.214 --dport 25441 -s 5.46.0.0/16 --sport 43634 -j ACCEPT
iptables -A OUTPUT -p 6 -d 4.34.6.136 --sport 50459 -s 245.198.21.132 --dport 24411 -j DROP
iptables -A test3 -p 6 -d 17.162.188.0/24 --sport 54962 -j ACCEPT
iptables -A test1 -p 193 -s 231.202.196.187 -d 139.179.0.0/16 -j DROP
iptables -A OUTPUT -p 6 -s 151.141.172.54 -d 213.176.152.136 --dport 56019 -j ACCEPT
iptables -A test1 -p 6 -d 31.16.71.55 --dport 16156 --sport 37600 -j DROP
iptables -A FORWARD -p 17 --dport 49021 -j ACCEPT
iptables -A OUTPUT -p 130 -j DROP
iptables -A test3 -p 17 -s 29.57.117.0/24 --sport 50769 -j DROP
iptables -A INPUT -p 17 --sport 37163 -j ACCEPT
iptables -A OUTPUT -p 6 -s 217.200.169.59 --dport 5842 --sport 5934 -j DROP
iptables -A OUTPUT -p 6 --sport 42544 --dport 16442 -d 162.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 --sport 40868 -j DROP
iptables -A OUTPUT -p 6 --dport 56184 -d 1.112.40.73 --sport 4293 -j ACCEPT
iptables -A test2 -p 6 --sport 56680 --dport 29551 -j ACCEPT
iptables -A test2 -p 6 -d 75.42.4.0/24 -s 84.90.88.200 --dport 4479 -j DROP
iptables -A INPUT -p 17 --sport 9888 --dport 4398 -j DROP
iptables -A FORWARD -p 6 --dport 35143 --sport 45064 -d 177.79.36.158 -j DROP
iptables -A OUTPUT -p 6 -d 53.212.6.0/24 --sport 32602 --dport 30632 -j ACCEPT
iptables -A test1 -p 17 --dport 32928 -j DROP
iptables -A OUTPUT -p 17 -d 126.131.175.0/24 --dport 9935 -s 150.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 3833 -s 145.0.0.0/8 -d 117.111.238.245 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 62551 --sport 39673 -d 194.90.133.39 -j DROP
iptables -A FORWARD -p 17 --dport 50059 -j ACCEPT
iptables -A FORWARD -p 6 -s 225.100.0.0/16 --sport 60107 -j ACCEPT
iptables -A INPUT -p 6 --dport 57087 -j DROP
iptables -A INPUT -p 17 -d 103.88.107.129 -s 73.0.0.0/8 --dport 58046 -j DROP
iptables -A FORWARD -p 17 -d 31.220.14.241 --sport 52069 -j ACCEPT
iptables -A INPUT -s 82.221.157.0/24 -j DROP
iptables -A test1 -p 17 --dport 55520 -s 10.21.118.76 -d 28.0.0.0/8 -j DROP
iptables -A test3 -p 6 --sport 64848 -d 215.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -s 107.171.227.149 --sport 13061 -j test2
iptables -A test2 -p 6 -d 212.68.174.229 -s 198.132.91.38 --sport 32343 -j DROP
iptables -A test1 -p 6 --sport 38506 -d 103.0.0.0/8 -s 218.47.0.0/16 -j ACCEPT
iptables -A test1 -p 17 -s 243.83.24.0/24 --sport 27551 -j ACCEPT
iptables -A test3 -s 98.0.0.0/8 -d 182.0.0.0/8 -j DROP
iptables -A OUTPUT -s 42.124.222.226 -j ACCEPT
iptables -A test2 -p 24 -s 98.145.37.32 -d 13.61.235.24 -j ACCEPT
iptables -A FORWARD -p 6 --sport 17435 -j DROP
iptables -A OUTPUT -s 68.0.0.0/8 -d 65.193.235.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -s 148.5.129.0/24 --sport 2489 -j ACCEPT
iptables -A INPUT -d 7.211.63.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -d 220.0.0.0/8 --sport 19129 --dport 39771 -j ACCEPT
iptables -A test3 -d 19.75.174.227 -p 106 -j DROP
iptables -A INPUT -p 17 --sport 60163 --dport 48166 -j ACCEPT
iptables -A OUTPUT -p 6 -s 154.144.60.213 -d 149.121.24.6 --dport 2040 --sport 44523 -j DROP
iptables -A test2 -p 6 -s 16.8.112.0/24 --sport 17785 -j DROP
iptables -A INPUT -p 36 -j DROP
iptables -A test1 -p 6 -d 149.26.56.182 --dport 21431 -s 191.19.93.28 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 38790 -j ACCEPT
iptables -A test1 -p 17 --sport 40388 -s 16.199.0.0/16 -d 214.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --sport 6355 -s 237.63.83.122 --dport 46821 -j ACCEPT
iptables -A OUTPUT -p 118 -d 111.4.248.80 -j DROP
iptables -A FORWARD -p 6 --sport 9508 -s 14.176.95.150 -j DROP
iptables -A OUTPUT -p 6 -d 227.68.38.43 -s 126.189.0.0/16 --dport 4216 -j ACCEPT
iptables -A FORWARD -d 254.0.0.0/8 -s 25.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 24298 --sport 31137 -d 50.0.0.0/8 -j DROP
iptables -A INPUT -d 240.106.236.34 -j ACCEPT
iptables -A INPUT -p 6 -d 204.12.93.23 --sport 9935 -s 0.212.165.103 -j DROP
iptables -A test2 -p 6 --dport 29005 -d 167.89.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --dport 23451 -d 250.1.209.157 -s 125.219.200.137 -j DROP
iptables -A FORWARD -s 47.170.13.250 -p 75 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 27722 -d 133.186.0.0/16 --dport 23313 -j ACCEPT
iptables -A OUTPUT -d 143.0.0.0/8 -j DROP
iptables -A test1 -p 6 --sport 23140 -d 117.125.3.253 -j DROP
iptables -A test1 -s 229.0.0.0/8 -p 89 -j ACCEPT
iptables -A test3 -p 17 -d 179.58.56.167 --sport 6069 -s 124.83.200.0/24 -j DROP
iptables -A test3 -p 17 -s 235.75.0.0/16 -d 99.0.0.0/8 --sport 63656 --dport 51357 -j DROP
iptables -A test1 -p 17 -s 226.96.222.122 --sport 4864 -j DROP
iptables -A test2 -d 132.59.0.0/16 -p 145 -j DROP
iptables -A INPUT -d 218.162.190.80 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 23808 --dport 23268 -j DROP
iptables -A OUTPUT -s 102.141.57.0/24 -j ACCEPT
iptables -A INPUT -p 6 -s 97.224.0.0/16 -d 151.177.96.0/24 --dport 33980 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 36618 -d 249.84.237.0/24 -j DROP
iptables -A test1 -s 113.101.248.73 -p 189 -j ACCEPT
iptables -A test3 -p 6 --dport 54977 -j ACCEPT
iptables -A test1 -p 6 --dport 6085 -j ACCEPT
iptables -A test3 -d 124.189.0.0/16 -j DROP
iptables -A test1 -p 6 --dport 3322 -d 150.0.0.0/8 -s 178.59.65.213 -j DROP
iptables -A OUTPUT -p 6 --dport 59564 -s 220.38.47.172 -j DROP
iptables -A OUTPUT -p 17 --dport 17220 -j ACCEPT
iptables -A test2 -p 6 --dport 26886 -d 55.146.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -s 126.20.244.158 --dport 24652 -d 107.135.220.15 -j ACCEPT
iptables -A test2 -d 218.216.201.0/24 -j ACCEPT
iptables -A test2 -p 6 -s 9.215.24.240 --sport 62730 -j DROP
iptables -A test1 -p 17 --dport 23728 -j DROP
iptables -A test2 -p 17 -s 207.163.63.30 --dport 32144 -j DROP
iptables -A FORWARD -s 38.13.74.70 -j DROP
iptables -A INPUT -p 6 --dport 17256 -j DROP
iptables -A test1 -p 17 -s 37.126.0.0/16 --dport 49037 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 24667 -s 64.119.65.0/24 -j test3
iptables -A test3 -p 17 --dport 23886 --sport 5009 -j ACCEPT
iptables -A test1 -p 17 --dport 49928 -j DROP
iptables -A INPUT -p 6 --dport 5733 -j DROP
iptables -A test2 -p 6 --sport 46894 -d 214.93.0.0/16 -j ACCEPT
iptables -A test3 -p 17 -s 107.131.101.245 --dport 36758 --sport 15461 -j ACCEPT
iptables -A test3 -p 6 --sport 13672 --dport 1876 -d 173.99.111.242 -j DROP
iptables -A test1 -p 6 --sport 5109 -s 36.92.110.91 -j ACCEPT
iptables -A FORWARD -d 27.222.0.0/16 -p 16 -s 51.128.0.0/16 -j DROP
iptables -A test1 -p 6 -d 161.158.70.42 --sport 51786 -j ACCEPT
iptables -A FORWARD -d 17.243.71.38 -p 16 -s 96.51.0.0/16 -j DROP
iptables -A FORWARD -p 6 --sport 47074 -d 87.6.164.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 32333 --sport 12887 -s 73.0.0.0/8 -j DROP
iptables -A test1 -p 6 --dport 27147 -d 219.114.18.82 --sport 41618 -j ACCEPT
iptables -A test1 -p 17 -d 177.176.254.156 --dport 48026 -j ACCEPT
iptables -A test1 -p 100 -j ACCEPT
iptables -A test2 -p 17 -d 141.83.0.0/16 --dport 9183 -s 38.134.57.26 -j DROP