#!/bin/bash
if [ $# -lt 1 ]
then
    echo 'usage ./prog <images folder>'
    exit -1
fi
IMGS_FOLDER=$1
for i in `ls $IMGS_FOLDER`
do
	./run.sh ./matlab_batcher.sh runMatchingComputeOxbuild \'$IMGS_FOLDER\/$i\'
done
