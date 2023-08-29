{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'product').database,
        schema=source('shopify', 'product').schema,
        identifier=source('shopify', 'product').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='product', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='product_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}