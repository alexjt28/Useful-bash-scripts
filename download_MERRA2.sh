#!/bin/bash

#############################################################################################
#--------------------------------------------------------------------------------------------
# Define variables here
#--------------------------------------------------------------------------------------------

# U/P for NASA Earth Data
USERNAME=[username]
PASSWORD=[password]

# Path to the NASA Earth Data URLs
FILE_PATH="path_to_urls.txt"

# Start and end date for making time series output file
start_year=1980
end_year=2019

#############################################################################################

#--------------------------------------------------------------------------------------------
# Download each individual file using the URL provided by NASA Earth Data
#--------------------------------------------------------------------------------------------

# Create variable to store all filenames
declare -a filenames

# Iterate over each line in the txt file of URLs to download each one at a time
while IFS= read -r line
do
    # Set the line as a variable and trim leading and trailing whitespace characters
    full_variable=$(echo "$line" | tr -d '[:space:]')

    # Use the variable as needed
    wget --user="$USERNAME" --password="$PASSWORD" "$full_variable"

    # Change time dimension from integer to float
    filename=$(basename "$full_variable")
    ncap2 -O -s 'time=float(time)' $filename $filename

    # Add filename to the array
    filenames+=("$filename")

done < "$FILE_PATH"

#--------------------------------------------------------------------------------------------
# Concatenate all files into a single file with NCO
#--------------------------------------------------------------------------------------------

# Make list of years variable
year_range=""

# Loop through the years and concatenate them with commas
for ((year=start_year; year<=end_year; year++))
do
    if [ -z "$year_range" ]; then
        year_range="$year"
    else
        year_range="$year_range,$year"
    fi
done

# Print the year range variable
echo "Year range: $year_range"

# Use ncrcat to concatenate all files together
echo "Concatenating..."
eval "ncrcat MERRA2_*.instM_2d_gas_Nx."{$year_range}"{01,02,03,04,05,06,07,08,09,10,11,12}.nc4 MERRA2.instM_2d_gas_Nx."$start_year"01-"$end_year"12.nc"

#--------------------------------------------------------------------------------------------
# Delete individual files
#--------------------------------------------------------------------------------------------

# Delete individual files
echo "Deleting individual files..."
for file in "${filenames[@]}"
do
    rm "$file"
done

echo "All files deleted."
