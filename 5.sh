#!/bin/bash

find $2 -type f -printf "%f\n" > /tmp/rez.txt 2> /tmp/error.txt
find $( readlink -f $2 )  -user $1 -type f -printf "%p  %f  %s\n" > $3 2> /tmp/error.txt
cat /tmp/rez.txt | wc -l
sed -r "s,^[^:]+,$(basename $0 -a),"  /tmp/error.txt >&2
rm /tmp/error.txt /tmp/rez.txt

#find $( readlink -f "$(find $2 -type f -printf "%f\n" > /tmp/rez.txt 2> /tmp/error.txt )" ) -user $1 -type f -printf "%p  %f  %s\n" > $3