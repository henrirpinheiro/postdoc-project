#!/bin/bash

  y1=1979
  y2=2021

  while [ $y1 -le $y2 ] ; do

 trackrun_ERA5.csh MAM $y1
 trackrun_ERA5.csh JJA $y1
 trackrun_ERA5.csh SON $y1
 trackrun_ERA5.csh DJF $y1

  y1=$[$y1+1]

 done

exit

