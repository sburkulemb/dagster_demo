{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'customer').database,
        schema=source('shopify', 'customer').schema,
        identifier=source('shopify', 'customer').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='customer', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='customer_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}