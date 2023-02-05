FROM postgres:latest

ARG PAGILA_REPOSITORY
ARG PAGILA_DB_NAME
ARG PAGILA_USER

RUN echo "dockerfile args ${PAGILA_DB_NAME} ${PAGILA_USER} ${PAGILA_REPOSITORY}"

COPY ${PAGILA_REPOSITORY}/*.sql .

COPY bootstrap.sh /docker-entrypoint-initdb.d/bootstrap.sh

RUN chmod +x /docker-entrypoint-initdb.d/bootstrap.sh

