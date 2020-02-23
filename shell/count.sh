#!/usr/bin/env bash

function do_count {
  if [[ ! -d "$1/$2" ]]; then
    ((files++))
  else
    ((directories++))
    for i in `ls $1/$2`; do
      do_count $1/$2 $i
    done
  fi
}

start=`date +%s`

if [[ -z $1 ]]; then
  echo "counting current directory: $PWD ..."
  do_count $PWD
else
  echo counting $1 ...
  do_count $1
fi

end=`date +%s`

cost=`expr $end - $start`

printf "directory: \e[1;4;31m $directories \e[0m \t files: \e[1;4;31m $files \e[0m \t time-cost: \e[1;4;31m $cost(s) \e[0m \n"
