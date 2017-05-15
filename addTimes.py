import sys

smt = 0
numCalls = 0

for line in sys.stdin:
	if line[:1].isdigit():
		smt += float(line)
		numCalls += 1

	if line[:4] == "Comp":
		print ("total =" + line[17:-1])

print smt
print "NumCalls = " + str(numCalls)