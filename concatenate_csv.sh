#########################################################################
#                                                                       #
#   This script concatenates four specific .csv files, where the        #
#   headers are appended beside each other. The four files have         #
#   a 'time' column in common, so only three of the files have this     #
#   column removed.                                                     #
#                                                                       #
#   The script saves all four files in temporary files, where one has   #
#   the timestamp column. The files are concatenated into a file called #
#   'concatenated.csv'.                                                 #
#                                                                       #
#   Example of usage:                                                   #
#       sh concatenate_csv.sh                                           #
#                                                                       #
#########################################################################

cat ./energy_demand_data.csv > temp1
cut -f 1 -d ',' --complement ./exchange_data.csv > temp2
cut -f 1 -d ',' --complement ./generator_production_data.csv > temp3
cut -f 1 -d ',' --complement ./renewable_production_data.csv > temp4

paste -d ',' temp1 temp2 temp3 temp4 > concatenated.csv && rm -f ./temp*