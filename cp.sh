#! /bin/bash

CONTAINER=$(docker ps -q -l)
INFILE=/tmp/diff
DATA_DIR=data

while read line
do
file=$(echo $line | cut -f2 -d " " )
docker cp $CONTAINER:$file $DATA_DIR
echo ADD $DATA_DIR/${file##*/} $file
done < $INFILE

