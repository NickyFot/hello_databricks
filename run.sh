#!/usr/bin/env bash

export MLFLOW_TRACKING_URI=databricks
export DATABRICKS_HOST=https://westeurope.azuredatabricks.net
export DATABRICKS_TOKEN="dapi0816f6528479c99a5af01d67f653f7bb"
mlflow run https://github.com/NickyFot/hello_databricks.git  -c cluster-spec.json --experiment-id "3626988820869740"
