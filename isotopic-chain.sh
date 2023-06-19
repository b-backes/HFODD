#! /usr/bin/bash

# Script for creating inputs for the HFODD code
# for an isotopic chain. Requires you to specify
# the range in the number of neutrons, the chain name
# and the number of protons. These can be changed
# manually in lines 11, 13 and 14. Also requires the files
# sn100-000-306-000-HFT-N16-siq-UDF1.dat and .job
# n.bat is an aux script which changes the names in the files section.

for NEUTRONS in $(seq 62 2 104)
do
    CHAIN=gd
    ZNUM=64
    ANUM=$(($ZNUM+$NEUTRONS))
    NNUM=$NEUTRONS

    ./n.bat '' sn100 $CHAIN$ANUM -000-306-000-HFT-N16-siq-UDF1

    FILE=$CHAIN$ANUM-000-306-000-HFT-N16-siq-UDF1.dat

    REPLACE1="           $NNUM  $ZNUM"
    REPLACE2="           $NNUM  $ZNUM   1.23"

    sed -i -e '6d' -e "7i \ $REPLACE1" $FILE
    sed -i -e '94d' -e "95i \ $REPLACE2" $FILE
    
done