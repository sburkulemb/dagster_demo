/************************************************************************************************
	Author       : Muskan Gavasekar
	Created Date : 19-07-2023
	Version      : 1.0
	Linear   	 : ANA-57
	Description  : Update DBT script to set empty values to null
************************************************************************************************/

WITH first_last_ord_date AS (
    SELECT
        EMAIL,
        max(ORDER_ID) MOST_RECENT_ORDER_ID,
        min(PROCESSED_TIMESTAMP) AS FIRST_ORDER_DATE,
        max(PROCESSED_TIMESTAMP) AS Last_ORDER_DATE
    FROM {{ref("shopify__orders")}}
    WHERE SOURCE_RELATION = 'shopify_mh'
    GROUP BY EMAIL),

country_data AS (
    SELECT email,
        CASE WHEN COUNTRY IN (
        'US', 'United states ', 'United state', 'United States of America ', 'United santes', 'U.S.A', 'UNITED STATED ', 'UNITED STATES ', 'United at', 'Unites states ', 
        'United statew', 'Us', 'U.S. Virgin Islands', 'U.S.', 'Us ', 'Untied States ', 'Untied states', 'United States Of America ', 'United State''s','United Stated',
        'United States of Amercia', 'United States of America’s ', 'United States American ', 'Unites states', 'UnitedStates', 'United State ', 'United Sates ', 'Unite States ',
        'Use', 'U. S. ', 'USAj', 'UNITED states', 'Usa', 'USA', 'Untied States', 'Unites estates', 'UNITED STATE ', 'United stayed ', 'United statea', 'U.s ', 'U.S.A. ', 
        'United States of American', 'United States Of American ', 'United states of america ', 'United Statea ', 'USA a', 'United States of Aerica', 'United Sates', 'Usa ', 
        'United States of america', 'United Statea', 'United States of American ', 'UNITED STATES OF AMERICA', 'Utah', 'United State', 'United', 'United STates of America', 
        'United States. ', 'United Stated ', 'United States America ', 'United stats', 'United States.', 'United StateS', 'United Estates', 'U', 'USA ', 'United States of America',
        'Untied states ', 'Unites States ', 'United stated', 'United States Of America', 'U.S.A.', 'UNITED STATES OF AMERICA ', 'United sates ', 'UNITED TATES',
        'United States America', 'United stayed', 'Untied States of America', 'Untied states of America ', 'United states of America', 'U.s', 'United States (USA)', 
        'United stares', 'United states', 'United States ', 'United state ', 'U.S', 'United states of america', 'Unite states', 'UNITED STATES', 'Unites States', 
        'United state of America ', 'U.S. ', 'USA, Ca', 'Unite state ', 'United States', 'Unided States', 'United states of America ', 'US ', 'United Statestes',
        'United S', 'United Stayes', 'U.s.a', 'United State of America', 'United stated ', 'UNITED STATE', 'United ', 'USa', 'Untied state ', 'Unites state ', 
        'United States Minor Outlying Islands', 'United STates', 'United Statew'
        ) THEN 'United States'
        ELSE country  
        END AS country 
    FROM {{ref("int_klaviyo__mh_profiles")}}),

geo_data AS (
    SELECT 
        ZIPCODE, 
        STATE, 
        STATE_ABBR
    FROM {{ref("geo_location")}}
    ),

klaviyo_data_mh AS (
    SELECT 
        EMAIL ,
        FIRST_NAME ,
        LAST_NAME ,
        ADDRESS1 ,
        ADDRESS2 ,
        CITY,
        REGION_NEW ,
        REGION_ID ,
        ZIP,
        SUBSTRING(ZIP , 1, 5) AS FORMATTED_ZIP_FIVE,
        SUBSTRING(ZIP , 1, 10) AS FORMATTED_ZIP_NINE,
        PHONE_NUMBER ,
        LEFT(REGEXP_REPLACE(PHONE_NUMBER , '[^0-9]',''),10) AS FORMATTED_PHONE_NUMBER,
        CREATED AS CREATED_DATE,
        UPDATED AS UPDATED_DATE,
        "SOURCE",
        SOURCE_CODE,
        CONSENT,
        CONSENT_TIMESTAMP,
        FORMATTED_DUE_DATE AS DUE_DATE
    FROM {{ref("int_klaviyo__mh_profiles")}}),

Orders_data AS(
    SELECT
        ORDER_ID ,
        EMAIL,
        BILLING_ADDRESS_FIRST_NAME,
        BILLING_ADDRESS_LAST_NAME,
        BILLING_ADDRESS_ADDRESS_1,
        BILLING_ADDRESS_ADDRESS_2,
        BILLING_ADDRESS_CITY,
        BILLING_ADDRESS_PROVINCE,
        BILLING_ADDRESS_PROVINCE_CODE,
        BILLING_ADDRESS_COUNTRY ,
        BILLING_ADDRESS_COUNTRY_CODE,
        BILLING_ADDRESS_ZIP,
        SUBSTRING(BILLING_ADDRESS_ZIP, 1, 5) AS FORMATTED_ZIP_FIVE,
        SUBSTRING(BILLING_ADDRESS_ZIP, 1, 10) AS FORMATTED_ZIP_NINE,
        BILLING_ADDRESS_PHONE,
        LEFT(REGEXP_REPLACE(BILLING_ADDRESS_PHONE , '[^0-9]',''),10) AS FORMATTED_PHONE_NUMBER
    FROM {{ref("shopify__orders")}}
    WHERE BILLING_ADDRESS_COUNTRY_CODE = 'US'
    AND SOURCE_RELATION = 'shopify_mh'
    ),

motherhood_data AS (
    SELECT 
        A.EMAIL,
        NULL AS NAME_PREFIX,
        COALESCE(B.BILLING_ADDRESS_FIRST_NAME, A. FIRST_NAME) AS FIRST_NAME,
        NULL AS MIDDLE_NAME,
        COALESCE(B.BILLING_ADDRESS_LAST_NAME, A.LAST_NAME) AS LAST_NAME,
        NULL AS NAME_SUFFIX,
        INITCAP(COALESCE(B.BILLING_ADDRESS_ADDRESS_1, A.ADDRESS1)) AS ADDRESS_1,
        INITCAP(COALESCE(B.BILLING_ADDRESS_ADDRESS_2, A.ADDRESS2)) AS ADDRESS_2,
        INITCAP(COALESCE(B.BILLING_ADDRESS_CITY, A.CITY)) AS CITY,
        INITCAP(COALESCE(B.BILLING_ADDRESS_PROVINCE, A.REGION_NEW, C.STATE)) AS STATE,
        UPPER(COALESCE(B.BILLING_ADDRESS_PROVINCE_CODE, A.REGION_ID,C.STATE_ABBR)) AS STATE_ABBREVIATION,
        INITCAP(COALESCE(B.BILLING_ADDRESS_COUNTRY, CD.COUNTRY))AS COUNTRY,
        UPPER(COALESCE(B.BILLING_ADDRESS_COUNTRY_CODE, 'US')) AS COUNTRY_CODE,
        COALESCE(B.BILLING_ADDRESS_ZIP, A.ZIP) AS ZIP,
        COALESCE(B.FORMATTED_ZIP_FIVE, A.FORMATTED_ZIP_FIVE) AS FORMATTED_ZIP_FIVE,
        COALESCE(B.FORMATTED_ZIP_NINE, A.FORMATTED_ZIP_NINE) AS FORMATTED_ZIP_NINE,
        COALESCE(B.BILLING_ADDRESS_PHONE, A.PHONE_NUMBER) AS PHONE_NUMBER,
        COALESCE(B.FORMATTED_PHONE_NUMBER, A.FORMATTED_PHONE_NUMBER) AS FORMATTED_PHONE_NUMBER,
        ld.MOST_RECENT_ORDER_ID,
        ld.FIRST_ORDER_DATE,
        ld.Last_ORDER_DATE,
        A.CREATED_DATE,
        A.UPDATED_DATE,
        A.DUE_DATE,
        A."SOURCE",
        A.SOURCE_CODE,
        A.CONSENT,
        A.CONSENT_TIMESTAMP
    FROM klaviyo_data_mh AS A
    LEFT JOIN first_last_ord_date AS LD 
    ON A.EMAIL = LD.EMAIL
    LEFT JOIN Orders_data AS B
    ON B.ORDER_ID = LD.MOST_RECENT_ORDER_ID 
    LEFT JOIN country_data AS CD 
    ON A.EMAIL = CD.EMAIL
    LEFT JOIN geo_data AS C 
    ON A.FORMATTED_ZIP_FIVE = C.ZIPCODE
    WHERE CD.country = 'United States'
    OR B.BILLING_ADDRESS_COUNTRY_CODE = 'US'
    GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28
    ),

formatted_name_add AS (
	SELECT
		CASE
		    WHEN FIRST_NAME = ADDRESS_1
		    THEN CASE 
			    	WHEN REGEXP_INSTR(FIRST_NAME, '[0-9]') > 0 THEN NULL
		        	ELSE FIRST_NAME
		    END
		    ELSE FIRST_NAME
		END AS FIRST_NAME,
		CASE
		    WHEN ADDRESS_1 = FIRST_NAME
		    THEN CASE 
			    	WHEN REGEXP_INSTR(FIRST_NAME, '[0-9]') > 0 THEN ADDRESS_1
		        	ELSE NULL
		    END
		    ELSE ADDRESS_1
		END AS ADDRESS_1,
		CASE
		    WHEN LAST_NAME = ADDRESS_2
		    THEN CASE 
			    	WHEN REGEXP_INSTR(LAST_NAME, '[0-9]') > 0 THEN NULL
		        	ELSE LAST_NAME
		    END
		    ELSE LAST_NAME
		END AS LAST_NAME,
		CASE
		    WHEN ADDRESS_2 = LAST_NAME
		    THEN CASE 
			    	WHEN REGEXP_INSTR(LAST_NAME, '[0-9]') > 0 THEN ADDRESS_2
		        	ELSE NULL
		    END
		    ELSE ADDRESS_2
		END AS ADDRESS_2,
		SPLIT_PART(CITY, ',', 1) AS CITY,
		a.* EXCLUDE(FIRST_NAME,ADDRESS_1,LAST_NAME,ADDRESS_2,CITY)
	FROM motherhood_data AS a),

carraige_func AS (
    SELECT
	    REGEXP_REPLACE(FIRST_NAME, '\r|\n|[0-9]','') AS FIRST_NAME,
	    REGEXP_REPLACE(LAST_NAME, '\r|\n|[0-9]','') AS LAST_NAME,
	    REGEXP_REPLACE(ADDRESS_1, '\r|\n','') AS ADDRESS_1,
	    REGEXP_REPLACE(ADDRESS_2, '\r|\n','') AS ADDRESS_2,
	    CASE
		    WHEN REGEXP_INSTR(CITY,'[0-9]') > 0  THEN NULL
		    ELSE CITY
	    END AS CITY,
	    CASE
	    	WHEN REGEXP_INSTR(FORMATTED_ZIP_FIVE,'[a-zA-Z]') > 0  THEN NULL
	    	ELSE FORMATTED_ZIP_FIVE
	    END AS FORMATTED_ZIP_FIVE,
	    CASE
	    	WHEN REGEXP_INSTR(FORMATTED_ZIP_NINE,'[a-zA-Z]') > 0  THEN NULL
	    	ELSE FORMATTED_ZIP_NINE
	    END AS FORMATTED_ZIP_NINE,	    
    	a.* EXCLUDE(FIRST_NAME,ADDRESS_1,LAST_NAME,ADDRESS_2,CITY,FORMATTED_ZIP_FIVE,FORMATTED_ZIP_NINE)
    FROM formatted_name_add AS a 
),

zip_fomratting as (
    SELECT
        REPLACE(REPLACE(REPLACE(FORMATTED_ZIP_FIVE, '(', ''), ')', ''), ',', '') as FORMATTED_ZIP_FIVE,
        REPLACE(REPLACE(REPLACE(FORMATTED_ZIP_NINE, '(', ''), ')', ''), ',', '') as FORMATTED_ZIP_NINE,
        a.* EXCLUDE(FORMATTED_ZIP_FIVE,FORMATTED_ZIP_NINE)
    from carraige_func as a
),

reducing_white_space AS (
	SELECT
		CASE
			WHEN REGEXP_COUNT(FIRST_NAME, '\\w+') > 1
			THEN CASE
				WHEN REGEXP_COUNT(FIRST_NAME, '\\s') > 1 THEN REGEXP_REPLACE(FIRST_NAME, '\\s+', ' ')
				ELSE FIRST_NAME
			END
			ELSE REGEXP_REPLACE(FIRST_NAME, '\\s', '')
		END AS FIRST_NAME,
		CASE
			WHEN REGEXP_COUNT(LAST_NAME, '\\w+') > 1
			THEN CASE
				WHEN REGEXP_COUNT(LAST_NAME, '\\s') > 1 THEN REGEXP_REPLACE(LAST_NAME, '\\s+', ' ')
				ELSE LAST_NAME
			END
			ELSE REGEXP_REPLACE(LAST_NAME, '\\s', '')
		END AS LAST_NAME,
		CASE
			WHEN REGEXP_COUNT(ADDRESS_1, '\\w+') > 1
			THEN CASE
				WHEN REGEXP_COUNT(ADDRESS_1, '\\s') > 1 THEN REGEXP_REPLACE(ADDRESS_1, '\\s+', ' ')
				ELSE ADDRESS_1
			END
			ELSE REGEXP_REPLACE(ADDRESS_1, '\\s', '')
		END AS ADDRESS_1,
		CASE
			WHEN REGEXP_COUNT(ADDRESS_2, '\\w+') > 1
			THEN CASE
				WHEN REGEXP_COUNT(ADDRESS_2, '\\s') > 1 THEN REGEXP_REPLACE(ADDRESS_2, '\\s+', ' ')
				ELSE ADDRESS_2
			END
			ELSE REGEXP_REPLACE(ADDRESS_2, '\\s', '')
		END AS ADDRESS_2,
		CASE
			WHEN REGEXP_COUNT(CITY, '\\w+') > 1
			THEN CASE
				WHEN REGEXP_COUNT(CITY, '\\s') > 1 THEN REGEXP_REPLACE(CITY, '\\s+', ' ')
				ELSE CITY
			END
			ELSE REGEXP_REPLACE(CITY, '\\s', '')
		END AS CITY,
        CASE
			WHEN REGEXP_COUNT(FORMATTED_ZIP_FIVE, '\\w+') > 1
			THEN CASE
				WHEN REGEXP_COUNT(FORMATTED_ZIP_FIVE, '\\s') > 1 THEN REGEXP_REPLACE(FORMATTED_ZIP_FIVE, '\\s+', ' ')
				ELSE FORMATTED_ZIP_FIVE
			END
			ELSE REGEXP_REPLACE(FORMATTED_ZIP_FIVE, '\\s', '')
		END AS FORMATTED_ZIP_FIVE,
		CASE
			WHEN REGEXP_COUNT(FORMATTED_ZIP_NINE, '\\w+') > 1
			THEN CASE
				WHEN REGEXP_COUNT(FORMATTED_ZIP_NINE, '\\s') > 1 THEN REGEXP_REPLACE(FORMATTED_ZIP_NINE, '\\s+', ' ')
				ELSE FORMATTED_ZIP_NINE
			END
			ELSE REGEXP_REPLACE(FORMATTED_ZIP_NINE, '\\s', '')
		END AS FORMATTED_ZIP_NINE,		
		A.* EXCLUDE(FIRST_NAME,LAST_NAME,ADDRESS_1,ADDRESS_2,CITY,FORMATTED_ZIP_FIVE,FORMATTED_ZIP_NINE)
	FROM zip_fomratting AS a),

removing_special_name AS (
	SELECT
		REGEXP_REPLACE(FIRST_NAME, '[^a-zA-Z]','') AS FIRST_NAME,
		REGEXP_REPLACE(LAST_NAME, '[^a-zA-Z]','') AS LAST_NAME,
        REPLACE(REPLACE(FORMATTED_ZIP_FIVE, '(', ''), ')', '') as FORMATTED_ZIP_FIVE,
        REPLACE(REPLACE(FORMATTED_ZIP_NINE, '(', ''), ')', '') as FORMATTED_ZIP_NINE,
		a.* EXCLUDE (FIRST_NAME,LAST_NAME,FORMATTED_ZIP_FIVE,FORMATTED_ZIP_NINE)
	FROM reducing_white_space AS a),

case_statement AS (
	SELECT
		NULLIF(EMAIL, '') AS EMAIL,
		NAME_PREFIX,
		NULLIF(FIRST_NAME, '') AS FIRST_NAME,
		MIDDLE_NAME,
		NULLIF(LAST_NAME, '') AS LAST_NAME,
		NAME_SUFFIX,
		NULLIF(ADDRESS_1, '') AS ADDRESS_1,
		NULLIF(ADDRESS_2, '') AS ADDRESS_2,
		NULLIF(CITY, '') AS CITY,
		STATE,
		NULLIF(STATE_ABBREVIATION, '') AS STATE_ABBREVIATION,
		COUNTRY,
		COUNTRY_CODE,
		ZIP,
		NULLIF(FORMATTED_ZIP_FIVE, '') AS FORMATTED_ZIP_FIVE,
		NULLIF(FORMATTED_ZIP_NINE, '') AS FORMATTED_ZIP_NINE,
		PHONE_NUMBER,
		NULLIF(FORMATTED_PHONE_NUMBER, '') AS FORMATTED_PHONE_NUMBER,
		a.* EXCLUDE (EMAIL, NAME_PREFIX, FIRST_NAME, MIDDLE_NAME, LAST_NAME, NAME_SUFFIX, ADDRESS_1, ADDRESS_2, CITY, STATE,STATE_ABBREVIATION, COUNTRY, COUNTRY_CODE, ZIP, FORMATTED_ZIP_FIVE,FORMATTED_ZIP_NINE ,PHONE_NUMBER,FORMATTED_PHONE_NUMBER)
FROM removing_special_name AS a
),

final_data AS (
	SELECT 
		a.*,
	     CASE 
		     WHEN First_Name IS NOT NULL
		        AND First_Name NOT IN ('TRUE','True','true')
		        AND Last_Name IS NOT NULL
                AND Last_Name NOT IN ('TRUE','True','true')
		        AND Address_1 IS NOT NULL
		        AND REGEXP_INSTR(ADDRESS_1  ,'[a-zA-Z]') > 0
		        AND UPPER(Address_1) NOT LIKE '%D2R%'
		        AND City IS NOT NULL
		        AND State IS NOT NULL
                AND FORMATTED_ZIP_NINE IS NOT NULL
		        AND Due_Date IS NOT NULL
		        THEN 1 ELSE 0
		END AS complete_record
	FROM case_statement AS a),

dropping_duplicate AS (
	SELECT 
		* 
	FROM final_data AS a
	WHERE CREATED_DATE = (SELECT max(CREATED_DATE) FROM final_data  WHERE EMAIL = a.EMAIL))

SELECT * FROM dropping_duplicate

