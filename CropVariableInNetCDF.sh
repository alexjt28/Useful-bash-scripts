#!/bin/bash

#---------------------------------------------------------------------------------------------
# This bash script crops variables along a specified dimension (i.e., time) in a netCDF file
#
# Author: Alex Thompson
# Date: 7/29/2022
# File name: CropVariableInNetCDF.sh
#---------------------------------------------------------------------------------------------

## Move this file into the directory that contains the monthly files

echo "Here we go..."

## If performing this task on an NCAR Supercomputer, must first load NCO module 

module load nco

## To change text...
## VIM Editor Command -> :%s/change_from/change_to/

#---------------------------------------------------------------------------------------------------------------------------------------------
# Example used in this file is cropping the time dimension so the output contains only the last 100 of the original 400 years of monthly data
# Case: b.e12.B1850C5.f19_g16.i06ka.04
#---------------------------------------------------------------------------------------------------------------------------------------------

## Crop the time dimension on the final file to be 0301-0400 (indices 3600:4799 correspond to Jan_0301:Dec_0400)

ncks -d time,3600,4799,1 b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.AEROD_v.0001-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.AEROD_v.0301-0400.nc
ncks -d time,3600,4799,1 b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.AODDUST1.0001-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.AODDUST1.0301-0400.nc

echo "Done cropping. All done!"
