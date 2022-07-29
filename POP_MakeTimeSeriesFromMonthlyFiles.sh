#!/bin/bash

#-------------------------------------------------------------------------------
# This bash script takes POP (ocean model) climate model output as monthly 
# netCDF files and compiles them into a single timeseries file with dimensions: 
# total # of months (years*months) x latitude x longitude
#
# To save disk space, this script saves only the surface level (z_t=0) of 
# each variable
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
# Case: b.e12.B1850C5.f19_g16.i06ka.07.pop {0101 - 0110}
# Years: 101,102,103,104,105,106,107,108,109,110
#-----------------------------------------------------------------------------------------------------------

## Make time series file with specified variables

echo "Making time series file..."

ncrcat -v R18O,RHDO,SALT,TEMP -d z_t,0 [/filepath/to/case/]b.e12.B1850C5.f19_g16.i06ka.07.pop.h.0{101,102,103,104,105,106,107,108,109,110}-{01,02,03,04,05,06,07,08,09,10,11,12}.nc b.e12.B1850C5.f19_g16.i06ka.07.pop.h.timeseries_sfc.0101-0110.nc

echo "Time series file created. All done!"
