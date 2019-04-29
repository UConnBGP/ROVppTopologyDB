#!/bin/sh

# Download the relationship dataset from CAIDA
wget --mirror --no-parent http://data.caida.org/datasets/as-relationships/serial-2/
# Go into the dataset dir
cd data.caida.org/datasets/as-relationships/serial-2

# Remove unecessary files
rm index*
rm README*
rm md5*

# Unzip all the files
bzcat ./* > as_relationships.csv
# Filter out comments
grep -v '^#' as_relationships.csv > relationships.csv

# Move final file up
mv relationships.csv ../../../../
cd ../../../../

# Remove duplicates
sort -u > dups_removed.csv
# Create customer_providers CSV
grep '[0-9]|[0-9]*|-1|[a-zA-Z]*' dups_removed.csv > customer_provider.csv
# Create peer CSV
grep '[0-9]|[0-9]*|0|[a-zA-Z]*' dups_removed.csv > peers.csv

