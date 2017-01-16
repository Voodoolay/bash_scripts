#!/bin/bash
function waitforfreeslot(){
   while [ `jobs | wc -l` -ge 5 ]
   do
      sleep 1
   done
}
  
set -o pipefail
for i in *; do	
	waitforfreeslot 
	echo "Processing: $i"
	mv "${i}" ./1/$(md5sum "${i}" | awk '{print $1}').${i##*.} &
done
