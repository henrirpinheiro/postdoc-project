'reinit'
'set display color white'
'c'

'sdfopen /media/henri/SMART/highXlow-resol_comparison_cyclones/ERA5/tracks/plot_tracks/output/file.nc'
'sdfopen /media/henri/SMART/highXlow-resol_comparison_cyclones/ERA5/tracks/netcdf/stat_trs_scl_vor850neg_ERA5_allseas.count.nc'

'set parea 0.2 5.4 2.2 7.7'

'set mpvals -120 120 -85 -15'
'set cmax -10000000'
'set grads off'
'set xlint 15'
'set ylint 15'
'set timelab off'
'set mproj sps'
'set lat -90 0'
'set map 15 1 5'

'set dfile 1'
#'set lat -85 -15'
#'set lon -120 120'
'd u(z=1)'

n_arq=101
while (n_arq <=1106)

#inputfile='/home/henri/trajetoria/split/newcommand/trfile'n_arq''
inputfile='/media/henri/SMART/highXlow-resol_comparison_cyclones/ERA5/tracks/plot_tracks/output/trfile'n_arq''
line=1
while(1)
a=read(inputfile)
if(sublin(a,1)!=0);break;endif;
   turnlin=sublin(a,2)
   rec=turnlin
   say rec

*Numero de posicoes (lat,lon)
lon = subwrd(rec,1)
lat = subwrd(rec,2)

say 'lon= '%lon
say 'lat= '%lat

* conversao lat,lon para coord pagina
'q w2xy 'lon' 'lat''
linha=sublin(result,1)
x=subwrd(result,3)
y=subwrd(result,6)
say 'x= '%x
say 'y= '%y

*Plota os pontos
#'set line 2 1 5'
#'draw mark 3 'x' 'y' 0.05'

*Liga-pontos
'set cstyle 1'
'set line 2 1 1'

if (line>1)
say 'Entrei no if de line>0'
'draw line 'xold' 'yold' 'x' 'y
endif
xold=x; yold=y

line=line+1
endwhile
n_arq=n_arq+1
endwhile

##########################

'set parea 5.6 10.8 2.2 7.7'

'set strsiz 0.22 0.22'
'draw string 0.55 7.1 (a)'
'draw string 5.9 7.1 (b)'

'set mpvals -120 120 -85 -15'
'set cmax -10000000'
'set grads off'
'set xlint 15'
'set ylint 15'
'set timelab off'
'set mproj sps'
'set map 15 1 5'

'set rgb 49 102 0 0'
'set rgb 50 153 0 0 '
'set rgb 51 173 41 10'
'set rgb 52 194 82 20'
'set rgb 53 214 122 31'
'set rgb 54 235 163 41'
'set rgb 55 255 204 51'
'set rgb 56 224 204 92'
'set rgb 57 194 204 133'
'set rgb 58 174 189 150'
'set rgb 59 153 175 168'
'set rgb 61 128 157 190'
'set rgb 62  102 139 212'
'set rgb 63  77 120 233'
'set rgb 64  51 102 255'
'set rgb 66 235 235 235'

'set dfile 2'
#'set lat -85 -15'
#'set lon -120 120'
'define track=tden.2(z=1,t=1)'

'set dfile 2'
#'set lat -85 -15'
#'set lon -120 120'
'define vor=mstr.2(z=1,t=1)'

***** MASCARA ******
'i=maskout(track,track-1.0)'
'mask=maskout(vor,i)'

'set gxout shaded'
#'set clevs  2 4 6 8 10 12 14'
'set clevs 1 3 5 7 9 11'
'set ccols 66 61 57 55 54 53 52'
'set grads off'
'd track'

'set gxout contour'
'set clab masked'
'set ccolor 1'
'set cmin 1'
'set cint 0.5'
'set cmax 5.5'
'd mask'
'set clab masked'
'set cstyle 3'
'set ccolor 1'
'set cmin 6.0'
'set cint 0.5'
'd mask'

'xcbar 1.5 9.5 2.8 2.92 -fs 1'

#'draw title ERA5'


'gxprint tracks-tden-mstr_cyclones_SA.png x2048 y1536'
#'enable print tden_vor.gmf'
#'print'
#'disable'
#'!gxeps -c -i tden_vor.gmf -o tden_vor.eps'
#'!rm *gmf'

'q pos'
'c'
'quit'



