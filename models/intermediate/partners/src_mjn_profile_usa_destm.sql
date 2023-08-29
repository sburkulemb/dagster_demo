/***********************************************************************************************
	Author       : Muskan Gavasekar
	Created Date : 27-07-2023
	Version      : 1.0
	Linear		 : ANA-58
	Description  : Develop MJN Feed for Maternity
************************************************************************************************/

WITH Apip_data AS (
SELECT 
FIRST_NAME,
LAST_NAME,
ADDRESS_1 ,
ADDRESS_2 ,
CITY ,
STATE_ABBREVIATION ,
FORMATTED_ZIP_NINE ,
DUE_DATE ,
EMAIL,
FORMATTED_PHONE_NUMBER ,
1 AS source_filter
FROM {{ref("due_date_apip")}}
WHERE DUE_DATE BETWEEN dateadd(month,-4,current_date()) AND dateadd(month,12,current_date())
AND COMPLETE_RECORD = 1
AND COUNTRY_CODE = 'US'
),
motherhood_data AS (
SELECT 
FIRST_NAME,
LAST_NAME,
ADDRESS_1 ,
ADDRESS_2 ,
CITY ,
STATE_ABBREVIATION ,
FORMATTED_ZIP_NINE ,
DUE_DATE ,
EMAIL,
FORMATTED_PHONE_NUMBER ,
2 AS source_filter
FROM {{ref("due_date_mh")}} 
WHERE DUE_DATE BETWEEN dateadd(month,-4,current_date()) AND dateadd(month,12,current_date())
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
Response_Media AS (
SELECT
	FIRST_NAME AS "name_first", 
	NULL AS "name_middle",
	LAST_NAME AS "name_last",
	NULL AS "name_suffix",
	ADDRESS_1 AS "parent_addr1",
	ADDRESS_2 AS "parent_addr2",
	CITY AS "city",
	STATE_ABBREVIATION AS "state" ,
	FORMATTED_ZIP_NINE AS "postal_code",
	TO_VARCHAR(DUE_DATE, 'MM/DD/YYYY') AS "child_birth_date",
	'426'AS "file_cd",
    'MW104'AS "src_id",
    TO_VARCHAR(CURRENT_DATE,'MM/DD/YYYY') AS "rcv_date",
	EMAIL AS "email_address",
	FORMATTED_PHONE_NUMBER AS "phone_number",
	NULL AS "tot_other_child",
	NULL AS "wic_status",
	NULL AS "email_optout_fl",
	NULL AS "mail_optout_fl",
	NULL AS "phone_optout_fl",
	NULL AS "mkt_consent_fl",
	NULL AS "feed_brand",
	NULL AS "feed_method",
	NULL AS "hospital_name",
	NULL AS "hospital_city",
	NULL AS "hospital_state",
	NULL AS "hospital_code",
	NULL AS "rep_number",
	NULL AS "batch",
	NULL AS "prospect_typ_cd",
	NULL AS "relationship_to_child",
	NULL AS "multip_cd",
	NULL AS "segment_survey_id",
	NULL AS "segment_survey_answer_01",
	NULL AS "segment_survey_answer_02",
	NULL AS "segment_survey_answer_03",
	NULL AS "segment_survey_answer_04",
	'N' AS "Delete",
	'USA' AS "Country_Code",
	NULL AS ACCT_SRC_CODE
FROM filter_data AS a
where EMAIL IS NOT NULL
AND EMAIL NOT IN (SELECT EMAIL FROM ANALYTICS.DBT_MGAVASEKAR_ANA_PARTNERSHIP.MJN_PROFILE_USA_DESTM)
AND EMAIL NOT IN (SELECT EMAIL FROM ANALYTICS.ANALYTICS_STG_PARTNERSHIPS.LEXER__EXCLUSION_LIST__MJN )
AND STATE_ABBREVIATION NOT IN ('PR','AA','AP','VI','AE','NULL'))
SELECT * FROM Response_Media