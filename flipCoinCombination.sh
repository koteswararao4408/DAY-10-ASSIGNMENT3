#!/bin/bash -x
echo "Welcome to Flip Coin Combination problem"
declare -A doublet                                         #storing the Doublet combination in Dictionary
#Variable
flipCoin=1

function checkResult ()                                    #fuction for checking random value
{
    case $1$2 in                                           #Case for 2 random values(HH,TT,HT,TH)
	00)
	doublet[HH]=$(( ${doublet[HH]} + 1 ))
	;;
	11)
	doublet[TT]=$(( ${doublet[TT]} + 1 ))
	;;
	01)
	doublet[HT]=$(( ${doublet[HT]} + 1 ))
	;;
	10)
	doublet[TH]=$(( ${doublet[TH]} + 1 ))
	;;
	*)
	echo "error"
	;;
    esac
}
while [ $flipTheCoin -le 20 ]                               #for flipping the coin for 20 times
do
	random1=$(( RANDOM % 2 ))
	random2=$(( RANDOM % 2 ))
	checkResult $random1 $random2                       #calling checkResult function
	flipCoin=$(( $flipCoin + 1 ))
done
echo "Doublet values in percentage"
for key in ${!doublet[@]}                                   #for printing the percentage of each doublet combination
do
	percentage=`echo | awk -v key="$key" -v value="${doublet[$key]}" '{ percent = (value / 20) * 100 } END { print key " is " percent "%" }'`
	echo "$percentage"

done
