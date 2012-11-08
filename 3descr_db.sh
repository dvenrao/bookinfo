for i in `cat isbnlist` ; do 
echo $i; 
sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/"/\&quot;/g' -e 's/:none/:block/g' -e s/\'//g descriptions/$i.dscr > descr_db/$i.db
done 
