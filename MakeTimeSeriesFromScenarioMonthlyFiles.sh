#!/bin/bash
#----------------------------------------------------------------------
# This bash script concatenates monthly files from two different
# scenarios (HIST and SSP370) of the CESM2 Large Ensemble into one
# time series file. 
#
# Author: Alex Thompson
# Date: 8/19/2024
# File name: MakeTimeSeriesFileFromScenarioMonthlyFiles.sh
#----------------------------------------------------------------------

## Define parameters

# Directory
dir="[file path to directory where files are stored]"

# Define output file
output_file="CESM2LE_1191.010_TREFHT_monthly.nc"

# Two scenarios: HIST and SSP370, 
scen=(HIST HIST HIST HIST HIST HIST HIST HIST HIST HIST HIST HIST HIST HIST HIST HIST HIST SSP370 SSP370 SSP370 SSP370 SSP370 SSP370 SSP370 SSP370 SSP370)
syrs=(1850 1860 1870 1880 1890 1900 1910 1920 1930 1940 1950 1960 1970 1980 1990 2000 2010 2015   2025   2035   2045   2055   2065   2075   2085   2095)
eyrs=(1859 1869 1879 1889 1899 1909 1919 1929 1939 1949 1959 1969 1979 1989 1999 2009 2014 2024   2034   2044   2054   2064   2074   2084   2094   2100)

## Concatenate files
echo "Creating input file list..."
input_files=""
for i in "${!syrs[@]}"; do
    input_files+="${dir}/b.e21.B${scen[$i]}smbb.f09_g17.LE2-1191.010.cam.h0.TREFHT.${syrs[$i]}01-${eyrs[$i]}12.nc "
done

# Remove trailing space on last item
input_files=$(echo "$input_files" | sed 's/ *$//')
echo "$input_files"

# Concatenate files
echo "Concatenating files..." 
ncrcat $input_files $output_file

echo "All done!"
