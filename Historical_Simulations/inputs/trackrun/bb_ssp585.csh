#!/bin/csh

 set MODEL=$1
 set ENS=$2
 set SEAS=$3

 set dirpos=/data2/henri/tracks/CMIP6/ssp585/${MODEL}/${ENS}/ADDFLDS_NH/TRACKS_NS40
 set dirneg=/data2/henri/tracks/CMIP6/ssp585/${MODEL}/${ENS}/ADDFLDS_SH/TRACKS_SN40
 set out=/data2/henri/tracks/CMIP6/ssp585/STATS

    echo "  ###                              ###  "
    echo "            $MODEL $ENS                 "
    echo "  ###                              ###  "

    bb_stats.job ${MODEL}_${ENS}_ssp585_${SEAS}2077-99_pos TOTAL ${dirpos}
    cdo -f nc copy ${dirpos}/TOTAL/stat_trs_scl_${MODEL}_${ENS}_ssp585_${SEAS}2077-99_pos_1.nc ${dirpos}/TOTAL/stat_trs_scl_${MODEL}_${ENS}_ssp585_${SEAS}2077-99_pos.nc 
    cp ${dirpos}/TOTAL/stat_trs_scl_${MODEL}_${ENS}_ssp585_${SEAS}2077-99_pos.nc ${out}

    bb_stats.job ${MODEL}_${ENS}_ssp585_${SEAS}2077-99_neg TOTAL ${dirneg}
    cdo -f nc copy ${dirneg}/TOTAL/stat_trs_scl_${MODEL}_${ENS}_ssp585_${SEAS}2077-99_neg_1.nc ${dirneg}/TOTAL/stat_trs_scl_${MODEL}_${ENS}_ssp585_${SEAS}2077-99_neg.nc 
    cp ${dirneg}/TOTAL/stat_trs_scl_${MODEL}_${ENS}_ssp585_${SEAS}2077-99_neg.nc ${out}

exit
