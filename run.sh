#!/usr/bin/env bash

export MLFLOW_TRACKING_URI=https://westeurope.azuredatabricks.net
export MLFLOW_TRACKING_USERNAME="GB012035348-MSP01"
export MLFLOW_TRACKING_PASSWORD="YSyn3%~9@GjohWr"
mlflow run https://github.com/NickyFot/hello_databricks.git  -c cluster-spec.json --experiment-id 362698882086974
