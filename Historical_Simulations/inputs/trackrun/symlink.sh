#!/bin/bash

 y1=1979
 y2=2014

 in=/data1/henri/CMIP6/hist-1950/HadGEM3-GC31-HH
 out=/home/henri/TRACK-1.5.2/indat

  while [ $y1 -le $y2 ] ; do

  echo "Year $y1"
  ln -s $in/ua850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_MAM$y1.nc $out/ua850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_MAM$y1.nc
  ln -s $in/ua850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_JJA$y1.nc $out/ua850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_JJA$y1.nc
  ln -s $in/ua850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_SON$y1.nc $out/ua850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_SON$y1.nc
  ln -s $in/ua850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_DJF$y1.nc $out/ua850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_DJF$y1.nc
  
  ln -s $in/va850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_MAM$y1.nc $out/va850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_MAM$y1.nc
  ln -s $in/va850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_JJA$y1.nc $out/va850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_JJA$y1.nc
  ln -s $in/va850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_SON$y1.nc $out/va850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_SON$y1.nc
  ln -s $in/va850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_DJF$y1.nc $out/va850_6hrPlevPt_HadGEM3-GC31-HH_hist-1950_r1i1p1f1_gn_DJF$y1.nc

 y1=$[$y1+1]
 
 done

 echo "End"

exit
