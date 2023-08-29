{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'tax_line').database,
        schema=source('shopify', 'tax_line').schema,
        identifier=source('shopify', 'tax_line').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='tax_line', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='tax_line_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}