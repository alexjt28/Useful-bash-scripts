#!/bin/bash

#----------------------------------------------------------------------
# This bash script takes climate model output as monthly netCDF files
# and compiles them into a single climatology file with dimensions
# months(12) x latitude x longitude
#
# Author: Alex Thompson
# Date: 7/29/2022
# File name: MakeClimatologyFileFromMonthlyFiles.sh
#----------------------------------------------------------------------

## Move this file into the directory that contains the monthly files

echo "Here we go..."

## If performing this task on an NCAR Supercomputer, must first load NCO module 

module load nco

## To change text...
## VIM Editor Command -> :%s/12ka.01/12ka.01/

#-----------------------------------------------------------------------------------------------------------
# Example used in this file is calculating a climatology file from years 91-100 of the following iCESM case:
# f.e12.F_1850_CAM5.wiso.f19.0ka.002 {0091 - 0100}
# Years: 0091,0092,0093,0094,0095,0096,0097,0098,0099,0100
#-----------------------------------------------------------------------------------------------------------

## Make monthly averaged files for specified years (ex. Jan from 0091-0100)

echo "Making monthly average files..."

ncra [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-01.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_01.nc 
ncra [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-02.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_02.nc 
ncra [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-03.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_03.nc
ncra [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-04.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_04.nc
ncra [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-05.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_05.nc
ncra [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-06.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_06.nc 
ncra [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-07.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_07.nc 
ncra [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-08.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_08.nc 
ncra [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-09.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_09.nc 
ncra [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-10.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_10.nc 
ncra [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-11.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_11.nc 
ncra [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-12.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_12.nc 

echo "Monthly average files created."

## Concatenate individual month files into climatology file

echo "Concatenating into climatology file..."

ncrcat f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_{01,02,03,04,05,06,07,08,09,10,11,12}.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100.climo.nc

echo "Climatology file created."

## Remove extra files

rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_01.nc
rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_02.nc
rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_03.nc
rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_04.nc
rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_05.nc
rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_06.nc
rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_07.nc
rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_08.nc
rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_09.nc
rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_10.nc
rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_11.nc
rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0091-0100_12.nc

echo "Extra files deleted. All done!"

