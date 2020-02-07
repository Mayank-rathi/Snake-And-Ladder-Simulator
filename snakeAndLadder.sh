#!/bin/bash 
echo "Welcome To Snake And Ladder Simulator"

#CONSTANT
WINING_POSITION=100
START_POSITION=0
NO_PLAY=1
LADDER=2
SNAKE=3
#VARIABLE
die=0
updatePosition=$START_POSITION	

#For Rolling dice
function dieRoll()
{
	die=$((RANDOM%6+1)); 
	((dice++))
}
#Wining Position Till 100, dice count and it's dice position
function winingPosition(){
	while [[ $updatePosition -lt $WINING_POSITION ]]
	do
		checkOption
		echo "count die $dice  and position is $updatePosition"
	done
}
#Exact position Till 100
function exactPositionForWining()
{
	if(($updatePosition>$WINING_POSITION))
		then
		updatePosition=$(($updatePosition-$die))      
	fi
}

#If value Above WINING_POSITION THEN RESTART
function resetToStart(){
	if [[ $updatePosition -lt 0 ]]
	then
		updatePosition=$START_POSITION
	fi
}

#Check for option And case 1)NO_PLAYE 2)LADDER 3)SNAKE
function checkOption()
{
	option=$((RANDOM%3+1))
	dieRoll 
	case $option in
		$NO_PLAY)
			updatePosition=$updatePosition
			;;
		$LADDER)
			updatePosition=$(($updatePosition+die))
			exactPositionForWining
			;;
		$SNAKE)
			updatePosition=$(($updatePosition-die))
			resetToStart
			;;
	esac
}
winingPosition
