from contextlib import contextmanager
from airflow.providers.postgres.hooks.postgres import PostgresHook
from sqlalchemy.orm import Session


@contextmanager
def get_psql_session(connection_name: str):
    psql_hook = PostgresHook(postgres_conn_id=connection_name)
    psql_engine = psql_hook.get_sqlalchemy_engine()
    psql_session = Session(psql_engine)
    try:
        yield psql_session
    finally:
        psql_session.close()
