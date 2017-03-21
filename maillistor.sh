#!/bin/sh

data=$1
termin=$2
year=$3

echo $data
echo $termin
echo $year

OldIFS=$IFS
IFS=$'\n'

for EachLine in `cat $data`; do

	program=$EachLine
	echo $program

	curl -b cookies.txt https://www3.student.liu.se/portal/listsearch/showlistmembers.pl?list=6c"${program}"-"${termin}"-"${year}" | grep -o ">[a-z]\{5\}[0-9]\{3\}@student.liu.se" | grep -o "[a-z]\{5\}[0-9]\{3\}@student.liu.se" >> output.txt

done
