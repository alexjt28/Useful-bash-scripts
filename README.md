# Useful-bash-scripts

Files in this directory:

AppendVariableToNetCDF.sh                    -> appends variable from one netCDF file to another

CLM_MakeClimatologyFileFromTimeSeriesFile.sh -> makes average climatology file from land model time series netCDF file

CropVariableInNetCDF.sh                      -> crops variable along specified dimension (i.e., time) in a netCDF file

MakeClimatologyFileFromMonthlyFiles.sh       -> makes average climatology file from monthly netCDF files

MakeTimeSeriesFromMonthlyFiles.sh            -> condenses monthly netCDF files into a single time series file

POP_MakeTimeSeriesFromMonthlyFiles.sh        -> condenses ocean model netCDF files into a single time series file

download_MERRA2.sh                           -> takes txt file of URLs for individual netCDF files, downloads them all, concatenates them all 
                                                into a single netCDF file, and deletes the individual netCDF files
                                                
NOTE: All files in this directory use NCO operator commands. Instructions for downloading NCO can be found
here (https://sourceforge.net/projects/nco/). 

