#!/usr/bin/env

import subprocess
import sys
import time

fileName = sys.argv[1]

t = time.time()
smt = subprocess.check_output(["z3", fileName])

print smt
print str (time.time() - t)