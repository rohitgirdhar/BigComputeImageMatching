#!/bin/bash
IMGS_FOLDER=$1
if [ $# -lt 1 ]
then
    echo 'Usage ./prog <images folder>'
    exit -1
fi
mkdir -p std/out std/err
for i in `ls $IMGS_FOLDER`
do
    qsub -cwd -o std/out/$i.out -e std/err/$i.err ./run.sh ./matlab_batcher.sh runMatchingCompute \'$IMGS_FOLDER\/$i\'
done
