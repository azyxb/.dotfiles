#!/bin/bash

#Strings and variables
ranoppo=$((`od -An -N2 -i /dev/random | tr -d " "` % 6 + 1))
oppohealth=$((`od -An -N2 -i /dev/random | tr -d " "` % 10 + 20))
playerhealth=$((`od -An -N2 -i /dev/random | tr -d " "` % 10 + 10))
oppodam=$((`od -An -N2 -i /dev/random | tr -d " "` % 5 + 1))
potion_used=0

#Start
echo -n "What is your name? "
read n
echo -n "Your opponent is ... "

#Picking opponent
if [ $ranoppo -eq 1 ]; then
	echo "an Orc!"
	echo "It does $oppodam damage."
fi

if [ $ranoppo -eq 2 ]; then
	echo "a Stick monster!"
	echo "It does $oppodam damage."
fi

if [ $ranoppo -eq 3 ]; then
	echo "a Giant slug!"
	echo "It does $oppodam damage."
fi

if [ $ranoppo -eq 4 ]; then
	echo "a Zombie!"
	echo "It does $oppodam damage."
fi

if [ $ranoppo -eq 5 ]; then
	echo "a Fighting bear!"
	echo "It does $oppodam damage."
fi

#The program loop begins
while [ $playerhealth -gt 1 ]; do
        playerdam=$((`od -An -N2 -i /dev/random | tr -d " "` % 6 + 1))
        oppodam=$((`od -An -N2 -i /dev/random | tr -d " "` % 5 + 1))
        echo
        echo
        echo "Your health is $playerhealth."
        echo "Your opponent's health is $oppohealth."
        echo
        echo "Do you want to //attack// your opponent?"
        echo "Or use Health //potion// ?"
        echo -n "Choice: "
        read movement

	if [ $potion_used -lt 1 ]; then
		if [ ${movement,,} == "potion" ]; then
			echo
			echo "You drink the Health potion and gain 20 health!"
			playerhealth=$((playerhealth + 20))
        	        potion_used=1
		fi
	else
		echo "Oh no, you're out of potions!"
	fi

	if [ ${movement,,} == "attack" ]; then
		echo
		echo "You attack your opponent."
		echo "The opponent attacks back!"
		oppohealth=$((oppohealth-playerdam))
	fi

	echo
	echo "The opponent attacks!"
	playerhealth=$((playerhealth - oppodam))

	if [ $oppohealth -lt 1 ]; then
		echo
		echo
		echo "==============================="
		echo "| You defeated your opponent! |"
		echo "|-----------------------------|"
		echo "| You win!                    |"
		echo "==============================="
		echo
		exit
	fi

done

echo
echo
echo "=================================="
echo "| Oh no! You have 0 health left! |"
echo "|--------------------------------|"
echo "| Game over!                     |"
echo "=================================="
echo
