#!/bin/bash

solution=$1
cases=$2

cppexecutable="./generate_temp"

g++ $solution -o $cppexecutable; 
chmod +x $cppexecutable;

count=0
for x in $cases**.in; do 
  in=$x;
  out=${x%.in}.out; 
  # echo $in $out;
  $cppexecutable < $in > $out;
  count=$(($count+1))
done

echo "Generated $count outputs with $solution"

rm $cppexecutable

