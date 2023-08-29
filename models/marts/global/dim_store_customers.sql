
WITH latest_orders AS (
    SELECT 
        CUSTOMER_ID ,
        min(ORDER_ID) as first_order_id,
        max(ORDER_ID) AS recent_order_id
    FROM {{ref("shopify__orders")}}
    where CUSTOMER_ID IS NOT NULL AND EMAIL IS NOT NULL AND EMAIL <> ''
    GROUP BY 1),

cust_latest_details AS (
    SELECT 
        ORDER_ID ,
        BILLING_ADDRESS_NAME  AS full_name,
        BILLING_ADDRESS_FIRST_NAME AS first_name,
        BILLING_ADDRESS_LAST_NAME AS last_name,
        BILLING_ADDRESS_ADDRESS_1 AS address_1,
        BILLING_ADDRESS_ADDRESS_2 AS address_2,
        BILLING_ADDRESS_CITY AS city,
        BILLING_ADDRESS_PROVINCE AS state,
        BILLING_ADDRESS_ZIP AS zipcode,
        BILLING_ADDRESS_COUNTRY AS country,
        EMAIL,
        null AS date_of_birth,
        null AS inferred_gender,
        null AS gender,
        SOURCE_RELATION,
        BILLING_ADDRESS_PHONE AS phone_number
    FROM {{ref("shopify__orders")}}),

cust_agg_details AS (
    SELECT 
        CUSTOMER_ID,
        ROUND(sum(SUBTOTAL_PRICE),2) AS total_spend,
        ROUND(sum(SUBTOTAL_PRICE),2) AS total_online_spend,
        null AS total_retail_spend,
        count(DISTINCT ORDER_ID) AS total_orders,
        min(PROCESSED_TIMESTAMP) AS date_of_first_order,
        max(PROCESSED_TIMESTAMP) AS date_of_last_order,
        null AS first_order_channel,
        null AS last_order_channel,
        TO_VARCHAR(DATE_TRUNC('MONTH', min(PROCESSED_TIMESTAMP)), 'YYYY-MM') AS month_cohort,
        YEAR(min(PROCESSED_TIMESTAMP)) AS year_cohort,
        YEAR(min(PROCESSED_TIMESTAMP))||'-'||WEEK(min(PROCESSED_TIMESTAMP)) as week_cohort,
        YEAR(min(PROCESSED_TIMESTAMP))||'-'||QUARTER(min(PROCESSED_TIMESTAMP)) as quarter_cohort,
        ROUND((sum(SUBTOTAL_PRICE) / count(DISTINCT ORDER_ID)),2) AS average_order_value
    FROM {{ref("shopify__orders")}}
    GROUP BY 1),

cust_last_24_months_details AS (
    SELECT 
        CUSTOMER_ID,
        ROUND(sum(SUBTOTAL_PRICE),2) AS total_spend_last_24,
        COUNT(DISTINCT ORDER_ID) AS total_orders_last_24
    FROM {{ref("shopify__orders")}}
    WHERE PROCESSED_TIMESTAMP BETWEEN dateadd(month,-24,current_date()) AND current_date()
    GROUP BY 1),

customer_table AS (
    SELECT 
        lo.customer_id AS shopify_customer_id,
        lo.first_order_id,
        lo.recent_order_id,
        cld. full_name,
        cld.first_name,
        cld.last_name,
        case when cld.address_1 = '' then null else cld.address_1 end as address_1,
        case when cld.address_2 = '' then null else cld.address_2 end as address_2,
        case when cld.city = '' then null else cld.city end as city,
        case when cld.state = '' then null else cld.state end as state,
        case when cld.zipcode = '' then null else cld.zipcode end as zipcode,
        case when cld.country = '' then null else cld.country end as country,
        case when cld.email = '' then null else cld.email end as email,
        cld.date_of_birth,
        cld.inferred_gender,
        cld.gender,
        cagd.total_spend,
        cagd.total_online_spend,
        cagd.total_retail_spend,
        cagd.total_orders,
        cagd.date_of_first_order,
        cagd.date_of_last_order,
        cagd.first_order_channel,
        cagd.last_order_channel,
        cld.SOURCE_RELATION,
        cagd.year_cohort,
        cagd.quarter_cohort,
        cagd.month_cohort,
        cagd.week_cohort,
        cagd.average_order_value,
        case when cld.phone_number = '' then null else cld.phone_number end as phone_number,
        zeroifnull(cl24d.total_spend_last_24) as total_spend_last_24,
        zeroifnull(cl24d.total_orders_last_24) as total_orders_last_24
    FROM latest_orders AS lo
    LEFT JOIN cust_latest_details AS cld 
    ON lo.recent_order_id = cld.ORDER_ID
    LEFT JOIN cust_agg_details AS cagd 
    ON lo.CUSTOMER_ID = cagd.CUSTOMER_ID
    LEFT JOIN cust_last_24_months_details AS cl24d
    ON lo.CUSTOMER_ID = cl24d.CUSTOMER_ID),

klv_apip_data AS (
	SELECT 
		"ID"  as klaviyo_customer_id,
		"EMAIL" ,
		"CREATED" AS email_acquired_date,
		'shopify_apip' AS "SOURCE_RELATION" 
	FROM {{ref("int_klaviyo__apip_profiles")}} AS a
	WHERE "CREATED" = (SELECT max("CREATED") FROM {{ref("int_klaviyo__apip_profiles")}} WHERE "EMAIL" = a."EMAIL")),

klv_mh_data AS (
	SELECT 
		"ID" as klaviyo_customer_id ,
		"EMAIL" ,
		"CREATED" AS email_acquired_date,
		'shopify_mh' AS "SOURCE_RELATION" 
	FROM {{ref("int_klaviyo__mh_profiles")}} AS a
	WHERE "CREATED" = (SELECT max("CREATED") FROM {{ref("int_klaviyo__mh_profiles")}} WHERE "EMAIL" = a."EMAIL")),

klv_hatch_data AS (
	SELECT 
		"ID" as klaviyo_customer_id ,
		"EMAIL" ,
		"CREATED" AS email_acquired_date,
		'shopify_hatch' AS "SOURCE_RELATION" 
	FROM {{ref("int_klaviyo__hatch_profiles")}} AS a
	WHERE "CREATED" = (SELECT max("CREATED") FROM {{ref("int_klaviyo__hatch_profiles")}} WHERE "EMAIL" = a."EMAIL")),

email_date_data AS (
	SELECT  * FROM klv_apip_data
	UNION 
	SELECT  * FROM klv_mh_data
	UNION
	SELECT  * FROM klv_hatch_data),

final_data AS (
	SELECT
        md5(lower(trim(a.email))) as global_customer_id,
        a.shopify_customer_id,
        b.klaviyo_customer_id,
        a.email,
        a.source_relation,
        a.* exclude (shopify_customer_id,email,source_relation) ,
        b.email_acquired_date
	FROM customer_table AS a
	LEFT JOIN email_date_data AS b
	ON a.email = b.email AND a.source_relation = b.source_relation)

SELECT * FROM final_data