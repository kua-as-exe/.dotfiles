#!/bin/bash

for program in ./*.cpp; do
  programName=$(basename $program)
  #ignore files if name begins with "_"
  if [[ ${programName:0:1} != "_" ]]; then
    @runcpp $program
  fi
done
