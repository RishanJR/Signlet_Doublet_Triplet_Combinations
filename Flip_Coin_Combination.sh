#!/bin/bash

echo -e "\nWelcome to Flip Coin Simulation"
echo -e "This problem displays the winning percentage of head or tail combinatiion in a singlet, doublet and triplet\n"

#Random to get any two numbers and and store is RES
RES=$(( RANDOM%2 ))

#Checking if RES is 0 or 1
#0 for heads and 1 for tails
if [[ $RES -eq 0 ]]
then
	echo HEADS
else
	echo TAILS
fi

