#!/bin/sh

#usage: checkLog <csv>

checkLog ()
{
shopt -s nullglob
cl_searchString=`echo $1 | sed 's/,/\\\|/g'`
for cl_filename in /var/log/ltm* /var/log/ns.log* /var/log/messages* /var/log/3dns*
do
echo "$cl_filename :"
nice zgrep --basic-regexp $cl_searchString $cl_filename
echo
done
shopt -u nullglob
unset cl_filename
unset cl_searchString
}
