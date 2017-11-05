#!/bin/bash

# find files mathcing strng in argument 1
#files=(`find . -name '*'$1'*'`)

# Make your own list of files
files=(energy_demand_data.csv exchange_data.csv generator_production_data.csv renewable_production_data.csv)

# remove the time stamp for all 
cut -d ',' -f1 --complement "${files[@]:1}" > temp.csv

# collect the files to one
paste -d ',' "${files[@]:0}" "temp.csv" 

#removes temp.csv
rm temp.csv
