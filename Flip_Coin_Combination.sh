#!/bin/bash

echo -e "\nWelcome to Flip Coin Simulation"
echo -e "This problem displays the winning percentage of head or tail combinatiion in a singlet, doublet and triplet\n"

echo Enter the number of events you want to check
read n

#Variables for singlet
hcount=0
tcpunt=0

#Decalring dictionary
declare -A singlet

#Singlet Combination
for (( i=0 ; i<n ; i++ ))
do
	#Random to get any two numbers and and store is RES
        res=$(( RANDOM%2 ))

	#Checking if RES is 0 or 1
	#0 for heads and 1 for tails
	if [[ res -eq 0 ]]
        then
                #Checking Singlet Combination (Heads)
                ((hcount++))
                singlet[$i]="Heads"
	else
		#Checking Singlet Combination (Tails
		((tcount++))
		singlet[$i]="Tails"
	fi
done

echo -e "\nThe Singlet combination are: ${singlet[@]}"

#Calculating percentage of the singlet combination
total=$(( $hcount+$tcount ))
hperc=$(( $hcount*100/$total ))
tperc=$(( 100-$hperc ))

echo -e "The percentage of the singlet combination is $hperc% Heads and $tperc% Tails"





