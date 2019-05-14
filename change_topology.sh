#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "\e[93mUSAGE: \e[0m\n";
    echo "${0} <topology>\n\n";
    echo "\ttopology: "; echo "a topology to load. Topologies are in /db/topologies";
    echo "\n";
    exit 1;
fi

# This is the name of the directory in topologies
# There should be a file called 'load.sql' in there to load data into the DB
topology=${1};
echo "Loading Topology ...";
psql -d bgp -U bgp_user -f /db/topologies/$topology/load.sql
echo "\e[92mLoaded!\e[0m";
