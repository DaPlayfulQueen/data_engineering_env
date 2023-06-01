import logging
from datetime import timedelta
from airflow.decorators import dag, task
from airflow.utils.dates import days_ago

from services.psql_session_fabric import get_psql_session
from services.sqlalchemy_models import Orders, OrderTotals

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
    @task
    def extract_implement(**kwargs):
        ti = kwargs['ti']
        with get_psql_session('source_database') as s:
            orders = s.query(Orders).all()

        orders = [{
            'order_id': order.order_id,
            'item': order.item,
            'item_price': order.item_price,
            'amount': order.amount,
        } for order in orders]

        ti.xcom_push(key='orders_data', value=orders)

    @task
    def transform_implement(**kwargs):
        ti = kwargs['ti']
        orders = ti.xcom_pull(key='orders_data')

        orders = [{
            'order_id': order['order_id'],
            'total': order['item_price'] * order['amount']
        } for order in orders]

        logging.info(f'Transformed data {orders}')
        ti.xcom_push(key='orders_data', value=orders)

    @task
    def load_implement(**kwargs):
        ti = kwargs['ti']
        orders = ti.xcom_pull(key='orders_data')

        orders = [OrderTotals(order_id=order['order_id'], total=order['total']) for order in orders]

        with get_psql_session('source_database') as s:
            s.add_all(orders)
            s.commit()

    extract = extract_implement()
    transform = transform_implement()
    load = load_implement()

    extract >> transform >> load


example_etl()
