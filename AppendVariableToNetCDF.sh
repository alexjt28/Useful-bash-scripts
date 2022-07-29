#!/bin/bash

echo "Here we go..."

## Drop the updated version of this file into the directory that contains all files

## Load NCO
module load nco

## To change 06ka.04 and AEROD_v...
## Example -> :%s/06ka.04/06ka.04/
## Example -> :%s/AEROD_v/AEROD_v/

## Copy the first variable to a new file that will act as the file for all variables
cp b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.AEROD_v.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
## For clm files, there should be 68 variables total
## This first variable will likely be AEROD_v

echo "Done copying..."

## Convert that file to netCDF3 so ncks will work with it
ncks -3 b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc

echo "Converted to netCDF3"

## Append all variables to the final file 
## This list excludes the file for AEROD_v because that is already in the final file
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.AEROD_v.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.AODDUST1.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.AODDUST3.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.CLDICE.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.CLDLIQ.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.CLDTOT.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.CLOUD.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FLDS.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FLNS.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FLNSC.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FLNT.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FLNTC.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FLUT.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FLUTC.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FSDS.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FSDSC.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FSNS.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FSNSC.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FSNT.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.FSNTC.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.H216OL.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.H216OV.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.H218OL.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.H218OV.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.H2OL.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.H2OV.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.HDOL.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.HDOV.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.LHFLX.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.OMEGA.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PBLH.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECC.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECL.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECRC_H216Or.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECRC_H218Or.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECRC_H2Or.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECRC_HDOr.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECRL_H216OR.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECRL_H218OR.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECRL_H2OR.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECRL_HDOR.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECSC.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECSC_H216Os.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECSC_H218Os.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECSC_H2Os.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECSC_HDOs.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECSL.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECSL_H216OS.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECSL_H218OS.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECSL_H2OS.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PRECSL_HDOS.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PS.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.PSL.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.Q.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.QFLX.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.QREFHT.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.RELHUM.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.SHFLX.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.SOLIN.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.T.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.TMQ.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.TREFHT.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.TS.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.TSMN.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.TSMX.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.U.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.V.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc
ncks -A b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.Z3.0301-0400.nc b.e12.B1850C5.f19_g16.i06ka.04.cam.h0.timeseries_of_all_vars.0301-0400.nc

echo "Done appending. Done with everything!"
