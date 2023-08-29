/************************************************************************************************
	Author       : Ranjeet Kashid
	Created Date : 18-07-2023
	Version      : 1.1
	Linear   	 : ANA-53
	Description  : Similac Mat+Hatch+APIP Partnership Feed
************************************************************************************************/

WITH 
mh_data AS (
	SELECT 
		"FIRST_NAME" ,
		"LAST_NAME" ,
		"ADDRESS_1" ,
		"ADDRESS_2" ,
		"CITY" ,
		"STATE_ABBREVIATION" ,
		"FORMATTED_ZIP_NINE" ,
		"EMAIL" ,
		"DUE_DATE" ,
		1 AS source_code_new,
		3 AS source_filter
	FROM {{ref("due_date_mh")}}
	WHERE COMPLETE_RECORD  = 1
	AND COUNTRY_CODE = 'US'
	AND DUE_DATE BETWEEN current_date() AND dateadd(month,12,current_date())),

hatch_data AS (
	SELECT 
		"FIRST_NAME" ,
		"LAST_NAME" ,
		"ADDRESS_1" ,
		"ADDRESS_2" ,
		"CITY" ,
		"STATE_ABBREVIATION" ,
		"FORMATTED_ZIP_NINE" ,
		"EMAIL" ,
		"DUE_DATE" ,
		2 AS source_code_new,
		1 AS source_filter
	FROM {{ref("due_date_hatch")}}
	WHERE "SELLABLE" = 1 
	AND COMPLETE_RECORD = 1
	AND COUNTRY_CODE = 'US'
	AND DUE_DATE BETWEEN current_date() AND dateadd(month,12,current_date())),

apip_data AS ( 
	SELECT 
		"FIRST_NAME" ,
		"LAST_NAME" ,
		"ADDRESS_1" ,
		"ADDRESS_2" ,
		"CITY" ,
		"STATE_ABBREVIATION" ,
		"FORMATTED_ZIP_NINE" ,
		"EMAIL" ,
		"DUE_DATE" ,
		1 AS source_code_new,
		2 AS source_filter
	FROM {{ref("due_date_apip")}}
	WHERE COMPLETE_RECORD = 1
	AND COUNTRY_CODE = 'US'
	AND DUE_DATE BETWEEN current_date() AND dateadd(month,12,current_date())),

union_data AS (
	SELECT * FROM mh_data
	UNION
	SELECT * FROM hatch_data
	UNION
	SELECT * FROM apip_data),

filt_email AS (
	SELECT 
		* 
	FROM (SELECT
			EMAIL ,
			DUE_DATE ,
			source_filter,
			RANK() OVER (PARTITION BY email ORDER BY (DUE_DATE,source_filter) DESC) AS ranking 
		FROM union_data) 
	WHERE ranking = 1),

filt_data AS (
	SELECT
		a.*
	FROM union_data AS a
	JOIN filt_email AS b
	ON a.EMAIL = b.EMAIL 
	AND a.DUE_DATE = b.DUE_DATE
	AND a.source_filter = b.source_filter),

similac_data AS (
	SELECT
        FIRST_NAME AS "Fname",
        LAST_NAME AS "Lname",
        ADDRESS_1 AS "Address1",
        ADDRESS_2 AS "Address2",
        CITY AS "City",
		STATE_ABBREVIATION AS "State",
		FORMATTED_ZIP_NINE AS "Zip",
		EMAIL AS "Email",
		REPLACE(TO_VARCHAR(DUE_DATE), '-', '') AS "MothersDueDate",
		NULL AS "MothersDateofBirth",
		source_code_new AS "Source Code"
	FROM filt_data
    where EMAIL IS NOT NULL
    AND EMAIL NOT IN (SELECT EMAIL 
                            FROM ANALYTICS.DBT_RKASHID_ANA_PARTNERSHIP.SIMILAC_DESTINATIONMATERNITY_LIST)
    AND EMAIL NOT IN (SELECT EMAIL
							FROM ANALYTICS.ANALYTICS_STG_PARTNERSHIPS.LEXER__EXCLUSION_LIST__SIMILAC)
    AND STATE_ABBREVIATION IS NOT NULL
    AND STATE_ABBREVIATION NOT IN ('PR','AA','AP','VI','AE'))

SELECT * FROM similac_data