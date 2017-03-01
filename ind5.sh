#!/bin/bash
# 1-name, 2-dir, 3-file

IFS=$'\n'
let count=0;
cp /dev/null $3

for j in $(find $( readlink -f "$2") -name '*' -type f 2> /tmp/error.txt)
do
	let "count=count+1"
done

for i in $(find $( readlink -f "$2") -user $1 -type f -printf "%p  %f  %s\n" 2> /tmp/error.txt)
do
	echo $i >> $3
done

echo $count
sed -r "s,^[^:]+,$(basename $0 -a),"  /tmp/error.txt >&2
rm /tmp/error.txt