#!/bin/bash
FULLPATH=$1
EXT=$2
SIZE=$3
QUALITYMIN=85


if [ -z "$EXT" ]
then
      echo "Run: cbcompress.sh Folder_path File_extension (jpg) File_size_min (500k)"
      exit 0
fi

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

echo "Ext:${EXT}"
echo "Size:${SIZE}" 
echo "FULLPATH:${FULLPATH}"

find $FULLPATH -name "*.$EXT" -size +$SIZE -print0 | while read -d $'\0' FILE 
do
    echo "FILE-->$FILE"
    FILEQUALTY=`magick  identify -format '%Q' $FILE`
    FILESIZESRC=`wc -c < "$FILE"`
    echo "FILE_SIZE_QUALITY-->$FILEQUALTY"
    echo "FILE_SIZE_SRC-->$FILESIZESRC"
    if [ "$FILEQUALTY" -gt "$QUALITYMIN" ]; then
       echo "TO_COMPRESS" 
       RESULT=`magick mogrify -quality 85 $FILE`
    fi
    FILESIZEDEST=`wc -c < "$FILE"`
    echo "FILE_SIZE_DEST-->$FILESIZEDEST"
    echo "----------------"
done


printf "\n"
