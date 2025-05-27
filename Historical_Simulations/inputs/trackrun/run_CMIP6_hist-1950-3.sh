#!/bin/bash

# MODEL=$1
# ENS=$2
# SEAS=$3
# YEAR=$4
# NX=$5
# NY=$6
# GRID=$7

# ECMWF-IFS-LR (done)
# ECMWF-IFS-HR (done)
# ECMWF-IFS-MR
# FGOALS-f3-L
# FGOALS-f3-H
# EC-Earth3P
# EC-Earth3P-HR
# MPI-ESM1-2-LR
# MPI-ESM1-2-XR
# HadGEM3-GC31-LL
# HadGEM3-GC31-MM
# HadGEM3-GC31-HH
# CNRM-CM6-1
# CNRM-CM6-1-HR
# CMCC-CM2-HR4
# CMCC-CM2-VHR4



  y1=1979
  y2=2014

  while [ $y1 -le $y2 ] ; do

 trackrun_parallel_cmip6hist-1950.csh FGOALS-f3-H r1i1p1f1 MAM $y1 1440 720 gr
 trackrun_parallel_cmip6hist-1950.csh FGOALS-f3-H r1i1p1f1 JJA $y1 1440 720 gr
 trackrun_parallel_cmip6hist-1950.csh FGOALS-f3-H r1i1p1f1 SON $y1 1440 720 gr
 trackrun_parallel_cmip6hist-1950.csh FGOALS-f3-H r1i1p1f1 DJF $y1 1440 720 gr
 
  y1=$[$y1+1]

 done

exit



