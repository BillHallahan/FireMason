import sys
from subprocess import call

for n in [100, 250, 375, 500]:
	print n
	x = call(["./dist/build/FireMason-exe/FireMason-exe", "./test/real_world/firewallsPy/firewallsPy/firewallPython" + str(n) + ".sh", "testOut.sh", "./test/real_world/firewallsPy/example10.txt"])
	print x