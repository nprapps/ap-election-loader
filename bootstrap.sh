#!/bin/bash

source config.sh

echo "Reset database (reset-db.sh)"
time ./reset-db.sh

echo "Initialize tables (init.sh)"
time ./init.sh

echo "Get results (update.sh)"
time ./update.sh

