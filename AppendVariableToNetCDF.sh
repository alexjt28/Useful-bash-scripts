#!/bin/bash

#----------------------------------------------------------------------
# This bash script appends variables from one netCDF file to another 
#
# Author: Alex Thompson
# Date: 7/29/2022
# File name: AppendVariableToNetCDF.sh
#----------------------------------------------------------------------

## Move this file into the directory that contains the monthly files

echo "Here we go..."

## If performing this task on an NCAR Supercomputer, must first load NCO module 

module load nco

## To change text...
## VIM Editor Command -> :%s/change_from/change_to/

#---------------------------------------------------------------------------------------------------------------------------------------
# Example used in this file is appending a variable from a single variable time series to a time series file containing many variables
# Case: b.e12.B1850C5.f19_g16.i06ka.04
#---------------------------------------------------------------------------------------------------------------------------------------

## Convert final time series file to netCDF3 so the "ncks" command will work with it
ncks -3 b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc

echo "Converted to netCDF3"

## Append all desired variables from the original file to the final file
 
ncks -A -v PRECC b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECC.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A -v PRECL b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECL.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc

echo "Done appending. All done!"
