# Ingesting data to GCP VM instance
    1) start up VM on GCP
    2) get new external ip address and change in ~/.ssh folder
    3) ssh into VM using `ssh de-zoomcamp` alias or connect through VScode
    4) navigate to airflow folder
    5) edit YAML file  
        - Change port if needed for so you can have airflow running locally and on VM
            - I used 8081:8080 (local port 8081 mapped to VM port 8080)
    6) create dags_new folder
        - create data_ingestion_local.py that contains all the airflow instructions and syntax for the DAG itself
            - create ingest_script.py which will be used for PythonOperator in the DAG run in data_ingestion_local.py 