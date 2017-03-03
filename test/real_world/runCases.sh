#!/bin/bash
for num in `seq 1 5`
do
	count=0
	echo $num
	while [ $count -lt 5 ]; do
		res=$(gtimeout 100s stack exec firewallcode-exe ../proposal/bench/bench${num}/firewall${num}  ../proposal/bench/bench${num}/firewall${num}Fixed.sh ../proposal/bench/bench${num}/examples${num} --allow-different-user)
		re="([0123456789.]+) (s|ms|ns)[^0123456789.]*([0123456789.]+) (s|ms|ns)[^0123456789.]*([0123456789.]+) (s|ms|ns)[^0123456789.]*([0123456789.]+) (s|ms|ns)[^0123456789.]*([0123456789.]+) (s|ms|ns)[^0123456789.]*" #\sms\sConsistency\sChecking\sTime:\s([0-9]\.[0-9])\sms\sLimit\sgeneration\stime:\s([0-9]\.[0-9])\sns\sRule\sAddition/Repair\sTime:\s([0-9]\.[0-9])\sms\sRedundant\sRule\sTime:\s([0-9]\.[0-9])\sms
		if [[ $res =~ $re ]]; then 
			for num2 in `seq 1 5`
			do
				echo -n ${BASH_REMATCH[((2 * $num2 - 1))]};
				echo -n " "
				echo -n ${BASH_REMATCH[((2 * $num2))]};
				echo -n ", "
			done
			echo ""
			((count+=1))
		fi
	done
done