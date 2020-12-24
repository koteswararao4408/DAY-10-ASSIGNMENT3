#!/bin/bash -x
echo "Welcome to Flip Coin Combination problem"

declare -A singlet                                        #storing the singlet in Dictionary

#Variable
flipCoin=1
function checkResult ()                                   #fuction for checking random value
{
     case $1 in                                           #Case for random value
	0)
	singlet[head]=$(( ${singlet[head]} + 1 ))
	;;
	1)
	singlet[tail]=$(( ${singlet[tail]} + 1 ))
	;;
	*)
	echo "error"
	;;
     esac
}

while [ $flipCoin -le 20 ]                                 #for flipping the coin for 20 times
do
      	random=$(( RANDOM % 2 ))
	checkResult $random                                #calling checkResult function
	flipCoin=$(( $flipCoin + 1 ))
done
echo "singlet values in percentage"
for key in ${!singlet[@]}                                  #for printing the percentage of heads and tails
do
	percentage=`echo | awk -v key="$key" -v value="${singlet[$key]}" '{ percent = (value / 50) * 100 } END { print key " is " percent "%" }'`
        echo "$percentage
done
