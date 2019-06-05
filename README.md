# "Simple" Guide to Hello World on Databricks

Documentation on Azure, Databricks and MLflow is fragmented and incomplete, but see below the steps to set up a "simple" hello world app.

## Local install
Create a conda environment (you can use Pycharm Preferences for this) and install mlflow with pip

```pip install mlflow```

Documentation mentions that for Python3.x you might have to use ```pip3```

After you have installed all dependencies, create a .yaml file of the conda environment:
```conda env export > environment.yml```

If no conda environment is created and specified in the MLproject yaml file, then it will use a default conda environment which only contains python.

## Experiment set up

You can follow the Azure Databricks documentation on [how to create an experiment](https://docs.azuredatabricks.net/applications/mlflow/quick-start.html)

Once this is done, get the Experiment ID from the UI (needed later on):

![experiment](https://i.imgur.com/UO9d7lK.png)


## Cluster set up

Documentation recommends creating a new cluster for every job; for this example I used an existing cluster.
To run the jon you need to create a ```.json``` file with the cluster specifications. 
If this is an existing cluster, you only need the cluster id which can be retrieved from the url in the clusters tab:
![cluster](https://docs.azuredatabricks.net/_images/azure-cluster.png)

[documentation](https://docs.azuredatabricks.net/user-guide/faq/workspace-details.html#cluster-url) has details on all ids.

If you are creating a new cluster where the job will run you have to update the json file with exact specifications. Acceptable keys and definitions can be found [here](https://docs.databricks.com/api/latest/clusters.html)

## MLproject

Deployment expects to find ```MLproject```; it's a file with yaml structure but no extention (similar to DOCKERFILE). You can set the run configurations here.
The current example does not include any parameters as it is a simple Hello world. More examples can be found in the [mlflow git repository](https://github.com/mlflow/mlflow/tree/master/examples)

Once previous steps are done git commit to a repository.

### Run

You need to obtain a DataBricks token if you are not running this locally.
Generate one following [these instructions](https://docs.azuredatabricks.net/api/latest/authentication.html#generate-a-token).

Once you have the token, you need to pass this to your local CLI so that it can send the request to the server.
On the command line run:
~~~~
export MLFLOW_TRACKING_URI=databricks
export DATABRICKS_HOST=https://westeurope.azuredatabricks.net
export DATABRICKS_TOKEN="<token>"
mlflow run https://github.com/NickyFot/hello_databricks.git  -c cluster-spec.json --experiment-id "<Experiment-id>"
~~~~


