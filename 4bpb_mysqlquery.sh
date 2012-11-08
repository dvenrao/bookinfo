for i in `cat isbnlist` ; do 
echo $i;
mysql description<<EOFMYSQL
insert into oup(isbn,description) values('$i','`cat descr_db/$i.db`');
EOFMYSQL
done
