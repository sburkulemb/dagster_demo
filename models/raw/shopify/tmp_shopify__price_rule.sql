{%- set source_relation = adapter.get_relation(
        database=source('shopify', 'price_rule').database,
        schema=source('shopify', 'price_rule').schema,
        identifier=source('shopify', 'price_rule').name) -%}

{{
    fivetran_utils.union_data(
        table_identifier='price_rule', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='price_rule_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}