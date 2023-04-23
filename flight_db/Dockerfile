FROM postgres:latest

ARG SCRIPT_PATH

COPY ${SCRIPT_PATH} .
COPY bootstrap.sh /docker-entrypoint-initdb.d/bootstrap.sh
