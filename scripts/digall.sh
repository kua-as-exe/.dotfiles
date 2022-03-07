#!/bin/bash

# Usage: digall domain [sub1] [sub2] [sub3] ...

CYAN="\\e[93m";END="\\e[0m"

domain=$1
_subdomains=$@

list=("A" "AAAA" "CAA" "CNAME" "MX" "NS" "PTR" "SOA" "SRV" "TXT")

DIG() {
  _domain=$1
  echo ""
  echo -e "$CYAN> $_domain $END"
  for type in ${list[@]}; do
    dig $_domain +noall +answer $type 
  done
}

DIG $domain

IFS=', ' read -r -a subdomains <<< "$_subdomains"
unset subdomains[0]

for sub in ${subdomains[@]}; do
  DIG $sub.$domain
done

echo ""
