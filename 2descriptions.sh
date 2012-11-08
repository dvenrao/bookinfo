for i in `cat isbnlist` ; do 
echo $i
perl -lne 'BEGIN{undef $/} while (/<TR  valign="top" style="padding-left:35px;">(.*?)<form name="ratefrm"/sg){print $1}' htmls/$i.html > descriptions/$i.dscr
done 

