#!/bin/bash
# use read to function as awk https://stackoverflow.com/a/64076646/21294350

while read -r a b; do
  [[ "$a" == "Date:" ]] && echo "$a $b"
  [[ "$a" == "Description:" ]] && read -r b && echo "$a $b"
  [[ "$a" == "Type:" ]] && echo "$a $b"
done < repo
