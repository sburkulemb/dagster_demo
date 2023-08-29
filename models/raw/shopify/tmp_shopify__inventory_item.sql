{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'inventory_item').database,
        schema=source('shopify', 'inventory_item').schema,
        identifier=source('shopify', 'inventory_item').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='inventory_item', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='inventory_item_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}