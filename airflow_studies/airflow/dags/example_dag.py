from airflow.decorators import dag, task
from airflow.operators.bash import BashOperator
import datetime as dt

default_ags = {
    'owner': 'me',
    'start_date': dt.datetime(2023, 1, 1),
}


@dag('example_dag',
     description='My test',
     default_args=default_ags,
     tags=['mine'],
     max_active_runs=1,
     schedule=None)
def example_dag():
    print_header = BashOperator(
        task_id='print_header',
        bash_command='echo \'Greetings. The date and time are\''
    )

    print_datetime = BashOperator(
        task_id='print_datetime',
        bash_command='date'
    )

    print_header >> print_datetime


example_dag()
