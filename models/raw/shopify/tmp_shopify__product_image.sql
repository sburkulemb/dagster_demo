{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'product_image').database,
        schema=source('shopify', 'product_image').schema,
        identifier=source('shopify', 'product_image').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='product_image', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='product_image_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}