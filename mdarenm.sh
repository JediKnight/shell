#!/bin/bash

export LANG=C

function usage()
{
    printf "%s\n" $0

    printf ":: -%-2s%-10s%s\n" 'd' 'maxdepth' '何階層まで探索'
    printf ":: -%-2s%-10s%s\n" 'p' 'path'     '探索ターゲットパス'
    printf ":: -%-2s%-10s%s\n" 'i' ''         'インクリメント'
    printf ":: -%-2s%-10s%s\n" 's' ''         'sha1'
    
    printf "\nimage\n"
    printf ":: -%-2s%-10s%s\n" 'g' '' 'gif'
    printf ":: -%-2s%-10s%s\n" 'j' '' 'jpg'
    printf ":: -%-2s%-10s%s\n" 'p' '' 'png'

    printf "\nmovie\n"
    printf ":: -%-2s%-10s%s\n" 'a' '' 'avi'
    printf ":: -%-2s%-10s%s\n" 'm' '' 'mkv'
    printf ":: -%-2s%-10s%s\n" 'w' '' 'wmv'

    exit
}

function sha1gen()
{
    shasum "$1" |cut -d' ' -f1
}

function incrgen()
{
    expr $1 + 1
}

NONE=0
INCR=1
SHA1=2

while getopts "d:p:gjpamwsh" opt
do
    case $opt in
	'd') depth=$OPTARG ;;
	'h') if [ -z $flg ]; then flg=$INCR; else usage; fi ;;
	's') if [ -z $flg ]; then flg=$SHA1; else usage; fi ;;
	'p') path=$OPTARG ;;
	'g') ext='gif' ;;
	'j') ext='jpg' ;;
	'p') ext='png' ;;
	'a') ext='avi ';;
	'm') ext='mkv' ;;
	'w') ext='wmv' ;;
    esac
done

. ./progress.fuc
    
[ -z $depth ] && usage
[ -z $path ] && usage
[ -z $ext ] && usage
[ -z $flg ] && usage

if [ $flg -eq $SHA1 ]; then fnc='sha1gen'; else fnc='incrgen'; fi

filecnt=`find $path -maxdepth $depth -type f -iname "*.${ext}" |wc -l`

proginit

i=0
find $path -maxdepth $depth -type f -iname "*.${ext}" |while read f
do

    new="${path}/`$fnc \"$f\"`.${f##*.}"
    [ "$f" != "$new" ] && mv "$f" $new

    i=`expr $i + 1`
    p=`getperc $i $filecnt`
    showprog $p
done

progend
