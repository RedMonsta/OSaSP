#!/bin/bash
# 1-name, 2-dir, 3-file

if [ $# = 3 ] 
then
	find $2 -type f 2> /tmp/errors.txt | wc -l 
	find $( readlink -f $2 )  -user $1 -type f -printf "%p  %f  %s\n" > $3 2> /tmp/errors.txt
	sed -r "s/^/$(basename $0 -a): /"  /tmp/errors.txt >&2
else
	echo "$(basename $0 -a): Arguments error." > /tmp/errors.txt >&2
fi

#cat /tmp/rez.txt | wc -l
#find $2 -type f -printf "%f\n" > /tmp/rez.txt 2> /tmp/error.txt
#find $( readlink -f "$(find $2 -type f -printf "%f\n" > /tmp/rez.txt 2> /tmp/error.txt )" ) -user $1 -type f -printf "%p  %f  %s\n" > $3
#sed -r "s,^+,$(basename $0 -a),"  /tmp/error.txt >&2
#echo $(basename $0 -a)+/tmp/error.txt >&2
#rm /tmp/rez.txt
#rm /tmp/errors.txt 