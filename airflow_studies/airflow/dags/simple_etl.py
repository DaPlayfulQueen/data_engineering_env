from datetime import timedelta
from airflow.decorators import dag, task
from airflow.operators.bash import BashOperator
from airflow.utils.dates import days_ago

from airflow_studies.airflow.dags.services.psql_session_fabric import get_psql_session

default_args = {
    'owner': 'me',
    'start_date': days_ago(0),
    'retries': 1,
    'retry_delay': timedelta(minutes=5)
}
@dag(
    dag_id='example_etl',
    default_args=default_args,
    description='Example ETL in one DAG',
    schedule_interval=timedelta(days=1)
)
def example_etl():
    extract = BashOperator(
        task_id='extract',
        bash_command='echo "transform"'
    )

    @task
    def extract_implement(**kwargs):
        with get_psql_session('source_database') as s:
            pass

    transform = BashOperator(
        task_id='transform',
        bash_command='echo "transform"'
    )

    load = BashOperator(
        task_id='load',
        bash_command='echo "load"'
    )

    extract >> transform >> load
