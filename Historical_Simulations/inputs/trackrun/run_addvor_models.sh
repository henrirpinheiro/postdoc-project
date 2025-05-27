#!/bin/bash

 y1=1979
 y2=2014
 
 while [ $y1 -le $y2 ] ; do
 
# addvor_models.csh CMCC-CM2-VHR4 r1i1p1f1 MAM $y1 1152 766
# addvor_models.csh CMCC-CM2-VHR4 r1i1p1f1 JJA $y1 1152 766
# addvor_models.csh CMCC-CM2-VHR4 r1i1p1f1 SON $y1 1152 766
# addvor_models.csh CMCC-CM2-VHR4 r1i1p1f1 DJF $y1 1152 766

# addvor_models.csh CMCC-CM2-HR4 r1i1p1f1 MAM $y1 288 190
# addvor_models.csh CMCC-CM2-HR4 r1i1p1f1 JJA $y1 288 190
# addvor_models.csh CMCC-CM2-HR4 r1i1p1f1 SON $y1 288 190
# addvor_models.csh CMCC-CM2-HR4 r1i1p1f1 DJF $y1 288 190
 
 addvor_models2.csh ECMWF-IFS-HR r1i1p1f1 MAM $y1 720 359
 addvor_models2.csh ECMWF-IFS-HR r1i1p1f1 JJA $y1 720 359
 addvor_models2.csh ECMWF-IFS-HR r1i1p1f1 SON $y1 720 359
 addvor_models2.csh ECMWF-IFS-HR r1i1p1f1 DJF $y1 720 359

# addvor_models2.csh ECMWF-IFS-MR r2i1p1f1 MAM $y1 360 179
# addvor_models2.csh ECMWF-IFS-MR r2i1p1f1 JJA $y1 360 179
# addvor_models2.csh ECMWF-IFS-MR r2i1p1f1 SON $y1 360 179
# addvor_models2.csh ECMWF-IFS-MR r2i1p1f1 DJF $y1 360 179
 
 addvor_models2.csh ECMWF-IFS-LR r1i1p1f1 MAM $y1 360 179
 addvor_models2.csh ECMWF-IFS-LR r1i1p1f1 JJA $y1 360 179
 addvor_models2.csh ECMWF-IFS-LR r1i1p1f1 SON $y1 360 179
 addvor_models2.csh ECMWF-IFS-LR r1i1p1f1 DJF $y1 360 179
 
# addvor_models.csh FGOALS-f3-H r1i1p1f1 MAM $y1 1440 720
# addvor_models.csh FGOALS-f3-H r1i1p1f1 JJA $y1 1440 720
# addvor_models.csh FGOALS-f3-H r1i1p1f1 SON $y1 1440 720
# addvor_models.csh FGOALS-f3-H r1i1p1f1 DJF $y1 1440 720
 
# addvor_models.csh FGOALS-f3-L r1i1p1f1 MAM $y1 288 180
# addvor_models.csh FGOALS-f3-L r1i1p1f1 JJA $y1 288 180
# addvor_models.csh FGOALS-f3-L r1i1p1f1 SON $y1 288 180
# addvor_models.csh FGOALS-f3-L r1i1p1f1 DJF $y1 288 180

# addvor_models.csh CNRM-CM6-1-HR r1i1p1f2 MAM $y1 720 360
# addvor_models.csh CNRM-CM6-1-HR r1i1p1f2 JJA $y1 720 360
# addvor_models.csh CNRM-CM6-1-HR r1i1p1f2 SON $y1 720 360
# addvor_models.csh CNRM-CM6-1-HR r1i1p1f2 DJF $y1 720 360

# addvor_models.csh CNRM-CM6-1 r1i1p1f2 MAM $y1 256 128
# addvor_models.csh CNRM-CM6-1 r1i1p1f2 JJA $y1 256 128
# addvor_models.csh CNRM-CM6-1 r1i1p1f2 SON $y1 256 128
# addvor_models.csh CNRM-CM6-1 r1i1p1f2 DJF $y1 256 128

# addvor_models.csh EC-Earth3P-HR r1i1p2f1 MAM $y1 1024 512 850
# addvor_models.csh EC-Earth3P-HR r1i1p2f1 JJA $y1 1024 512 850
# addvor_models.csh EC-Earth3P-HR r1i1p2f1 SON $y1 1024 512 850
# addvor_models.csh EC-Earth3P-HR r1i1p2f1 DJF $y1 1024 512 850

# addvor_models.csh EC-Earth3P r1i1p2f1 MAM $y1 512 256
# addvor_models.csh EC-Earth3P r1i1p2f1 JJA $y1 512 256
# addvor_models.csh EC-Earth3P r1i1p2f1 SON $y1 512 256
# addvor_models.csh EC-Earth3P r1i1p2f1 DJF $y1 512 256

# addvor_models2.csh HadGEM3-GC31-HH r1i1p1f1 MAM $y1 1024 767
# addvor_models2.csh HadGEM3-GC31-HH r1i1p1f1 JJA $y1 1024 767
# addvor_models2.csh HadGEM3-GC31-HH r1i1p1f1 SON $y1 1024 767
# addvor_models2.csh HadGEM3-GC31-HH r1i1p1f1 DJF $y1 1024 767

# addvor_models2.csh HadGEM3-GC31-MM r1i1p1f3 MAM $y1 432 323
# addvor_models2.csh HadGEM3-GC31-MM r1i1p1f3 JJA $y1 432 323
# addvor_models2.csh HadGEM3-GC31-MM r1i1p1f3 SON $y1 432 323
# addvor_models2.csh HadGEM3-GC31-MM r1i1p1f3 DJF $y1 432 323

# addvor_models2.csh HadGEM3-GC31-LL r1i1p1f3 MAM $y1 192 143
# addvor_models2.csh HadGEM3-GC31-LL r1i1p1f3 JJA $y1 192 143
# addvor_models2.csh HadGEM3-GC31-LL r1i1p1f3 SON $y1 192 143
# addvor_models2.csh HadGEM3-GC31-LL r1i1p1f3 DJF $y1 192 143

# addvor_models.csh MPI-ESM1-2-XR r1i1p1f1 MAM $y1 768 384 gn
# addvor_models.csh MPI-ESM1-2-XR r1i1p1f1 JJA $y1 768 384 gn
# addvor_models.csh MPI-ESM1-2-XR r1i1p1f1 SON $y1 768 384 gn
# addvor_models.csh MPI-ESM1-2-XR r1i1p1f1 DJF $y1 768 384 gn

# addvor_models3.csh MPI-ESM1-2-LR r1i1p1f1 MAM $y1 192 96
# addvor_models3.csh MPI-ESM1-2-LR r1i1p1f1 JJA $y1 192 96
# addvor_models3.csh MPI-ESM1-2-LR r1i1p1f1 SON $y1 192 96
# addvor_models3.csh MPI-ESM1-2-LR r1i1p1f1 DJF $y1 192 96
 
 y1=$[$y1+1]
 
 done
 
exit
