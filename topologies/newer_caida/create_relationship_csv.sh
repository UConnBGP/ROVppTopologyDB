#!/bin/sh

# Download the relationship dataset from CAIDA
echo "Downloading Relationship Data"
wget --mirror --no-parent http://data.caida.org/datasets/as-relationships/serial-2/20190501.as-rel2.txt.bz2
echo "\e[92mDownload Complete\e[0m"
# Go into the dataset dir
cd data.caida.org/datasets/as-relationships/serial-2

# Remove unecessary files
rm index*
rm README*
rm md5*

# Unzip all the files
echo "Unzipping Relationships"
bzcat ./* > as_relationships.csv
echo "\e[92mUnzipped Relationships\e[0m"
# Filter out comments
echo "Removing Comments"
grep -v '^#' as_relationships.csv > relationships.csv
echo "\e[92mComments removed\e[0m"

# Move final file up
mv relationships.csv ../../../../
cd ../../../../

# Remove duplicates
echo "Removing Duplicates"
sort -u relationships.csv > dups_removed.csv
echo "\e[92mDuplicates removed\e[0m"
# Create customer_providers CSV
echo "Creating intermediary customer_provider peers CSVs."
grep '[0-9]|[0-9]*|-1|[a-zA-Z]*' dups_removed.csv > customer_provider.csv
# Create peer CSV
grep '[0-9]|[0-9]*|0|[a-zA-Z]*' dups_removed.csv > peers.csv
echo "\e[92mDone\e[0m"

# Replace | with ,
echo "Replace pipes with commas"
sed -i 's/|/,/g' customer_provider.csv
sed -i 's/|/,/g' peers.csv
echo "\e[92mDone\e[0m"

# Remove Extra Columns
echo "Producing final files (only two columns each)"
awk -F, '{print $1","$2}' customer_provider.csv > just_customer_provider.csv
awk -F, '{print $1","$2}' peers.csv > just_peers.csv
echo "\e[92mDone\e[0m"

# Remove some intermediary files
echo "Cleaning up"
rm customer_provider.csv peers.csv dups_removed.csv
rm -rf data.caida.org

# Rename the final output files
mv just_customer_provider.csv customer_providers.csv
mv just_peers.csv peers.csv
echo "\e[92mDone!!!\e[0m"

# Print some notes to screen
echo "\e[1;93mNotes\e[0m"
echo "Output: relationships.csv, peers.csv and customer_provider.csv\n"
echo "relationships.csv is raw data from CAIDA (with comments removed)."
echo "peers.csv is the peer relationships"
echo "customer_provider.csv is the 'customer,provider' (in that order) relationships."
