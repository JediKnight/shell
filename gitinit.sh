#!/bin/bash

function usage()
{
    printf "%s [project name]\n" $0
    exit
}

uname='たなかともあき'
email='git@bamboo-copter.com'
id='jedi-master'
pw='prince4712'

prj=$1
url="http://github.com/${account}/${prj}.git"

[ -z $prj ] && usage

git config --global user.name "$uname"
git config --global user.email "$email"
mkdir $prj
cd $prj
touch README
git commit -m 'first commit'
git remote add origin $url
git push -u origin master
