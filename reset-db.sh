#!/bin/bash

source config.sh

dropdb elex
createdb elex

echo "Create races"
psql elex -c "CREATE TABLE races(
    id varchar PRIMARY KEY,
    raceid varchar,
    racetype varchar,
    racetypeid varchar,
    description varchar,
    initialization_data boolean,
    lastupdated date,
    national boolean,
    officeid varchar,
    officename varchar,
    party varchar,
    seatname varchar,
    seatnum varchar,
    statename varchar,
    statepostal char(2),
    test boolean,
    uncontested boolean
);"

echo "Create reporting units"
psql elex -c "CREATE TABLE reporting_units(
    id varchar,
    reportingunitid varchar,
    reportingunitname varchar,
    description varchar,
    fipscode char(5),
    initialization_data bool,
    lastupdated date,
    level varchar,
    national varchar,
    officeid varchar,
    officename varchar,
    precinctsreporting int,
    precinctsreportingpct numeric,
    precinctstotal int,
    raceid varchar,
    racetype varchar,
    racetypeid varchar,
    seatname varchar,
    seatnum varchar,
    statename varchar,
    statepostal varchar,
    test bool,
    uncontested bool,
    votecount int
);"

echo "Create candidates table"
psql elex -c "CREATE TABLE candidates(
    id varchar,
    unique_id varchar,
    candidateid varchar,
    ballotorder int,
    first varchar,
    last varchar,
    party varchar,
    polid varchar,
    polnum varchar
);"

echo "Create ballot_positions table"
psql elex -c "CREATE TABLE ballot_positions(
    id varchar,
    unique_id varchar,
    candidateid varchar,
    ballotorder int,
    description varchar,
    last varchar,
    polid varchar,
    polnum varchar,
    seatname varchar
);"

echo "Create results table"
psql elex -c "CREATE TABLE results(
    id varchar,
    unique_id varchar,
    raceid varchar,
    racetype varchar,
    racetypeid varchar,
    ballotorder int,
    candidateid varchar,
    description varchar,
    fipscode char(5),
    first varchar,
    incumbent bool,
    initialization_data bool,
    is_ballot_position bool,
    last varchar,
    lastupdated varchar,
    level varchar,
    national bool,
    officeid varchar,
    officename varchar,
    party varchar,
    polid varchar,
    polnum varchar,
    precinctsreporting int,
    precinctsreportingpct numeric,
    precinctstotal int,
    reportingunitid varchar,
    reportingunitname varchar,
    runoff bool,
    seatname varchar,
    seatnum varchar,
    statename varchar,
    statepostal char(2),
    test bool,
    uncontested bool,
    votecount int,
    votepct numeric,
    winner bool
);"

if [ -f $DIR/name_overrides.csv ]; then
  ## THIS SHOULD MATCH YOUR `name_overrides.csv`
  echo "Create name_overrides table"
  psql elex -c "CREATE TABLE name_overrides(
      unique_id varchar,
      first varchar,
      last varchar
  );"

  psql elex -c "COPY name_overrides FROM '`pwd`/name_overrides.csv' DELIMITER ',' CSV HEADER;"

  psql elex -c "CREATE VIEW elex_results as
      SELECT n.last as display_last, n.first as display_first, r.* from results as r
          LEFT JOIN name_overrides as n on r.unique_id = n.unique_id
  ;"
fi
