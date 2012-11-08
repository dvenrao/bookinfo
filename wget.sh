#!/bin/bash
for i in `cat list` ; do
wget 'http://www.gkpublications.com/index.php?route=product/product&product_id='$i
done
