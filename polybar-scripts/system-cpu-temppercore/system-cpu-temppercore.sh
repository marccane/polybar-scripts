#!/bin/sh

#sensors | grep CORE | awk '{print substr($3, 2, length($3)-5)}' | tr "\\n" " " | sed 's/ /°C  /g' | sed 's/  $//'

xapussa10=`sensors`
xapussa9=$xapussa10
xapussa9="${xapussa10//.0}"
xapussa="${xapussa9//+}"

cpu=$(echo "$xapussa" | grep CPUTIN | tr -s " " | cut -d' ' -f2)
#sys=$(echo "$xapussa" | grep SYSTIN | tr -s " " | cut -d' ' -f2)
aux=$(echo "$xapussa" | grep AUXTIN0 | tr -s " " | cut -d' ' -f2)
#aux2=$(echo "$xapussa" | grep AUXTIN2 | tr -s " " | cut -d' ' -f2)
sbus=$(echo "$xapussa" | grep SMBUSMASTER | tr -s " " | cut -d' ' -f3)
gpu=$(echo "$xapussa" | grep edge: | tr -s " " | cut -d' ' -f2)

echo "CPU ${cpu}C GPU ${gpu}C"
#AUX ${aux}C SBUS ${sbus}C