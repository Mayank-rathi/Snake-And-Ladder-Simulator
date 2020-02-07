#!/bin/bash -x
echo "Welcome To Snake And Ladder Simulator"

#Constant
WINNING_POSITION=100
START_POSITION=0
NO_PLAY=1
LADDER=2
SNAKE=3

#Variables
currentPlayer=$START_POSITION	
player1=$START_POSITION
player2=$START_POSITION
flag=false

#Check exact winning position 100
function winingPosition(){
	while [[ $currentPlayer -lt $WINNING_POSITION ]]
	do
		checkPlayer
	done
}
#Check for option And case 1)NO_PLAYE 2)LADDER 3)SNAKE
function checkOption(){
	option=$((RANDOM%3+1))
	diceRoll=$((RANDOM%6+1))
	case $option in
		$NO_PLAY)
			currentPlayer=$currentPlayer
			;;
		$LADDER)
			currentPlayer=$(($currentPlayer+diceRoll))
			if [[ $currentPlayer -gt $WINNING_POSITION ]]
			then
				currentPlayer=$(($currentPlayer-$diceRoll))
			fi
			;;
		$SNAKE)
			currentPlayer=$(($currentPlayer-diceRoll))
			if [[ $currentPlayer -lt 0 ]]
   			then
				currentPlayer=$START_POSITION
			fi
			;;
	esac
}
#Switch between two player
function checkPlayer(){
	if [[ $flag == false ]]
	then
		currentPlayer=$player1
		checkOption
		flag=true
		player1=$currentPlayer
	else
		currentPlayer=$player2
		checkOption
		flag=false
		player2=$currentPlayer
	fi
}

#Check for winner between player1 and player2
function winnerChecking(){
        if [[ $player1 -eq $WINNING_POSITION ]]
        then
                echo "PLAYER 1 WIN"
        else
                echo "PLAYER 2 WIN"
        fi
}
winingPosition
winnerChecking
