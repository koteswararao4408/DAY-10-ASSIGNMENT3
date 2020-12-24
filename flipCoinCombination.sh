#!/bin/bash -x
echo "Welcome to Flip Coin Combination problem"
declare -A triplet                                          #storing the Triplet combination in Dictionary
#variable
flipCoin=1

function checkResult ()                                     #fuction for checking random value
{
	case $1$2$3 in                                      #Case for 3 random values (HHH,HHT,HTH,THH,TTH,HTT,THT,TTT)
		000)
		triplet[HHH]=$(( ${triplet[HHH]} + 1 ))
		;;
		001)
		triplet[HHT]=$(( ${triplet[HHT]} + 1 ))
		;;
		010)
		triplet[HTH]=$(( ${triplet[HTH]} + 1 ))
		;;
		100)
		triplet[THH]=$(( ${triplet[THH]} + 1 ))
		;;
		110)
		triplet[TTH]=$(( ${triplet[TTH]} + 1 ))
		;;
		011)
		triplet[HTT]=$(( ${triplet[HTT]} + 1 ))
		;;
		101)
		triplet[THT]=$(( ${triplet[THT]} + 1 ))
		;;
		111)
		triplet[TTT]=$(( ${triplet[TTT]} + 1 ))
		;;
		*)
		echo "error"
		;;
	esac
}
while [ $flipCoin -le 50 ]                                      #for flipping the coin for 50 times
do
	random1=$(( RANDOM % 2 ))
	random2=$(( RANDOM % 2 ))
	random3=$(( RANDOM % 2 ))
	checkResult $random1 $random2 $random3                  #calling CheckResult for 3 random values
	flipCoin=$(( $flipCoin + 1 ))
done

for key in ${!triplet[@]}                                       #for printing the percentage of each triplet combination
do
	percentage=`echo | awk -v key="$key" -v value="${triplet[$key]}" '{ percent = (value / 50) * 100 } END { print key " is " percent "%" }'`
	echo "$percentage"
done
