#!/bin/bash

COLOR="\e[96m"; ENDCOLOR="\e[0m";

file=$1
echo -e "${COLOR}${file}:${ENDCOLOR}"

g++ $file -o ./main

if [[ -z $2 ]]; then
        echo "stdin not supported yet"
elif [[ $2 == "-f" ]]; then
        ./main < $3
else
        ./main <<< $2
fi

rm ./main
printf "\n"
