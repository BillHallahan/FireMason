import random
import copy
import sys
import subprocess

def ip():
	x = []
	for i in range(4):
		x.append(random.randrange(0,255))
	return reduce(lambda y, z : str(y) + "." + str(z), x)

def ipMask():
	x = []
	l = random.randrange(1,4)
	for i in range(l):
		x.append(random.randrange(0,256))
	for i in range(l, 4):
		x.append(0)
	return reduce(lambda y, z : str(y) + "." + str(z), x) + "/" + str((l) * 8)

def ipOrIpMask():
	return random.choice([ip(), ipMask()])

def protocol():
	return random.randrange(0, 256)

def port():
	return random.randrange(0, 65536)

def limit():
	s = random.randrange(0, 20)
	b = random.randrange(s, 30)
	return "-m limit --limit " + str(s) + random.choice(["/second", "/minute", "/hour", "/day"]) + " --limit-burst " + str(b)

def target(chains):
	j = " -j "
	if random.uniform(0, 100) < 95 or chains == []:
		j += random.choice(["ACCEPT", "DROP"])
	else:
		j += random.choice(chains)

	return j

def randomRule():
	draw = ["-s", "-d", "-p", "dport", "sport"]
	rule = "iptables -A "

	chains = ["INPUT", "OUTPUT", "FORWARD", "test1", "test2", "test3"]
	chain = random.choice(chains)

	remChain = []
	if chain in ["INPUT", "OUTPUT", "FORWARD"]:
		remChain = ["test1", "test2", "test3"]

	rule += chain

	c = random.sample(draw, random.randrange(1,len(draw)))

	#if random.randrange(0, 100) < 5:
	#	c.append("l")

	if ("dport" in c or "sport" in c) and "-p" in c:
		c.remove("-p")

	if "dport" in c or "sport" in c:
		rule += " -p " + random.choice(["6", "17"])

	for x in c:
		if x == "-s":
			rule += " -s " + ipOrIpMask()
		elif x == "-d":
			rule += " -d " + ipOrIpMask()
		if x == "-p":
			rule += " -p " + str(protocol())
		if x == "dport":
			rule += " --dport " + str(port())
		if x == "sport":
			rule += " --sport " + str(port())
		if x == "l":
			rule += " " + limit()

	return rule + target(remChain)

def runWithNum(num):
	r = reduce(lambda x, y : x + "\n" + y, map(lambda x : "iptables -N " + x, ["test1", "test2", "test3"]))

	for i in range(num):
		r += "\n" + randomRule()

	f = open("firewallsPy/firewallPython" + str(num) + ".sh", 'w')
	f.write(r)
	f.close()

random.seed()

runWithNum(int(sys.argv[1]))