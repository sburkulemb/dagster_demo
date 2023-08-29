{{
    config(
        materialized='incremental',
        unique_key='global_customer_id'
    )
}}

WITH shopify_data AS (
	select 
		lower(trim("EMAIL")) AS email,
	    max(case when "SOURCE_RELATION"  = 'shopify_apip' then "CUSTOMER_ID" else NULL end) as shp_apip_customer_id,
	    max(case when "SOURCE_RELATION"  = 'shopify_martha' then "CUSTOMER_ID" else NULL end) as shp_martha_customer_id,
	    max(case when "SOURCE_RELATION"  = 'shopify_bodyglove' then "CUSTOMER_ID" else NULL end) as shp_bodyglove_customer_id,
	    max(case when "SOURCE_RELATION"  = 'assc_shopify' then "CUSTOMER_ID" else NULL end) as shp_assc_customer_id,
	    max(case when "SOURCE_RELATION"  = 'shopify_dakine' then "CUSTOMER_ID" else NULL end) as shp_dakine_customer_id,
	    max(case when "SOURCE_RELATION"  = 'shopify_hatch' then "CUSTOMER_ID" else NULL end) as shp_hatch_customer_id,
	    max(case when "SOURCE_RELATION"  = 'bcbg_shopify' then "CUSTOMER_ID" else NULL end) as shp_bcbg_customer_id,
	    max(case when "SOURCE_RELATION"  = 'shopify_ben' then "CUSTOMER_ID" else NULL end) as shp_ben_customer_id,   
	    max(case when "SOURCE_RELATION"  = 'shopify_bruno' then "CUSTOMER_ID" else NULL end) as shp_bruno_customer_id,    
	    max(case when "SOURCE_RELATION"  = 'shopify_mh' then "CUSTOMER_ID" else NULL end) as shp_mh_customer_id,
	    max("UPDATED_TIMESTAMP") AS shp_updated_timestamp
	from {{ref("shopify__orders")}}
	WHERE "EMAIL" IS NOT NULL AND "EMAIL" <> ''
	group by 1),

klaviyo_apip_data AS (
	SELECT 
		lower(trim(EMAIL)) AS "EMAIL",
		"ID" AS klv_apip_customer_id,
        Updated AS klv_apip_updated_timestamp
	FROM {{ref("int_klaviyo__apip_profiles")}} as a
    WHERE "CREATED" = (SELECT max("CREATED") FROM {{ref("int_klaviyo__apip_profiles")}} WHERE "EMAIL" = a."EMAIL")
    AND "EMAIL" IS NOT NULL AND "EMAIL" <> ''),

klaviyo_mh_data AS (
	SELECT 
		lower(trim(EMAIL)) AS "EMAIL",
		"ID" AS klv_mh_customer_id,
        Updated as klv_mh_updated_timestamp
	FROM {{ref("int_klaviyo__mh_profiles")}} as a
    WHERE "CREATED" = (SELECT max("CREATED") FROM {{ref("int_klaviyo__mh_profiles")}} WHERE "EMAIL" = a."EMAIL")
    AND "EMAIL" IS NOT NULL AND "EMAIL" <> ''),

klaviyo_hatch_data AS (
	SELECT 
		lower(trim(EMAIL)) AS "EMAIL",
		"ID" AS klv_hatch_customer_id,
        Updated as klv_hatch_updated_timestamp
	FROM {{ref("int_klaviyo__hatch_profiles")}} as a
    WHERE "CREATED" = (SELECT max("CREATED") FROM {{ref("int_klaviyo__hatch_profiles")}} WHERE "EMAIL" = a."EMAIL")
    AND "EMAIL" IS NOT NULL AND "EMAIL" <> ''),

email_data AS (
	SELECT "EMAIL"  FROM shopify_data
	UNION 
	SELECT "EMAIL"  FROM klaviyo_apip_data
	UNION 
	SELECT "EMAIL"  FROM klaviyo_mh_data
	UNION
	SELECT "EMAIL"  FROM klaviyo_hatch_data),

dim_customers AS (
	SELECT
        md5(lower(trim(a.email))) as global_customer_id,
        a.email,
        b.shp_apip_customer_id,
        b.shp_martha_customer_id,
        b.shp_bodyglove_customer_id,
        b.shp_assc_customer_id,
        b.shp_dakine_customer_id,
        b.shp_hatch_customer_id,
        b.shp_bcbg_customer_id,
        b.shp_ben_customer_id,   
        b.shp_bruno_customer_id,    
        b.shp_mh_customer_id,
        c.klv_apip_customer_id,
        dd.klv_mh_customer_id,
        e.klv_hatch_customer_id,
        greatest(COALESCE(b.shp_updated_timestamp,c.klv_apip_updated_timestamp,
            dd.klv_mh_updated_timestamp,e.klv_hatch_updated_timestamp),
        COALESCE(c.klv_apip_updated_timestamp,dd.klv_mh_updated_timestamp,
            e.klv_hatch_updated_timestamp,b.shp_updated_timestamp),
        COALESCE(dd.klv_mh_updated_timestamp,e.klv_hatch_updated_timestamp,
            b.shp_updated_timestamp,c.klv_apip_updated_timestamp),
        COALESCE(e.klv_hatch_updated_timestamp,b.shp_updated_timestamp,
            c.klv_apip_updated_timestamp,dd.klv_mh_updated_timestamp)) AS updated_at
	FROM email_data AS a
	LEFT JOIN shopify_data AS b
	ON a.email = b.email
	LEFT JOIN klaviyo_apip_data AS c 
	ON a.email = c.email
	LEFT JOIN klaviyo_mh_data AS dd
	ON a.email = dd.email
	LEFT JOIN klaviyo_hatch_data AS e
	ON a.email = e.email)

SELECT * FROM dim_customers 

{% if is_incremental() %}

where
  updated_at > (select max(updated_at) from {{ this }})

{% endif %}