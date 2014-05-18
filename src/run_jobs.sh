#!/bin/bash
IMGS_FOLDER='../../07_3DAR/work/attempt2/Images_bob/'
for i in `ls $IMGS_FOLDER`
do
	./run.sh ./matlab_batcher.sh runMatchingCompute \'$IMGS_FOLDER\/$i\'
done
