#!/bin/bash

# 38 foreground
# 48 background
# {1..256} 256 colors

# why printf???
# echo -e "\e[${fgbg};5;${color}m ${color} \t \e[0m"
# does not work, it substitute variables but do not read escapse sequence on my OS X bash 3.2.57


for fgbg in 38 48; do
  for color in {0..256}; do
    printf "\e[${fgbg};5;${color}m ${color} \t \e[0m"
    if [[ $((($color + 1) % 10)) == 0 ]]; then
      echo
    fi
  done
  echo
done

