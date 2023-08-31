from dagster import OpExecutionContext
from dagster_dbt import DbtCliResource, dbt_assets

from .constants import dbt_manifest_path

from dagster import EnvVar
from dagster_airbyte import AirbyteResource

from dagster_airbyte import load_assets_from_airbyte_instance
from dagster_fivetran import FivetranResource
from dagster import EnvVar

from dagster_fivetran import load_assets_from_fivetran_instance


@dbt_assets(manifest=dbt_manifest_path)
def marquee_analytics_dbt_assets(context: OpExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()


airbyte_instance = AirbyteResource(
    host="3.83.217.97",
    port="8000",
    username="airbyte",
    password=EnvVar("AIRBYTE_PASSWORD"),
)

# Use the airbyte_instance resource we defined in Step 1
airbyte_assets = load_assets_from_airbyte_instance(airbyte_instance)

# Pull API key and secret from environment variables
fivetran_instance = FivetranResource(
    api_key=EnvVar("FIVETRAN_API_KEY"),
    api_secret=EnvVar("FIVETRAN_API_SECRET"),
)
# Use the fivetran_instance resource we defined in Step 1
fivetran_assets = load_assets_from_fivetran_instance(fivetran_instance)
