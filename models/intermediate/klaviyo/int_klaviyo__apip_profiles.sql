{{
    config(
        materialized='table'
    )
}}

WITH DATA AS (
SELECT 
	ID,
    Anonymous_ID,
    Email,
    External_ID, 
    Created,
    Updated,
    First_Name,
    Last_Name,
    Last_Event_Date,
    Phone_Number,
    Address1,
    Address2,
    City,
    Country,
    Latitude,
    Longitude,
    TimeZone,
    Zip,
    Consent,
    Consent_TimeStamp,
    Consent_Version,
    Source,
    Method_ID,
    Method_Type,
    Event_ID,
    Source_Code,
    Shopify_Tags,
    Accepts_Marketing,
    First_Purchase_Date,
    Formatted_First_Purchase_Date,
    DUE_Date,
    Formatted_Due_Date,
	trim(lower(REGION)) AS REGION,
    SOURCE_RELATION
FROM {{ref("stg_klaviyo__apip_profiles")}}
),
mapper AS 
(
	SELECT 
		trim(lower(STATE_ABBR)) AS STATE_ABBR,
		trim(lower(STATE)) AS STATE
	FROM {{ref("geo_location")}}
	GROUP BY 1,2
)
SELECT 
	a.id, 
	a.region, 
	a.Anonymous_ID,
    a.Email,
    a.External_ID, 
    a.Created,
    a.Updated,
    a.First_Name,
    a.Last_Name,
    a.Last_Event_Date,
    a.Phone_Number,
    a.Address1,
    a.Address2,
    a.City,
    a.Country,
    a.Latitude,
    a.Longitude,
    a.TimeZone,
    a.Zip,
    a.Consent,
    a.Consent_TimeStamp,
    a.Consent_Version,
    a.Source,
    a.Method_ID,
    a.Method_Type,
    a.Event_ID,
    a.Source_Code,
    a.Shopify_Tags,
    a.Accepts_Marketing,
    a.First_Purchase_Date,
    a.Formatted_First_Purchase_Date,
    a.DUE_Date,
    a.Formatted_Due_Date,
	b.STATE_ABBR AS REGION_ID, 
	COALESCE(b.state, a.region) AS region_new,
    SOURCE_RELATION
FROM DATA AS a
LEFT JOIN  mapper AS B 
ON a.region = b.STATE_ABBR
OR a.region =b.state
