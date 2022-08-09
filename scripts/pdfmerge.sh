#!/bin/bash
# Based on: 
# ~ https://stackoverflow.com/questions/2507766/merge-convert-multiple-pdf-files-into-one-pdf#comment51103781_19358402
echo ${1}
echo "${@:2:2}"


inputs=()
for (( c=2;c<$#;c++ )); do
  inputs+=($c)
done
# echo ${inputs[@]}

# gs \
#   -dBATCH \
#   -dNOPAUSE \
#   -q \
#   -sDEVICE=pdfwrite \
#   -dPrinted=false \
#   -dPDFSETTINGS=/prepress \
#   -sOutputFile="$1" \
# ${@:2}
#   ${inputs[@]}
