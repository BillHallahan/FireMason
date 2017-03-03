iptables -N test1
iptables -N test2
iptables -N test3
iptables -A test3 -p 17 --dport 62041 -d 164.60.156.45 --sport 44523 -j ACCEPT
iptables -A test3 -p 17 --sport 49569 --dport 42606 -j DROP
iptables -A test1 -p 6 --dport 39541 -j ACCEPT
iptables -A test2 -d 0.140.172.156 -j ACCEPT
iptables -A FORWARD -p 17 --sport 13834 --dport 44194 -d 4.138.14.74 -j ACCEPT
iptables -A OUTPUT -s 143.217.141.72 -d 150.177.223.38 -j DROP
iptables -A OUTPUT -p 17 --sport 24747 -d 75.56.0.0/16 -j test3
iptables -A OUTPUT -p 6 --sport 1815 --dport 16716 -j ACCEPT
iptables -A test3 -p 17 --sport 14166 -j ACCEPT
iptables -A INPUT -p 17 --dport 61830 -s 156.218.145.33 -j DROP
iptables -A test2 -p 17 --dport 40889 -j DROP
iptables -A test1 -p 6 -d 27.61.203.95 --sport 15891 -s 50.26.217.0/24 --dport 32418 -j ACCEPT
iptables -A INPUT -p 6 -s 133.225.0.0/16 --sport 47836 -j ACCEPT
iptables -A FORWARD -p 17 -d 1.84.185.0/24 --sport 30305 -s 182.185.93.232 -j ACCEPT
iptables -A test1 -p 17 --sport 217 -j DROP
iptables -A test1 -p 6 --dport 45118 -d 25.250.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --sport 9474 --dport 23100 -j DROP
iptables -A test1 -p 6 --dport 18925 --sport 49478 -j ACCEPT
iptables -A INPUT -p 50 -j ACCEPT
iptables -A INPUT -p 17 --dport 41554 -j DROP
iptables -A FORWARD -p 6 --sport 18543 -s 154.35.60.147 -j test1
iptables -A OUTPUT -p 6 --sport 59710 -s 166.11.193.138 -j test2
iptables -A INPUT -p 6 --dport 41898 -d 41.92.227.222 -j ACCEPT
iptables -A FORWARD -p 6 --sport 33175 --dport 27234 -s 2.35.127.0/24 -j DROP
iptables -A FORWARD -p 17 -d 3.134.135.104 --sport 52283 -j DROP
iptables -A test1 -d 210.237.64.240 -p 182 -j ACCEPT
iptables -A test1 -p 17 --sport 40357 -d 133.136.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 -s 75.14.59.83 --dport 32221 -j DROP
iptables -A test2 -p 117 -j DROP
iptables -A test2 -p 17 --sport 2168 -d 115.197.143.112 -j DROP
iptables -A test3 -p 17 --dport 8010 -j ACCEPT
iptables -A test2 -d 88.4.0.0/16 -j DROP
iptables -A OUTPUT -s 182.0.0.0/8 -j DROP
iptables -A test2 -p 61 -j DROP
iptables -A test2 -p 17 -s 36.47.0.0/16 -d 18.5.151.75 --sport 37523 -j DROP
iptables -A test2 -d 20.182.146.100 -s 136.71.95.206 -j DROP
iptables -A test3 -p 6 -s 243.26.37.96 -d 40.76.236.0/24 --dport 5798 -j ACCEPT
iptables -A INPUT -s 201.84.23.141 -d 21.121.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --dport 37431 --sport 53415 -s 2.49.0.0/16 -j DROP
iptables -A FORWARD -p 17 -d 102.14.25.122 --dport 8494 -s 181.114.184.6 -j ACCEPT
iptables -A test3 -p 73 -s 254.0.0.0/8 -j ACCEPT
iptables -A test1 -p 17 --dport 56646 --sport 38003 -d 212.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 -d 149.0.0.0/8 --sport 13835 -s 59.81.203.0/24 -j DROP
iptables -A test2 -p 132 -s 107.209.207.0/24 -j ACCEPT
iptables -A FORWARD -p 17 -s 238.0.0.0/8 --sport 30076 -d 120.115.96.40 -j DROP
iptables -A test1 -p 17 --sport 2900 -j ACCEPT
iptables -A test2 -p 6 --sport 353 -s 225.73.127.112 -j ACCEPT
iptables -A test3 -p 17 -d 35.209.81.167 --dport 51460 -j DROP
iptables -A FORWARD -p 17 --sport 29590 --dport 42582 -j DROP
iptables -A FORWARD -p 17 -s 125.0.0.0/8 --dport 16659 -d 120.194.100.84 -j ACCEPT
iptables -A INPUT -p 6 -d 149.151.29.52 --dport 46125 -j ACCEPT
iptables -A test2 -p 17 --dport 44633 --sport 18686 -j ACCEPT
iptables -A test1 -p 17 -d 130.68.214.116 --dport 6943 -j ACCEPT
iptables -A test2 -p 17 --dport 52269 -d 203.196.119.66 -j DROP
iptables -A test3 -p 6 -d 82.38.247.119 -s 198.190.190.64 --sport 63286 -j ACCEPT
iptables -A INPUT -d 110.91.213.109 -p 18 -j ACCEPT
iptables -A test2 -p 17 -d 111.15.73.113 --sport 34138 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 30584 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 8998 --sport 3439 -j ACCEPT
iptables -A test1 -p 17 -s 112.67.107.128 --dport 38944 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 60286 -j ACCEPT
iptables -A test3 -p 17 -s 107.171.216.0/24 --sport 6982 -j DROP
iptables -A OUTPUT -p 177 -d 154.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --dport 3826 -s 42.179.0.0/16 -d 23.20.0.0/16 -j ACCEPT
iptables -A FORWARD -p 200 -j DROP
iptables -A test3 -p 163 -s 72.195.0.0/16 -j DROP
iptables -A OUTPUT -p 117 -s 81.110.28.210 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 51668 -j ACCEPT
iptables -A FORWARD -p 17 --sport 2331 -j DROP
iptables -A test2 -p 6 --dport 12874 --sport 12955 -j ACCEPT
iptables -A INPUT -p 6 -d 119.119.0.0/16 --sport 19657 --dport 5457 -s 44.58.236.223 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 1412 -s 122.0.0.0/8 -d 36.64.200.0/24 --dport 37388 -j DROP
iptables -A FORWARD -p 39 -j DROP
iptables -A test2 -p 6 --dport 5412 -d 69.111.116.0/24 --sport 37284 -s 185.104.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 12201 -s 28.191.240.0/24 -d 160.215.0.0/16 --dport 11627 -j DROP
iptables -A FORWARD -p 17 --sport 23906 --dport 30238 -d 84.2.0.0/16 -j test3
iptables -A FORWARD -p 6 --dport 5543 --sport 22893 -j DROP
iptables -A test3 -d 101.147.191.163 -j DROP
iptables -A FORWARD -p 17 --dport 45846 -j DROP
iptables -A FORWARD -p 17 -s 5.163.2.108 --dport 21340 -j ACCEPT
iptables -A test3 -p 6 -s 37.0.0.0/8 --sport 50480 -d 137.14.201.71 -j DROP
iptables -A OUTPUT -p 17 --sport 49366 -d 203.208.135.24 --dport 49773 -j ACCEPT
iptables -A test3 -s 149.254.237.245 -p 11 -j ACCEPT
iptables -A test1 -d 163.200.0.0/16 -p 11 -s 236.20.0.0/16 -j DROP
iptables -A OUTPUT -p 17 -d 142.252.0.0/16 --sport 10613 -s 228.0.0.0/8 -j ACCEPT
iptables -A test3 -p 6 -d 7.35.205.94 -s 17.0.0.0/8 --sport 44928 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 31483 -j ACCEPT
iptables -A test2 -p 6 -d 102.1.169.56 --dport 33105 -s 85.210.246.0/24 --sport 29078 -j ACCEPT
iptables -A test1 -p 17 --sport 5313 -s 229.0.0.0/8 -d 23.196.0.0/16 -j ACCEPT
iptables -A test2 -d 44.41.88.227 -j DROP
iptables -A OUTPUT -s 147.223.0.0/16 -j ACCEPT
iptables -A test2 -p 17 -s 174.103.196.125 -d 144.234.58.112 --sport 20402 -j DROP
iptables -A test2 -p 6 --sport 61808 -d 252.97.31.75 -j DROP
iptables -A FORWARD -p 6 --sport 51293 --dport 53050 -j ACCEPT
iptables -A INPUT -p 17 --dport 34914 -d 65.218.0.0/16 -j ACCEPT
iptables -A FORWARD -p 6 -d 169.222.35.217 -s 233.88.13.165 --sport 6034 -j DROP
iptables -A FORWARD -p 17 --dport 23812 -d 187.139.242.25 --sport 63416 -s 153.187.77.197 -j ACCEPT
iptables -A test1 -p 6 --dport 27889 --sport 6141 -d 214.68.178.56 -j ACCEPT
iptables -A FORWARD -p 6 -d 148.79.139.64 --dport 61984 -j ACCEPT
iptables -A test2 -d 118.0.0.0/8 -s 59.78.207.32 -j ACCEPT
iptables -A test3 -p 17 --dport 61211 -s 249.16.88.159 -d 5.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 -d 71.119.83.0/24 --sport 36276 --dport 56646 -j DROP
iptables -A INPUT -p 6 --sport 61560 -s 169.190.191.204 --dport 19620 -j ACCEPT
iptables -A OUTPUT -p 17 -d 81.0.0.0/8 --dport 42868 -s 247.16.132.58 -j ACCEPT
iptables -A FORWARD -p 6 --sport 1727 --dport 65159 -j ACCEPT
iptables -A test2 -p 6 --dport 43822 -s 66.132.141.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --sport 203 --dport 45490 -j DROP
iptables -A INPUT -d 173.58.249.0/24 -p 25 -s 4.16.148.127 -j ACCEPT
iptables -A test3 -p 17 --sport 59012 --dport 36454 -s 93.125.178.0/24 -j DROP
iptables -A INPUT -p 170 -s 200.50.0.0/16 -j DROP
iptables -A test3 -p 6 --sport 45751 -j DROP
iptables -A test1 -s 65.176.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --sport 31849 --dport 21496 -s 86.47.165.231 -j DROP
iptables -A test1 -p 17 -d 102.0.152.232 --dport 10143 -j ACCEPT
iptables -A test2 -s 136.137.0.0/16 -j ACCEPT
iptables -A test2 -p 6 -d 18.41.18.37 --sport 40698 --dport 24364 -j ACCEPT
iptables -A test3 -p 17 --sport 42094 -d 183.226.16.7 --dport 13861 -j ACCEPT
iptables -A test3 -p 6 -s 110.88.230.57 --dport 7230 -d 67.189.0.0/16 -j ACCEPT
iptables -A test2 -p 17 --dport 34469 -s 95.95.205.103 -j DROP
iptables -A INPUT -p 17 --dport 62819 --sport 49489 -d 13.0.0.0/8 -j DROP
iptables -A INPUT -p 17 --dport 38729 --sport 1683 -d 34.0.0.0/8 -j test2
iptables -A FORWARD -p 17 -s 131.158.198.163 --dport 48214 -j DROP
iptables -A test1 -d 126.158.52.175 -j ACCEPT
iptables -A test3 -d 7.244.67.177 -j ACCEPT
iptables -A test2 -p 6 -s 61.70.239.106 --dport 50479 -j DROP
iptables -A INPUT -p 17 --sport 502 -s 160.153.127.0/24 -j DROP
iptables -A test1 -p 6 -s 30.17.88.68 --dport 48571 -j DROP
iptables -A INPUT -p 17 -d 110.195.136.92 --dport 15344 --sport 64558 -j ACCEPT
iptables -A test2 -p 6 -d 156.220.147.202 --sport 37073 --dport 19190 -j ACCEPT
iptables -A test2 -p 6 --dport 33481 -j ACCEPT
iptables -A test1 -p 6 --sport 65190 -d 118.157.77.228 --dport 52583 -j DROP
iptables -A test1 -p 17 --dport 3792 -j ACCEPT
iptables -A FORWARD -p 17 -s 53.78.227.0/24 --dport 45355 -j ACCEPT
iptables -A FORWARD -s 94.97.31.107 -d 3.50.226.0/24 -j ACCEPT
iptables -A INPUT -p 17 --sport 35552 --dport 45327 -j ACCEPT
iptables -A test3 -p 17 --dport 59694 --sport 61919 -j DROP
iptables -A test2 -p 6 --dport 6944 -j DROP
iptables -A test1 -s 221.230.182.229 -j ACCEPT
iptables -A test1 -p 17 -s 17.134.0.0/16 --dport 23291 -j DROP
iptables -A test2 -p 17 --sport 58781 -s 190.163.75.71 -j ACCEPT
iptables -A test1 -p 6 --sport 7551 --dport 5249 -j DROP
iptables -A FORWARD -p 6 --dport 63764 -d 206.14.230.0/24 -j ACCEPT
iptables -A test1 -p 92 -d 48.218.129.111 -j ACCEPT
iptables -A FORWARD -p 6 --sport 33340 -s 160.209.0.0/16 -j DROP
iptables -A INPUT -p 17 --sport 8944 -s 39.99.72.0/24 -j DROP
iptables -A FORWARD -p 17 --sport 20946 -j DROP
iptables -A test1 -s 149.236.219.57 -j DROP
iptables -A FORWARD -p 183 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 13405 -j ACCEPT
iptables -A test1 -p 17 --dport 32703 -d 75.94.112.2 -j DROP
iptables -A FORWARD -p 17 --sport 322 --dport 54133 -s 3.88.232.85 -j DROP
iptables -A OUTPUT -p 17 -d 69.192.83.44 --dport 46352 -j DROP
iptables -A test3 -p 17 --dport 62547 -j ACCEPT
iptables -A test2 -p 6 -s 188.0.0.0/8 --sport 9748 -j ACCEPT
iptables -A test1 -p 6 --sport 52977 -s 217.187.28.217 -j DROP
iptables -A INPUT -p 100 -j ACCEPT
iptables -A test3 -p 17 --sport 42329 --dport 41089 -d 12.0.0.0/8 -s 8.35.39.208 -j DROP
iptables -A INPUT -p 17 --dport 57742 --sport 26141 -d 136.129.0.0/16 -j DROP
iptables -A test1 -p 6 --dport 3697 -j ACCEPT
iptables -A FORWARD -p 6 --sport 15207 -j DROP
iptables -A test1 -p 6 --sport 14775 -d 72.0.0.0/8 -s 205.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 --dport 33875 -j DROP
iptables -A INPUT -p 17 --dport 49220 -j DROP
iptables -A test2 -p 6 --dport 31111 -j DROP
iptables -A OUTPUT -p 17 --sport 7963 --dport 36824 -s 188.250.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --sport 38315 -j ACCEPT
iptables -A FORWARD -p 6 --dport 4954 -d 184.30.0.0/16 --sport 16734 -s 13.48.95.90 -j DROP
iptables -A FORWARD -s 42.227.8.234 -j ACCEPT
iptables -A FORWARD -p 6 -s 86.253.41.0/24 --sport 50578 -j ACCEPT
iptables -A INPUT -p 6 --sport 50364 -s 239.80.0.0/16 -j ACCEPT
iptables -A test3 -p 17 --dport 24409 -d 102.22.202.144 --sport 36191 -j ACCEPT
iptables -A INPUT -p 17 --dport 14677 --sport 15012 -s 229.62.183.79 -j DROP
iptables -A test2 -p 17 --sport 44416 -d 175.0.0.0/8 --dport 61351 -j DROP
iptables -A FORWARD -p 6 --sport 16250 -s 65.81.36.0/24 --dport 32813 -j ACCEPT
iptables -A FORWARD -p 6 -s 40.207.70.0/24 --dport 42681 -j ACCEPT
iptables -A FORWARD -d 199.180.0.0/16 -j ACCEPT
iptables -A INPUT -p 6 -d 21.0.0.0/8 --sport 46237 -s 201.101.186.0/24 --dport 55509 -j DROP
iptables -A OUTPUT -p 17 -d 237.205.22.0 --sport 13946 --dport 63250 -j DROP
iptables -A INPUT -d 135.1.229.173 -s 172.124.61.198 -j ACCEPT
iptables -A test3 -p 133 -j DROP
iptables -A test1 -p 17 --dport 39407 -j ACCEPT
iptables -A test1 -p 17 --dport 5598 -j DROP
iptables -A INPUT -p 13 -j ACCEPT
iptables -A test1 -p 17 --sport 24756 -d 103.71.0.0/16 -j DROP
iptables -A test3 -p 6 --dport 532 -s 44.0.0.0/8 --sport 35212 -j DROP
iptables -A OUTPUT -p 17 --dport 45831 --sport 64864 -j DROP
iptables -A test1 -d 79.64.254.94 -s 82.152.161.0/24 -p 164 -j ACCEPT
iptables -A test3 -d 160.253.168.54 -p 140 -j ACCEPT
iptables -A INPUT -p 17 --dport 58292 -j DROP
iptables -A test2 -d 83.0.0.0/8 -s 242.193.241.199 -j ACCEPT
iptables -A test2 -p 6 -d 114.9.0.0/16 --dport 2796 --sport 7851 -j DROP
iptables -A FORWARD -p 6 -s 51.52.0.0/16 --dport 20538 -d 218.41.159.224 -j DROP
iptables -A INPUT -p 6 --sport 54628 -s 200.64.0.0/16 -j test1
iptables -A FORWARD -s 1.2.204.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 53364 -s 233.221.0.0/16 -d 140.112.157.117 -j ACCEPT
iptables -A test2 -p 180 -j ACCEPT
iptables -A test1 -p 17 --dport 2672 -d 73.125.8.45 -j DROP
iptables -A FORWARD -p 6 -s 160.160.9.0/24 -d 98.0.0.0/8 --dport 272 -j ACCEPT
iptables -A INPUT -s 8.30.223.75 -j ACCEPT
iptables -A FORWARD -p 6 --dport 36449 --sport 33051 -s 117.220.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 -d 50.0.0.0/8 --dport 53948 -j ACCEPT
iptables -A test1 -p 6 --sport 13123 -d 146.52.100.0/24 --dport 10191 -j ACCEPT
iptables -A test3 -p 6 -s 54.0.0.0/8 --dport 33555 -j DROP
iptables -A INPUT -p 17 -d 90.236.84.0/24 --dport 63447 --sport 16694 -j ACCEPT
iptables -A OUTPUT -d 222.0.0.0/8 -j test2
iptables -A test1 -p 17 --dport 54070 -s 224.120.39.0/24 -j DROP
iptables -A test3 -p 6 --dport 1442 -j DROP
iptables -A FORWARD -d 199.222.111.111 -j ACCEPT
iptables -A INPUT -d 131.2.220.139 -j DROP
iptables -A test1 -p 6 --sport 18581 -j ACCEPT
iptables -A test2 -s 232.192.41.21 -j DROP
iptables -A test3 -p 6 --dport 11575 -j DROP
iptables -A test1 -p 6 --dport 49971 -j DROP
iptables -A FORWARD -p 17 --dport 24596 -s 7.169.209.79 -d 39.34.219.0/24 -j DROP
iptables -A test3 -p 6 -d 139.200.0.0/16 --dport 14438 --sport 47763 -j ACCEPT
iptables -A test1 -p 17 --dport 7846 -s 218.199.82.69 -d 47.229.126.36 -j ACCEPT
iptables -A FORWARD -s 191.100.0.0/16 -j DROP
iptables -A test1 -p 6 --dport 28006 -s 200.215.0.0/16 -d 254.218.129.168 -j DROP
iptables -A FORWARD -p 6 --dport 39988 --sport 51311 -s 128.216.112.2 -d 122.115.0.0/16 -j ACCEPT
iptables -A INPUT -p 17 --dport 56780 --sport 3161 -d 196.151.39.220 -j DROP
iptables -A FORWARD -p 17 -d 72.232.175.208 --sport 53131 -s 129.218.66.0/24 -j ACCEPT
iptables -A test1 -p 17 --dport 21321 -j DROP
iptables -A FORWARD -d 241.22.241.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 28592 -s 38.76.137.12 -d 104.31.0.0/16 -j DROP
iptables -A test3 -p 6 -s 22.252.81.224 --dport 39847 -j DROP
iptables -A test3 -d 102.89.233.0/24 -j ACCEPT
iptables -A INPUT -p 6 --dport 59463 -j ACCEPT
iptables -A FORWARD -p 6 --dport 30709 -j ACCEPT
iptables -A FORWARD -p 17 -s 66.214.141.175 --dport 56317 --sport 20617 -j DROP
iptables -A OUTPUT -p 17 -s 19.78.101.4 --sport 543 -j DROP
iptables -A INPUT -d 102.131.149.115 -s 83.0.0.0/8 -p 20 -j DROP
iptables -A OUTPUT -d 53.143.241.0/24 -p 156 -j DROP
iptables -A FORWARD -p 230 -j ACCEPT
iptables -A FORWARD -p 6 --dport 27266 -d 89.0.0.0/8 --sport 2616 -j DROP
iptables -A INPUT -p 17 --sport 18889 -d 246.167.234.0/24 --dport 10295 -j DROP
iptables -A test2 -p 16 -d 61.205.248.0/24 -j DROP
iptables -A INPUT -p 17 --dport 28269 -s 211.199.209.125 -d 73.177.0.145 -j DROP
iptables -A FORWARD -p 17 --sport 11485 -j DROP
iptables -A test2 -p 17 -s 98.228.112.161 --dport 64300 --sport 60021 -d 153.162.80.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 12305 -d 64.90.31.125 -j DROP
iptables -A FORWARD -p 17 --dport 33836 -s 28.182.4.77 -j DROP
iptables -A OUTPUT -s 209.39.80.73 -p 163 -j DROP
iptables -A test2 -p 17 -d 75.164.189.237 --sport 41605 -s 10.122.49.110 -j ACCEPT
iptables -A test2 -p 17 --dport 42299 --sport 40278 -s 126.117.171.241 -j ACCEPT
iptables -A test2 -d 115.169.169.0/24 -j DROP
iptables -A INPUT -p 6 -s 224.215.39.0/24 --sport 33286 -j ACCEPT
iptables -A INPUT -d 199.224.242.0/24 -j DROP
iptables -A OUTPUT -p 6 --dport 43544 -s 190.249.90.241 -j DROP
iptables -A OUTPUT -s 73.191.182.17 -j ACCEPT
iptables -A FORWARD -p 17 --dport 22198 -j DROP
iptables -A test2 -p 17 --sport 46019 -d 102.84.189.245 -j DROP
iptables -A FORWARD -p 6 --dport 32633 --sport 10773 -s 75.124.236.200 -j ACCEPT
iptables -A FORWARD -p 17 --dport 4345 -j DROP
iptables -A FORWARD -p 17 -s 78.163.15.30 --dport 57515 --sport 55883 -d 125.168.0.0/16 -j DROP
iptables -A OUTPUT -p 17 --sport 35275 --dport 611 -j ACCEPT
iptables -A INPUT -p 17 --sport 59462 -j ACCEPT
iptables -A OUTPUT -p 219 -j ACCEPT
iptables -A OUTPUT -p 74 -s 201.33.76.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 44021 -d 31.7.18.137 -j DROP
iptables -A test1 -p 6 --sport 55602 -j ACCEPT
iptables -A INPUT -s 18.208.160.249 -j ACCEPT
iptables -A test3 -p 17 --dport 47717 -j ACCEPT
iptables -A INPUT -d 4.101.252.213 -s 225.155.0.0/16 -j test2
iptables -A test1 -p 6 --sport 18847 -d 206.132.214.69 -s 88.5.210.0/24 -j ACCEPT
iptables -A test2 -d 187.29.169.161 -s 173.167.31.253 -j ACCEPT
iptables -A INPUT -p 17 -s 240.109.18.231 --dport 53417 --sport 50371 -j DROP
iptables -A test1 -p 6 --sport 353 -j DROP
iptables -A OUTPUT -p 17 --dport 15742 -s 191.0.0.0/8 --sport 4781 -d 206.190.128.103 -j ACCEPT
iptables -A test1 -p 17 -d 156.104.218.219 -s 107.154.0.0/16 --dport 60262 -j ACCEPT
iptables -A test3 -p 6 --sport 7757 -j DROP
iptables -A FORWARD -p 17 --sport 29486 -d 111.140.177.191 -j ACCEPT
iptables -A test3 -p 6 -d 104.170.59.35 -s 224.131.233.16 --sport 56268 -j ACCEPT
iptables -A test1 -p 6 --dport 16578 -d 29.140.183.119 --sport 46396 -j ACCEPT
iptables -A test1 -p 6 -d 137.0.0.0/8 -s 11.178.0.0/16 --sport 62827 -j ACCEPT
iptables -A test2 -p 6 -s 183.72.48.25 --dport 3815 -d 197.99.35.247 -j ACCEPT
iptables -A FORWARD -p 17 -d 221.206.232.69 --dport 62542 --sport 10520 -j ACCEPT
iptables -A FORWARD -p 6 -d 18.35.0.0/16 -s 223.101.0.0/16 --dport 50626 -j test2
iptables -A OUTPUT -p 17 --sport 6046 --dport 5649 -d 97.26.154.187 -j DROP
iptables -A INPUT -p 6 --sport 45909 -d 46.117.120.0/24 -s 165.0.0.0/8 -j ACCEPT
iptables -A OUTPUT -d 168.72.20.29 -j ACCEPT
iptables -A test3 -s 219.100.57.157 -p 94 -j DROP
iptables -A test2 -s 107.0.0.0/8 -p 164 -j ACCEPT
iptables -A test1 -d 150.197.239.211 -p 188 -j ACCEPT
iptables -A test1 -p 6 --sport 43762 -d 197.127.176.177 -s 254.93.185.7 -j DROP
iptables -A OUTPUT -p 179 -s 35.211.36.38 -j ACCEPT
iptables -A FORWARD -p 17 --sport 3488 --dport 20599 -d 21.103.87.5 -j DROP
iptables -A test2 -p 6 -d 103.18.64.66 --sport 47482 -j ACCEPT
iptables -A FORWARD -p 107 -j DROP
iptables -A OUTPUT -p 6 --dport 44178 -j ACCEPT
iptables -A test1 -p 17 -s 170.28.178.239 -d 228.90.169.180 --sport 34847 -j ACCEPT
iptables -A test3 -s 88.137.0.0/16 -d 248.127.225.52 -p 104 -j DROP
iptables -A test1 -p 17 -d 135.208.52.155 -s 29.176.75.97 --dport 47565 -j DROP
iptables -A test3 -s 209.173.251.89 -j ACCEPT
iptables -A INPUT -p 17 --dport 14906 -s 23.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --sport 63533 -j DROP
iptables -A OUTPUT -p 58 -j DROP
iptables -A FORWARD -p 17 --dport 7774 -d 163.24.231.203 -s 26.149.191.78 -j ACCEPT
iptables -A test2 -p 6 --sport 31777 -s 131.57.38.223 -j DROP
iptables -A test2 -p 17 --sport 60886 -s 86.102.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --sport 57287 -s 191.215.46.59 -j ACCEPT
iptables -A OUTPUT -p 17 -d 22.173.245.116 --dport 63667 -j DROP
iptables -A FORWARD -p 17 --dport 55550 -s 178.63.38.0/24 --sport 22312 -j ACCEPT
iptables -A INPUT -p 88 -j ACCEPT
iptables -A INPUT -p 235 -j DROP
iptables -A test1 -p 6 --dport 56289 -j DROP
iptables -A FORWARD -p 6 --sport 58536 -j DROP
iptables -A INPUT -p 6 --sport 35266 -s 48.189.0.0/16 -j ACCEPT
iptables -A test2 -p 6 --dport 21899 --sport 24020 -j DROP
iptables -A test1 -p 17 -d 214.78.18.87 --dport 49962 -j ACCEPT
iptables -A OUTPUT -s 54.46.237.0 -j ACCEPT
iptables -A OUTPUT -p 6 --dport 49458 -s 80.54.208.30 -j DROP
iptables -A FORWARD -p 17 --sport 34407 -s 166.221.0.0/16 -j DROP
iptables -A INPUT -p 6 -d 56.0.166.83 --sport 55020 -s 79.158.33.0/24 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 11226 --sport 19621 -j ACCEPT
iptables -A test2 -s 14.5.35.110 -d 240.0.0.0/8 -j ACCEPT
iptables -A test1 -p 199 -j ACCEPT
iptables -A INPUT -p 17 --sport 4008 -j DROP
iptables -A test3 -p 6 --sport 58605 -s 108.131.0.0/16 --dport 40664 -j ACCEPT
iptables -A test1 -p 17 -d 159.0.0.0/8 --dport 49961 -s 63.173.234.47 -j DROP
iptables -A test3 -p 17 -d 212.184.0.0/16 -s 202.0.0.0/16 --sport 58939 -j DROP
iptables -A INPUT -s 119.148.134.2 -j ACCEPT
iptables -A test3 -d 171.151.225.117 -s 60.29.44.234 -p 255 -j DROP
iptables -A OUTPUT -d 40.0.0.0/8 -j ACCEPT
iptables -A test2 -p 252 -d 231.0.0.0/8 -j DROP
iptables -A FORWARD -d 92.0.0.0/8 -j ACCEPT
iptables -A INPUT -p 6 -s 219.203.57.69 --sport 2661 -j DROP
iptables -A test2 -p 17 --sport 34817 -s 11.172.12.3 -d 208.189.151.3 -j ACCEPT
iptables -A INPUT -p 6 --sport 64984 --dport 29928 -j ACCEPT
iptables -A test1 -p 17 --dport 21451 -j DROP
iptables -A OUTPUT -p 17 --sport 18056 --dport 41649 -s 228.10.171.49 -j ACCEPT
iptables -A INPUT -d 130.9.0.0/16 -p 244 -j ACCEPT
iptables -A test3 -d 164.245.3.57 -s 170.181.165.207 -j ACCEPT
iptables -A test1 -p 17 --dport 53631 --sport 37256 -j DROP
iptables -A FORWARD -p 6 --sport 42767 --dport 22862 -s 230.201.117.103 -j test1
iptables -A OUTPUT -p 6 --sport 2923 -d 72.197.179.249 -j ACCEPT
iptables -A test2 -p 17 -d 78.0.0.0/8 --sport 1941 --dport 63575 -j ACCEPT
iptables -A INPUT -p 6 --sport 61981 -s 157.0.0.0/8 -j test1
iptables -A INPUT -p 6 --sport 55976 -d 125.224.108.33 --dport 39571 -j DROP
iptables -A FORWARD -p 17 -s 131.62.204.0/24 --dport 23752 -d 243.129.59.67 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 54707 -d 130.82.237.39 --dport 12740 -j DROP
iptables -A FORWARD -p 6 -d 250.6.9.61 --sport 3384 -s 136.157.21.119 -j DROP
iptables -A OUTPUT -p 6 -s 245.51.0.0/16 --dport 27610 -j ACCEPT
iptables -A test2 -d 179.72.68.115 -j DROP
iptables -A FORWARD -p 17 --dport 16204 --sport 45684 -d 229.78.52.94 -j ACCEPT
iptables -A FORWARD -p 6 --dport 7210 -j DROP
iptables -A OUTPUT -p 187 -d 21.120.27.254 -j DROP
iptables -A test3 -p 17 --sport 2200 -s 193.141.0.0/16 --dport 43422 -d 90.201.6.250 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 10928 --dport 58495 -j DROP
iptables -A FORWARD -p 6 --sport 15644 -j DROP
iptables -A test2 -p 17 --dport 54400 -j DROP
iptables -A test2 -p 6 --sport 33127 -j DROP
iptables -A test2 -p 6 --dport 38531 -s 110.101.0.0/16 --sport 21384 -j DROP
iptables -A test1 -p 17 --sport 52012 -s 91.47.148.14 --dport 24083 -j DROP
iptables -A FORWARD -p 17 --sport 19068 -j ACCEPT
iptables -A test2 -p 6 --sport 55449 -s 226.238.26.206 --dport 45840 -d 182.111.109.169 -j DROP
iptables -A OUTPUT -p 17 --sport 25012 --dport 23781 -j test1
iptables -A INPUT -p 17 --sport 34070 -s 83.166.179.156 -d 227.228.93.11 -j ACCEPT
iptables -A OUTPUT -d 159.192.74.0/24 -j ACCEPT
iptables -A test1 -p 6 -d 237.0.0.0/8 --dport 54835 --sport 35210 -j ACCEPT
iptables -A FORWARD -p 6 --sport 23682 -d 104.103.132.0/24 -s 153.0.0.0/8 --dport 52698 -j ACCEPT
iptables -A test2 -p 17 -d 45.252.0.0/16 --dport 43852 -s 144.91.0.0/16 -j ACCEPT
iptables -A test1 -p 6 --sport 52843 -j DROP
iptables -A test2 -p 6 --sport 28776 -d 193.87.75.71 -j ACCEPT
iptables -A FORWARD -p 17 -s 231.38.107.76 --dport 37201 -d 84.238.0.0/16 --sport 42467 -j DROP
iptables -A OUTPUT -p 17 --dport 41895 -d 101.7.90.7 -j ACCEPT
iptables -A INPUT -p 17 -d 30.91.55.142 --sport 56867 -j DROP
iptables -A INPUT -p 6 -s 205.114.225.209 --dport 52856 --sport 58288 -d 149.36.80.53 -j DROP
iptables -A test1 -p 6 --sport 40989 -d 118.20.79.0/24 -j DROP
iptables -A INPUT -p 17 --dport 45495 -d 192.118.102.182 -j DROP
iptables -A FORWARD -p 17 --dport 24093 -d 197.2.0.0/16 -j ACCEPT
iptables -A test3 -s 230.235.196.0/24 -j ACCEPT
iptables -A test3 -p 6 -s 224.90.83.194 -d 244.47.114.89 --sport 10969 -j DROP
iptables -A test1 -p 17 -s 91.183.0.0/16 --sport 10271 -j ACCEPT
iptables -A INPUT -p 17 --dport 52562 -j ACCEPT
iptables -A test1 -p 6 --dport 16955 -j DROP
iptables -A INPUT -p 6 -s 234.0.0.0/8 --dport 13136 -d 70.50.154.148 -j DROP
iptables -A test3 -p 6 --dport 32893 -s 129.110.61.13 --sport 59336 -j ACCEPT
iptables -A OUTPUT -p 6 -s 107.80.156.100 -d 83.27.38.101 --dport 39824 -j ACCEPT
iptables -A test2 -p 17 -d 88.93.72.188 --sport 61575 --dport 32547 -j DROP
iptables -A test3 -p 6 --dport 22239 -j ACCEPT
iptables -A test2 -p 223 -d 23.154.179.138 -j DROP
iptables -A FORWARD -p 6 -s 197.39.209.0/24 --sport 58889 -j ACCEPT
iptables -A INPUT -p 193 -s 199.182.4.69 -d 137.10.246.135 -j ACCEPT
iptables -A test2 -p 6 -d 87.215.67.166 --dport 36240 -j DROP
iptables -A OUTPUT -s 65.241.0.0/16 -d 50.20.84.63 -j DROP
iptables -A OUTPUT -s 103.55.176.103 -d 99.150.186.39 -j ACCEPT
iptables -A test1 -p 17 --sport 58838 --dport 5214 -d 3.218.43.17 -j ACCEPT
iptables -A INPUT -p 17 --dport 23300 -s 106.221.46.0/24 -d 211.247.0.0/16 -j ACCEPT
iptables -A OUTPUT -p 17 -d 233.169.170.47 -s 48.96.187.142 --dport 36247 -j DROP
iptables -A test2 -p 151 -d 245.5.42.228 -j ACCEPT
iptables -A test2 -p 17 --sport 34189 --dport 37876 -s 251.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 43977 -j ACCEPT
iptables -A INPUT -p 17 --sport 38840 -j test2
iptables -A OUTPUT -p 17 --dport 49981 -s 173.54.143.0/24 -j ACCEPT
iptables -A test3 -p 6 --dport 46657 --sport 58883 -d 170.0.0.0/8 -j DROP
iptables -A FORWARD -p 6 --dport 62232 -s 232.4.156.148 -j DROP
iptables -A OUTPUT -d 226.116.93.82 -j DROP
iptables -A INPUT -p 6 --dport 553 -s 122.183.243.208 -j DROP
iptables -A FORWARD -p 6 --dport 7242 -s 23.0.0.0/8 --sport 16816 -j ACCEPT
iptables -A FORWARD -p 6 --dport 40484 -j DROP
iptables -A INPUT -p 68 -j ACCEPT
iptables -A FORWARD -p 6 -d 176.76.35.75 --sport 37884 --dport 825 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 57376 -d 110.65.70.225 -j ACCEPT
iptables -A INPUT -p 109 -d 33.72.4.11 -s 153.34.74.152 -j DROP
iptables -A test3 -p 17 -d 174.46.73.186 --sport 38656 --dport 14560 -j DROP
iptables -A FORWARD -p 17 --sport 30112 -s 3.0.0.0/8 --dport 50158 -j DROP
iptables -A OUTPUT -p 6 --sport 49281 -j ACCEPT
iptables -A test1 -p 6 -d 5.102.90.0/24 --dport 9962 -j ACCEPT
iptables -A INPUT -p 121 -j DROP
iptables -A INPUT -p 16 -j ACCEPT
iptables -A OUTPUT -s 20.180.130.43 -j DROP
iptables -A test3 -p 17 -s 59.76.207.145 -d 74.0.0.0/8 --dport 28511 --sport 59380 -j ACCEPT
iptables -A INPUT -p 6 -s 52.90.16.246 -d 173.208.61.106 --dport 56838 --sport 1724 -j DROP
iptables -A test3 -p 6 -s 109.194.247.0/24 --sport 45327 -j DROP
iptables -A OUTPUT -s 40.130.237.214 -j DROP
iptables -A INPUT -p 17 -s 37.3.196.251 --sport 2407 -d 201.67.90.126 -j DROP
iptables -A OUTPUT -p 6 -d 197.215.173.0/24 --dport 65507 --sport 55614 -j ACCEPT
iptables -A test1 -p 17 --sport 21621 --dport 27831 -s 163.236.18.134 -j ACCEPT
iptables -A test3 -p 6 -d 65.0.0.0/8 --dport 42802 -s 178.82.171.64 -j DROP
iptables -A FORWARD -d 44.254.244.0/24 -j ACCEPT
iptables -A test1 -p 17 --sport 23471 -s 148.131.128.71 -d 89.116.174.0/24 -j DROP
iptables -A FORWARD -d 152.37.71.0/24 -s 126.125.55.233 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 58363 -d 198.0.0.0/8 --sport 11157 -j ACCEPT
iptables -A test2 -d 157.0.0.0/8 -j DROP
iptables -A INPUT -p 6 --sport 9412 -j DROP
iptables -A INPUT -p 17 --dport 65413 -j ACCEPT
iptables -A test2 -p 17 -d 125.183.240.248 -s 54.0.0.0/8 --dport 9262 -j ACCEPT
iptables -A test1 -p 6 --dport 64939 -j ACCEPT
iptables -A test2 -p 6 --sport 32559 -d 229.4.251.191 -j ACCEPT
iptables -A INPUT -p 6 -s 132.235.39.103 --dport 16340 --sport 3698 -j ACCEPT
iptables -A test3 -s 136.173.0.0/16 -d 77.8.3.13 -j ACCEPT
iptables -A INPUT -s 33.1.155.0/24 -j DROP
iptables -A INPUT -d 216.159.204.17 -j DROP
iptables -A test1 -p 6 --dport 17896 -d 199.9.0.0/16 --sport 59770 -s 173.4.99.123 -j DROP
iptables -A test1 -p 95 -j DROP
iptables -A test2 -p 17 --sport 15391 -j DROP
iptables -A INPUT -p 17 --sport 270 -j DROP
iptables -A test1 -p 17 --sport 16547 -d 131.0.0.0/8 --dport 43565 -j ACCEPT
iptables -A test2 -p 17 --dport 10601 --sport 27550 -j DROP
iptables -A FORWARD -p 17 --dport 13606 --sport 9627 -j ACCEPT
iptables -A test2 -p 6 --sport 62109 -d 125.144.0.0/16 --dport 61847 -j ACCEPT
iptables -A OUTPUT -d 199.196.131.27 -j ACCEPT
iptables -A OUTPUT -p 17 -s 69.94.68.82 --dport 41980 -d 142.214.122.72 -j ACCEPT
iptables -A OUTPUT -p 6 --sport 14502 --dport 13390 -j ACCEPT
iptables -A FORWARD -d 125.60.154.105 -j test3
iptables -A OUTPUT -p 6 --sport 25772 --dport 30367 -s 236.225.111.208 -j DROP
iptables -A test1 -p 53 -j DROP
iptables -A OUTPUT -p 17 -s 167.92.228.0/24 --sport 5120 -j DROP
iptables -A FORWARD -p 6 -d 236.31.175.108 -s 131.163.65.209 --sport 62343 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 30088 -d 173.28.9.0/24 --sport 1978 -j DROP
iptables -A FORWARD -p 174 -j DROP
iptables -A FORWARD -p 17 --sport 42665 --dport 28289 -j DROP
iptables -A test3 -p 6 -s 162.162.213.218 -d 142.0.0.0/8 --sport 5163 -j ACCEPT
iptables -A test1 -p 6 --sport 45762 -d 204.0.0.0/8 -j DROP
iptables -A test1 -p 17 --sport 19081 -d 51.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 17 -s 208.99.82.104 -d 133.137.223.206 --sport 16354 -j DROP
iptables -A OUTPUT -p 6 --dport 26206 --sport 15589 -j ACCEPT
iptables -A INPUT -p 17 -d 225.252.153.73 --sport 29894 --dport 4045 -j DROP
iptables -A INPUT -p 17 --dport 19073 -s 18.0.0.0/8 -j ACCEPT
iptables -A test2 -p 6 --dport 27438 -s 75.187.63.109 --sport 26535 -j DROP
iptables -A INPUT -p 6 --dport 23533 --sport 36320 -j ACCEPT
iptables -A OUTPUT -p 112 -j DROP
iptables -A OUTPUT -p 6 --dport 28146 -j ACCEPT
iptables -A OUTPUT -p 17 --dport 31051 -j test2
iptables -A FORWARD -p 17 --sport 29797 -j DROP
iptables -A INPUT -p 6 -d 223.33.79.160 -s 52.86.3.0/24 --dport 25651 -j ACCEPT
iptables -A test1 -s 234.244.186.64 -j ACCEPT
iptables -A INPUT -p 17 --dport 53701 -d 53.0.0.0/8 -j ACCEPT
iptables -A test3 -d 69.148.68.29 -s 15.39.117.71 -j ACCEPT
iptables -A test2 -p 73 -j DROP
iptables -A test1 -p 17 --dport 7192 --sport 9810 -s 11.229.0.0/16 -j DROP
iptables -A test3 -p 17 --sport 15636 --dport 16801 -s 181.117.67.103 -d 212.64.142.0/24 -j DROP
iptables -A INPUT -p 6 --sport 49651 -j DROP
iptables -A test3 -p 6 -d 154.164.250.209 -s 87.31.0.0/16 --sport 6572 --dport 902 -j DROP
iptables -A test1 -p 6 --dport 11561 -d 229.0.0.0/8 -j ACCEPT
iptables -A FORWARD -p 6 --sport 41004 -d 44.193.91.128 -j ACCEPT
iptables -A OUTPUT -d 96.149.0.0/16 -s 101.75.0.0/16 -j ACCEPT
iptables -A test2 -s 101.162.182.185 -p 92 -j DROP
iptables -A test1 -p 17 --dport 20506 -s 19.0.0.0/8 --sport 54138 -j ACCEPT
iptables -A test3 -p 17 --dport 36038 -d 34.205.0.0/16 -j DROP
iptables -A test3 -p 17 -d 235.168.80.0/24 --sport 30571 -j DROP
iptables -A test3 -p 17 -s 214.47.3.62 --sport 33717 -j DROP
iptables -A OUTPUT -p 6 -s 223.254.0.0/16 --sport 43809 --dport 45148 -j ACCEPT
iptables -A OUTPUT -p 6 -s 77.3.190.241 -d 205.218.238.150 --dport 64987 -j DROP
iptables -A OUTPUT -p 6 --sport 58239 -d 56.158.201.0/24 -j ACCEPT
iptables -A test3 -p 17 --dport 53978 -j DROP
iptables -A INPUT -p 191 -d 12.0.0.0/8 -j DROP
iptables -A test3 -p 6 --sport 24548 -j ACCEPT
iptables -A test3 -p 6 --sport 45574 -j DROP
iptables -A test1 -p 17 --dport 40508 -d 162.85.129.0/24 -s 89.0.0.0/8 -j DROP
iptables -A OUTPUT -s 217.41.207.53 -j DROP
iptables -A test3 -p 6 --dport 35240 --sport 44079 -s 28.0.0.0/8 -j DROP
iptables -A FORWARD -p 17 --sport 27206 --dport 46419 -d 213.131.252.0/24 -j DROP
iptables -A INPUT -p 17 --dport 44401 -j ACCEPT
iptables -A INPUT -p 6 -d 90.0.0.0/8 --dport 34281 --sport 49660 -j test2
iptables -A test2 -p 6 --sport 40834 -d 79.236.155.0/24 -j ACCEPT
iptables -A test2 -p 6 -d 35.173.0.0/16 -s 56.0.0.0/8 --sport 49437 --dport 52977 -j DROP
iptables -A test2 -p 17 --sport 55928 -d 92.0.0.0/8 -s 151.169.110.31 -j ACCEPT
iptables -A INPUT -d 72.110.18.205 -j DROP
iptables -A test3 -p 6 --dport 38336 -j DROP