{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'location').database,
        schema=source('shopify', 'location').schema,
        identifier=source('shopify', 'location').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='location', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='location_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}