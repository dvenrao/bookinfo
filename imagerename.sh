#! /bin/sh

while IFS=, read key value
do
    echo "$key"
    echo "$value"
wget $value
mv *.jpg images/$key.jpg
done < try
