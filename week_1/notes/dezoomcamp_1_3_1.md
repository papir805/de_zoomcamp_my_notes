# Google Cloud Platform (GCP):

## Setting up new project and permissions:
1) Create New Project
2) IAM & Admin -> service accounts
3) Create Service Account:
4) three dots -> manage keys -> create new key (JSON)
5) add environmental variable to .zshrc or JUST type what's below into terminal 
    export GOOGLE_APPLICATION_CREDENTIALS="<path/to/your/service-account-authkeys>.json"

    What I used in terminal: 
    
    export GOOGLE_APPLICATION_CREDENTIALS="/Users/rancher/Google Drive/Coding/GitHub/data-engineering-zoomcamp/my_notes/week_1/my_work/GCP/de-zoomcamp-944-5be0d73fffbc.json"

    # Refresh token, and verify authentication by running the following in terminal:

    gcloud auth application-default login
6) IAM & Admin -> IAM -> permissions:
    - pencil (edit) button
    - add role -> storage admin
    - add role -> storage object admin
    - add role -> BigQuery Admin
7) enable APIs:
    - https://console.cloud.google.com/apis/library/iam.googleapis.com
    - https://console.cloud.google.com/apis/library/iamcredentials.googleapis.com


# Installing terraform
https://www.terraform.io/downloads
