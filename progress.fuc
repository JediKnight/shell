decor='[] [     ]'

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

function showprog()
{
    PERC=$1
    BARCMP=$2
    BARSPC=$3

    esc=''
    line=10
    cols=`tput cols`
    cols=`expr $cols - ${#decor}`

    cmpcnt=`expr \( $PERC \* $cols \) / 100`
    spccnt=`expr \( \( 100 - $PERC \) \* $cols \) / 100`
    barcmp=`echo "$BARCMP" | cut -c1-${cmpcnt} 2>/dev/null`
    barspc=`echo "$BARSPC" | cut -c1-${spccnt} 2>/dev/null`

    [ $PERC -gt 100 ] && exit
    [ $PERC -eq 0 ] && barcmp=$BARSPC

#    printf "${esc}[${line};1H[%s%s] [ %3s%% ]${esc}[$line;1H" "$barcmp" "$barspc" "$PERC"
    printf "${esc}[1;1H %s ${esc}[1;1H" $barcmp
}
