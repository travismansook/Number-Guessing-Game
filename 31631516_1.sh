#! /bin/bash

games_played=0
games_won=0
replay=0

while [ "$replay" -eq 0 ]; do
	games_played=$(($games_played+1))
	attempts=7
	rand_num=$(($RANDOM % 50 + 1))
	#echo "$rand_num" #check random number for testin
	echo "Welcome to Bash Number Guessing Game!"
	echo "Think of a number between 1 and 50."
	echo "You have 7 attempts to guess it!"
	echo ""
	is_word_right=-1
	did_user_win=-1
	while [ "$attempts" -ne 0 ] && [ "$did_user_win" -eq -1 ]; do
		did_user_win=-1
		echo -n "Enter your guess: "
        	read guess
		if [ "$guess" -lt 1 ] || [ "$guess" -gt 50 ]; then
			attempts=$(($attempts-1))
			echo "Invalid input! Please enter a number between 1 and 50."
                	echo "Attempts remaining: $attempts"
                	echo ""
		else
			if [ "$guess" -gt "$rand_num" ]; then
                        	echo "Too high! Try a lower number."
                        	attempts=$(($attempts-1))
                        	echo "Attempts remaining: $attempts"
                        	echo""
                	elif [ "$guess" -lt "$rand_num" ]; then
                       		echo "Too low! Try a higher number."
                        	attempts=$(($attempts-1))
                        	echo "Attempts remaining: $attempts"
                        	echo""
			else
				attempts=$(($attempts-1))
				games_won=$(($games_won+1))
				is_word_right=0
				did_user_win=0
				echo "Congratulations! You guessed the number $guess in $((7-$attempts)) attempt(s)!"
                                echo -n "Would you like to play again? (yes/no): "
                                read play_again
                                echo ""
                               	valid=1
				while [ "$valid" -eq 1 ]; do
			       		if [ "$play_again" = "yes" ]; then
                                	        valid=-1
						did_user_win=0
                                	elif [ "$play_again" = "no" ]; then
                                	       	echo "Thanks for playing!"
						valid=-1
						replay=-1	
                                	else
                                  		echo "Enter a valid response"
                                        	continue
                                	fi
				done
			fi
		fi		
	done
	if [ "$attempts" -eq 0 ] && [ "$is_word_right" -eq -1 ]; then
                valid=1
		echo "Game Over! The number was $rand_num. Better luck next time!"
              	while [ "$valid" -eq 1 ]; do
		
                	echo -n "Would you like to play again? (yes/no): "
                	read play_again
                	echo ""

			if [ "$play_again" = "yes" ]; then                
				valid=-1                
			elif [ "$play_again" = "no" ]; then                
				echo "Thanks for playing!"        
				valid=-1                
				replay=-1                
			else                
				echo "Enter a valid response"                
				continue                
			fi
		done
	fi
done
		
echo "Games Played: $games_played"
echo "Games Won: $games_won"


