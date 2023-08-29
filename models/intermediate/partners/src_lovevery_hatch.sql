/************************************************************************************************
	Author       : Muskan Gavasekar
	Created Date : 18-07-2023
	Version      : 1.0
	Linear   	 : ANA-47
	Description  : Develop Lovevery Integration for HATCH based off the Specifications In Feed Requirements Sheet
************************************************************************************************/

WITH Lovevery_Hatch AS (
	               SELECT 
	                     FIRST_NAME AS "First Name", 
                         LAST_NAME AS "Last Name",
	                     ADDRESS_1 AS "Address 1",
	                     ADDRESS_2 AS "Address 2",
	                     CITY AS "City" ,
                         STATE_ABBREVIATION  AS "State",
	                     FORMATTED_ZIP_NINE AS "Zip",
	                     EMAIL AS "Email" ,
	                     REPLACE(TO_VARCHAR(DUE_DATE), '-', '/') AS "Due Date"
	                     FROM {{ref("due_date_hatch")}}
	                     WHERE DUE_DATE <= ADD_MONTHS(CURRENT_DATE,12)
	                     AND DUE_DATE >= ADD_MONTHS(CURRENT_DATE,-3)
	                     AND COUNTRY_CODE = 'US' 
	                     AND COMPLETE_RECORD = 1
	                     AND SELLABLE = 1
	                     AND EMAIl IS NOT NULL
	                     AND EMAIL NOT IN (SELECT email FROM ANALYTICS.DBT_MGAVASEKAR_ANA_PARTNERSHIP.LOVEVERY_HATCH )
                         AND EMAIL NOT IN (SELECT EMAIL FROM ANALYTICS.ANALYTICS_STG_PARTNERSHIPS.LEXER__EXCLUSION_LIST__LOVEVERY )
                         AND STATE_ABBREVIATION NOT IN ('PR','AA','AP','VI','AE','NULL'))
SELECT * FROM Lovevery_Hatch
