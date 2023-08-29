{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'transaction').database,
        schema=source('shopify', 'transaction').schema,
        identifier=source('shopify', 'transaction').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='transaction', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='transaction_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}