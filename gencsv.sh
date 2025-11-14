#!/bin/bash

start=$1
end=$2

> inputFile   # create/empty file

for i in $(seq $start $end); do
    echo "$i, $RANDOM" >> inputFile
done

