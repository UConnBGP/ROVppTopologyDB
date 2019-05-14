# Topologies

Each topology is represented as a directory that consists of all the tables it needs as CSV files.

For example:  
```
small_test
├── customer_providers.csv
├── load.sql
├── peers.csv
└── roas.csv
```

This topology recreates the `customer_providers`, `peers`, and `roas` tables.
The `load.sql` removes all the rows in those respective tables, and loads/inserts the data from all the `.csv` files;

More complicated topologies can have additional things in it.
For example:  
```
caida
├── create_relationship_csv.sh
├── customer_providers.csv
├── load.sql
├── peers.csv
├── README.txt
└── relationships.csv
```

Here the `relationships.csv` is not a table in the database. It's an intermediary file produced from the `create_relationship_csv.sh` script; which is used to pull down the CAIDA relationship data and create the `peers.csv` and `customer_providers.csv`.

This one also has a README (which I stole from CAIDA), that explains `relationships.csv`. Additional notes can be added in the README.
