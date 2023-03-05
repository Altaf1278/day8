#Write a Program to generate a birth month of 50 individuals between the
#year 92 & 93. Find all the individuals having birthdays in the same #month.
#Store it to finally print.

#!/bin/bash

declare -A months

for i in {1..50}
do
  month=$(shuf -i 1-12 -n 1)
  year=$(shuf -i 92-93 -n 1)
  case $month in
    1) months["January"]+="$i " 
    ;;
    2) months["February"]+="$i " 
    ;;
    3) months["March"]+="$i " 
    ;;
    4) months["April"]+="$i " 
    ;;
    5) months["May"]+="$i " 
    ;;
    6) months["June"]+="$i " 
    ;;
    7) months["July"]+="$i " 
    ;;
    8) months["August"]+="$i " 
    ;;
    9) months["September"]+="$i "
    ;;
    10) months["October"]+="$i " 
    ;;
    11) months["November"]+="$i " 
    ;;
    12) months["December"]+="$i " 
    ;;
  esac
done

echo "Individuals with birthdays in the same month:"
for month in "${!months[@]}"
do
  if [[ ${#months[$month]} -gt 0 ]]; then
    echo "$month: ${months[$month]}"
  fi
done
