#!/bin/bash
FULLPATH=$1
SIZE=$2
QUALITYMIN=85
COUNTER=0

if [ -z "$SIZE" ]
then
      echo "Run: cbcompress.sh Folder_path File_extension (jpg) File_size_min (500k)"
      exit 0
fi

if [ -z "$FULLPATH" ]
then
      echo "Run: cbcompress.sh Folder_path File_extension (jpg) File_size_min (500k)"
      exit 0
fi

echo "START"
date
echo "Size:${SIZE}" 
echo "FULLPATH:${FULLPATH}"

#find $FULLPATH -name "*.jpg" -o -name "*.jpeg" -size +$SIZE -print0 | while read -d $'\0' FILE 
find $FULLPATH -name "*.jpg" -o -name "*.jpeg" -size +$SIZE | while read FILE 
do
    let COUNTER++ 
    echo "FILE-->$FILE"
    echo $COUNTER
    echo $FILE 
    FILEQUALTY=`identify -format '%Q' $FILE`
    FILESIZESRC=`wc -c < "$FILE"`
    echo "FILE_SIZE_QUALITY-->$FILEQUALTY"
    echo "FILE_SIZE_SRC-->$FILESIZESRC"
    if [ "$FILEQUALTY" -gt "$QUALITYMIN" ]; then
       echo "TO_COMPRESS" 
       RESULT=`mogrify -quality 85 $FILE`
    fi
    FILESIZEDEST=`wc -c < "$FILE"`
    echo "FILE_SIZE_DEST-->$FILESIZEDEST"
    echo "----------------"
done

echo "END"
date

