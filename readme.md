# My docker envs

A little collection of docker services to deploy separate envs for my
data engineering related studies. Currently has 2 envs listed below

## airflow
Located in: **/airflow**


[Airflow](https://airflow.apache.org/) services, deployable all together as a part of one airflow application. 
Yet is empty in relation of hand-crafted DAGs, only using those of examples.

## database_studies
This subsection is for deploy of various services related to learning of databases.
Has the following docker profiles:
- pagila: runs postgres DB + pgadmin for experimenting with [pagila](https://github.com/devrimgunduz/pagila) dataset 
- flight_db: runs postgres DB + pgadmin for dataset from [SQL masterclass](https://www.udemy.com/course/15-days-of-sql/) 
- jupyter: runs container for Jupyter notebook

**.env** file and **/study_outputs** directories' content is deliberately hidden 
at the moment, for the worse or for the better.