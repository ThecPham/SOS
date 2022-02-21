#!/bin/bash


for i in $(cat posty.csv.txt | cut -d ";" -f 1,4 | grep 5 | grep -v 55 | tr -t " " "_" | cut -d ";" -f 1 | tr -d '"');
do
    cd result;
    mkdir -p $i;
    cd ..;
done

length_v=0;

cd result;

for j in $(ls);
do
    length_v=$(echo $j | wc -m);

    for k in $(cat ../posty.csv.txt | cut -d ";" -f 1 | tr -d '"');
    do
        length_tmp=$(echo $k | wc -m);
        if test $length_v = $length_tmp
        then
            cd $j;
            echo $k >> result.txt;
            cd ..;
        fi
    done

done