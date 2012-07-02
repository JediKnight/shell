#!/bin/bash

function usage()
{
    printf "%s\n" $0

    printf ":: -%-2s%-10s%s\n" 'd' 'maxdepth' '何階層まで探索'
    printf ":: -%-2s%-10s%s\n" 'p' 'path'     '探索ターゲットパス'

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

#find $path -maxdepth $depth -name ""

NONE=0

flg=$NONE

while getopts "d:p:gjpamw" opt
do
    case $opt in
	'd') depth=$OPTARG ;;
	'p') path=$OPTARG ;;
	'g') type='gif' ;;
	'j') type='jpg' ;;
	'p') type='png' ;;
	'a') type='avi ';;
	'm') type='mkv' ;;
	'w') type='wmv' ;;
    esac
done
    
[ -z $depth ] && usage
[ -z $path ] && usage
[ -z $type ] && usage
