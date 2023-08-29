{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'collection').database,
        schema=source('shopify', 'collection').schema,
        identifier=source('shopify', 'collection').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='collection', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='collection_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}