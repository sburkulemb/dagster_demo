/***********************************************************************************************
	Author       : Muskan Gavasekar
	Created Date : 21-07-2023
	Version      : 1.0
	Linear		 : ANA-54
	Description  : Viacord Mat+Hatch Partnership Feed
************************************************************************************************/

WITH mh_data AS (
	SELECT 
		FIRST_NAME,
		LAST_NAME ,
		EMAIL ,
		DUE_DATE ,
		ADDRESS_1 ,
		ADDRESS_2 ,
		CITY ,
		STATE_ABBREVIATION ,
		FORMATTED_ZIP_FIVE ,
		FORMATTED_PHONE_NUMBER ,
		3 AS source_filter
	FROM {{ref("due_date_mh")}}
	WHERE DUE_DATE BETWEEN current_date() AND dateadd(month,12,current_date())
	AND COUNTRY_CODE = 'US'
	AND COMPLETE_RECORD = 1
),
hatch_data AS (
SELECT 
		FIRST_NAME,
		LAST_NAME ,
		EMAIL ,
		DUE_DATE ,
		ADDRESS_1 ,
		ADDRESS_2 ,
		CITY ,
		STATE_ABBREVIATION ,
		FORMATTED_ZIP_FIVE ,
		FORMATTED_PHONE_NUMBER ,
		1 AS source_filter
	FROM {{ref("due_date_hatch")}}
	WHERE DUE_DATE BETWEEN current_date() AND dateadd(month,12,current_date())
	AND COUNTRY_CODE = 'US'
	AND COMPLETE_RECORD = 1
	AND SELLABLE = 1
),
apip_data AS ( 
	SELECT 
	    FIRST_NAME,
		LAST_NAME ,
		EMAIL ,
		DUE_DATE ,
		ADDRESS_1 ,
		ADDRESS_2 ,
		CITY ,
		STATE_ABBREVIATION ,
		FORMATTED_ZIP_FIVE ,
		FORMATTED_PHONE_NUMBER ,
		2 AS source_filter
	FROM {{ref("due_date_apip")}}
	WHERE DUE_DATE BETWEEN current_date() AND dateadd(month,12,current_date())
    AND COUNTRY_CODE = 'US'
	AND COMPLETE_RECORD = 1
),
union_data AS (
	SELECT * FROM mh_data
	UNION
	SELECT * FROM hatch_data
	UNION
	SELECT * FROM apip_data),
filt_email AS (
	SELECT 
		* 
	FROM (
		SELECT
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
Viacord_data AS (
	SELECT
		a.* exclude(source_filter)
	FROM filt_data AS a),
Viacord_Formatted AS (
	SELECT
	    FIRST_NAME AS "First Name", 
	    LAST_NAME AS "Last Name",
		EMAIL AS "Email Address",
		TO_CHAR(DUE_DATE, 'MM/DD/YYYY') || ' 0:00' AS "Due Date",
		ADDRESS_1 AS "Address ",
	    ADDRESS_2 AS "Address 2",
	    CITY AS  "City",
		STATE_ABBREVIATION  AS "State",
		FORMATTED_ZIP_FIVE AS "Zip Code",
        FORMATTED_PHONE_NUMBER AS "Phone Number"
	FROM Viacord_data
	WHERE EMAIL IS NOT NULL
    AND EMAIL NOT IN (SELECT EMAIL  FROM ANALYTICS.DBT_MGAVASEKAR_ANA_PARTNERSHIP.VIACORD )
    AND EMAIL NOT IN (SELECT EMAIL FROM ANALYTICS.ANALYTICS_STG_PARTNERSHIPS.LEXER__EXCLUSION_LIST__VIACORD)
    AND STATE_ABBREVIATION NOT IN ('PR','AA','AP','VI','AE','NULL'))
SELECT * FROM Viacord_Formatted
