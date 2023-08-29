{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'customer_tag').database,
        schema=source('shopify', 'customer_tag').schema,
        identifier=source('shopify', 'customer_tag').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='customer_tag', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='customer_tag_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}