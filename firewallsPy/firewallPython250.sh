iptables -N test1
iptables -N test2
iptables -N test3
iptables -A test3 -p 17 --dport 31734 -s 70.98.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --sport 55643 -d 138.37.0.0/16 -j DROP
iptables -A INPUT -p 157 -j ACCEPT
iptables -A test3 -p 6 --dport 25457 -s 63.150.214.89 --sport 33100 -j DROP
iptables -A test3 -p 17 --dport 47012 -s 160.0.0.0/8 --sport 36111 -j DROP
iptables -A test2 -p 17 --dport 62588 -s 131.217.46.38 -j DROP
iptables -A OUTPUT -p 17 --dport 42859 --sport 14063 -j ACCEPT
iptables -A test2 -p 17 --dport 38111 -j DROP
iptables -A test3 -p 6 --sport 48380 -s 138.197.0.0/16 --dport 36853 -j DROP
iptables -A FORWARD -p 6 --sport 50786 -s 64.165.36.119 --dport 18167 -j ACCEPT
iptables -A FORWARD -p 17 --sport 889 -j ACCEPT
iptables -A test1 -p 17 --dport 39355 -d 227.217.0.0/16 -s 150.177.239.131 --sport 16739 -j ACCEPT
iptables -A INPUT -p 17 -s 50.55.78.0/24 -d 19.249.166.0/24 --sport 34384 -j ACCEPT
iptables -A test3 -d 45.67.140.180 -j DROP
iptables -A FORWARD -d 35.224.118.209 -s 71.164.24.3 -j ACCEPT
iptables -A test1 -p 17 -d 194.206.79.67 --sport 12019 -j DROP
iptables -A test3 -s 157.193.123.152 -j DROP
iptables -A FORWARD -s 49.240.4.0/24 -j test2
iptables -A test2 -p 6 -d 225.236.98.139 --dport 3170 --sport 32673 -s 111.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 --dport 37018 -j DROP
iptables -A OUTPUT -s 83.240.226.20 -j ACCEPT
iptables -A test2 -p 17 -s 243.36.91.194 --sport 63331 -j ACCEPT
iptables -A test3 -p 17 --sport 16520 -j DROP
iptables -A test2 -p 17 --dport 62974 -d 245.178.251.112 --sport 3833 -s 114.225.235.115 -j DROP
iptables -A OUTPUT -s 228.160.138.61 -j DROP
iptables -A test1 -p 17 -s 50.32.238.125 --dport 37574 --sport 50397 -j DROP
iptables -A FORWARD -p 6 --dport 33524 -j DROP
iptables -A OUTPUT -p 17 --sport 12173 --dport 29992 -d 71.189.111.53 -j ACCEPT
iptables -A test2 -d 242.44.0.0/16 -p 38 -s 102.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 -s 252.203.23.63 --sport 62430 -j ACCEPT
iptables -A INPUT -p 6 --sport 54246 -j ACCEPT
iptables -A INPUT -p 6 --dport 58220 --sport 30971 -d 185.140.36.181 -s 32.0.0.0/8 -j DROP
iptables -A test2 -p 17 --sport 3435 -d 99.121.0.0/16 -s 241.122.0.0/16 -j ACCEPT
iptables -A INPUT -d 63.247.0.0/16 -p 8 -j DROP
iptables -A FORWARD -p 17 --sport 57766 -s 31.148.0.0/16 --dport 25496 -j ACCEPT
iptables -A FORWARD -p 6 --sport 40606 --dport 10082 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 2463 -d 62.67.181.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 -s 208.0.0.0/8 -d 13.232.228.0/24 --dport 63185 --sport 54487 -j ACCEPT
iptables -A INPUT -p 17 --dport 30079 -j DROP
iptables -A test2 -p 6 --sport 29912 -j ACCEPT
iptables -A test3 -p 90 -s 185.139.8.237 -j ACCEPT
iptables -A FORWARD -p 162 -d 206.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 50179 -j ACCEPT
iptables -A OUTPUT -d 244.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --dport 38198 -j DROP
iptables -A OUTPUT -p 17 --dport 47152 -d 134.135.59.161 --sport 49270 -j test3
iptables -A test3 -p 6 --dport 59285 -s 8.74.168.160 --sport 5608 -j ACCEPT
iptables -A FORWARD -p 6 -s 84.16.227.37 --sport 49954 -d 73.106.249.111 -j DROP
iptables -A FORWARD -p 17 --sport 9381 --dport 4922 -j ACCEPT
iptables -A FORWARD -s 59.83.114.0/24 -j ACCEPT
iptables -A INPUT -p 17 --sport 37601 -s 77.69.36.102 --dport 45657 -j DROP
iptables -A INPUT -d 206.27.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 13358 -j DROP
iptables -A INPUT -p 6 --sport 25299 --dport 16879 -j ACCEPT
iptables -A INPUT -d 100.27.183.242 -j ACCEPT
iptables -A test1 -s 71.129.96.204 -j ACCEPT
iptables -A test2 -p 17 -d 32.185.198.228 --sport 37343 -s 198.162.11.76 -j DROP
iptables -A test3 -p 6 -s 173.56.97.0/24 --sport 56775 --dport 39388 -j DROP
iptables -A test2 -d 56.96.188.0/24 -j DROP
iptables -A INPUT -p 17 --dport 10140 -d 125.215.0.0/16 -j ACCEPT
iptables -A OUTPUT -d 160.240.0.0/16 -j ACCEPT
iptables -A test3 -p 6 --dport 59902 -d 120.0.0.0/8 --sport 25900 -s 73.163.21.164 -j DROP
iptables -A test1 -p 186 -j ACCEPT
iptables -A test1 -p 17 -s 87.237.172.87 --dport 44440 -j ACCEPT
iptables -A test3 -p 17 --sport 28396 -s 7.255.0.0/16 -j DROP
iptables -A FORWARD -s 198.235.1.172 -j DROP
iptables -A INPUT -p 17 --dport 20683 -s 200.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 52009 -j test1
iptables -A test2 -p 17 --dport 12620 -d 18.0.0.0/8 -s 182.174.41.179 -j DROP
iptables -A test3 -p 17 --dport 13946 -d 95.65.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 2535 -s 59.0.0.0/8 -j DROP
iptables -A test3 -p 17 -s 205.216.53.75 -d 127.103.221.222 --dport 23867 -j ACCEPT
iptables -A test1 -p 17 -d 144.1.0.0/16 --dport 18626 --sport 6968 -j ACCEPT
iptables -A test3 -p 6 -d 201.0.0.0/8 -s 203.90.110.141 --sport 60891 -j DROP
iptables -A test1 -p 17 -d 244.205.226.0/24 --sport 59729 -j DROP
iptables -A FORWARD -p 17 --sport 37068 -s 123.2.36.107 -j DROP
iptables -A OUTPUT -p 6 --dport 51768 -s 148.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -s 127.0.0.0/8 --dport 8396 --sport 35022 -j ACCEPT
iptables -A FORWARD -p 17 --sport 45736 -d 20.67.137.0/24 -j DROP
iptables -A OUTPUT -p 17 --dport 45520 -d 172.0.0.0/8 --sport 35551 -j DROP
iptables -A test2 -p 17 --sport 49287 --dport 47389 -j ACCEPT
iptables -A OUTPUT -p 17 -s 163.0.0.0/8 --dport 45213 -j ACCEPT
iptables -A INPUT -p 17 --sport 11285 -s 163.42.126.142 --dport 25065 -j ACCEPT
iptables -A INPUT -p 6 --sport 13901 -d 44.118.40.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 -s 253.199.114.59 --sport 45536 -j ACCEPT
iptables -A INPUT -p 174 -j DROP
iptables -A test3 -d 38.0.0.0/8 -j DROP
iptables -A test3 -p 6 --sport 9591 -s 134.215.94.36 --dport 62488 -j DROP
iptables -A OUTPUT -p 17 --dport 13034 -s 43.0.0.0/8 -d 129.205.221.118 -j DROP
iptables -A INPUT -p 17 --dport 49743 -j DROP
iptables -A test1 -p 200 -d 9.0.0.0/8 -s 36.142.133.57 -j DROP
iptables -A test1 -p 17 -d 64.0.0.0/8 --sport 55557 -s 120.80.200.105 -j DROP
iptables -A OUTPUT -p 6 --dport 18099 -s 65.212.55.96 -j test2
iptables -A INPUT -s 86.61.254.214 -j ACCEPT
iptables -A INPUT -d 106.57.64.0/24 -j DROP
iptables -A test3 -p 17 --sport 53413 -j DROP
iptables -A FORWARD -p 6 --dport 52006 -j ACCEPT
iptables -A INPUT -p 151 -s 192.21.3.37 -j DROP
iptables -A FORWARD -p 6 --sport 8384 --dport 51018 -j DROP
iptables -A FORWARD -p 6 --dport 44882 --sport 27553 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 60829 -s 57.210.247.117 -j test3
iptables -A test3 -s 39.233.77.150 -j ACCEPT
iptables -A INPUT -p 6 --dport 19592 -s 62.180.245.72 -j DROP
iptables -A INPUT -p 6 --sport 57199 -j ACCEPT
iptables -A FORWARD -s 114.28.0.0/16 -j DROP
iptables -A test1 -p 229 -d 49.208.105.0/24 -j ACCEPT
iptables -A test2 -p 6 --sport 39100 -d 110.159.25.243 --dport 55142 -j DROP
iptables -A test3 -p 6 -d 102.98.199.10 --sport 13273 -s 50.228.2.0/24 -j DROP
iptables -A FORWARD -p 6 -d 148.253.232.0/24 --dport 7871 -j DROP
iptables -A OUTPUT -p 6 --dport 48337 -s 52.250.68.56 --sport 24409 -j DROP
iptables -A test3 -p 6 -d 10.0.0.0/8 --dport 50083 --sport 48206 -j ACCEPT
iptables -A test3 -p 6 -s 158.215.65.238 --sport 37765 -j DROP
iptables -A test2 -p 17 --dport 856 -d 197.147.164.98 -s 99.55.106.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 62045 -s 202.11.49.155 -j DROP
iptables -A test2 -p 6 -d 92.92.75.138 --dport 10981 -j DROP
iptables -A OUTPUT -p 6 -d 151.225.232.142 --dport 22514 -j ACCEPT
iptables -A test2 -p 6 -d 204.176.28.22 --dport 28694 --sport 61510 -j DROP
iptables -A INPUT -p 136 -j DROP
iptables -A test3 -p 17 --dport 2580 -s 186.232.217.216 -d 46.202.0.0/16 -j DROP
iptables -A test2 -p 6 -s 165.74.248.0/24 --sport 2234 -j DROP
iptables -A test1 -p 6 --dport 45725 -s 71.243.0.0/16 -d 194.243.118.2 -j DROP
iptables -A FORWARD -p 6 -s 254.172.212.120 --sport 10811 -j ACCEPT
iptables -A test1 -p 6 -s 120.40.84.211 --sport 10964 --dport 32626 -d 77.0.0.0/8 -j ACCEPT
iptables -A test1 -d 208.48.63.0/24 -j ACCEPT
iptables -A test2 -p 17 --dport 3268 -s 162.101.155.0/24 -d 76.240.158.161 -j DROP
iptables -A test1 -s 5.29.239.39 -p 190 -d 40.212.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --sport 20985 -j ACCEPT
iptables -A test2 -p 17 --dport 25434 -d 56.219.179.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 14289 -j DROP
iptables -A test2 -p 7 -j DROP
iptables -A OUTPUT -s 40.61.24.0/24 -p 90 -j ACCEPT
iptables -A OUTPUT -p 190 -j ACCEPT
iptables -A test1 -p 17 --dport 55451 -j ACCEPT
iptables -A INPUT -p 6 --dport 4387 -s 164.181.0.0/16 -d 173.0.0.0/8 -j DROP
iptables -A OUTPUT -d 24.100.22.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 46971 -s 101.146.89.127 --sport 9305 -j DROP
iptables -A test2 -d 166.45.114.0/24 -j DROP
iptables -A INPUT -p 17 -s 63.246.43.39 --dport 35882 --sport 42481 -j DROP
iptables -A INPUT -p 6 -s 181.34.148.27 --sport 63381 -d 118.228.0.0/16 -j DROP
iptables -A test1 -p 6 --sport 14268 -d 47.224.68.0/24 --dport 16321 -j DROP
iptables -A OUTPUT -p 17 --sport 40710 -d 61.53.158.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 11119 -j DROP
iptables -A OUTPUT -p 6 -d 246.0.0.0/8 --dport 33398 --sport 20846 -j ACCEPT
iptables -A test2 -p 17 --sport 8174 -j DROP
iptables -A OUTPUT -p 17 --dport 64248 --sport 27293 -d 128.200.181.144 -j DROP
iptables -A INPUT -p 17 --dport 14842 --sport 6909 -j DROP
iptables -A test3 -p 17 -s 132.32.209.147 -d 243.238.61.0/24 --dport 34467 -j ACCEPT
iptables -A test2 -p 17 --sport 17141 -j DROP
iptables -A test1 -s 5.64.69.64 -d 41.122.48.0/24 -j DROP
iptables -A OUTPUT -p 17 --sport 6625 --dport 8696 -j ACCEPT
iptables -A INPUT -p 17 -s 70.4.78.19 --dport 7172 -j DROP
iptables -A test3 -p 6 --sport 34596 -s 242.169.0.0/16 -j ACCEPT
iptables -A INPUT -p 146 -j DROP
iptables -A INPUT -p 17 -d 200.0.0.0/8 --dport 19900 -j DROP
iptables -A test3 -p 17 --sport 63179 --dport 29702 -s 192.56.131.120 -j ACCEPT
iptables -A test2 -p 17 --sport 57644 -s 45.137.140.27 -j ACCEPT
iptables -A test2 -s 193.162.11.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 45081 -j ACCEPT
iptables -A test3 -p 6 --sport 6301 -j ACCEPT
iptables -A INPUT -p 6 -d 48.0.0.0/8 --sport 50480 --dport 5737 -s 208.189.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 2431 -d 163.169.9.35 --sport 63367 -j DROP
iptables -A FORWARD -s 41.136.121.0/24 -p 65 -j ACCEPT
iptables -A OUTPUT -p 6 -s 80.39.229.0/24 --sport 4901 -j ACCEPT
iptables -A INPUT -s 6.184.0.0/16 -p 149 -j DROP
iptables -A test3 -p 6 -s 45.0.0.0/8 -d 140.18.71.220 --dport 21289 -j DROP
iptables -A OUTPUT -s 232.0.0.0/8 -p 38 -j DROP
iptables -A test1 -p 17 -s 206.67.250.238 --dport 59138 -d 14.71.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --dport 42785 -j DROP
iptables -A test2 -p 6 -d 246.0.0.0/8 --dport 17313 -j ACCEPT
iptables -A test3 -p 17 --sport 30111 --dport 16236 -j ACCEPT
iptables -A INPUT -p 17 -s 68.0.0.0/8 --sport 5176 -j DROP
iptables -A OUTPUT -p 6 --dport 50843 -d 26.12.176.67 -j ACCEPT
iptables -A test2 -p 17 -d 94.154.26.133 --dport 32329 -s 143.28.234.207 -j ACCEPT
iptables -A INPUT -p 17 --sport 43078 -j ACCEPT
iptables -A test3 -p 6 --sport 43992 --dport 61375 -s 132.50.152.238 -j DROP
iptables -A FORWARD -p 6 -d 195.225.196.0/24 --sport 8766 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 54039 -s 216.74.31.96 --dport 12868 -j ACCEPT
iptables -A test1 -p 6 -s 108.100.2.0/24 --sport 48221 --dport 39199 -j DROP
iptables -A test1 -p 6 --dport 60675 -j ACCEPT
iptables -A test1 -p 6 -s 1.0.0.0/8 -d 61.0.0.0/8 --sport 28545 --dport 12445 -j DROP
iptables -A FORWARD -s 230.27.161.0/24 -j ACCEPT
iptables -A test2 -p 6 --dport 12255 -s 111.161.5.73 --sport 39434 -j DROP
iptables -A test1 -d 54.0.0.0/8 -j ACCEPT
iptables -A test3 -s 12.79.128.0/24 -p 163 -j DROP
iptables -A test1 -p 6 -d 50.251.206.19 --sport 8940 --dport 32870 -j ACCEPT
iptables -A test3 -p 17 --dport 22407 -d 249.90.139.0/24 -j DROP
iptables -A test3 -p 17 --dport 65529 -d 70.40.72.23 --sport 56409 -j DROP
iptables -A FORWARD -p 6 --sport 57700 -s 131.56.254.0/24 -d 21.180.60.0/24 -j test2
iptables -A test3 -p 6 --sport 23952 -s 194.236.245.150 -j DROP
iptables -A FORWARD -d 230.115.32.110 -j DROP
iptables -A test3 -p 87 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 33978 --sport 39391 -s 101.177.197.201 -j ACCEPT
iptables -A test1 -p 6 -s 69.158.54.116 --sport 51121 --dport 2525 -j DROP
iptables -A test2 -p 6 --dport 62061 --sport 31577 -j ACCEPT
iptables -A test3 -p 17 --dport 64272 -s 55.4.220.72 -j DROP
iptables -A INPUT -p 17 -d 62.168.208.0/24 --sport 18252 -s 206.254.177.21 -j test2
iptables -A OUTPUT -p 17 --dport 58031 --sport 9664 -j DROP
iptables -A OUTPUT -p 17 --dport 44083 -s 240.43.233.0/24 -j ACCEPT
iptables -A test3 -s 66.221.149.131 -d 237.163.189.207 -p 166 -j DROP
iptables -A test1 -p 17 --dport 55586 -s 111.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -d 161.177.74.187 --sport 41089 -j ACCEPT
iptables -A test1 -d 117.26.0.0/16 -j DROP
iptables -A INPUT -p 126 -j ACCEPT
iptables -A test1 -p 17 --sport 36078 --dport 17848 -s 73.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 27218 --sport 31915 -j ACCEPT
iptables -A test3 -p 110 -j DROP
iptables -A INPUT -p 17 --sport 2792 -s 32.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --dport 38761 -s 187.39.13.209 -j DROP
iptables -A OUTPUT -p 17 --sport 6054 -d 94.7.216.0/24 -j DROP
iptables -A test1 -p 17 --dport 7712 -d 95.176.0.0/16 -s 111.15.29.104 -j ACCEPT
iptables -A test1 -p 6 --sport 23934 -j DROP
iptables -A test1 -p 157 -s 20.255.168.0/24 -j DROP
iptables -A INPUT -p 17 --dport 39206 -j ACCEPT
iptables -A test1 -d 252.120.57.168 -j ACCEPT
iptables -A FORWARD -p 185 -j DROP
iptables -A test3 -p 6 --sport 43643 -j DROP
iptables -A INPUT -p 17 --dport 28241 -j ACCEPT
iptables -A INPUT -p 6 --sport 48818 --dport 24329 -j DROP
iptables -A test2 -p 17 --sport 55162 -s 31.183.22.210 --dport 22738 -j DROP
iptables -A test1 -s 99.16.97.0/24 -j ACCEPT
iptables -A FORWARD -p 13 -j DROP
iptables -A FORWARD -p 17 --dport 25820 -s 195.7.223.0/24 -j test1
iptables -A test2 -p 6 --sport 61470 --dport 50654 -s 39.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -s 95.110.166.148 --sport 8661 -j DROP
iptables -A FORWARD -p 6 --sport 23526 -s 197.238.0.0/16 --dport 35133 -j DROP
iptables -A INPUT -p 17 --sport 65004 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 31119 -d 29.1.183.38 -j DROP
iptables -A test3 -p 17 --dport 8786 -s 177.97.117.0/24 -j DROP
iptables -A test3 -p 6 --dport 1479 -d 70.233.10.224 -j DROP
iptables -A test2 -p 6 --dport 27381 -d 238.45.141.227 -j DROP
iptables -A test3 -p 17 --dport 5443 -s 5.186.122.16 -j DROP
iptables -A INPUT -p 17 -d 115.62.143.116 --sport 14082 -s 69.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 -d 126.221.67.183 --sport 30706 --dport 47573 -j ACCEPT
iptables -A FORWARD -p 6 --dport 61317 -j ACCEPT
iptables -A FORWARD -p 6 --dport 42980 --sport 50865 -s 178.104.169.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 61323 --dport 30047 -s 226.208.129.29 -j DROP
iptables -A OUTPUT -p 6 --dport 55780 -d 34.117.166.249 -j DROP
iptables -A OUTPUT -p 17 --dport 16669 -d 94.9.0.0/16 -s 157.155.192.247 -j ACCEPT
iptables -A test3 -p 17 -s 133.0.0.0/8 --dport 17820 --sport 47623 -j ACCEPT
iptables -A test2 -p 17 --sport 5404 --dport 18322 -s 67.219.0.0/16 -j DROP
iptables -A test1 -p 6 --sport 16793 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 56122 -s 228.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 55586 -d 3.42.237.103 -s 155.125.83.246 -j ACCEPT
iptables -A FORWARD -p 17 --sport 28898 -s 199.248.114.210 -d 94.144.233.123 -j DROP
iptables -A INPUT -p 17 -d 13.0.0.0/8 --dport 25853 --sport 59311 -j ACCEPT
iptables -A test1 -p 6 --dport 43285 -j DROP
iptables -A test2 -d 190.216.232.151 -s 30.62.139.0/24 -j DROP
iptables -A test1 -p 158 -d 57.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 -s 41.122.0.0/16 --dport 49040 -d 236.40.0.0/16 --sport 19995 -j ACCEPT
iptables -A test2 -p 6 --dport 40357 -d 160.29.104.87 -j DROP