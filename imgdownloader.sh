#!/bin/bash

wget_cmd='wget -r'
domain=`echo $1 | sed -e 's|.*//||' -e 's|/.*||'`
exit

depth="-l "
type="-A "
imgsrv="-H -D $domain"
url=""

$wget_cmd $depth $type $imgsrv $url
