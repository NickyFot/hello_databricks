import mlflow
import click


@click.command(help="Give a name to the hello app")
@click.option("--your-name", default="Unidentified",
              help="Limit the data size to run comfortably on a laptop.")
def hello_databricks(name):
    with mlflow.start_run() as run:
        # Log a parameter (key-value pair)
        mlflow.log_param("param1", 5)

        # Log a metric; metrics can be updated throughout the run
        mlflow.log_metric("foo", 1)
        mlflow.log_metric("foo", 2)
        mlflow.log_metric("foo", 3)

        # Log an artifact (output file)
        with open("output.txt", "w") as f:
            f.write("I am logging Hello world! Hello {}".format(name))
        mlflow.log_artifact("output.txt")


if __name__=="__main__":
    hello_databricks()
