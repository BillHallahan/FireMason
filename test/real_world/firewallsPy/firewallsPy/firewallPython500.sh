iptables -N test1
iptables -N test2
iptables -N test3
iptables -A FORWARD -p 6 -d 248.59.97.107 --sport 20230 --dport 5864 -j DROP
iptables -A test3 -p 6 --sport 56336 -j DROP
iptables -A test2 -p 6 -s 207.237.165.243 --dport 39151 --sport 21161 -j ACCEPT
iptables -A FORWARD -s 157.15.102.64 -p 151 -j DROP
iptables -A test2 -d 202.102.60.195 -p 74 -j DROP
iptables -A test2 -s 45.0.0.0/8 -p 204 -j DROP
iptables -A OUTPUT -p 6 --dport 55664 -d 75.15.67.234 --sport 57716 -j ACCEPT
iptables -A OUTPUT -p 66 -s 164.226.145.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 31466 -d 14.127.115.32 -s 158.59.53.0/24 -j DROP
iptables -A OUTPUT -p 17 --sport 53369 -d 198.150.103.0/24 -s 128.170.82.98 -j ACCEPT
iptables -A test2 -p 17 --dport 45954 -d 187.231.144.3 -j ACCEPT
iptables -A test3 -p 6 --dport 8136 -s 220.79.169.183 -j DROP
iptables -A test2 -p 17 --dport 10781 --sport 22917 -j ACCEPT
iptables -A FORWARD -p 6 --sport 5279 -d 77.242.82.115 -s 171.87.187.77 -j ACCEPT
iptables -A test1 -d 67.211.166.55 -s 131.38.72.158 -j ACCEPT
iptables -A test3 -p 6 -d 113.106.43.179 --dport 1734 -j ACCEPT
iptables -A OUTPUT -p 17 -s 243.76.0.0/16 --dport 25880 -d 206.2.83.126 -j DROP
iptables -A INPUT -p 17 -d 134.163.126.50 -s 80.156.216.184 --dport 40092 -j DROP
iptables -A test3 -p 17 --sport 62750 -j DROP
iptables -A OUTPUT -p 17 --sport 40204 -j ACCEPT
iptables -A INPUT -p 6 --dport 39666 -s 203.92.74.0/24 -j ACCEPT
iptables -A INPUT -p 6 --sport 46055 --dport 29218 -s 94.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 18895 -d 203.50.91.199 --dport 58283 -j DROP
iptables -A test3 -p 17 --sport 34494 -s 25.0.0.0/8 -d 185.215.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 -s 238.175.0.0/16 --dport 21905 --sport 4852 -j ACCEPT
iptables -A INPUT -p 6 --dport 7553 -j ACCEPT
iptables -A OUTPUT -p 6 -d 251.82.132.146 -s 29.182.0.0/16 --sport 46499 -j DROP
iptables -A test3 -p 17 --sport 57176 --dport 2260 -d 139.140.149.0 -j DROP
iptables -A FORWARD -p 6 --dport 17 -d 140.184.0.0/16 --sport 21515 -j DROP
iptables -A test2 -p 17 --dport 7096 --sport 63693 -s 125.205.8.0/24 -d 10.177.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --sport 21234 --dport 41674 -j ACCEPT
iptables -A test3 -p 6 -d 0.208.2.110 --dport 30740 -j DROP
iptables -A FORWARD -p 27 -d 16.176.151.167 -j DROP
iptables -A test1 -p 17 -s 4.0.0.0/8 --sport 26163 -j ACCEPT
iptables -A test2 -p 17 --dport 46550 -d 198.253.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --sport 26032 -s 177.74.0.0/16 -j DROP
iptables -A test1 -p 6 --sport 59715 -j ACCEPT
iptables -A test1 -p 17 --dport 62134 -d 246.231.24.195 --sport 32824 -j DROP
iptables -A test3 -p 6 --sport 41452 -j ACCEPT
iptables -A INPUT -p 6 --sport 30597 -j DROP
iptables -A test1 -p 6 -s 183.26.60.167 -d 47.217.151.70 --dport 4548 -j ACCEPT
iptables -A test1 -d 126.54.73.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --dport 4246 -s 221.95.165.64 -j DROP
iptables -A test2 -p 6 -s 151.153.19.180 --dport 42227 -j ACCEPT
iptables -A test3 -p 6 -d 152.188.181.195 --dport 36080 -j DROP
iptables -A test1 -p 17 --dport 32847 -j ACCEPT
iptables -A FORWARD -p 17 -d 62.32.0.0/16 --sport 35451 -s 133.42.164.0/24 -j ACCEPT
iptables -A FORWARD -p 149 -j ACCEPT
iptables -A test1 -p 6 -d 179.190.60.94 --sport 26374 -j DROP
iptables -A OUTPUT -d 148.189.202.162 -p 234 -j DROP
iptables -A FORWARD -p 17 --sport 2942 -s 245.98.113.139 -j DROP
iptables -A test1 -p 6 -d 54.239.186.165 --sport 64961 -j DROP
iptables -A INPUT -d 141.206.133.141 -p 212 -s 122.0.0.0/8 -j DROP
iptables -A test1 -p 17 -d 144.0.0.0/8 --dport 41939 -j DROP
iptables -A test3 -p 127 -d 156.225.170.0/24 -s 175.0.0.0/8 -j DROP
iptables -A test3 -p 17 --sport 436 -s 99.63.210.15 --dport 60514 -j DROP
iptables -A INPUT -p 17 --dport 7396 -s 75.47.65.97 -d 183.0.0.0/8 -j DROP
iptables -A test3 -p 17 --sport 63256 -s 254.0.0.0/8 --dport 2756 -j ACCEPT
iptables -A test1 -p 60 -s 246.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --sport 20389 -s 145.207.210.108 --dport 17393 -j DROP
iptables -A OUTPUT -p 17 --dport 17301 -s 201.126.56.0/24 --sport 51864 -j DROP
iptables -A FORWARD -p 17 -d 24.101.113.44 --dport 47394 --sport 29023 -j DROP
iptables -A test3 -d 45.0.0.0/8 -s 174.64.101.0/24 -j ACCEPT
iptables -A INPUT -p 6 --sport 4909 -d 182.103.0.0/16 --dport 39469 -j ACCEPT
iptables -A INPUT -p 17 --sport 37852 -d 125.51.160.0/24 -j ACCEPT
iptables -A FORWARD -p 6 --dport 61847 -j DROP
iptables -A FORWARD -p 17 --sport 27586 -j ACCEPT
iptables -A test2 -p 17 -d 174.181.70.172 --sport 2051 -s 66.169.0.0/16 -j ACCEPT
iptables -A test1 -p 101 -j ACCEPT
iptables -A FORWARD -p 6 --sport 45393 -j ACCEPT
iptables -A OUTPUT -p 17 -s 160.216.24.120 --dport 30095 -j ACCEPT
iptables -A FORWARD -s 131.42.145.99 -j ACCEPT
iptables -A test3 -p 17 -s 222.0.0.0/8 -d 110.0.0.0/8 --dport 32090 -j DROP
iptables -A INPUT -p 17 --sport 3486 --dport 780 -j ACCEPT
iptables -A test3 -s 67.163.0.0/16 -j DROP
iptables -A test2 -p 6 --dport 13826 --sport 16532 -s 187.142.193.228 -j ACCEPT
iptables -A test1 -p 6 -d 158.0.0.0/8 -s 75.67.38.63 --dport 10964 -j ACCEPT
iptables -A FORWARD -p 6 --sport 41719 -s 62.246.147.0/24 --dport 13337 -j ACCEPT
iptables -A test1 -p 17 -s 217.153.78.82 --sport 6976 -d 75.0.0.0/8 -j ACCEPT
iptables -A test1 -d 72.0.0.0/8 -p 58 -j ACCEPT
iptables -A test2 -p 19 -s 53.65.180.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 53892 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 49355 --sport 44173 -s 66.153.31.87 -d 72.133.183.171 -j DROP
iptables -A test3 -p 6 -d 241.0.0.0/8 -s 71.66.82.81 --sport 29865 -j ACCEPT
iptables -A INPUT -p 17 --sport 5609 --dport 28760 -s 50.147.66.70 -d 240.35.185.51 -j ACCEPT
iptables -A test3 -p 6 --dport 7703 -j ACCEPT
iptables -A INPUT -p 6 --sport 28185 -s 183.125.8.41 --dport 30662 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 52363 -j ACCEPT
iptables -A test3 -s 44.34.147.213 -j DROP
iptables -A test3 -s 52.239.0.0/16 -p 26 -j ACCEPT
iptables -A FORWARD -d 212.57.125.101 -j DROP
iptables -A INPUT -p 6 -s 97.81.237.50 --sport 20000 -j ACCEPT
iptables -A FORWARD -p 71 -s 152.163.13.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 32487 --sport 679 -d 49.94.0.0/16 -j DROP
iptables -A test2 -s 52.149.0.0/16 -d 139.81.160.60 -p 240 -j DROP
iptables -A FORWARD -p 17 --dport 44349 --sport 13830 -j DROP
iptables -A OUTPUT -p 17 --dport 1684 --sport 8273 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 2124 -j ACCEPT
iptables -A test2 -p 17 -d 119.134.166.22 --sport 48851 -s 76.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --sport 43554 -s 104.39.132.248 -j DROP
iptables -A OUTPUT -s 166.135.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 18783 -j DROP
iptables -A OUTPUT -p 17 --dport 30727 -j test3
iptables -A test1 -s 254.162.193.205 -j ACCEPT
iptables -A test3 -p 17 --dport 30762 -d 28.162.11.73 -j DROP
iptables -A test1 -p 6 --dport 33579 -j ACCEPT
iptables -A test1 -p 6 --sport 65197 -s 159.228.174.235 -j ACCEPT
iptables -A test1 -p 6 -d 77.0.0.0/8 --sport 8867 --dport 5145 -j DROP
iptables -A INPUT -s 54.209.91.100 -j DROP
iptables -A INPUT -p 6 -s 7.0.0.0/8 -d 76.208.227.0/24 --dport 30033 --sport 25108 -j DROP
iptables -A FORWARD -p 6 --dport 10800 -j test2
iptables -A test3 -p 17 --dport 12796 -j ACCEPT
iptables -A test3 -p 17 --dport 21936 -d 0.43.169.8 --sport 42686 -j ACCEPT
iptables -A test2 -s 160.220.121.174 -j DROP
iptables -A test3 -d 207.0.0.0/8 -j DROP
iptables -A test3 -p 100 -j DROP
iptables -A test1 -p 6 --dport 15216 --sport 54783 -j DROP
iptables -A test2 -p 6 -d 198.102.75.217 --sport 38966 --dport 60344 -j ACCEPT
iptables -A INPUT -p 17 -d 71.46.167.6 --sport 13701 --dport 25315 -j DROP
iptables -A test2 -p 6 --dport 47195 -j DROP
iptables -A OUTPUT -p 17 --sport 31234 -s 168.54.190.0/24 -j ACCEPT
iptables -A FORWARD -p 6 -d 112.90.203.53 -s 21.94.159.239 --dport 8375 --sport 15676 -j DROP
iptables -A OUTPUT -p 17 --dport 12229 --sport 20474 -s 39.0.0.0/8 -j DROP
iptables -A test3 -p 17 --sport 44560 -j DROP
iptables -A OUTPUT -p 17 --sport 40023 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 12586 --sport 52504 -s 92.114.0.0/16 -d 50.125.91.186 -j ACCEPT
iptables -A test3 -p 17 -s 79.36.185.0/24 --sport 23363 -j ACCEPT
iptables -A OUTPUT -p 83 -d 139.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 -d 241.0.0.0/8 -s 52.76.0.148 --sport 26037 -j DROP
iptables -A test2 -d 209.113.103.182 -s 91.0.0.0/8 -j DROP
iptables -A test2 -p 6 --dport 5720 -s 9.131.235.132 -d 149.0.0.0/8 -j DROP
iptables -A test2 -s 136.192.194.177 -j DROP
iptables -A test1 -p 6 -d 4.65.146.253 --dport 23775 --sport 19375 -j ACCEPT
iptables -A test1 -p 17 --sport 36725 -s 150.115.238.115 --dport 7327 -j ACCEPT
iptables -A OUTPUT -p 176 -s 72.92.116.37 -j DROP
iptables -A OUTPUT -d 240.13.162.145 -s 228.20.0.0/16 -p 231 -j ACCEPT
iptables -A OUTPUT -p 199 -j ACCEPT
iptables -A test1 -p 17 --sport 49081 -s 63.0.0.0/8 -d 247.145.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 16862 -s 247.0.0.0/8 -d 77.74.12.34 -j DROP
iptables -A test3 -p 17 -d 103.10.70.41 --sport 31245 -j ACCEPT
iptables -A test1 -p 17 -s 149.72.0.0/16 --sport 3057 --dport 3845 -j ACCEPT
iptables -A test2 -p 17 --sport 47720 -d 200.69.254.130 -j DROP
iptables -A test2 -p 17 --sport 47290 -j DROP
iptables -A test2 -p 6 --sport 2722 --dport 39827 -j ACCEPT
iptables -A INPUT -p 17 --sport 36606 -d 71.0.0.0/8 --dport 29589 -j test3
iptables -A OUTPUT -s 102.9.243.6 -j test3
iptables -A test3 -p 6 --sport 32513 -j ACCEPT
iptables -A OUTPUT -p 6 -d 114.130.212.59 --dport 36974 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 33391 -s 77.71.0.0/16 -j DROP
iptables -A OUTPUT -d 207.70.115.0/24 -s 242.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --dport 11433 --sport 26049 -d 241.82.237.0/24 -j DROP
iptables -A FORWARD -p 246 -j ACCEPT
iptables -A FORWARD -p 17 -s 132.123.7.248 --sport 4410 --dport 65515 -j DROP
iptables -A INPUT -p 17 --dport 51305 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 8667 --sport 22188 -d 62.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 -s 43.162.31.130 --sport 5049 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 31719 -s 199.239.181.175 -j ACCEPT
iptables -A test2 -p 6 --dport 640 -j ACCEPT
iptables -A test1 -s 42.196.224.110 -j ACCEPT
iptables -A test2 -p 6 -s 16.79.90.27 --dport 46329 -d 98.254.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 -d 252.193.0.0/16 --sport 9423 -j test2
iptables -A test3 -p 17 --dport 6324 -d 103.212.191.135 --sport 19575 -j ACCEPT
iptables -A test2 -p 6 -d 112.14.162.228 --sport 39252 --dport 52428 -j DROP
iptables -A FORWARD -p 17 --sport 25301 -d 216.120.0.0/16 -s 234.211.242.211 --dport 8353 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 59986 -s 198.24.232.0/24 -d 71.128.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 7028 -j DROP
iptables -A test2 -p 6 -s 12.10.85.0/24 --dport 11919 --sport 624 -j ACCEPT
iptables -A test2 -p 115 -j ACCEPT
iptables -A test2 -p 17 -d 55.154.243.69 -s 228.81.0.0/16 --sport 35581 -j ACCEPT
iptables -A test3 -p 6 --dport 54227 -s 54.163.205.114 --sport 46554 -j DROP
iptables -A test3 -p 6 -s 7.126.41.0/24 --dport 19342 -j ACCEPT
iptables -A INPUT -p 6 -d 35.200.0.0/16 -s 215.166.161.122 --dport 40851 -j ACCEPT
iptables -A INPUT -p 17 -d 193.140.0.0/16 --sport 37114 -j test1
iptables -A test2 -d 186.224.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --dport 27700 --sport 5379 -s 186.180.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --sport 39113 -s 137.240.0.0/16 -j ACCEPT
iptables -A INPUT -s 81.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --sport 36861 -s 179.0.0.0/8 -j ACCEPT
iptables -A FORWARD -s 73.231.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 -d 233.246.237.250 --dport 56460 -s 233.0.0.0/8 -j DROP
iptables -A test3 -p 17 --dport 32510 --sport 54753 -j DROP
iptables -A INPUT -p 17 -d 7.35.0.0/16 -s 75.0.0.0/8 --dport 37167 -j ACCEPT
iptables -A test3 -s 210.153.201.67 -j ACCEPT
iptables -A FORWARD -d 174.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --dport 47302 --sport 56049 -d 62.214.140.226 -j ACCEPT
iptables -A test3 -p 6 -s 105.139.174.186 --dport 28990 -j ACCEPT
iptables -A INPUT -p 6 --dport 32969 --sport 40251 -s 246.86.222.139 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 10438 -j ACCEPT
iptables -A test2 -p 17 -d 98.202.0.0/16 --sport 44889 -j ACCEPT
iptables -A test1 -p 6 --dport 6230 -j DROP
iptables -A INPUT -p 6 -s 222.156.37.127 --sport 46604 -j ACCEPT
iptables -A FORWARD -d 180.64.246.0/24 -p 61 -j DROP
iptables -A test1 -p 17 -d 220.141.25.179 --dport 33212 -s 57.88.77.144 --sport 49340 -j DROP
iptables -A test2 -d 11.79.61.37 -j ACCEPT
iptables -A test1 -d 71.0.0.0/8 -j DROP
iptables -A test2 -d 78.116.4.0/24 -j DROP
iptables -A test3 -p 17 --sport 27859 -j DROP
iptables -A OUTPUT -p 6 -s 68.224.69.80 --dport 14478 -d 73.169.4.149 -j ACCEPT
iptables -A INPUT -p 17 --dport 49073 -d 118.40.100.18 -j DROP
iptables -A INPUT -p 6 --dport 27063 -j DROP
iptables -A test1 -p 6 -s 182.87.48.56 --dport 3949 --sport 2425 -j ACCEPT
iptables -A test3 -p 17 --sport 33485 --dport 21174 -s 176.171.155.209 -j ACCEPT
iptables -A INPUT -p 6 --sport 20771 -d 179.84.208.0/24 -j DROP
iptables -A test3 -p 6 --sport 58956 -j ACCEPT
iptables -A OUTPUT -p 223 -j DROP
iptables -A FORWARD -p 6 --sport 64283 -d 118.0.0.0/8 -j ACCEPT
iptables -A INPUT -d 126.4.49.119 -s 58.35.39.24 -p 225 -j DROP
iptables -A INPUT -p 6 --dport 11666 -j ACCEPT
iptables -A test1 -p 17 --dport 33248 -j DROP
iptables -A INPUT -p 6 --dport 54178 -j ACCEPT
iptables -A test1 -d 43.206.239.110 -j DROP
iptables -A test2 -p 17 --sport 9438 -d 68.49.90.11 -j DROP
iptables -A FORWARD -p 6 --sport 11821 -s 168.231.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 --sport 10232 -d 84.215.10.117 -s 99.24.219.133 -j ACCEPT
iptables -A test3 -s 171.153.36.0/24 -j ACCEPT
iptables -A INPUT -p 226 -j DROP
iptables -A test2 -p 6 --sport 50744 -d 249.243.242.175 --dport 24036 -j DROP
iptables -A OUTPUT -p 138 -j ACCEPT
iptables -A test2 -p 17 --sport 61256 -j DROP
iptables -A INPUT -p 17 -s 184.42.252.92 --sport 39893 -j DROP
iptables -A test3 -p 17 --dport 20924 -d 160.154.103.202 --sport 17764 -s 155.161.206.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 21938 -s 25.68.51.178 --dport 22605 -j ACCEPT
iptables -A OUTPUT -p 17 -s 96.29.104.30 --sport 12762 -j DROP
iptables -A test3 -p 17 -d 64.0.0.0/8 --dport 34508 --sport 10644 -j DROP
iptables -A FORWARD -p 16 -s 128.16.0.0/16 -d 83.0.0.0/8 -j DROP
iptables -A test3 -p 6 --dport 911 -d 38.38.37.130 -j ACCEPT
iptables -A test2 -p 6 -d 215.250.0.0/16 --dport 41910 --sport 41194 -j ACCEPT
iptables -A OUTPUT -d 45.0.0.0/8 -j DROP
iptables -A test1 -p 6 -s 72.249.0.0/16 --sport 22787 -j ACCEPT
iptables -A test3 -p 6 --sport 16655 -s 41.0.0.0/8 -d 195.47.191.0/24 -j ACCEPT
iptables -A test1 -p 6 -s 80.10.52.100 --sport 35890 -j DROP
iptables -A FORWARD -p 6 -d 162.0.0.0/8 --sport 33469 --dport 2160 -j ACCEPT
iptables -A test2 -d 42.0.0.0/8 -j DROP
iptables -A test3 -p 83 -d 141.7.82.92 -j DROP
iptables -A INPUT -p 17 -s 223.101.85.72 --dport 10387 --sport 57397 -j ACCEPT
iptables -A test1 -p 17 --dport 32286 -s 205.222.73.180 -j DROP
iptables -A OUTPUT -p 6 --sport 41510 -j ACCEPT
iptables -A test2 -d 215.197.252.63 -j DROP
iptables -A test3 -p 17 -d 99.59.89.235 --sport 21250 -s 87.110.182.253 -j DROP
iptables -A test2 -d 232.79.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 37492 -d 190.21.254.41 --dport 13753 -j DROP
iptables -A INPUT -s 28.246.183.141 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 62673 -s 71.45.235.0/24 --dport 26034 -d 99.66.0.0/16 -j DROP
iptables -A test1 -s 200.143.0.0/16 -p 180 -j ACCEPT
iptables -A INPUT -p 105 -s 248.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 --dport 41785 -j ACCEPT
iptables -A test3 -p 17 -d 8.0.0.0/8 --sport 16492 -j DROP
iptables -A OUTPUT -p 6 --sport 53286 -j DROP
iptables -A FORWARD -p 6 --sport 48256 -j ACCEPT
iptables -A INPUT -p 31 -j DROP
iptables -A INPUT -p 6 -d 204.98.165.89 --sport 62006 -j ACCEPT
iptables -A INPUT -p 6 -s 210.84.120.0/24 -d 56.81.180.88 --sport 3160 -j ACCEPT
iptables -A test2 -p 17 --dport 61677 -s 39.60.50.0/24 -j DROP
iptables -A FORWARD -p 17 -s 65.144.0.0/16 -d 83.103.67.0/24 --sport 21052 -j ACCEPT
iptables -A OUTPUT -p 6 -s 218.0.0.0/8 --dport 2855 -j ACCEPT
iptables -A test2 -p 17 -s 173.32.152.0/24 -d 221.223.19.116 --sport 52345 -j DROP
iptables -A test3 -d 60.103.74.210 -p 182 -j ACCEPT
iptables -A test3 -p 6 --sport 23512 -d 230.116.56.0/24 -j ACCEPT
iptables -A test3 -s 155.161.74.84 -j DROP
iptables -A OUTPUT -p 6 --sport 55641 -d 66.217.181.177 -j ACCEPT
iptables -A FORWARD -p 17 -d 160.7.182.0/24 --dport 49179 -j DROP
iptables -A INPUT -p 17 --dport 24839 -j ACCEPT
iptables -A FORWARD -s 46.0.0.0/8 -j DROP
iptables -A test1 -p 6 --dport 33175 --sport 36741 -d 193.158.26.0/24 -j DROP
iptables -A test1 -p 6 --dport 2012 -s 122.124.51.251 --sport 21183 -d 202.118.0.0/16 -j ACCEPT
iptables -A test2 -d 199.69.158.195 -s 197.31.0.0/16 -j DROP
iptables -A INPUT -p 6 --sport 27644 -j ACCEPT
iptables -A test2 -p 210 -s 230.129.216.0/24 -j ACCEPT
iptables -A test1 -p 6 -s 70.249.4.0/24 --dport 65221 --sport 6968 -d 155.31.146.42 -j ACCEPT
iptables -A FORWARD -p 6 -s 130.0.0.0/8 --dport 37864 -d 10.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 -s 85.46.23.228 -d 144.194.204.73 --sport 33815 -j ACCEPT
iptables -A INPUT -s 156.225.72.246 -p 18 -j DROP
iptables -A FORWARD -p 6 --sport 19089 -d 10.0.0.0/8 --dport 3051 -j ACCEPT
iptables -A test2 -p 17 -s 252.139.50.174 --sport 18338 --dport 44883 -d 240.50.112.0/24 -j ACCEPT
iptables -A INPUT -d 113.202.199.0/24 -p 66 -s 95.0.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --sport 31287 -s 144.0.0.0/8 --dport 23436 -j DROP
iptables -A OUTPUT -p 6 --dport 24837 -j ACCEPT
iptables -A INPUT -d 126.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 --sport 11303 -j ACCEPT
iptables -A OUTPUT -s 82.0.0.0/8 -p 200 -j DROP
iptables -A test3 -p 17 --dport 50900 -j DROP
iptables -A FORWARD -p 17 --sport 39338 -d 250.24.61.198 -j ACCEPT
iptables -A INPUT -p 6 --sport 53803 -s 208.103.177.65 -j ACCEPT
iptables -A test1 -s 195.159.110.0/24 -j ACCEPT
iptables -A test3 -p 6 -d 146.0.0.0/8 --sport 11580 -j DROP
iptables -A test3 -p 17 --dport 498 -s 217.158.79.0/24 --sport 353 -d 124.241.77.25 -j DROP
iptables -A INPUT -s 113.0.0.0/8 -p 227 -j DROP
iptables -A test1 -p 6 --dport 46142 -d 57.141.0.0/16 -s 161.31.185.219 --sport 58409 -j DROP
iptables -A test2 -p 6 --sport 55435 --dport 15892 -j DROP
iptables -A test1 -p 6 --sport 20122 -d 159.205.144.19 -s 159.142.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 -d 80.247.1.0/24 --dport 19267 -j DROP
iptables -A OUTPUT -p 6 -s 146.0.0.0/8 --dport 4178 -d 46.0.0.0/8 --sport 49580 -j DROP
iptables -A INPUT -s 156.244.245.109 -p 31 -j ACCEPT
iptables -A OUTPUT -p 6 -s 204.23.117.254 --sport 38403 --dport 43498 -j DROP
iptables -A INPUT -p 17 -s 22.148.187.88 --sport 26301 -j DROP
iptables -A FORWARD -d 227.68.201.222 -j DROP
iptables -A test3 -d 9.49.158.10 -p 47 -s 252.210.100.84 -j DROP
iptables -A test1 -p 6 -d 208.49.219.94 --sport 5137 -j DROP
iptables -A OUTPUT -p 6 --sport 17548 --dport 54981 -s 41.160.194.106 -j DROP
iptables -A INPUT -p 6 --sport 37547 -j DROP
iptables -A INPUT -p 6 -s 198.152.0.0/16 --dport 18800 --sport 52373 -j ACCEPT
iptables -A FORWARD -s 124.66.153.0/24 -j ACCEPT
iptables -A INPUT -p 6 -s 113.21.249.115 -d 253.0.0.0/8 --dport 56147 -j ACCEPT
iptables -A OUTPUT -p 17 -s 7.81.119.91 --dport 12946 -j ACCEPT
iptables -A test3 -p 6 --dport 18738 --sport 39489 -j ACCEPT
iptables -A test1 -p 17 -d 92.220.0.0/16 --sport 51081 -s 16.231.49.25 -j DROP
iptables -A test3 -p 17 --sport 3135 -j ACCEPT
iptables -A test2 -p 6 --dport 34130 -s 130.230.0.0/16 -d 15.74.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 8303 -j DROP
iptables -A INPUT -p 17 -s 66.0.0.0/8 --sport 16466 -j DROP
iptables -A test2 -p 17 -s 151.118.104.124 --dport 2380 -j DROP
iptables -A INPUT -p 17 -s 15.170.70.122 --dport 13398 -d 123.28.62.214 -j DROP
iptables -A INPUT -p 158 -j DROP
iptables -A test1 -p 6 --dport 23857 --sport 20117 -d 3.57.56.157 -j DROP
iptables -A test1 -p 194 -j DROP
iptables -A INPUT -p 6 --dport 50533 --sport 12329 -j ACCEPT
iptables -A test2 -p 6 --sport 1578 --dport 4770 -d 213.112.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 -s 155.186.182.100 --dport 60344 --sport 22282 -d 121.82.119.0/24 -j DROP
iptables -A test3 -p 36 -j ACCEPT
iptables -A FORWARD -p 17 -d 43.128.0.0/16 --sport 11601 -s 220.57.0.0/16 -j test1
iptables -A test3 -p 6 --sport 1318 -s 2.91.22.139 -d 171.212.147.57 -j ACCEPT
iptables -A test1 -p 6 --dport 23119 -s 216.29.253.33 -d 200.35.75.194 -j ACCEPT
iptables -A INPUT -p 17 -d 240.148.201.117 --sport 34486 -s 158.131.0.0/16 -j DROP
iptables -A INPUT -p 17 --dport 16083 -j test2
iptables -A FORWARD -p 17 --sport 25723 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 20962 -d 232.75.221.177 -j DROP
iptables -A test1 -d 234.91.242.100 -p 232 -s 130.138.175.18 -j DROP
iptables -A test1 -s 228.31.85.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 53173 -j ACCEPT
iptables -A INPUT -p 17 -d 115.208.83.0/24 --sport 14710 -j ACCEPT
iptables -A test1 -p 17 -d 19.28.28.100 --dport 26192 -j ACCEPT
iptables -A OUTPUT -p 109 -j DROP
iptables -A test1 -s 121.145.224.90 -j DROP
iptables -A test2 -p 6 --sport 21227 -j DROP
iptables -A test3 -s 94.179.235.0/24 -j ACCEPT
iptables -A test1 -s 63.2.47.238 -j DROP
iptables -A FORWARD -p 17 --sport 35936 --dport 61711 -d 89.0.0.0/8 -j test3
iptables -A OUTPUT -s 152.224.0.0/16 -j ACCEPT
iptables -A INPUT -s 56.20.0.0/16 -j DROP
iptables -A FORWARD -p 17 --dport 50552 -d 76.0.0.0/8 -j DROP
iptables -A OUTPUT -d 100.155.86.137 -j ACCEPT
iptables -A test3 -p 6 --sport 25249 -s 41.159.97.29 --dport 63111 -j ACCEPT
iptables -A test2 -p 17 -s 214.164.0.0/16 -d 60.0.0.0/8 --sport 52324 -j DROP
iptables -A INPUT -p 6 -d 154.79.187.228 --dport 57160 -j DROP
iptables -A OUTPUT -p 50 -j ACCEPT
iptables -A INPUT -p 6 --dport 24000 -s 103.6.92.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 25397 -d 69.65.160.22 --dport 41411 -s 65.77.22.157 -j DROP
iptables -A test2 -s 60.136.215.0/24 -d 1.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 47067 -d 245.167.201.233 -j DROP
iptables -A test1 -p 6 --dport 49955 -d 252.0.0.0/8 --sport 23180 -j DROP
iptables -A test1 -p 17 -d 96.153.137.197 --sport 25578 -s 64.33.0.0/16 -j DROP
iptables -A INPUT -p 17 -s 132.168.127.0/24 --sport 45266 -d 49.212.34.217 -j DROP
iptables -A test1 -p 6 --dport 3319 -s 90.175.89.9 -d 115.75.73.177 -j ACCEPT
iptables -A test2 -p 6 --dport 31114 -j ACCEPT
iptables -A FORWARD -p 17 -d 146.145.208.98 --sport 11364 -j ACCEPT
iptables -A test2 -p 6 -d 124.0.0.0/8 --sport 11557 -j DROP
iptables -A FORWARD -p 17 --sport 9268 --dport 14687 -s 7.182.104.198 -j DROP
iptables -A OUTPUT -d 218.145.173.175 -j ACCEPT
iptables -A test3 -p 190 -d 156.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --sport 15952 -d 130.225.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 32403 -d 120.0.0.0/8 -s 165.67.0.0/16 -j ACCEPT
iptables -A FORWARD -s 5.9.84.160 -j ACCEPT
iptables -A test1 -p 6 --sport 65083 -s 34.164.166.153 -d 115.78.38.252 -j DROP
iptables -A OUTPUT -s 210.213.223.0/24 -p 157 -j ACCEPT
iptables -A test2 -p 6 --dport 54228 -s 237.176.141.0/24 --sport 39326 -d 60.185.47.78 -j ACCEPT
iptables -A test1 -d 219.20.164.230 -j DROP
iptables -A test1 -s 221.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --sport 26502 -j ACCEPT
iptables -A test3 -p 210 -d 80.115.187.193 -j DROP
iptables -A test3 -s 55.83.254.72 -p 151 -j DROP
iptables -A test3 -p 85 -j DROP
iptables -A OUTPUT -p 17 -d 56.214.131.62 --sport 4965 --dport 1119 -s 184.220.155.6 -j ACCEPT
iptables -A FORWARD -p 17 --sport 39910 -s 53.0.0.0/8 --dport 48915 -j ACCEPT
iptables -A FORWARD -p 17 --dport 41457 -d 211.42.83.5 --sport 13616 -j ACCEPT
iptables -A test2 -p 17 --sport 28728 --dport 61651 -d 157.143.13.0/24 -j DROP
iptables -A test1 -p 6 -d 169.24.132.244 --dport 27133 -j DROP
iptables -A FORWARD -p 6 --sport 45867 -d 25.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 7468 --dport 31668 -j ACCEPT
iptables -A INPUT -p 6 --sport 54040 -j ACCEPT
iptables -A OUTPUT -p 6 -s 46.146.118.24 -d 163.5.194.24 --dport 58434 -j ACCEPT
iptables -A INPUT -p 6 --dport 52186 -s 242.54.133.0/24 -d 78.46.0.0/16 -j DROP
iptables -A test3 -p 17 --dport 12297 --sport 11031 -d 115.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --dport 43869 -j DROP
iptables -A test2 -d 202.36.47.141 -p 245 -j ACCEPT
iptables -A FORWARD -s 11.45.245.209 -p 68 -j test3
iptables -A test1 -p 6 -s 36.231.232.0/24 --sport 57313 -j DROP
iptables -A test1 -p 17 --sport 4666 -d 228.51.0.0/16 -s 213.142.53.0/24 -j DROP
iptables -A OUTPUT -p 35 -j ACCEPT
iptables -A test2 -p 6 -s 90.0.0.0/8 --sport 31605 -d 84.220.44.171 -j ACCEPT
iptables -A FORWARD -d 209.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 19131 --sport 55565 -s 125.44.169.59 -j DROP
iptables -A OUTPUT -p 6 -s 178.6.116.129 --sport 39883 -d 141.42.7.183 -j DROP
iptables -A test2 -p 6 --dport 49528 --sport 11828 -j DROP
iptables -A test1 -p 17 -s 117.57.0.0/16 --sport 64668 -j ACCEPT
iptables -A test2 -d 220.0.0.0/8 -p 167 -s 228.199.144.7 -j DROP
iptables -A FORWARD -p 17 --sport 6421 -s 247.0.0.0/8 --dport 52578 -j DROP
iptables -A test2 -s 16.134.145.250 -j ACCEPT
iptables -A test1 -p 17 --sport 20805 -j ACCEPT
iptables -A test1 -p 6 -s 252.233.0.0/16 -d 216.92.209.0/24 --dport 17051 -j ACCEPT
iptables -A INPUT -p 17 -s 107.12.119.9 --sport 41842 --dport 48401 -d 129.233.52.131 -j ACCEPT
iptables -A FORWARD -p 38 -d 120.25.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 60414 --sport 2751 -j ACCEPT
iptables -A FORWARD -p 17 --dport 34387 -d 100.239.251.0/24 -s 146.195.77.0/24 -j DROP
iptables -A test3 -p 6 -d 184.51.0.0/16 -s 81.90.30.14 --sport 32721 -j DROP
iptables -A test3 -p 17 --sport 2452 -d 86.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --sport 13233 -j DROP
iptables -A test1 -p 17 -s 4.20.199.67 --sport 35036 --dport 35210 -j ACCEPT
iptables -A OUTPUT -s 197.9.0.0/16 -j DROP
iptables -A test2 -p 17 -s 143.152.242.140 --dport 42916 --sport 19118 -d 4.225.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --sport 39010 -s 187.22.151.124 --dport 63652 -j DROP
iptables -A test1 -p 17 -s 215.35.181.236 --sport 218 --dport 21211 -j ACCEPT
iptables -A INPUT -p 17 --sport 7824 -s 60.0.0.0/8 -d 205.0.0.0/8 -j DROP
iptables -A test2 -p 6 -d 131.13.59.60 --sport 61669 -s 81.56.51.11 -j ACCEPT
iptables -A INPUT -p 17 -s 107.128.107.0/24 --dport 28448 -j DROP
iptables -A FORWARD -p 6 --sport 34827 -s 62.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -d 140.78.0.0/16 --sport 55914 -j DROP
iptables -A test2 -p 17 --sport 57800 -d 67.221.124.168 -j DROP
iptables -A OUTPUT -p 6 --sport 60342 -d 189.3.138.15 -j DROP
iptables -A FORWARD -p 219 -j DROP
iptables -A test3 -p 6 -s 153.182.149.29 --dport 11717 -d 103.158.242.131 -j DROP
iptables -A FORWARD -p 6 -d 26.230.39.254 --sport 21889 -j ACCEPT
iptables -A test1 -p 17 -s 86.0.0.0/8 --sport 35672 --dport 28308 -j ACCEPT
iptables -A FORWARD -p 17 -d 9.178.140.208 --dport 38019 -j DROP
iptables -A test3 -p 17 -d 33.98.82.0/24 --sport 43478 --dport 15124 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 27308 -d 225.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --dport 56175 --sport 25226 -s 168.243.0.0/16 -j test1
iptables -A FORWARD -p 17 --dport 2544 -d 2.0.0.0/8 -s 187.31.176.0/24 -j DROP
iptables -A test1 -p 6 --sport 27481 -s 246.242.180.20 -j DROP
iptables -A FORWARD -p 17 --dport 41483 -j test3
iptables -A OUTPUT -p 17 --dport 1591 -j ACCEPT
iptables -A FORWARD -p 6 --sport 9796 -s 18.0.0.0/8 -d 121.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 -s 185.85.13.146 --dport 30226 -j ACCEPT
iptables -A FORWARD -p 17 --sport 22144 -j DROP
iptables -A INPUT -p 6 --dport 4111 --sport 41494 -d 146.69.108.95 -j DROP
iptables -A test2 -d 43.17.26.197 -s 86.44.123.2 -p 39 -j ACCEPT
iptables -A FORWARD -p 6 --sport 19793 -j ACCEPT
iptables -A INPUT -p 6 --dport 51624 -j ACCEPT
iptables -A test2 -p 6 --sport 46956 -s 39.220.48.0/24 --dport 19075 -j ACCEPT
iptables -A test3 -p 63 -j DROP
iptables -A test2 -p 6 --sport 4 -j DROP
iptables -A INPUT -s 222.52.0.0/16 -d 152.181.68.29 -p 163 -j DROP
iptables -A FORWARD -p 6 --sport 19005 -d 119.28.4.0/24 --dport 55483 -s 171.128.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 -d 198.241.0.0/16 --sport 3026 -j DROP
iptables -A test3 -p 17 --dport 12379 -s 3.125.199.0/24 --sport 663 -j DROP
iptables -A FORWARD -p 17 --dport 3995 -j ACCEPT
iptables -A OUTPUT -p 17 -d 37.225.24.138 --dport 37708 -j DROP
iptables -A INPUT -p 17 --dport 10720 -d 215.0.0.0/8 --sport 28707 -j ACCEPT
iptables -A FORWARD -p 17 --dport 39317 -d 63.153.250.10 -j ACCEPT
iptables -A FORWARD -p 17 --dport 19863 -d 56.217.96.190 --sport 10081 -j DROP
iptables -A FORWARD -p 6 --sport 43454 -s 61.80.245.176 --dport 53771 -j ACCEPT
iptables -A test1 -p 6 --dport 49552 -s 13.203.0.0/16 --sport 58044 -j ACCEPT
iptables -A OUTPUT -d 142.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 -s 20.56.73.106 -d 11.70.230.189 --sport 25748 --dport 1685 -j DROP
iptables -A INPUT -p 17 --dport 30373 --sport 45765 -s 143.147.94.115 -j ACCEPT
iptables -A FORWARD -p 6 -d 147.0.0.0/8 --dport 20940 -j DROP
iptables -A INPUT -d 27.111.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --dport 17635 -d 8.140.221.22 --sport 35790 -j DROP
iptables -A test3 -p 6 -d 213.199.81.30 --dport 15067 -j DROP
iptables -A FORWARD -d 120.96.62.22 -j ACCEPT
iptables -A test2 -p 17 -s 53.38.20.0/24 --dport 22649 -j DROP
iptables -A FORWARD -p 6 -s 136.13.52.37 --dport 26036 --sport 30902 -j DROP
iptables -A FORWARD -p 6 -s 107.149.109.24 -d 194.0.0.0/8 --dport 43976 -j DROP
iptables -A FORWARD -p 17 --dport 39739 -j DROP
iptables -A test3 -p 6 --sport 34361 -j ACCEPT
iptables -A FORWARD -p 6 --sport 61911 -d 3.58.0.0/16 -j ACCEPT
iptables -A FORWARD -s 152.37.0.0/16 -p 142 -j DROP
iptables -A test1 -p 17 --sport 30230 -j ACCEPT
iptables -A test3 -p 17 -d 228.31.27.0/24 -s 123.14.38.0/24 --dport 4235 -j DROP
iptables -A INPUT -d 156.1.241.52 -j ACCEPT
iptables -A test3 -p 6 --sport 5738 -j DROP
iptables -A FORWARD -s 105.216.245.243 -j DROP
iptables -A FORWARD -p 17 --dport 14819 -d 190.235.166.148 -s 51.74.144.0/24 -j DROP
iptables -A OUTPUT -p 108 -j DROP
iptables -A INPUT -p 17 --dport 9534 -s 67.124.169.0/24 --sport 10024 -j ACCEPT
iptables -A test2 -p 17 -s 229.137.46.59 --dport 21864 -j DROP
iptables -A INPUT -p 17 --dport 24629 --sport 56255 -d 228.119.22.170 -s 53.196.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --sport 10483 -s 118.0.0.0/8 -j ACCEPT
iptables -A test3 -p 166 -s 148.229.0.0/16 -d 88.214.0.0/16 -j DROP
iptables -A test2 -p 17 --sport 44681 -s 1.0.0.0/8 -d 108.225.106.0/24 --dport 62887 -j ACCEPT
iptables -A test3 -p 17 -s 231.0.0.0/8 --sport 22187 -d 150.2.184.251 -j DROP
iptables -A test3 -d 223.19.163.152 -j ACCEPT
iptables -A INPUT -p 17 --sport 20110 -d 80.222.0.0/16 -s 25.0.0.0/8 -j DROP
iptables -A INPUT -s 27.0.0.0/8 -p 133 -d 96.144.235.157 -j ACCEPT
iptables -A test1 -p 121 -j ACCEPT
iptables -A test2 -p 100 -j DROP
iptables -A test2 -p 17 --sport 2132 --dport 52722 -d 2.134.0.0/16 -j ACCEPT
iptables -A test3 -p 142 -j ACCEPT
iptables -A INPUT -p 17 -s 0.157.247.0/24 --dport 63359 -j ACCEPT
iptables -A INPUT -p 6 -d 186.253.0.0/16 --sport 55792 --dport 21296 -s 115.149.10.180 -j ACCEPT
iptables -A test3 -p 17 --sport 29392 -s 189.44.35.246 -j ACCEPT
iptables -A OUTPUT -p 17 -s 189.132.205.0/24 --dport 14529 -d 76.61.99.103 -j DROP
iptables -A test1 -p 17 --sport 32705 -s 94.74.57.0/24 --dport 30600 -j ACCEPT
iptables -A FORWARD -p 6 --sport 57576 -s 58.128.88.95 -d 223.201.124.133 -j DROP
iptables -A FORWARD -p 6 --dport 12914 --sport 63172 -d 186.195.45.185 -j ACCEPT
iptables -A test3 -d 236.174.10.38 -s 174.16.67.120 -j ACCEPT
iptables -A test2 -d 75.144.139.69 -j DROP
iptables -A test1 -s 134.0.0.0/8 -d 228.103.12.0/24 -j DROP
iptables -A FORWARD -d 181.94.0.0/16 -j DROP
iptables -A OUTPUT -p 190 -d 128.109.192.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 14711 -j DROP