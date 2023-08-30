from dagster import OpExecutionContext
from dagster_dbt import DbtCliResource, dbt_assets

from .constants import dbt_manifest_path

from dagster import EnvVar
from dagster_airbyte import AirbyteResource

airbyte_instance = AirbyteResource(
    host="3.83.217.97",
    port="8000",
    username="airbyte",
    password=EnvVar("AIRBYTE_PASS"),
)

@dbt_assets(manifest=dbt_manifest_path)
def marquee_analytics_dbt_assets(context: OpExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()


from dagster_airbyte import load_assets_from_airbyte_instance

# Use the airbyte_instance resource we defined in Step 1
airbyte_assets = load_assets_from_airbyte_instance(airbyte_instance)
