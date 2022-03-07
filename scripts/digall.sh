#!/bin/bash

# Usage: digall domain [sub1] [sub2] [sub3] ...

D="[[:digit:]]\{1,3\}"
IP="$D\.$D\.$D\.$D"

CYAN=$(tput setaf 51)
END=$(tput sgr0)

domain=$1
_subdomains=$@

records=("A" "AAAA" "CAA" "CNAME" "MX" "NS" "PTR" "SOA" "SRV" "TXT")

DIG() {
  _domain=$1
  echo ""
  echo -e "$CYAN> $_domain $END"
  for type in ${records[@]}; do
    dig $_domain +noall +answer $type \
      | sed -e "s/\($IP\)/$(tput setaf 184)\1$END/g" \
      
      ## Thing to highlight record types
      # | sed -e "s/\(\\tA\\t.*$\)/$(tput setaf 226)\1$END/g" \
      # | sed -e "s/\(\\tAAAA\\t.*$\)/$(tput setaf 229)\1$END/g" \
      # | sed -e "s/\(\\tTXT\\t.*$\)/$(tput setaf 110)\1$END/g" \
      # | sed -e "s/\(\\tMX\\t.*$\)/$(tput setaf 174)\1$END/g" \
      # | sed -e "s/\(\\tNS\\t.*$\)/$(tput setaf 141)\1$END/g" \
  done
}

DIG $domain

IFS=', ' read -r -a subdomains <<< "$_subdomains"
unset subdomains[0]

for sub in ${subdomains[@]}; do
  DIG $sub.$domain
done

echo ""
