for i in `cat list` ; do
echo $i
name=`perl -lne 'BEGIN{undef $/} while (/<h1>(.*?)<\/h1>/sg){print $1}' "index.php?route=product%2Fproduct&product_id=$i"`
price=`perl -lne 'BEGIN{undef $/} while (/Price:<\/b><\/td>.*?Rs (.*?)<\/td>/sg){print $1}' "index.php?route=product%2Fproduct&product_id=$i"`
stock=`perl -lne 'BEGIN{undef $/} while (/Availability:<\/b><\/td>.*?<td>(.*?)<\/td>/sg){print $1}' "index.php?route=product%2Fproduct&product_id=$i"`
isbn=`perl -lne 'BEGIN{undef $/} while (/ISBN<\/b><\/td>.*?<td>(.*?)<\/td>/sg){print $1}' "index.php?route=product%2Fproduct&product_id=$i"`
image=`perl -lne 'BEGIN{undef $/} while (/top;"><a href="(.*?)" title=/sg){print $1}' "index.php?route=product%2Fproduct&product_id=$i"`
desc=`perl -lne 'BEGIN{undef $/} while (/div id="tab_description" class="tab_page">(.*?)<\/div>/sg){print $1}' "index.php?route=product%2Fproduct&product_id=$i"`


echo $price
echo $stock
echo $isbn
echo $image
echo $desc
echo "--------------------------------------------------------------------------------------------------------"
mysql description<<EOFMYSQL
insert into gk(name,price,stock,isbn,image,description) values('$name','$price','$stock','$isbn','$image','$desc');
EOFMYSQL
done
#echo 'insert into gk(price,stock,isbn,image,desc) values("$price","$stock","$isbn","$image","$desc")'

