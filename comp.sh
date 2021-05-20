#!/bin/bash
PATH=$1
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

if [ -z "$PATH" ]
then
      echo "Run: cbcompress.sh Folder_path File_extension (jpg) File_size_min (500k)"
      exit 0
fi

echo "Ext:${EXT}"
echo "Size:${SIZE}" 
echo "PATH:${PATH}"

/usr/bin/find $PATH -name "*.$EXT" -size +$SIZE -print0 | while read -d $'\0' FILE 
do
    echo "FILE-->$PATH/$FILE"
    FILEQUALTY=`/usr/local/Cellar/imagemagick/7.0.11-13/bin/magick  identify -format '%Q' $FILE`
    FILESIZESRC=`/usr/bin/wc -c < "$FILE"`
    echo "FILE_SIZE_QUALITY-->$FILEQUALTY"
    echo "FILE_SIZE_SRC-->$FILESIZESRC"
    if [ "$FILEQUALTY" -gt "$QUALITYMIN" ]; then
       echo "TO_COMPRESS" 
       RESULT=`/usr/local/Cellar/imagemagick/7.0.11-13/bin/magick mogrify -quality 85 $FILE`
    fi
    FILESIZEDEST=`/usr/bin/wc -c < "$FILE"`
    echo "FILE_SIZE_DEST-->$FILESIZEDEST"
    echo "----------------"
done


printf "\n"
