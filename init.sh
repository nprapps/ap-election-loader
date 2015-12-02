#!/bin/bash

source config.sh

echo "Initialize races"
psql elex -c "DELETE FROM races;"
elex races $RACEDATE | psql elex -c "COPY races FROM stdin DELIMITER ',' CSV HEADER;"

echo "Initialize reporting units"
psql elex -c "DELETE FROM reporting_units;"
elex reporting-units $RACEDATE | psql elex -c "COPY reporting_units FROM stdin DELIMITER ',' CSV HEADER;"

echo "Initialize candidates"
psql elex -c "DELETE FROM candidates;"
elex candidates $RACEDATE | psql elex -c "COPY candidates FROM stdin DELIMITER ',' CSV HEADER;"

echo "Initialize ballot positions"
psql elex -c "DELETE FROM ballot_positions;"
elex ballot-positions $RACEDATE | psql elex -c "COPY ballot_positions FROM stdin DELIMITER ',' CSV HEADER;"
