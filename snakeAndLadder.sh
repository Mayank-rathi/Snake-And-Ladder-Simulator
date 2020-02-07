#!/bin/bash 
echo "Welcome To Snake And Ladder Simulator"

#CONSTANT
NO_OF_PLAYER=1
START_POSITION=0

#VARIABLE
position=START_POSITION

die=$((RANDOM%6+1));
#choic=$((RANDOM%3+1)); 
echo "1)No Play 2)Ladder 3)Snake"
case $((RANDOM%3+1)) in
	1)
		echo "No play Stay on position"
		;;
	2)
		echo "Iincreas the position according to dice"
		echo "die position: " $die 
		position=$((position+die))
		echo "$position"
		;;
	3)
		echo "Snake positon"
		echo "die vale:" $die
		position=$((position-die))
		echo "$position"
		;;
esac
