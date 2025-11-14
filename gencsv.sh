#!/bin/bash
set -e

start=$1
end=$2

if [ -z "$start" ] || [ -z "$end" ]; then
  echo "Usage: ./gencsv.sh <start> <end>"
  exit 1
fi

> inputFile

for (( i=$start; i<=$end; i++ ))
do
  echo "$i, $((RANDOM % 300))" >> inputFile
done
