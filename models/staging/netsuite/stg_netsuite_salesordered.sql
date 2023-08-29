with base as (select * from {{ source("raw_netsuite", "SALESORDERED") }})

SELECT 
    "ACCOUNT" as "ACCOUNT",
    AMOUNT as AMOUNT,
    AMOUNTNET as AMAOUNT_NET,
    CLASS as CLASS,
    COSTESTIMATE as COST_ESTIMATE, 
    DEPARTMENT as DEPARTMENT,
    EMPLOYEE as EMPLOYEE,
    ENTITY as ENTITY,
    ESTGROSSPROFIT as EST_GROSS_PROFIT, 
    ESTGROSSPROFITPERCENT as EST_GROSS_PROFIT_PERCENT,
    ITEM as ITEM,
    ITEMCOUNT as ITEM_COUNT,
    "LOCATION" as "LOCATION",
    MEMO as MEMO,
    TRANDATE as TRANDATE,
    TRANLINE as TRANLINE,
    "TRANSACTION" as "TRANSACTION",
    "TYPE" as "TYPE",
    UNIQUEKEY as UNIQUE_KEY,
    "_FIVETRAN_DELETED" as "_FIVETRAN_DELETED",
    DATE_DELETED as DATE_DELETED,
    "_FIVETRAN_SYNCED" as "_FIVETRAN_SYNCED",
    SUBSIDIARY as SUBSIDIARY
FROM base