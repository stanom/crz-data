#!/bin/bash


den="2016-12-20"
until [[ $den > "2016-12-30" ]]; do
    curl -sfSL http://www.crz.gov.sk/export/${den}.zip -o ${den}.zip
    7z x -y ${den}.zip  >/dev/null
    xml2csv --input ${den}.xml --output ${den}.csv --tag zmluva --delimiter '#' >/dev/null
echo "$den - OK"
#    den_cislo=`date -I -d $den |sed 's/-//g'`
#    let "vysledok = $den_cislo % 2"
#    if [[ $vysledok -eq 0 ]]; 
#    then echo -e "\tpar"; 
#    else echo -e "\tnepar"; 
#    fi
    sleep 1
    den=$(date -I -d "$den + 1 day")
done
