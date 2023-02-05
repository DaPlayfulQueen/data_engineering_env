FROM postgres:latest

ARG PAGILA_DATA

COPY ${PAGILA_DATA}/*.sql .
COPY bootstrap.sh /docker-entrypoint-initdb.d/bootstrap.sh
