#!/bin/csh

set MODEL=$1
set ENS=$2
set SEAS=$3
set YEAR=$4
set NX=$5
set NY=$6
set GRID=$7
set LEV=$8

set DATA=/data2/henri/tracks/CMIP6/hist-1950/${MODEL}
set VORDATA=/data2/henri/CMIP6/hist-1950/VORDATA/${MODEL}

set FILE=vor850_${MODEL}_hist-1950_${ENS}_${SEAS}${YEAR}.dat
set FFF=vor850_${MODEL}_hist-1950_${ENS}_${SEAS}${YEAR}_filt.dat

set OUTDIR=${MODEL}_hist-1950_${ENS}_VOR850_${SEAS}${YEAR}

#   bin/track.linux -i vorticity_file -f chol < cholesky_GISS_E2_R.in

set EXT = ${MODEL}_hist-1950_${ENS}_${SEAS}${YEAR}
 \rm calcvor_${EXT}
  sed -e "s/MODEL/${MODEL}/;s/ENS/${ENS}/;s/DJF/${SEAS}/;s/YYYY/${YEAR}/;s/NX/${NX}/;s/NY/${NY}/;s/GRID/${GRID}/;s/LEVEL/${LEV}/" calcvor_${MODEL}.in > calcvor_${EXT}
  bin/track.linux < calcvor_${EXT}
\rm calcvor_${EXT}

\rm specfilt_${EXT}
  sed -e "s/MODEL/${MODEL}/;s/NX/${NX}/;s/NY/${NY}/" specfilt_${MODEL}.in > specfilt_${EXT}
  bin/track.linux -i $FILE -f $EXT < specfilt_${EXT}
  mv outdat/specfil.${EXT}_band000 indat/$FFF
\rm specfilt_${EXT}

  master -c=${OUTDIR} -d=now -e=track.linux -i=${FFF} -f=${EXT} -n=1,32,12 -o=${DATA} -j=RUN_AT.in -r=RUN_AT_ -s=RUNDATIN.cmip_VOR

  \rm indat/$FFF
  mv indat/$FILE ${VORDATA}

  gunzip ${DATA}/${OUTDIR}/ff_trs_neg.gz
  gunzip ${DATA}/${OUTDIR}/tr_trs_neg.gz
  gunzip ${DATA}/${OUTDIR}/ff_trs_pos.gz
  gunzip ${DATA}/${OUTDIR}/tr_trs_pos.gz

exit
