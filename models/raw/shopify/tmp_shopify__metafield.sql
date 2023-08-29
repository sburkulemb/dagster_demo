{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'metafield').database,
        schema=source('shopify', 'metafield').schema,
        identifier=source('shopify', 'metafield').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='metafield', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='metafield_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}