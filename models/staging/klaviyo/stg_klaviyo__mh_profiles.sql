{{
	config(
		alias = "stg_klaviyo__mh_profiles"
	)
}}

WITH stg_klaviyo__mh_profiles AS
(
    SELECT ID ,
ATTRIBUTES:anonymous_id::varchar  AS Anonymous_ID,
ATTRIBUTES:email::varchar AS Email,
ATTRIBUTES:external_id::varchar AS External_ID, 
ATTRIBUTES:created::DATETIME  AS Created,
ATTRIBUTES:updated::DATETIME  AS Updated,
ATTRIBUTES:first_name::varchar AS First_Name,
ATTRIBUTES:last_name::varchar AS Last_Name,
ATTRIBUTES:last_event_date::DATETIME  AS Last_Event_Date,
ATTRIBUTES:organization::varchar AS Organization ,
ATTRIBUTES:phone_number::varchar AS Phone_Number,
ATTRIBUTES:location:address1::varchar AS Address1,
ATTRIBUTES:location:address2::varchar AS Address2,
ATTRIBUTES:location:city::varchar AS City,
ATTRIBUTES:location:country::varchar  AS Country ,
ATTRIBUTES:location:latitude::varchar  AS Latitude,
ATTRIBUTES:location:longitude::varchar  AS Longitude ,
ATTRIBUTES:location:region::varchar  AS Region  ,
ATTRIBUTES:location:timezone::varchar  AS TimeZone ,
ATTRIBUTES:location:zip::varchar  AS Zip,
ATTRIBUTES:properties:"$consent"::varchar  AS Consent,
TRY_CAST(ATTRIBUTES:properties:"$consent_timestamp"::STRING  AS DATETIME) AS Consent_Timestamp,
ATTRIBUTES:properties:"$consent_version"::varchar AS Consent_Version,
ATTRIBUTES:properties:"$source"::varchar  AS Source,
ATTRIBUTES:properties:"$source_code"::varchar  AS Source_Code,
ATTRIBUTES:properties:"$method_id"::varchar AS Method_ID,
ATTRIBUTES:properties:"$method_type"::varchar AS Method_Type,
ATTRIBUTES:properties:"$event_id"::varchar AS Event_ID,
ATTRIBUTES:properties:"Accepts Marketing"::varchar  AS Accepts_Marketing ,
ATTRIBUTES:properties:"Shopify Tags"::varchar  AS Shopify_Tags,
ATTRIBUTES:properties:"First Purchase Date"::STRING  AS First_Purchase_Date,
CASE
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM/DD/YYYY') IS NOT NULL AND YEAR(TRY_TO_DATE(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM/DD/YYYY')) > 1000 THEN TRY_TO_DATE(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM/DD/YYYY')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY/MM/DD') IS NOT NULL AND YEAR(TRY_TO_DATE(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY/MM/DD')) > 1000 THEN TRY_TO_DATE(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY/MM/DD')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DD') IS NOT NULL AND YEAR(TRY_TO_DATE(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DD')) > 1000 THEN TRY_TO_DATE(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DD')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM/DD/YYYY HH:MI:SS') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM/DD/YYYY HH:MI:SS')) > 1000 THEN TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM/DD/YYYY HH:MI:SS')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY/MM/DD HH:MI:SS') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY/MM/DD HH:MI:SS')) > 1000 THEN TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY/MM/DD HH:MI:SS')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DDTHH:MI:SS') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DDTHH:MI:SS')) > 1000 THEN TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DDTHH:MI:SS')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM-DD-YYYY') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM-DD-YYYY')) > 1000 THEN TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM-DD-YYYY')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM-DD-YY') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM-DD-YYYY')) > 1000 THEN TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM-DD-YYYY')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DDTHH:MI:SSZ') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DDTHH:MI:SSZ')) > 1000 THEN TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DDTHH:MI:SSZ')
		WHEN TRY_TO_DATE(LEFT(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		10),
		'YYYY-MM-DD') IS NOT NULL AND YEAR(TRY_TO_DATE( LEFT(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		10),
		'YYYY-MM-DD')) > 1000 THEN TRY_TO_DATE( LEFT(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		10),
		'YYYY-MM-DD')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM/DD/YYYY') IS NOT NULL AND YEAR(TRY_TO_DATE(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM/DD/YYYY')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM/DD/YYYY'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY/MM/DD') IS NOT NULL AND YEAR(TRY_TO_DATE(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY/MM/DD')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY/MM/DD'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DD') IS NOT NULL AND YEAR(TRY_TO_DATE(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DD')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DD'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM/DD/YYYY HH:MI:SS') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM/DD/YYYY HH:MI:SS')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM/DD/YYYY HH:MI:SS'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY/MM/DD HH:MI:SS') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY/MM/DD HH:MI:SS')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY/MM/DD HH:MI:SS'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DDTHH:MI:SS') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DDTHH:MI:SS')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DDTHH:MI:SS'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM-DD-YYYY') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM-DD-YYYY')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM-DD-YYYY'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM-DD-YY') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM-DD-YYYY')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'MM-DD-YYYY'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DDTHH:MI:SSZ') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DDTHH:MI:SSZ')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( ATTRIBUTES:properties:"First Purchase Date"::STRING,
		'YYYY-MM-DDTHH:MI:SSZ'))
		WHEN TRY_TO_DATE(LEFT(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		10),
		'YYYY-MM-DD') IS NOT NULL AND YEAR(TRY_TO_DATE( LEFT(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		10),
		'YYYY-MM-DD')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( LEFT(ATTRIBUTES:properties:"First Purchase Date"::STRING,
		10),
		'YYYY-MM-DD'))
		ELSE NULL END AS Formatted_First_Purchase_Date,
ATTRIBUTES:properties:"Due Date"::STRING AS Due_Date,
CASE
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'MM/DD/YYYY') IS NOT NULL AND YEAR(TRY_TO_DATE(ATTRIBUTES:properties:"Due Date"::STRING,
		'MM/DD/YYYY')) > 1000 THEN TRY_TO_DATE(ATTRIBUTES:properties:"Due Date"::STRING,
		'MM/DD/YYYY')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY/MM/DD') IS NOT NULL AND YEAR(TRY_TO_DATE(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY/MM/DD')) > 1000 THEN TRY_TO_DATE(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY/MM/DD')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DD') IS NOT NULL AND YEAR(TRY_TO_DATE(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DD')) > 1000 THEN TRY_TO_DATE(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DD')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'MM/DD/YYYY HH:MI:SS') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'MM/DD/YYYY HH:MI:SS')) > 1000 THEN TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'MM/DD/YYYY HH:MI:SS')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY/MM/DD HH:MI:SS') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY/MM/DD HH:MI:SS')) > 1000 THEN TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY/MM/DD HH:MI:SS')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DDTHH:MI:SS') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DDTHH:MI:SS')) > 1000 THEN TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DDTHH:MI:SS')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'MM-DD-YYYY') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'MM-DD-YYYY')) > 1000 THEN TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'MM-DD-YYYY')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'MM-DD-YY') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'MM-DD-YYYY')) > 1000 THEN TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'MM-DD-YYYY')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DDTHH:MI:SSZ') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DDTHH:MI:SSZ')) > 1000 THEN TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DDTHH:MI:SSZ')
		WHEN TRY_TO_DATE(LEFT(ATTRIBUTES:properties:"Due Date"::STRING,
		10),
		'YYYY-MM-DD') IS NOT NULL AND YEAR(TRY_TO_DATE( LEFT(ATTRIBUTES:properties:"Due Date"::STRING,
		10),
		'YYYY-MM-DD')) > 1000 THEN TRY_TO_DATE( LEFT(ATTRIBUTES:properties:"Due Date"::STRING,
		10),
		'YYYY-MM-DD')
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'MM/DD/YYYY') IS NOT NULL AND YEAR(TRY_TO_DATE(ATTRIBUTES:properties:"Due Date"::STRING,
		'MM/DD/YYYY')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE(ATTRIBUTES:properties:"Due Date"::STRING,
		'MM/DD/YYYY'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY/MM/DD') IS NOT NULL AND YEAR(TRY_TO_DATE(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY/MM/DD')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY/MM/DD'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DD') IS NOT NULL AND YEAR(TRY_TO_DATE(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DD')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DD'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'MM/DD/YYYY HH:MI:SS') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'MM/DD/YYYY HH:MI:SS')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'MM/DD/YYYY HH:MI:SS'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY/MM/DD HH:MI:SS') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY/MM/DD HH:MI:SS')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY/MM/DD HH:MI:SS'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DDTHH:MI:SS') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DDTHH:MI:SS')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DDTHH:MI:SS'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'MM-DD-YYYY') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'MM-DD-YYYY')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'MM-DD-YYYY'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'MM-DD-YY') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'MM-DD-YYYY')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'MM-DD-YYYY'))
		WHEN TRY_TO_TIMESTAMP(ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DDTHH:MI:SSZ') IS NOT NULL AND YEAR(TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DDTHH:MI:SSZ')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( ATTRIBUTES:properties:"Due Date"::STRING,
		'YYYY-MM-DDTHH:MI:SSZ'))
		WHEN TRY_TO_DATE(LEFT(ATTRIBUTES:properties:"Due Date"::STRING,
		10),
		'YYYY-MM-DD') IS NOT NULL AND YEAR(TRY_TO_DATE( LEFT(ATTRIBUTES:properties:"Due Date"::STRING,
		10),
		'YYYY-MM-DD')) < 1000 THEN DATEADD( year,2000, TRY_TO_DATE( LEFT(ATTRIBUTES:properties:"Due Date"::STRING,
		10),
		'YYYY-MM-DD'))
		ELSE NULL END AS Formatted_Due_Date,
		'klaviyo_mh' AS SOURCE_RELATION
        FROM {{ source("raw_klaviyo__mh", "profiles") }}

)
SELECT * FROM stg_klaviyo__mh_profiles