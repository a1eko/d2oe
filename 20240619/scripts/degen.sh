#!/bin/bash -e

T=${T:=degen}
P=${P:=degen}
N=${N:=1}

ind2=0
for file in $*; do
        name=$(basename $file .swc)
        echo -n "degenerating $name ($N) "
        N=$N chop.sh $file
        for i in $(seq 0 $N); do
                ind1=$(printf '%02d' $i)
                mkdir -p $P$i/$T/$ind2
                mv $name-$ind1.swc $P$i/$T/$ind2
        done
        ind2=$((ind2+1))
done
