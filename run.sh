#!/usr/bin/env bash

export MLFLOW_TRACKING_URI=https://westeurope.azuredatabricks.net/?o=6802933195053587
mlflow run https://github.com/NickyFot/hello_databricks.git  -c cluster-spec.json --experiment-id 362698882086974
