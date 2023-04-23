#!/bin/bash
set -e
POSTGRES="psql --username ${POSTGRES_USER}"

echo "Creating database: ${DB_NAME}"
$POSTGRES <<EOSQL
CREATE DATABASE ${DB_NAME} OWNER ${POSTGRES_USER};
EOSQL

echo "Filling database"
psql -d "${DB_NAME}" -a -U "${POSTGRES_USER}" -f "${FLIGHT_SCRIPT_LOCATION}"/"${SQL_SCRIPT_NAME}"
