/************************************************************************************************
	Author       : Muskan Gavasekar
	Created Date : 19-07-2023
	Version      : 1.0
	Linear   	 : ANA-48
	Description  : Develop Lovevery Integration for Maternity/APIP based off the Specifications In Feed Requirements Sheet
************************************************************************************************/

WITH Apip_data AS (
SELECT 
	FIRST_NAME , 
	LAST_NAME ,
	ADDRESS_1 ,
	ADDRESS_2 ,
	CITY ,
	STATE_ABBREVIATION ,
	FORMATTED_ZIP_NINE ,
	EMAIL ,
	DUE_DATE,
	1 AS source_filter
FROM {{ref("due_date_apip")}}
WHERE DUE_DATE <= ADD_MONTHS(CURRENT_DATE,12)
AND DUE_DATE >= ADD_MONTHS(CURRENT_DATE,-3)
AND COMPLETE_RECORD = 1
AND COUNTRY_CODE = 'US'
),
motherhood_data AS (
SELECT 
	FIRST_NAME , 
	LAST_NAME ,
	ADDRESS_1 ,
	ADDRESS_2 ,
	CITY ,
	STATE_ABBREVIATION ,
	FORMATTED_ZIP_NINE ,
	EMAIL ,
	DUE_DATE,
	2 AS source_filter
FROM {{ref("due_date_mh")}}
WHERE DUE_DATE <= ADD_MONTHS(CURRENT_DATE,12)
AND DUE_DATE >= ADD_MONTHS(CURRENT_DATE,-3)
AND COMPLETE_RECORD = 1
AND COUNTRY_CODE = 'US'
),
union_data AS (
	   SELECT * FROM Apip_data 
	   UNION
	   SELECT * FROM motherhood_data),
filter_email AS (
	SELECT * FROM (
	SELECT
		EMAIL ,
		DUE_DATE ,
		source_filter,
		RANK() OVER (PARTITION BY email ORDER BY (DUE_DATE,source_filter) DESC) AS ranking 
	FROM union_data) WHERE ranking = 1),
filter_data AS (
	SELECT
		a.*
	FROM union_data AS a
	JOIN filter_email AS b
	ON a.EMAIL = b.EMAIL AND a.DUE_DATE = b.DUE_DATE AND a.source_filter = b.source_filter),
lovevery_maternity AS (
SELECT
	FIRST_NAME AS "First Name", 
	LAST_NAME AS "Last Name",
	ADDRESS_1 AS "Address 1",
	ADDRESS_2 AS "Address 2",
	CITY AS "City",
	STATE_ABBREVIATION AS "State" ,
	FORMATTED_ZIP_NINE AS "Zip" ,
	EMAIL AS "Email",
	REPLACE(TO_VARCHAR(DUE_DATE), '-', '/') AS "Due Date"
FROM filter_data AS a
where EMAIL IS NOT NULL
AND EMAIL NOT IN (SELECT EMAIL FROM ANALYTICS.DBT_MGAVASEKAR_ANA_PARTNERSHIP.LOVEVERY_MATERNITY)
AND EMAIL NOT IN (SELECT EMAIL FROM ANALYTICS.ANALYTICS_STG_PARTNERSHIPS.LEXER__EXCLUSION_LIST__LOVEVERY)
AND STATE_ABBREVIATION NOT IN ('PR','AA','AP','VI','AE','NULL'))
SELECT * FROM lovevery_maternity