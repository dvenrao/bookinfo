for i in `cat 6to7lakh.txt` ; do
echo $i
id=$i
isbn13=`perl -lne 'BEGIN{undef $/} while (/strong>ISBN :<\/strong> (.*?),/sg){print $1}' "getProductDetail.action?id=$i"`
isbn10=`perl -lne 'BEGIN{undef $/} while (/strong> '$isbn13',(.*?)<\/h2>/sg){print $1}' "getProductDetail.action?id=$i"`
specialprice=`perl -lne 'BEGIN{undef $/} while (/style="font-size:24px; font-weight:bold; color:#ff5501; font-family:Arial;"> (.*?) <\/div>/sg){print $1}' "getProductDetail.action?id=$i"`
price=`perl -lne 'BEGIN{undef $/} while (/style="font-size:13px; text-decoration:line-through;">(.*?) <\/span>/sg){print $1}' "getProductDetail.action?id=$i"`
delivery=`perl -lne 'BEGIN{undef $/} while (/<span style="color:#000000;">(.*?) <\/span>/sg){print $1}' "getProductDetail.action?id=$i"`
stock=`perl -lne 'BEGIN{undef $/} while (/text-transform:uppercase;"><font>(.*?)<\/font><\/font>/sg){print $1}' "getProductDetail.action?id=$i"`
binding=`perl -lne 'BEGIN{undef $/} while (/<a href="getProductsByAuthor.*?\((.*?)\| ISBN : /sg){print $1}' "getProductDetail.action?id=$i"`
title=`perl -lne 'BEGIN{undef $/} while (/Title : <\/strong>(.*?)<\/div>/sg){print $1}' "getProductDetail.action?id=$i"`
author=`perl -lne 'BEGIN{undef $/} while (/Author :<\/strong>.*?text-decoration: none">(.*?)<\/a>.*?<\/div>/sg){print $1}' "getProductDetail.action?id=$i"`
publisher=`perl -lne 'BEGIN{undef $/} while (/Publisher :<\/strong>.*?\)">(.*?)<\/a>.*?<\/div>/sg){print $1}' "getProductDetail.action?id=$i"`
pages=`perl -lne 'BEGIN{undef $/} while (/Pages :<\/strong>(.*?)<\/div>/sg){print $1}' "getProductDetail.action?id=$i"`
published=`perl -lne 'BEGIN{undef $/} while (/Published :<\/strong>(.*?)<\/div>/sg){print $1}' "getProductDetail.action?id=$i"`
subject=`perl -lne 'BEGIN{undef $/} while (/Subject :<\/strong>.*?none">(.*?)<\/a>.*?<\/div>/sg){print $1}' "getProductDetail.action?id=$i"`
category=`perl -lne 'BEGIN{undef $/} while (/Home<\/a>>.*?">(.*?)<\/a>/sg){print $1}' "getProductDetail.action?id=$i"`
description=` perl -lne 'BEGIN{undef $/} while (/<div class="isbn1_font description_div">(.*?)<\/div>\n    <div class="book_details_div">/sg){print $1}' "getProductDetail.action?id=$i"`
title=`echo $title|sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/"/\&quot;/g' -e 's/:none/:block/g' -e s/\'//g`
description=`echo $description|sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/"/\&quot;/g' -e 's/:none/:block/g' -e s/\'//g`
published=`echo $published|sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/"/\&quot;/g' -e 's/:none/:block/g' -e s/\'//g`
stock=`echo $stock|sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/"/\&quot;/g' -e 's/:none/:block/g' -e s/\'//g`
echo $isbn13,$isbn10,$price,$specialprice,$delivery,$stock,$binding,
echo $title,$author,$publisher,$pages,$published,$subject,$category
#echo $description
echo "--------------------------------------------------------------------------------------------------------"
mysql pramod<<EOFMYSQL
insert into 7to8lakh(id,isbn13,isbn10,price,specialprice,delivery,stock,binding,title,author,publisher,pages,published,subject,category,description) values($id,'$isbn13','$isbn10','$price','$specialprice','$delivery','$stock','$binding','$title','$author','$publisher','$pages','$published','$subject','$category','$description');
EOFMYSQL
done
