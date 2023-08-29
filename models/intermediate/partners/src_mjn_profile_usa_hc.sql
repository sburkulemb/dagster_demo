/************************************************************************************************
	Author       : Ranjeet Kashid
	Created Date : 27-07-2023
	Version      : 1.0
	Linear   	 : ANA-59
	Description  : Develop MJN Feed for Hatch
************************************************************************************************/

WITH response_media AS (
	SELECT
		FIRST_NAME AS "name_first", 
		NULL AS "name_middle",
		LAST_NAME AS "name_last",
		NULL AS "name_suffix",
        ADDRESS_1 AS "parent_addr1",
        ADDRESS_2 AS "parent_addr2",
        CITY AS "city",
		STATE_ABBREVIATION AS "state" ,
		FORMATTED_ZIP_NINE AS "postal_code" ,
		TO_VARCHAR(DUE_DATE, 'MM/DD/YYYY') AS "child_birth_date",
		'426'AS "file_cd",
	    'MW107'AS "src_id",
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
		NULL AS "ACCT_SRC_CODE"
	FROM {{ref("due_date_hatch")}}
    WHERE DUE_DATE BETWEEN dateadd(month,-4,current_date()) AND dateadd(month,12,current_date())
	AND COUNTRY_CODE = 'US' 
	AND COMPLETE_RECORD = 1
	AND SELLABLE = 1
	AND EMAIl IS NOT NULL
	AND EMAIL NOT IN (SELECT EMAIL FROM ANALYTICS.DBT_RKASHID_ANA_PARTNERSHIP.MJN_PROFILE_USA_HC)
	AND EMAIL NOT IN (SELECT EMAIL FROM ANALYTICS.ANALYTICS_STG_PARTNERSHIPS.LEXER__EXCLUSION_LIST__MJN)
	AND STATE_ABBREVIATION IS NOT NULL 
	AND STATE_ABBREVIATION NOT IN ('PR','AA','AP','VI','AE','NULL'))

SELECT * FROM response_media