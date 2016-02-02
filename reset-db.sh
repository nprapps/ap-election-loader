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
    electiondate date,
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
    electiondate date,
    fipscode char(5),
    initialization_data bool,
    lastupdated timestamp,
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
psql elex -c "CREATE TABLE ballot_measures(
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
    electiondate date,
    fipscode char(5),
    first varchar,
    incumbent bool,
    initialization_data bool,
    is_ballot_measure bool,
    last varchar,
    lastupdated timestamp,
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

