#!/bin/bash -x
echo "Welcome To Snake And Ladder Simulator"

#CONSTANT
WINING_POSITION=100
START_POSITION=0
NO_PLAY=1
LADDER=2
SNAKE=3
#VARIABLE
updatePosition=$START_POSITION	

#For Rolling dice
function dieRoll()
{
	die=$((RANDOM%6+1)); 
}
#Wining Position Till 100
function winingPosition(){
	while [[ $updatePosition -lt $WINING_POSITION ]]
	do
		checkOption
	done
}

#Check for option And case 1)NO_PLAYE 2)LADDER 3)SNAKE
function checkOption()
{
	option=$((RANDOM%3+1))
	dieRoll 
	case $option in
		$NO_PLAY)
			updatePosition=$updatePosition
			echo "same"
			;;
		$LADDER)
			updatePosition=$(($updatePosition+die))
			echo "ladder"
			if(($updatePosition>$WINING_POSITION))
			then
				updatePosition=$(($updatePosition-$die))
			fi
			;;
		$SNAKE)
			updatePosition=$(($updatePosition-die))
			echo "snake"
			if [[ $updatePosition -lt 0 ]]
			then
				updatePosition=$START_POSITION
			fi
			;;
	esac
}
winingPosition
