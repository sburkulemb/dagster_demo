

{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'refund').database,
        schema=source('shopify', 'refund').schema,
        identifier=source('shopify', 'refund').name) -%}



{{
    fivetran_utils.union_data(
        table_identifier='refund', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='refund_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}
