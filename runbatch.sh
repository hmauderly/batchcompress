#!/bin/bash
ROOTPATH=$1
OUTPUTPATH=$1
MAINPATH=${ROOTPATH}/0
RESULTFILE=${OUTPUTPATH}_0

for i in {0..9}
do
    if [ $i le 8 ]
    then
    ./comp.sh $MAINPATH$i 1k >> $RESULTFILE$i &
    fi
    if [ $i = 9 ]
    then
    ./comp.sh $MAINPATH$i 1k >> $RESULTFILE$i 
    fi
done


MAINPATH=${ROOTPATH}/
RESULTFILE=${OUTPUTPATH}_


i=10
while [ $i -le 96 ]
do
    echo "$MAINPATH$i"
    ./comp.sh $MAINPATH$i 1k >> $RESULTFILE$i &
    let i++
    echo "$MAINPATH$i"
    ./comp.sh $MAINPATH$i 1k >> $RESULTFILE$i &
    let i++
    echo "$MAINPATH$i"
    ./comp.sh $MAINPATH$i 1k >> $RESULTFILE$i &
    let i++
    echo "$MAINPATH$i"
    ./comp.sh $MAINPATH$i 1k >> $RESULTFILE$i &
    let i++
   if [ $i = 100 ]
   then
        exit 0
    fi
    echo "$MAINPATH$i"
    ./comp.sh $MAINPATH$i 1k >> $RESULTFILE$i 
    let i++

done


