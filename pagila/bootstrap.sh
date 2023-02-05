#!/bin/bash
set -e
POSTGRES="psql --username ${POSTGRES_USER}"

echo "Creating database: ${PAGILA_DB_NAME}"
$POSTGRES <<EOSQL
CREATE DATABASE ${PAGILA_DB_NAME} OWNER ${POSTGRES_USER};
EOSQL
echo "Creating schema..."
psql -d "${PAGILA_DB_NAME}" -a -U "${POSTGRES_USER}" -f /pagila-schema.sql

echo "Populating database initial data"
psql -d "${PAGILA_DB_NAME}" -a  -U "${POSTGRES_USER}" -f /pagila-insert-data.sql

echo "Populating database..."
psql -d "${PAGILA_DB_NAME}" -a  -U "${POSTGRES_USER}" -f /pagila-data.sql

