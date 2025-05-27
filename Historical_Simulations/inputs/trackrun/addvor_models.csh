#!/bin/csh

set MODEL=$1
set ENS=$2
set SEAS=$3
set YEAR=$4
set NX=$5
set NY=$6

set dir=/data2/henri/tracks/CMIP6/hist-1950/all_tracks/${MODEL}/addflds

# Adding the area-average full 850-hPa vorticity
# original units = multiplying by -1.0e+5 

   \rm hhh.in
   sed -e "s/MODEL/${MODEL}/;s/MODEL/${MODEL}/;s/ENS/${ENS}/;s/DJF/${SEAS}/;s/YYYY/${YEAR}/;s/NX/${NX}/;s/NY/${NY}/"  add_vor850_models.in > hhh.in
   bin/track.linux < hhh.in
   mv outdat/ff_trs.linux_addfld ${dir}/ff_trs.vor850neg_2deg_$SEAS$YEAR

exit
