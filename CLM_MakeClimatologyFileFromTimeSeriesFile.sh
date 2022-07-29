#!/bin/bash

#------------------------------------------------------------------------------------------------------------------------------------
# This bash script makes a climatology file from a CLM (land model) time series netCDF file and modifies the time period of 
# averaging in the process. The final climatology file has dimensions: months(12) x latitude x longitude
#
# Author: Alex Thompson
# Date: 7/29/2022
# File name: CLM_MakeClimatologyFileFromTimeSeriesFile.sh
#----------------------------------------------------------------------

## Move this file into the directory that contains the monthly files

echo "Here we go..."

## If performing this task on an NCAR Supercomputer, must first load NCO module 

module load nco

## To change text...
## VIM Editor Command -> :%s/change_from/change_to/

#-----------------------------------------------------------------------------------------------------------
# Example used in this file is calculating a climatology file from years 91-100 of the following iCESM case:
# Case: b.e12.B1850C5.f19_g16.i06ka.04
#-----------------------------------------------------------------------------------------------------------

## Convert original files to NetCDF-3 to work around _FillValue problem with CLM files

echo "Converting to NetCDF-3"

ncks -O -3 b.e12.B1850C5.f19_g16.i06ka.04.clm2.h0.H2OSOI.0001-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.clm2.h0.H2OSOI.0001-0400.nc

## Crop time dimension to be last 100 years of the original 400 years and place variable into a place-holder file

echo "Cropping time dimension"

ncks -A -v H2OSOI -d time,3600,4799,1 b.e12.B1850C5.f19_g16.i06ka.04.clm2.h0.H2OSOI.0001-0400.nc holdingfile_timeseries.nc

## Create new file with new averages of each month 

echo "Creating monthly files"

ncra -F -d time,1,,12  holdingfile_timeseries.nc holdingfile_timeseries_clm2.h0.0301-0400_01.nc
ncra -F -d time,2,,12  holdingfile_timeseries.nc holdingfile_timeseries_clm2.h0.0301-0400_02.nc
ncra -F -d time,3,,12  holdingfile_timeseries.nc holdingfile_timeseries_clm2.h0.0301-0400_03.nc
ncra -F -d time,4,,12  holdingfile_timeseries.nc holdingfile_timeseries_clm2.h0.0301-0400_04.nc
ncra -F -d time,5,,12  holdingfile_timeseries.nc holdingfile_timeseries_clm2.h0.0301-0400_05.nc
ncra -F -d time,6,,12  holdingfile_timeseries.nc holdingfile_timeseries_clm2.h0.0301-0400_06.nc
ncra -F -d time,7,,12  holdingfile_timeseries.nc holdingfile_timeseries_clm2.h0.0301-0400_07.nc
ncra -F -d time,8,,12  holdingfile_timeseries.nc holdingfile_timeseries_clm2.h0.0301-0400_08.nc
ncra -F -d time,9,,12  holdingfile_timeseries.nc holdingfile_timeseries_clm2.h0.0301-0400_09.nc
ncra -F -d time,10,,12 holdingfile_timeseries.nc holdingfile_timeseries_clm2.h0.0301-0400_10.nc
ncra -F -d time,11,,12 holdingfile_timeseries.nc holdingfile_timeseries_clm2.h0.0301-0400_11.nc
ncra -F -d time,12,,12 holdingfile_timeseries.nc holdingfile_timeseries_clm2.h0.0301-0400_12.nc

## Concatenate into one climatology file

echo "Concatenating files"

ncrcat holdingfile_timeseries_clm2.h0.0301-0400_{01,02,03,04,05,06,07,08,09,10,11,12}.nc b.e12.B1850C5.f19_g16.i06ka.04.clm2.h0.0301-0400.climo.nc

## Remove extra files

echo "Removing the rest of the extra files"

rm holdingfile_timeseries.nc
rm holdingfile_timeseries_clm2.h0.0301-0400_01.nc
rm holdingfile_timeseries_clm2.h0.0301-0400_02.nc
rm holdingfile_timeseries_clm2.h0.0301-0400_03.nc
rm holdingfile_timeseries_clm2.h0.0301-0400_04.nc
rm holdingfile_timeseries_clm2.h0.0301-0400_05.nc
rm holdingfile_timeseries_clm2.h0.0301-0400_06.nc
rm holdingfile_timeseries_clm2.h0.0301-0400_07.nc
rm holdingfile_timeseries_clm2.h0.0301-0400_08.nc
rm holdingfile_timeseries_clm2.h0.0301-0400_09.nc
rm holdingfile_timeseries_clm2.h0.0301-0400_10.nc
rm holdingfile_timeseries_clm2.h0.0301-0400_11.nc
rm holdingfile_timeseries_clm2.h0.0301-0400_12.nc

echo "Extra files deleted. All done!"
