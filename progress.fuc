decor='[] [      ]'

function getbar()
{
    barstr=$1
    maxcols=`tput cols`
    barleng=`expr $maxcols - ${#decor}`
    for i in `seq 1 $barleng`
    do
	cmpbar=${cmpbar}${barstr}
    done

    echo $cmpbar
}

function getperc()
{
    x=$1
    y=$2

    expr \( $x \* 100 \) / $y
}

function proginit()
{
    tput civis
}

function progend()
{
    tput cnorm
    tput cud1
}

function showprog()
{
    perc=$1
    strcmp=`getbar '#'`
    strspc=`getbar '_'`

    cols=`tput cols`
    cols=`expr $cols - ${#decor}`
    cmpcnt=`expr \( $perc \* $cols \) / 100`
    spccnt=`expr $cols - $cmpcnt`

    barcmp=`echo "$strcmp" | cut -c1-${cmpcnt} 2>/dev/null`
    barspc=`echo "$strspc" | cut -c1-${spccnt} 2>/dev/null`

    [ $perc -gt 100 ] && exit
    [ $perc -eq 0 ] && barcmp=$strspc

    tput dl1
    tput sc
    printf "[%s%s] [ %3s%% ]" $barcmp $barspc $perc
    tput rc
}
