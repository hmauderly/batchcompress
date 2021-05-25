#!/bin/bash
ROOTPATH=$1
OUTPUTPATH=$2
MAINPATH=${ROOTPATH}/0
RESULTFILE=${OUTPUTPATH}_0

for i in {0..9}
do


    CURPATH=${MAINPATH}${i}
    CURRESULTFILE=${RESULTFILE}${i}

    if [ $i -le 8 ]
    then
      echo $CURPATH
      echo $CURRESULTFILE
      ./comp.sh $CURPATH 1k >> $CURRESULTFILE &
    fi
    if [ $i = 9 ]
    then
      echo $CURPATH
      echo $CURRESULTFILE
      ./comp.sh $CURPATH 1k >> $CURRESULTFILE
    fi
done


MAINPATH=${ROOTPATH}/
RESULTFILE=${OUTPUTPATH}_


i=10
while [ $i -le 96 ]
do
    CURPATH=${MAINPATH}${i}
    CURRESULTFILE=${RESULTFILE}${i}
    echo $CURPATH
    echo $CURRESULTFILE
    ./comp.sh $CURPATH 1k >> $CURRESULTFILE &

    let i++
    CURPATH=${MAINPATH}${i}
    CURRESULTFILE=${RESULTFILE}${i}
    echo $CURPATH
    echo $CURRESULTFILE
    ./comp.sh $CURPATH 1k >> $CURRESULTFILE &

    let i++
    CURPATH=${MAINPATH}${i}
    CURRESULTFILE=${RESULTFILE}${i}
    echo $CURPATH
    echo $CURRESULTFILE
    ./comp.sh $CURPATH 1k >> $CURRESULTFILE &

    let i++
    CURPATH=${MAINPATH}${i}
    CURRESULTFILE=${RESULTFILE}${i}
    echo $CURPATH
    echo $CURRESULTFILE
    ./comp.sh $CURPATH 1k >> $CURRESULTFILE &

    let i++
   if [ $i = 100 ]
   then
        exit 0
    fi
    CURPATH=${MAINPATH}${i}
    CURRESULTFILE=${RESULTFILE}${i}
    echo $CURPATH
    echo $CURRESULTFILE
    ./comp.sh $CURPATH 1k >> $CURRESULTFILE 
    let i++

done
