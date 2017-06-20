#!/bin/bash
#use this script to generate the input image file
SOLN=$1
LOC="./params/$SOLN/"

IMG_ROW_SIZE=`cat $LOC/params.h | grep IMG_ROW_SIZE | awk '{ print $3 }'`
IMG_COL_SIZE=`cat $LOC/params.h | grep IMG_COL_SIZE | awk '{ print $3 }'`

IMAGE_FILE="$LOC/input.img"
>$IMAGE_FILE
#IMG_ROW_SIZE=3
#IMG_COL_SIZE=3
col=0
row=0

while [[ $row -lt $IMG_COL_SIZE ]]
do
	while [[ $col -lt $IMG_ROW_SIZE ]]
	do
		echo -n $(($RANDOM*$RANDOM)) >> $IMAGE_FILE	
		echo -n " " >> $IMAGE_FILE
		col=$(($col+1))
	done
	echo "" >> $IMAGE_FILE
	row=$(($row+1))
	col=0
done 

