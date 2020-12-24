echo "Welcome to Flip Coin Combination problem"

#!/bin/bash -x

Toss=$((RANDOM%2))                                        #Generating a random value

if [[ $Toss -eq 1 ]]                                      #Checking a random value
then
   echo "Heads"
else
   echo "Tails"
fi
