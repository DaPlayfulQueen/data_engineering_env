#!/bin/bash
set -e
echo "vars ${PAGILA_DB_NAME} ${PAGILA_USER}"
echo "$@"
echo "lololo"

POSTGRES="psql --username ${PAGILA_USER}"

echo "Creating database: ${PAGILA_DB_NAME}"

$POSTGRES <<EOSQL
CREATE DATABASE ${PAGILA_DB_NAME} OWNER ${PAGILA_USER};
EOSQL
echo "Creating schema..."
psql -d "${PAGILA_DB_NAME}" -a -U "${PAGILA_USER}" -f /pagila-schema.sql

echo "Populating database initial data"
psql -d "${PAGILA_DB_NAME}" -a  -U "${PAGILA_USER}" -f /pagila-insert-data.sql

echo "Populating database..."
psql -d "${PAGILA_DB_NAME}" -a  -U "${PAGILA_USER}" -f /pagila-data.sql

