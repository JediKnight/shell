#!/bin/sh

repodir='/home/tomoaki/Developer'
prj='1timeTransfer lib pwmgr social shellscript'

for p in $prj
do
    cd ${repodir}/${p}
    git pull origin master || echo "$p pull error" >> ~/gpull.log
done
