#!/bin/csh

set SEAS=$1
set YEAR=$2

set DATA=/data2/henri/tracks/ERA5

   set FILE=ERA5_VOR850_${SEAS}${YEAR}.dat
   set FFF=ERA5_VOR850_${SEAS}${YEAR}_filt.dat

#   bin/track.linux -i vorticity_file -f chol < cholesky_ERA5.in

   \rm rrr
   sed -e "s/DJF/${SEAS}/;s/YYYY/${YEAR}/" calcvor_ERA5.in > rrr
   bin/track.linux < rrr

   bin/track.linux -i $FILE -f filt < specfilt_ERA5.in
   mv outdat/specfil.filt_band000 indat/$FFF

   master -c=VOR850_${SEAS}${YEAR}_T42 -d=now -e=track.linux -i=${FFF} -f=${SEAS}${YEAR} -n=1,32,12 -o=${DATA} -j=RUN_AT.in -r=RUN_AT_ -s=RUNDATIN.cmip_VOR

   \rm indat/$FFF

   gunzip ${DATA}/*/ff_trs_neg.gz
   gunzip ${DATA}/*/tr_trs_neg.gz
   gunzip ${DATA}/*/ff_trs_pos.gz
   gunzip ${DATA}/*/tr_trs_pos.gz

endif
