#!/bin/bash

#----------------------------------------------------------------------
# This bash script takes climate model output as monthly netCDF files
# and compiles them into a single timeseries file with dimensions
# total # of months (years*months) x latitude x longitude
#
# Author: Alex Thompson
# Date: 7/29/2022
# File name: MakeTimeSeriesFileFromMonthlyFiles.sh
#----------------------------------------------------------------------

## Move this file into the directory that contains the monthly files

echo "Here we go..."

## If performing this task on an NCAR Supercomputer, must first load NCO module 

module load nco

## To change text...
## VIM Command Editor -> :%s/change_from/change_to/

#-----------------------------------------------------------------------------------------------------------
# Example used in this file is making a time series file from years 91-100 of the following iCESM case:
# Case: f.e12.F_1850_CAM5.wiso.f19.0ka.002 {0091 - 0100}
# Years: 0091,0092,0093,0094,0095,0096,0097,0098,0099,0100
#-----------------------------------------------------------------------------------------------------------

## First make time series file of all variables (NOTE: This step potentially requires large free disk space)

echo "Making time series file..."

ncrcat [/filepath/to/case/]f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.0{0091,0092,0093,0094,0095,0096,0097,0098,0099,0100}-{01,02,03,04,05,06,07,08,09,10,11,12}.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.timeseries_of_every_var.0091-0100.nc

echo "Time series file created."

## Condense to only essential variables (NOTE: Must specify the individual variables to save, example variables are given below)

echo "Condensing..."

ncks -v CLOUD,FLNT,FSNT,PRECC,PRECL,T,U,V,Z3 f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.timeseries_of_every_var.0091-0100.nc f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.timeseries_of_all_vars.0091-0100.nc

echo "Condensing complete."

## Remove extra file 

rm f.e12.F_1850_CAM5.wiso.f19.0ka.002.cam.h0.timeseries_of_every_var.0091-0100.nc

echo "Extra file deleted. All done!"
