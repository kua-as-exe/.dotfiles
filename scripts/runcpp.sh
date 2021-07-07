#!/bin/bash

showCases=true # Muestra detalles los casos de prueba
showResults=true # Muestra la salida de los programas
showExpected=true # Muestra la salida esperada si se obtuvo respuesta incorrecta
showTime=true # Muestra el tiempo tltal
timePrecision=5  # Número de decimales [0, 9]

# clear
bla=$'\e[1;30m'; gray=$'\e[1;90m'
red=$'\e[1;31m'; lred=$'\e[1;91m'
grn=$'\e[1;32m'; lgrn=$'\e[1;92m'
yel=$'\e[1;33m'; lyel=$'\e[1;93m'
blu=$'\e[1;34m'; lblu=$'\e[1;94m'
mag=$'\e[1;35m'; lmag=$'\e[1;95m'
cyn=$'\e[1;36m'; lcyn=$'\e[1;96m'
end=$'\e[0m'   ; whit=$'\e[1;97m'

file=$1

if [[ -z "$file" ]]; then
  [[ -e "main.cpp" ]] && file="main.cpp"
  # [[ -e "programas/main.cpp" ]] && file="programas/main.cpp"
fi

echo -e "${cyn}${file}:${ENDCOLOR}"
result=$(g++ $file -o ./main)

if [[ ! -e ./main ]]; then
  echo -e "${red}Compilation Error:${end}"
  echo "$result"
  exit 1
fi


printCase(){
  [ $showCases == true ] && printf $1
}

runCase(){

  local program=$1
  local testFile=$2

  testFilename=$(basename $testFile .in)
  $($showCases == true) && printf "${yel}► ${testFilename}${end} "

  STARTTIME=$(date '+%s%N')
  out=$($program < $testFile)
  ENDTIME=$(date '+%s%N')

  testDuration=$((ENDTIME-STARTTIME))

  if [ $showResults == true ] ; then  
    printf " $out\t\t\t"; 
  fi

    # compare with expected output (.out files)
    if [ -e "casos/$testFilename.out" ]; then
      outputFilename="casos/$testFilename.out"
      expected=$(cat $outputFilename)

      processedOutput=$out # get last line
      if [[ $processedOutput == $expected ]]; then
        printCase "(${grn}AC${end})"
        ac=$(($ac+1))
      else
        printCase "(${red}WA${end})"
        if [ $showExpected == true ] ; then  
          printf " $expected"
        fi
      fi
      totalTests=$(($totalTests+1))
      printf " "
    fi

    printf "[${mag}$( bc <<< "scale=$timePrecision; $testDuration/1000000000" ) s${end}]"
    printCase "\n"
  }

if [[ -z $2 ]]; then
  if [[ -e "casos/" ]]; then
    for testFile in $( ls ./casos/*.in | sort -n -t "/" -k 3,3); do
      testFilename=$(basename $testFile .in)
      if [[ ${testFilename:0:1} != "_" ]] ; then
        runCase ./main $testFile
      fi 
    done
  else 
    ./main
  fi 
elif [[ $2 == "-f" ]]; then
  ./main < $3
else
  ./main <<< $2
fi

rm ./main
printf "\n"
