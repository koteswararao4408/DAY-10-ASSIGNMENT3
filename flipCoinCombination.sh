#!/bin/bash -x
echo "Welcome To flipCoin combination problem"

declare -A singlet                                                #storing singlet,doublet and triplet in dictionaries
declare -A triplet
declare -A doublet

#variables
flipCoin=1
max=0
keyMax=0

function checkResult ()
{
        case $1$2$3 in                                                     #Case for checking (H,T,HH,TT,HT,TH,HHH,HHT,HTH,THH,TTH,HTT,THT,TTT)
                0)
                singlet[H]=$(( ${singlet[H]} + 1 ))
                ;;
                1)
                singlet[T]=$(( ${singlet[T]} + 1 ))
                ;;
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

while [ $flipCoin -le 50 ]
do
        checkResult $(( RANDOM % 2 ))                                        #calling function for H or T
        checkResult $(( RANDOM % 2 ))$(( RANDOM % 2 ))                       #calling function for HH,TT,HT and TH
        checkResult $(( RANDOM % 2 ))$(( RANDOM % 2 ))$(( RANDOM % 2 ))      #calling fuction for HHH,HHT,HTH,THH,TTH,HTT,THT and TTT
        flipCoin=$(( $flipCoin + 1 ))
done

echo "Singlet Values in Percentage : "

for key1 in ${!singlet[@]}                                                   #for printing percentage for singlet combination
do
         percentage=`echo | awk -v key1="$key1" -v value="${singlet[$key1]}" '{ percent = (value / 50) * 100 } END { print key1 " is " percent "%" }'`
         echo "$percentage"
done
echo "Doublet Values in Percentage : "

for key2 in ${!doublet[@]}                                                    #for printing the percentage of each doublet combination
do
        percentage=`echo | awk -v key2="$key2" -v value="${doublet[$key2]}" '{ percent = (value / 50) * 100 } END { print key2 " is " percent "%" }'`
        echo "$percentage"
done
echo "Triplet Values in Percentage : "

for key3 in ${!triplet[@]}                                                    #for printing the percentage of each triplet combination
do
        percentage=`echo | awk -v key3="$key3" -v value="${triplet[$key3]}" '{ percent = (value / 50) * 100 } END { print key3 " is " percent "%" }'`
        echo "$percentage"
done
echo "sorted singlet result"

for key1 in "${!singlet[@]}"                           #for sorting singlet combination
do
        if [[ $max -lt ${singlet[$key1]} ]]
        then
                max=${singlet[$key1]}
                keyMax=$key1
        fi
        printf '%s:%s\n' "$key1" "${singlet[$key1]}"
done | sort -t : -k 2n

echo "winning combination in singlet is"  $keymax
