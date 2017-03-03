iptables -N test1
iptables -N test2
iptables -N test3
iptables -A test1 -p 6 --sport 24803 -d 254.17.0.0/16 --dport 31204 -j ACCEPT
iptables -A test1 -p 6 -s 42.138.178.97 --sport 13836 -d 240.2.182.207 -j ACCEPT
iptables -A test1 -p 6 --dport 60941 -j ACCEPT
iptables -A test1 -p 17 -s 22.101.35.175 --sport 34188 --dport 23108 -j ACCEPT
iptables -A test3 -d 219.81.53.0/24 -s 11.0.0.0/8 -j ACCEPT
iptables -A test3 -d 192.39.191.0/24 -s 143.139.0.0/16 -j DROP
iptables -A test1 -p 17 --dport 10158 -s 227.83.54.0/24 -j DROP
iptables -A OUTPUT -p 6 --sport 64329 -s 74.162.130.124 -j ACCEPT
iptables -A test2 -p 17 --sport 17359 -j DROP
iptables -A OUTPUT -p 6 --sport 35253 -d 126.20.59.48 -s 135.87.6.248 -j ACCEPT
iptables -A test3 -d 157.0.0.0/8 -s 219.0.0.0/8 -p 41 -j DROP
iptables -A INPUT -p 6 -d 80.71.115.179 --dport 19230 -j ACCEPT
iptables -A test3 -p 6 --dport 11102 -j DROP
iptables -A FORWARD -p 17 --sport 63444 --dport 51484 -s 226.229.168.107 -d 135.144.70.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 51700 -d 82.30.0.0/16 --sport 31455 -j DROP
iptables -A test3 -p 107 -s 118.93.241.79 -j DROP
iptables -A test1 -s 90.15.215.189 -j ACCEPT
iptables -A OUTPUT -p 17 -d 77.169.246.0/24 --dport 3155 -j DROP
iptables -A test3 -p 17 --dport 32359 -j ACCEPT
iptables -A FORWARD -d 122.252.220.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 10246 -j ACCEPT
iptables -A FORWARD -p 6 --dport 26717 -s 245.61.33.0/24 --sport 45521 -j ACCEPT
iptables -A test1 -p 17 -s 196.220.0.0/16 --sport 59105 -d 70.155.142.141 -j ACCEPT
iptables -A test3 -s 121.5.229.108 -j ACCEPT
iptables -A test1 -s 36.78.122.0/24 -d 65.97.0.0/16 -j DROP
iptables -A INPUT -p 17 --sport 46872 -d 217.123.117.134 --dport 11205 -j ACCEPT
iptables -A test2 -p 6 --sport 24787 -d 13.46.227.0/24 -j DROP
iptables -A test3 -p 6 --dport 36649 -j ACCEPT
iptables -A INPUT -p 17 -s 13.245.151.215 --dport 55131 -j DROP
iptables -A test1 -p 17 -d 206.159.0.0/16 -s 136.189.55.224 --sport 43783 -j ACCEPT
iptables -A test2 -p 17 --dport 56772 -s 170.173.189.0/24 -j ACCEPT
iptables -A test2 -s 41.79.229.0/24 -j DROP
iptables -A INPUT -s 246.151.236.164 -d 60.178.0.0/16 -p 143 -j test1
iptables -A FORWARD -p 17 --sport 10082 -s 164.0.0.0/8 -d 148.0.0.0/8 -j ACCEPT
iptables -A test2 -p 17 --dport 34709 -j ACCEPT
iptables -A OUTPUT -p 6 -s 174.78.240.0/24 --sport 13337 -j DROP
iptables -A test2 -d 2.233.0.0/16 -s 218.106.48.41 -j DROP
iptables -A test2 -p 9 -d 249.147.164.0/24 -s 124.32.65.145 -j ACCEPT
iptables -A OUTPUT -p 6 -d 16.0.46.234 --sport 3843 -j DROP
iptables -A test2 -p 6 -s 231.0.0.0/8 --dport 14824 -j DROP
iptables -A test3 -p 6 -d 140.42.128.0/24 --sport 39104 --dport 23259 -j DROP
iptables -A FORWARD -p 17 --dport 44307 -j ACCEPT
iptables -A test1 -p 17 --dport 19703 --sport 8621 -s 228.88.74.170 -j DROP
iptables -A test1 -s 201.32.162.206 -j DROP
iptables -A test3 -p 6 -d 254.199.103.184 --dport 14516 -j ACCEPT
iptables -A test3 -p 6 -d 80.0.0.0/8 -s 244.0.150.46 --dport 38979 -j ACCEPT
iptables -A test1 -s 103.29.109.0/24 -p 107 -d 188.128.28.206 -j DROP
iptables -A test1 -p 17 --sport 64693 -j DROP
iptables -A INPUT -p 17 --dport 41215 -d 145.114.0.0/16 -j DROP
iptables -A test1 -s 30.81.184.175 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 56192 -j DROP
iptables -A test2 -s 110.135.0.0/16 -p 227 -j DROP
iptables -A test1 -p 17 -d 125.35.0.0/16 --sport 60272 -s 51.121.178.195 -j ACCEPT
iptables -A test3 -p 6 -s 59.0.0.0/8 -d 70.0.0.0/8 --dport 17858 -j ACCEPT
iptables -A test3 -p 17 --sport 37203 -j ACCEPT
iptables -A INPUT -p 215 -s 174.0.0.0/8 -d 214.26.79.178 -j ACCEPT
iptables -A FORWARD -p 17 -s 117.240.0.0/16 --dport 60896 -j ACCEPT
iptables -A test3 -p 17 -s 203.87.13.205 --sport 47025 -j DROP
iptables -A test3 -p 17 -s 28.98.65.254 --sport 42822 -d 147.150.69.82 --dport 62505 -j DROP
iptables -A test3 -p 6 --dport 59749 -s 164.68.139.87 -j DROP
iptables -A INPUT -p 17 --sport 15417 -d 55.44.165.16 -s 180.133.221.0/24 -j ACCEPT
iptables -A test2 -p 17 --dport 46357 -j ACCEPT
iptables -A FORWARD -p 17 -s 136.172.0.0/16 --dport 32319 --sport 8865 -j DROP
iptables -A test2 -p 17 -d 105.231.189.189 --sport 56143 -j DROP
iptables -A test1 -p 6 --sport 46829 -s 249.107.251.158 -j DROP
iptables -A OUTPUT -p 17 -s 190.43.0.0/16 --dport 49907 -j ACCEPT
iptables -A test2 -p 17 -d 157.106.83.114 --sport 45470 --dport 29547 -j DROP
iptables -A FORWARD -p 6 --dport 46679 -s 204.187.100.87 -d 207.121.214.52 -j ACCEPT
iptables -A FORWARD -p 6 --sport 59199 --dport 60816 -j ACCEPT
iptables -A test2 -p 6 -d 110.90.0.0/16 --dport 47497 --sport 59818 -j DROP
iptables -A FORWARD -p 17 --sport 49406 -j DROP
iptables -A FORWARD -p 17 --dport 11686 -j ACCEPT
iptables -A test3 -s 168.0.0.0/8 -p 39 -j DROP
iptables -A test2 -s 33.136.40.9 -j ACCEPT
iptables -A test1 -s 0.32.217.16 -j DROP
iptables -A INPUT -p 17 --sport 51812 -s 37.49.51.82 -d 65.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --dport 37098 --sport 47795 -d 125.145.207.62 -j ACCEPT
iptables -A test2 -p 6 -s 189.199.0.0/16 -d 230.150.93.11 --sport 62126 -j DROP
iptables -A test2 -d 76.219.85.0/24 -j DROP
iptables -A test2 -p 6 -d 185.76.123.0/24 -s 236.177.235.42 --dport 35152 --sport 11383 -j ACCEPT
iptables -A INPUT -s 107.106.72.92 -j DROP
iptables -A test3 -p 6 --dport 17886 -s 27.226.24.194 -j DROP
iptables -A test3 -p 17 -s 12.131.19.118 --sport 46541 --dport 22035 -d 230.220.0.0/16 -j DROP
iptables -A INPUT -p 17 -d 101.152.0.0/16 --dport 28657 -j DROP
iptables -A test3 -p 6 --sport 8901 -s 188.3.60.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 52497 -d 158.84.208.106 --sport 18630 -j ACCEPT
iptables -A FORWARD -p 17 -s 37.0.0.0/8 --dport 62482 -j ACCEPT
iptables -A INPUT -s 93.144.215.194 -j ACCEPT
iptables -A FORWARD -p 6 --dport 6936 -s 102.0.0.0/8 --sport 5750 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 32731 -s 104.194.7.158 -d 248.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 34289 -d 103.72.193.241 -j DROP
iptables -A test1 -p 17 --dport 28094 -d 201.226.201.0/24 --sport 61204 -s 110.0.0.0/8 -j DROP
iptables -A test1 -p 17 --dport 19549 -s 177.107.94.64 -j DROP
iptables -A test3 -p 17 --sport 58158 -d 125.87.190.110 --dport 40459 -j ACCEPT
iptables -A test1 -p 17 --sport 22756 -j DROP
iptables -A test1 -p 6 --dport 12586 -j ACCEPT
iptables -A INPUT -p 17 --sport 60729 -s 32.168.58.174 -j DROP
iptables -A INPUT -d 248.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -s 53.184.46.112 --sport 10955 -j ACCEPT
iptables -A test1 -p 1 -d 89.114.105.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 20034 -j ACCEPT
iptables -A OUTPUT -p 79 -j DROP
iptables -A test1 -p 6 -s 192.45.234.92 -d 168.193.166.65 --dport 29079 -j ACCEPT
iptables -A test2 -p 17 --sport 31852 -d 86.168.15.27 -s 34.242.220.38 -j DROP
iptables -A INPUT -p 6 --dport 30233 --sport 51697 -j ACCEPT
iptables -A test3 -d 185.8.63.0/24 -j ACCEPT
iptables -A test1 -p 6 --dport 5667 --sport 24255 -s 37.228.16.245 -j DROP
iptables -A OUTPUT -p 17 --dport 20520 -j DROP
iptables -A test3 -p 6 -s 190.0.0.0/8 --sport 28820 -j ACCEPT
iptables -A test2 -p 17 -s 53.141.131.0/24 --sport 34617 --dport 26640 -d 190.93.215.11 -j DROP
iptables -A test1 -p 6 -s 62.239.93.0/24 --sport 20071 --dport 54866 -j ACCEPT
iptables -A test3 -p 6 --sport 60773 -d 3.245.60.238 -j ACCEPT
iptables -A test1 -p 6 --sport 22081 -d 71.202.17.207 --dport 14928 -s 229.163.123.143 -j DROP
iptables -A INPUT -p 6 --dport 44924 --sport 16514 -d 251.233.234.215 -j ACCEPT
iptables -A test2 -p 17 -s 186.80.135.230 -d 51.48.214.59 --dport 3752 --sport 58942 -j DROP
iptables -A test3 -p 6 -s 22.78.0.0/16 -d 128.0.0.0/8 --sport 15396 --dport 29506 -j DROP
iptables -A OUTPUT -p 17 --dport 1813 -d 187.128.48.0/24 -j ACCEPT
iptables -A test2 -p 17 --sport 27865 -s 37.241.43.155 --dport 5727 -j ACCEPT
iptables -A FORWARD -p 6 -s 132.0.0.0/8 --sport 49012 -d 175.176.235.69 -j test1
iptables -A test3 -p 17 -d 247.155.0.0/16 --dport 6665 -j ACCEPT
iptables -A FORWARD -p 17 -s 7.205.39.108 --sport 8604 --dport 49635 -j ACCEPT
iptables -A test3 -p 6 --sport 26635 --dport 38414 -j ACCEPT
iptables -A FORWARD -s 215.0.0.0/8 -j DROP
iptables -A OUTPUT -p 6 -d 190.4.70.0/24 -s 179.237.176.124 --sport 57372 -j DROP
iptables -A test1 -p 17 --sport 60366 -s 191.205.72.79 -d 70.42.229.7 -j DROP
iptables -A test1 -d 83.0.0.0/8 -j DROP
iptables -A test3 -p 6 -d 70.235.141.115 --sport 34945 -j DROP
iptables -A FORWARD -p 6 -s 182.194.75.0/24 --sport 7036 -j DROP
iptables -A test3 -p 247 -s 197.94.155.38 -j DROP
iptables -A test3 -p 17 -d 113.25.0.0/16 --dport 35608 -j DROP
iptables -A test2 -p 6 -d 115.88.0.0/16 --sport 6236 -j DROP
iptables -A test2 -p 172 -j DROP
iptables -A OUTPUT -p 6 --dport 25422 -j DROP
iptables -A test3 -p 6 --sport 51735 -j ACCEPT
iptables -A OUTPUT -p 166 -s 180.231.80.29 -d 138.69.239.206 -j ACCEPT
iptables -A test1 -p 17 --dport 36767 -d 202.0.0.0/8 -j DROP
iptables -A test1 -d 139.0.0.0/8 -s 3.165.172.0/24 -j DROP
iptables -A FORWARD -d 94.0.0.0/8 -j ACCEPT
iptables -A test2 -d 200.94.237.154 -j ACCEPT
iptables -A INPUT -d 46.123.127.39 -j DROP
iptables -A test2 -p 6 --sport 61597 -s 237.219.40.155 --dport 49286 -j ACCEPT
iptables -A test1 -p 6 -s 168.252.107.190 --sport 15528 --dport 49828 -j DROP
iptables -A test3 -d 129.0.0.0/8 -j DROP
iptables -A test1 -p 17 -d 195.0.0.0/8 --sport 7799 --dport 11352 -j ACCEPT
iptables -A test2 -p 6 -d 107.117.96.55 --dport 44014 --sport 14180 -j ACCEPT
iptables -A INPUT -p 17 --sport 2010 -s 200.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --sport 12643 -j DROP
iptables -A INPUT -p 6 -s 11.0.0.0/8 --dport 4416 -j DROP
iptables -A FORWARD -p 6 -d 81.87.251.133 --sport 5774 -j ACCEPT
iptables -A test3 -p 17 --sport 20512 --dport 8990 -j ACCEPT
iptables -A test2 -p 17 --sport 50062 --dport 31190 -s 21.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 270 --dport 55943 -j DROP
iptables -A INPUT -p 3 -s 172.45.222.0/24 -j DROP
iptables -A FORWARD -p 6 -d 152.201.157.0/24 --dport 30511 -j ACCEPT
iptables -A FORWARD -s 239.80.133.157 -j DROP
iptables -A test2 -p 17 --dport 3859 -d 153.85.29.0/24 -s 199.0.73.0/24 -j DROP
iptables -A FORWARD -p 17 --dport 4277 -s 82.0.0.0/8 --sport 22562 -j test3
iptables -A OUTPUT -p 17 -d 42.175.14.82 --dport 55013 -s 71.254.226.252 -j ACCEPT
iptables -A test2 -p 17 -s 117.44.80.41 --sport 4136 --dport 55518 -j ACCEPT
iptables -A test2 -s 185.0.0.0/8 -p 188 -d 84.109.135.190 -j DROP
iptables -A test3 -p 17 -s 229.158.59.0/24 -d 253.0.0.0/8 --dport 60575 -j DROP
iptables -A test3 -s 131.154.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --dport 2287 -s 92.35.93.0/24 -j DROP
iptables -A OUTPUT -p 215 -s 66.175.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 -s 158.132.84.0/24 -d 181.0.0.0/8 --dport 581 -j DROP
iptables -A test3 -p 233 -s 105.13.0.0/16 -d 157.209.0.0/16 -j DROP
iptables -A OUTPUT -p 250 -j ACCEPT
iptables -A test3 -p 17 --sport 11060 -s 115.38.252.108 -j ACCEPT
iptables -A OUTPUT -p 17 -s 158.176.130.250 --sport 11010 --dport 63086 -j DROP
iptables -A test3 -p 6 --sport 65155 -s 42.203.60.93 --dport 3934 -j ACCEPT
iptables -A test2 -p 132 -d 138.27.0.0/16 -j ACCEPT
iptables -A test1 -p 17 --dport 54794 -s 40.61.60.13 --sport 34176 -j ACCEPT
iptables -A FORWARD -p 6 -s 34.134.251.113 --dport 2680 -d 146.14.29.178 -j DROP
iptables -A test1 -s 118.62.86.2 -j ACCEPT
iptables -A test1 -p 6 -d 75.92.123.0/24 --dport 51988 -j ACCEPT
iptables -A test1 -p 6 -s 107.1.32.161 -d 235.210.0.0/16 --dport 35865 --sport 52007 -j ACCEPT
iptables -A FORWARD -s 60.199.0.0/16 -p 185 -j DROP
iptables -A test2 -p 17 --sport 57732 -j DROP
iptables -A INPUT -p 17 -s 95.11.107.157 --sport 21804 -j DROP
iptables -A test3 -p 17 -s 72.6.0.0/16 --sport 15314 --dport 13064 -j ACCEPT
iptables -A OUTPUT -p 17 -d 184.102.223.0/24 --dport 64353 -s 95.190.206.0/24 -j DROP
iptables -A OUTPUT -d 24.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 17 --dport 21533 -j ACCEPT
iptables -A test3 -p 112 -d 158.74.132.24 -j DROP
iptables -A INPUT -d 220.49.42.41 -p 9 -j DROP
iptables -A test1 -p 17 -d 80.54.236.0/24 --dport 26631 -s 192.227.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 30752 --dport 20615 -j DROP
iptables -A test1 -p 6 --sport 43654 -s 67.157.33.0/24 -d 7.103.130.117 -j DROP
iptables -A test2 -p 17 -s 66.98.37.0/24 --dport 17388 -d 239.196.40.0/24 -j DROP
iptables -A INPUT -p 6 --dport 15189 -j DROP
iptables -A INPUT -s 3.110.0.0/16 -j DROP
iptables -A FORWARD -s 250.32.173.202 -j DROP
iptables -A FORWARD -p 177 -j DROP
iptables -A OUTPUT -s 126.188.228.0/24 -d 205.166.0.0/16 -j DROP
iptables -A OUTPUT -p 6 --dport 39831 -j ACCEPT
iptables -A test2 -p 17 -s 120.48.0.0/16 --sport 51447 -d 135.186.195.0/24 --dport 41678 -j ACCEPT
iptables -A test1 -d 55.32.97.119 -s 111.163.0.0/16 -j DROP
iptables -A test1 -p 6 --sport 47254 --dport 61680 -j ACCEPT
iptables -A OUTPUT -p 6 -d 160.199.119.17 --dport 45444 -j ACCEPT
iptables -A test2 -p 17 -s 255.77.152.0/24 --sport 3547 --dport 60580 -j DROP
iptables -A INPUT -d 144.182.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 22028 -s 3.8.0.0/16 -d 74.21.0.0/16 -j ACCEPT
iptables -A test2 -p 42 -j DROP
iptables -A test3 -p 6 --dport 60120 --sport 1694 -j ACCEPT
iptables -A test2 -p 6 --dport 63657 -s 164.0.0.0/8 -j ACCEPT
iptables -A test1 -d 3.251.57.204 -j DROP
iptables -A INPUT -p 17 -d 164.0.0.0/8 --sport 33379 -s 201.235.250.76 --dport 57429 -j ACCEPT
iptables -A OUTPUT -p 6 -s 123.200.142.1 --sport 35408 --dport 33936 -j DROP
iptables -A FORWARD -p 6 -d 117.11.59.148 --dport 65296 -s 240.133.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 -s 46.171.198.147 -d 5.0.0.0/8 --sport 52235 --dport 45788 -j ACCEPT
iptables -A OUTPUT -d 104.205.60.151 -p 110 -s 4.0.0.0/8 -j ACCEPT
iptables -A test2 -p 66 -j DROP
iptables -A INPUT -p 17 --sport 5310 --dport 51935 -d 96.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 239 -s 136.151.55.0/24 -d 38.80.207.51 -j DROP
iptables -A test2 -p 6 --sport 59776 -j ACCEPT
iptables -A test3 -p 6 --sport 37529 -d 197.120.33.0/24 -j ACCEPT
iptables -A test1 -p 163 -s 56.179.163.0/24 -d 202.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 --sport 26700 -d 98.48.103.245 -s 249.244.122.0/24 -j DROP
iptables -A test2 -p 6 --dport 17276 -d 122.179.40.0/24 -j DROP
iptables -A test3 -d 70.16.0.0/16 -j ACCEPT
iptables -A test2 -p 6 -s 232.202.0.0/16 --dport 28993 --sport 63288 -j ACCEPT
iptables -A FORWARD -p 17 --dport 41545 --sport 15996 -s 180.22.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --dport 58058 -s 61.80.183.0/24 -d 134.79.22.0/24 -j DROP
iptables -A test1 -p 6 -d 40.191.23.99 --dport 52043 -j ACCEPT
iptables -A test3 -p 6 --dport 36730 --sport 43933 -j ACCEPT
iptables -A test3 -p 6 --sport 30353 -j ACCEPT
iptables -A OUTPUT -p 6 -s 176.15.18.12 --sport 36778 -d 24.87.10.238 -j DROP
iptables -A OUTPUT -p 6 --dport 41256 -j ACCEPT
iptables -A FORWARD -p 17 --dport 1432 -d 8.164.135.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 33369 -j ACCEPT
iptables -A test2 -p 17 -d 46.185.0.0/16 --dport 57187 -j DROP
iptables -A test3 -p 6 -s 76.0.0.0/8 --sport 39439 -d 190.107.41.0/24 -j ACCEPT
iptables -A OUTPUT -p 6 -d 116.119.79.196 --sport 21276 -j DROP
iptables -A FORWARD -p 6 -s 134.38.0.0/16 --dport 52412 -d 67.107.0.0/16 --sport 32273 -j ACCEPT
iptables -A FORWARD -p 17 -s 79.0.0.0/8 --dport 20358 -j ACCEPT
iptables -A INPUT -p 17 -d 96.129.163.151 --sport 30245 -s 159.0.0.0/8 --dport 21958 -j DROP
iptables -A test2 -p 6 -s 206.192.32.198 --dport 29111 -j DROP
iptables -A OUTPUT -p 6 --dport 16786 -j ACCEPT
iptables -A FORWARD -p 6 --dport 2104 --sport 4177 -j DROP
iptables -A FORWARD -p 180 -s 234.103.227.201 -j DROP
iptables -A test1 -d 240.129.10.0/24 -j ACCEPT
iptables -A test1 -p 6 --sport 26985 -d 57.227.106.193 --dport 38215 -j DROP
iptables -A FORWARD -p 6 --dport 47852 -j ACCEPT
iptables -A test1 -p 6 --dport 17476 --sport 24777 -s 230.46.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --dport 9899 -s 210.7.93.151 -j ACCEPT
iptables -A test2 -p 6 --dport 43126 -s 205.214.88.82 -j ACCEPT
iptables -A INPUT -s 36.128.247.71 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 55316 --dport 63128 -d 54.11.32.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 -s 45.88.101.0/24 --dport 41284 -j ACCEPT
iptables -A test3 -p 6 -d 106.6.105.122 --sport 62529 --dport 16553 -j ACCEPT
iptables -A test1 -p 6 --sport 59583 -j ACCEPT
iptables -A INPUT -s 191.230.99.0/24 -j DROP
iptables -A test3 -p 17 --sport 8870 -d 19.63.62.202 -j ACCEPT
iptables -A test3 -p 221 -s 242.244.139.71 -j ACCEPT
iptables -A FORWARD -p 17 -d 202.82.17.217 --dport 7934 --sport 60668 -j ACCEPT
iptables -A test3 -p 6 --dport 17514 -j ACCEPT
iptables -A test1 -p 6 --sport 15233 -j ACCEPT
iptables -A INPUT -p 17 --dport 17392 -j DROP
iptables -A test1 -p 17 -d 159.195.34.0/24 -s 198.206.234.0/24 --dport 8849 -j ACCEPT
iptables -A INPUT -s 0.197.0.0/16 -j DROP
iptables -A OUTPUT -p 6 -d 87.0.0.0/8 --dport 41628 -j DROP
iptables -A test3 -s 157.168.183.2 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 51125 --dport 51261 -s 156.0.0.0/8 -j ACCEPT
iptables -A test3 -p 17 --dport 54360 -j DROP
iptables -A FORWARD -p 6 --sport 55629 -s 4.81.199.12 --dport 30496 -j DROP
iptables -A INPUT -p 6 --dport 5821 -s 114.220.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 9165 -j DROP
iptables -A OUTPUT -s 85.190.82.160 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 61126 --sport 37707 -d 93.64.0.0/16 -j DROP
iptables -A test2 -p 6 -s 184.104.204.139 --dport 28875 --sport 61357 -j DROP
iptables -A INPUT -p 6 --dport 41860 -j ACCEPT
iptables -A test1 -p 6 -d 20.153.0.0/16 --dport 15090 -s 76.97.85.237 -j ACCEPT
iptables -A test2 -p 17 --dport 65409 -s 248.135.0.0/16 -j DROP
iptables -A FORWARD -p 6 -s 122.20.112.24 -d 20.162.228.252 --dport 36780 -j DROP
iptables -A OUTPUT -p 17 --sport 32759 -j DROP
iptables -A FORWARD -p 6 -s 103.42.148.0/24 --sport 45107 --dport 37895 -j DROP
iptables -A test3 -s 250.29.20.52 -p 44 -d 105.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 -d 187.133.0.0/16 -s 131.0.0.0/8 --sport 18023 -j DROP
iptables -A test2 -p 17 --sport 31135 -j ACCEPT
iptables -A FORWARD -p 17 -d 234.16.29.0/24 --dport 52935 -j ACCEPT
iptables -A test1 -p 6 --sport 29039 -d 40.50.208.13 -j ACCEPT
iptables -A test1 -p 6 -s 12.79.0.0/16 --dport 29135 -d 143.121.90.252 -j ACCEPT
iptables -A test1 -p 17 --sport 48993 -d 184.128.170.2 -j DROP
iptables -A test3 -p 17 --dport 10592 --sport 30895 -d 113.24.132.219 -j ACCEPT
iptables -A test1 -s 244.18.17.0/24 -p 29 -d 107.180.183.1 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 4151 -d 153.213.166.142 -j DROP
iptables -A test2 -p 6 --sport 28781 -d 147.77.187.123 --dport 17959 -j ACCEPT
iptables -A test2 -p 17 --dport 51824 -j ACCEPT
iptables -A test3 -p 17 -d 154.6.42.205 --sport 42568 -j ACCEPT
iptables -A test1 -p 6 -s 137.107.102.0/24 --sport 33448 -d 2.182.12.18 --dport 29589 -j DROP
iptables -A test3 -p 6 --dport 19931 --sport 20959 -j ACCEPT
iptables -A FORWARD -s 128.15.29.123 -j ACCEPT
iptables -A INPUT -p 6 --dport 9024 --sport 35518 -s 1.44.187.238 -j test3
iptables -A INPUT -s 158.160.167.0/24 -j ACCEPT
iptables -A test2 -p 6 -s 179.0.0.0/8 --sport 38922 -d 111.35.216.193 --dport 21185 -j DROP
iptables -A INPUT -s 95.23.245.52 -d 177.57.0.0/16 -j DROP
iptables -A test2 -p 17 --dport 44259 -j DROP
iptables -A test1 -p 6 -d 101.0.0.0/8 --sport 55730 --dport 34131 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 5551 -d 44.0.0.0/8 -s 187.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 -s 114.188.79.219 -d 103.134.175.181 --sport 47736 -j DROP
iptables -A FORWARD -p 6 --sport 35699 -d 73.44.18.251 -s 200.74.19.31 -j DROP
iptables -A FORWARD -p 17 --dport 19207 --sport 10157 -s 211.35.18.19 -j DROP
iptables -A test2 -p 75 -d 17.59.58.10 -s 192.213.85.105 -j ACCEPT
iptables -A test1 -p 53 -j ACCEPT
iptables -A FORWARD -p 6 --dport 7079 -d 173.194.140.7 -j ACCEPT
iptables -A INPUT -p 6 --dport 54608 -d 241.102.0.0/16 -j ACCEPT
iptables -A test1 -d 94.148.196.72 -s 58.66.175.30 -j DROP
iptables -A test1 -p 6 --dport 34154 -j ACCEPT
iptables -A test3 -p 6 -d 193.219.53.201 --dport 11163 -s 169.95.235.188 -j DROP
iptables -A test3 -p 6 --sport 39602 -j DROP
iptables -A FORWARD -p 203 -d 75.172.118.187 -j ACCEPT
iptables -A test3 -p 17 -s 129.178.101.0/24 --sport 41346 -j DROP
iptables -A FORWARD -p 17 --sport 23544 -j DROP
iptables -A test1 -p 17 --sport 61303 -s 101.0.0.0/8 -d 197.0.0.0/8 -j DROP
iptables -A INPUT -p 6 -s 150.60.116.99 -d 134.229.139.0/24 --dport 1755 --sport 42279 -j ACCEPT
iptables -A FORWARD -p 204 -d 156.243.4.68 -j DROP
iptables -A INPUT -p 127 -s 241.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 39 -d 225.211.0.0/16 -j DROP
iptables -A OUTPUT -p 17 -s 123.101.80.0/24 --dport 3607 -j ACCEPT
iptables -A INPUT -p 17 --dport 36876 -j ACCEPT
iptables -A test3 -p 17 --dport 20053 -d 139.232.151.153 --sport 8187 -j DROP
iptables -A FORWARD -p 6 --sport 32559 -d 116.60.0.0/16 -s 26.0.0.0/8 -j DROP
iptables -A test3 -p 17 -d 52.197.115.163 --sport 17141 -j DROP
iptables -A OUTPUT -d 87.0.0.0/8 -j DROP
iptables -A test1 -s 174.27.20.0/24 -d 168.206.16.204 -j DROP
iptables -A INPUT -p 6 -s 42.65.28.12 --dport 61101 -j ACCEPT
iptables -A OUTPUT -p 17 -s 143.0.0.0/8 --dport 933 --sport 3569 -j DROP
iptables -A FORWARD -p 6 -s 67.0.0.0/8 --dport 43700 -d 63.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 20104 --sport 54137 -j ACCEPT
iptables -A test3 -p 6 --dport 42253 --sport 18009 -j DROP
iptables -A test2 -d 209.162.98.70 -s 110.112.70.231 -j DROP
iptables -A test1 -p 6 --dport 43999 -j DROP
iptables -A test1 -p 6 -s 240.100.194.0/24 --sport 52416 -d 191.250.229.0/24 -j ACCEPT
iptables -A FORWARD -p 17 --sport 51764 -d 186.187.189.30 -j ACCEPT
iptables -A test1 -s 90.103.0.0/16 -j DROP
iptables -A OUTPUT -d 158.87.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --sport 8568 -j ACCEPT
iptables -A INPUT -s 48.67.144.0/24 -j DROP
iptables -A test3 -p 6 -s 192.51.0.0/16 -d 58.87.0.0/16 --dport 39495 -j DROP
iptables -A FORWARD -p 17 -d 61.0.0.0/8 -s 34.0.0.0/8 --sport 47655 -j ACCEPT
iptables -A INPUT -p 17 -d 186.60.112.220 --sport 62968 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 59980 -s 109.64.109.82 -d 221.92.183.226 -j DROP
iptables -A INPUT -p 17 --dport 4175 -j ACCEPT
iptables -A OUTPUT -p 70 -s 162.27.251.98 -j DROP
iptables -A FORWARD -p 17 --sport 1686 -d 42.38.76.60 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 30165 --dport 47609 -d 46.0.0.0/8 -j ACCEPT
iptables -A test1 -p 6 -d 87.165.20.0/24 --dport 8323 -s 30.93.218.170 -j DROP
iptables -A FORWARD -p 6 --dport 1529 -j DROP
iptables -A OUTPUT -p 6 --dport 27617 -j ACCEPT
iptables -A test3 -p 6 --dport 15607 --sport 26747 -d 38.206.57.43 -j DROP
iptables -A OUTPUT -s 190.118.140.235 -p 69 -j ACCEPT
iptables -A test2 -p 6 --sport 16543 --dport 13595 -j ACCEPT
iptables -A FORWARD -s 36.5.56.15 -d 217.36.118.59 -j ACCEPT
iptables -A test2 -p 6 --dport 54116 -j DROP
iptables -A test3 -p 6 --sport 3720 -j ACCEPT
iptables -A test2 -p 17 --dport 17336 -j ACCEPT
iptables -A test3 -p 6 -s 180.253.107.233 --dport 59550 -j ACCEPT
iptables -A FORWARD -p 6 --dport 35390 -s 163.164.111.84 -j ACCEPT
iptables -A OUTPUT -s 141.193.33.89 -j ACCEPT
iptables -A OUTPUT -p 221 -j ACCEPT
iptables -A INPUT -p 30 -j test2
iptables -A INPUT -s 47.105.68.0/24 -d 174.199.172.202 -j ACCEPT
iptables -A test1 -p 6 --dport 29212 -j DROP
iptables -A INPUT -p 6 --dport 51100 --sport 26722 -s 178.228.57.0/24 -j DROP
iptables -A test1 -p 6 --sport 23305 -j ACCEPT
iptables -A test3 -p 17 -s 139.105.170.113 --dport 18548 -j ACCEPT
iptables -A OUTPUT -p 6 -s 188.35.0.0/16 -d 166.190.52.144 --dport 16776 --sport 19530 -j ACCEPT
iptables -A OUTPUT -p 17 -d 180.238.37.57 --sport 28102 -j test2
iptables -A FORWARD -p 17 -d 90.184.0.0/16 -s 243.52.89.205 --sport 46595 -j DROP
iptables -A OUTPUT -p 6 -s 248.251.197.0/24 -d 21.0.0.0/8 --sport 29690 -j DROP
iptables -A FORWARD -p 6 -d 96.173.226.83 -s 161.0.0.0/8 --sport 11274 -j DROP
iptables -A FORWARD -p 6 -s 209.65.26.192 -d 174.12.215.213 --sport 25213 -j test2
iptables -A INPUT -p 6 --sport 13176 -d 107.217.26.6 -s 10.72.60.9 -j ACCEPT
iptables -A test3 -p 6 -d 62.17.112.25 --sport 48964 -j DROP
iptables -A test3 -p 17 --dport 24785 -s 64.61.118.136 -j ACCEPT