#Write a program in the following steps
#a. Roll a die and find the number between 1 to 6
#b. Repeat the Die roll and find the result each time
#c. Store the result in a dictionary
#d. Repeat till any one of the number has reached 10 times
#e. Find the number that reached maximum times and the one that was for #minimum times

#!/bin/bash

# Create an empty dictionary to store the die rolls
declare -A die_rolls

# Roll the die until one of the numbers has been rolled 10 times
while true; 
 do
  # Roll the die and get a random number between 1 and 6
  roll=$((RANDOM % 6 + 1))

  # Increment the count for the rolled number in the dictionary
  die_rolls[$roll]=$(( ${die_rolls[$roll]:-0} + 1 ))

  # Check if any number has been rolled 10 times
  for i in $(seq 1 6); do
    if [[ ${die_rolls[$i]:-0} -ge 10 ]]; then
      echo "The number $i has been rolled 10 times."
      break 2
    fi
  done
done

# Find the number that was rolled the maximum and minimum number of times
max_count=0
min_count=10
max_number=0
min_number=0
for i in $(seq 1 6); do
  count=${die_rolls[$i]:-0}
  if [[ $count -gt $max_count ]]; then
    max_count=$count
    max_number=$i
  fi
  if [[ $count -lt $min_count ]]; then
    min_count=$count
    min_number=$i
  fi
done

# Print out the results
echo "The number that was rolled the maximum number of times is $max_number, which was rolled $max_count times."
echo "The number that was rolled the minimum number of times is $min_number, which was rolled $min_count times."
