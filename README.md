# GCP Landing Zone Template

![GCP Landing Zone Template](https://github.com/cloudon-one/snippet/blob/main/GCP%20HLD%20-%20SNIPPET-GCP.png)

## Requirements

- terraform v1.3+
- gcloud sdk

## Required Permissions to Deploy Landing Zone

    - Organization Admin
    - Folders Creator
    - Projects Creator
    - Org/Folder/Projects IAM Admin

## Values

Proposed landoing zone example is DRY. It doesn't contain any values exapt *required* variable within Terraform modules.

## Start

    git clone git@github.com:cloudon-one/snippet.git
    export $PROJECT_ID = "*your-gcp-project-id*"
    gcloud auth application-default login
    gcloud config set project $PROJECT_ID
    gcloud auth application-default login

### Deploy Admin Project

    cd admin/admin-project.
    terraform init
    terraform plan
    terraform apply

This will create folders structure within GCP Organization, GCS Buckets to strore terrafrom-state and environments service accounts to manage terrafrom executions in the future runs.

### Deploy environments

    cd ../../envs/ # select next env to deploy resources.
    terraform init
    terraform plan
    terraform apply
