FROM apache/airflow:2.6.1
COPY ./dags/. /opt/airflow/dags
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
USER airflow