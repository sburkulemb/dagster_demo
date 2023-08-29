{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'product_tag').database,
        schema=source('shopify', 'product_tag').schema,
        identifier=source('shopify', 'product_tag').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='product_tag', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='product_tag_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}