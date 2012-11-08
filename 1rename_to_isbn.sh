#!/bin/bash
for i in `cat isbnlist` ; do
n=`grep -r -l "$i" oup`
echo $n
cp $n html/$i.html
done
