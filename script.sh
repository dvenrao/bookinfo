for i in `cat list1` ; do
#echo $i
isbn13=`perl -lne 'BEGIN{undef $/} while (/ISBN-13: <\/span>.*?>(.*?)<\/span>/sg){print $1}' "$i"`
publisher=`perl -lne 'BEGIN{undef $/} while (/Publisher: <\/span>.*?>(.*?)<\/span>/sg){print $1}' "$i"`
language=`perl -lne 'BEGIN{undef $/} while (/Language: <\/span>.*?>(.*?)<\/span>/sg){print $1}' "$i"`
isbn10=`perl -lne 'BEGIN{undef $/} while (/ISBN-10: <\/span>.*?>(.*?)<\/span>/sg){print $1}' "$i"`
pub_date=`perl -lne 'BEGIN{undef $/} while (/Publisher Date: <\/span>.*?>(.*?)<\/span>/sg){print $1}' "$i"`
binding=`perl -lne 'BEGIN{undef $/} while (/Binding: <\/span>.*?>(.*?)<\/span>/sg){print $1}' "$i"`
extent=`perl -lne 'BEGIN{undef $/} while (/No of Pages: <\/span>.*?>(.*?)<\/span>/sg){print $1}' "$i"`
weight=`perl -lne 'BEGIN{undef $/} while (/Weight: <\/span>.*?>(.*?)<\/span>/sg){print $1}' "$i"`
name=`perl -lne 'BEGIN{undef $/} while (/product-bottom-detail.*?<strong>(.*?)<\/strong>/sg){print $1}' "$i"`
author=`perl -lne 'BEGIN{undef $/} while (/product-bottom-detail.*?<\/strong>(.*?)<\/label>/sg){print $1}' "$i"`
image=`perl -lne 'BEGIN{undef $/} while (/product-image.*?src="(.*?)"/sg){print $1}' "$i"`
stock=`perl -lne 'BEGIN{undef $/} while (/ctl00_phBody_ProductDetail_lblAvailable.*?>(.*?)<\/label>/sg){print $1}' "$i"`
mrp=`perl -lne 'BEGIN{undef $/} while (/List Price:.*?<\/span>(.*?)<\/span>/sg){print $1}' "$i"`
special_price=`perl -lne 'BEGIN{undef $/} while (/Our Price:.*?<\/span>(.*?)<\/span>/sg){print $1}' "$i"`
description=`perl -lne 'BEGIN{undef $/} while (/product-desc">(.*?)<\/div>/sg){print $1}' "$i"`

####### remove special characters #
publisher=`echo $publisher|sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/"/\&quot;/g' -e 's/:none/:block/g' -e s/\'//g`
name=`echo $name|sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/"/\&quot;/g' -e 's/:none/:block/g' -e s/\'//g`
author=`echo $author|sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/"/\&quot;/g' -e 's/:none/:block/g' -e s/\'//g`
description=`echo $description|sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/"/\&quot;/g' -e 's/:none/:block/g' -e s/\'//g`

echo $isbn13,$publisher,$language,$isbn10,$pub_date,$binding,$extent,$weight
echo $name,$author,$image,$stock,$mrp,$special_price
#echo $description
echo "--------------------------------------------------------------------------------------------------------"
mysql description<<EOFMYSQL
insert into uread(isbn13,publisher,language,isbn10,pub_date,binding,extent,weight,name,author,image,stock,mrp,special_price,description) values('$isbn13','$publisher','$language','$isbn10','$pub_date','$binding','$extent','$weight','$name','$author','$image','$stock','$mrp','$special_price','$description');
EOFMYSQL
done