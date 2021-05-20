#!/bin/bash
MAINPATH=/netapp/04/P0/00/
RESULTFILE=OUTPUT_04_P0_00_

for i in {2..9}
do
    echo $i
    RESULT=`./comp.sh $MAINPATH0$i 1k >> $RESULTFILE0$i` 
done

