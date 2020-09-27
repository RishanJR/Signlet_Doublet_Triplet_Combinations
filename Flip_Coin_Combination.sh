#!/bin/bash

echo -e "\nWelcome to Flip Coin Simulation"
echo -e "This problem displays the winning percentage of head or tail combinatiion in a singlet, doublet and triplet\n"

echo Enter the number of events you want to check
read n

#Variables for singlet
hcount=0
tcpunt=0

#variables for doublet
hhcount=0
htcount=0
ttcount=0

#Variables for triplet
hhhcount=0
hhtcount=0
httcount=0
tttcount=0

#Decalring dictionary
declare -A singlet
declare -A doublet
declare -A triplet

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

                #Checking Doublet Combination (HH)
                res=$(( RANDOM%2 ))

                if [[ res -eq 0 ]]
                then
                        ((hhcount++))
                        doublet[$i]="HH"
                        #Checking Triplet Combination (HHH or HHT)
                        res=$(( RANDOM%2 ))

                        if [[ res -eq 0 ]]
                        then
                                ((hhhcount++))
                                triplet[$i]="HHH"
                        else
                                ((hhtcount++))
                                triplet[$i]="HHT"
                        fi

		else
	                #Checking Doublet Combination (HT)
			((htcount++))
			doublet[$i]="HT"

			#Checking Triplet Combination (HTH or HTT)
                        res=$(( RANDOM%2 ))

                        if [[ res -eq 0 ]]
                        then
                                ((hhtcount++))
                                triplet[$i]="HHT"
                        else
                                ((httcount++))
                                triplet[$i]="HTT"
                        fi

                fi

	else
		#Checking Singlet Combination (Tails)
		((tcount++))
		singlet[$i]="Tails"

                res=$(( RANDOM%2 ))

                if [[ res -eq 0 ]]
                then
                	#Checking Doublet Combination (HT)
                        ((htcount++))
                        doublet[$i]="HT"

                        #Checking Triplet Combination (HHT or HTT)
                        res=$(( RANDOM%2 ))

                        if [[ res -eq 0 ]]
                        then
                                ((hhtcount++))
                                triplet[$i]="HHT"
                        else
                                ((httcount++))
                                triplet[$i]="HTT"
                        fi

		else
			#Checking Doublet Combination (TT)
			((ttcount++))
			doublet[$i]="TT"

			#Checking Triplet Combination (HTT or TTT)
                        res=$(( RANDOM%2 ))

                        if [[ res -eq 0 ]]
                        then
                                ((httcount++))
                                triplet[$i]="HTT"
                        else
                                ((tttcount++))
                                triplet[$i]="TTT"
                        fi

		fi

	fi
done

echo -e "\nThe Singlet combination are: ${singlet[@]}"

#Calculating percentage of the singlet combination
total=$(( $hcount+$tcount ))
hperc=$(( $hcount*100/$total ))
tperc=$(( 100-$hperc ))

echo -e "The percentage of the singlet combination is $hperc% Heads and $tperc% Tails\n"

echo -e "Now performing Doublet Combinations\n"

echo The doublet combinations are:      ${doublet[@]}

#Calculating the percentage of the doublet
total=$(( $hhcount+$ttcount+$htcount ))
hhperc=$(( $hhcount*100/$total ))
ttperc=$(( $ttcount*100/$total ))
htperc=$(( $htcount*100/$total ))

echo -e "The percentage of the Doublet combination is $hhperc% heads and heads, $htperc% heads and tails and $ttperc tails and tails"

echo -e "\nNow performing Triplet Combinations]\n"

echo The triplet combinations are:      ${triplet[@]}

#Calculating the percentage of the triplet
total=$(( $hhhcount+$hhtcount+$httcount+$tttcount ))
hhhperc=$(( $hhhcount*100/$total ))
hhtperc=$(( $hhtcount*100/$total ))
httperc=$(( $httcount*100/$total ))
tttperc=$(( $tttcount*100/$total ))

echo -e "The percentage of the Triplet combination is $hhhperc% heads, heads and heads, $hhtperc% heads, heads and tails, $httperc% heads, tails and tails and $tttperc% tails, tails and tails\n"




