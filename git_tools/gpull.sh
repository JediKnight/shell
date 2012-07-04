#!/bin/sh

repodir='/home/tomoaki/Developer'
prj='1timeTransfer lib pwmgr social shellscript'

for p in $prj
do
    [ ! -d ${repodir}/${p} ] && git clone http://github.com/jedi-master/${p}.git ${repodir}/${p}
    cd ${repodir}/${p}
    git pull origin master || echo "$p pull error [`date +%Y/%m/%d %H:%M:%S`]" >> ~/gpull.log
done
