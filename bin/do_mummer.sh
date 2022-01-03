#!/bin/bash
ref_file=$1; 
query_file=$2;
index_name=$3;
mummer_commands=$4;
sv_commands=$5;
if [ $mummer_commands -eq 0 ]
then
     nucmer  -g 1000 -c 90 -l 40 -t 20  -p $index_name $ref_file $query_file
     delta-filter -r -q  -l 1000 $index_name.delta >$index_name.delta.filter
     show-coords -TrHcl $index_name.delta.filter >$index_name.delta.filter.coords 
     mummerplot -color  -postscript -R $ref_file -p $index_name.delta.filter $index_name.delta.filter
         if [ $sv_commands -eq 1 ]
         then
             show-snps -ClrTH $index_name.delta.filter >$index_name.delta.filter.snps
             show-diff -q $index_name.delta.filter >$index_name.delta.filter.qdiff
         fi
else
     if [ $sv_commands -eq 1 ]
     then
         nucmer  -g 1000 -c 90 -l 40 -t 20  -p $index_name $ref_file $query_file
         delta-filter -r -q  -l 1000 $index_name.delta >$index_name.delta.filter
         show-snps -ClrTH $index_name.delta.filter >$index_name.delta.filter.snps
         show-diff -q $index_name.delta.filter >$index_name.delta.filter.qdiff
     fi
fi
