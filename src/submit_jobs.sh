#!/bin/bash
IMGS_FOLDER='../../07_3DAR/work/attempt2/Images_bob/'
mkdir -p std/out std/err
for i in `ls $IMGS_FOLDER`
do
    qsub -cwd -o std/out/$i.out -e std/err/$i.err ./run.sh ./matlab_batcher.sh runMatchingCompute \'$IMGS_FOLDER\/$i\'
done
