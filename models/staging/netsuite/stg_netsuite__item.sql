with base as (select * from {{ source("raw_netsuite", "ITEM") }})

SELECT
    ID AS ID,
    ALTERNATEDEMANDSOURCEITEM AS ALTERNATE_DEMAND_SOURCE_ITEM,
    AMORTIZATIONPERIOD AS AMORTIZATION_PERIOD,
    AMORTIZATIONTEMPLATE AS AMORTIZATION_TEMPLATE,
    ASSETACCOUNT AS ASSET_ACCOUNT,
    ATPMETHOD AS ATP_METHOD,
    AVERAGECOST AS AVERAGE_COST,
    BACKWARDCONSUMPTIONDAYS AS BACKWARD_CONSUMPTION_DAYS,
    BILLEXCHRATEVARIANCEACCT AS BILL_EXCH_RATE_VARIANCE_ACCT,
    BILLINGSCHEDULE AS BILLING_SCHEDULE,
    BILLPRICEVARIANCEACCT AS BILL_PRICE_VARIANCE_ACCT,
    BILLQTYVARIANCEACCT AS BILL_QTY_VARIANCE_ACCT,
    BUILDENTIREASSEMBLY AS BUIL_DENTIRE_ASSEMBLY,
    BUILDTIME AS BUILD_TIME,
    CLASS AS CLASS,
    COPYDESCRIPTION AS COPY_DESCRIPTION,
    COST AS COST,
    COSTESTIMATE AS COST_ESTIMATE,
    COSTESTIMATETYPE AS COST_ESTIMATE_TYPE,
    COSTINGMETHOD AS COSTING_METHOD,
    COSTINGMETHODDISPLAY AS COSTING_METHODD_IS_PLAY,
    COUNTRYOFMANUFACTURE AS COUNTRY_OF_MANUFACTURE,
    CREATEDDATE AS CREATED_DATE,
    CREATEEXPENSEPLANSON AS CREATE_EXPENSE_PLANSON,
    CSEG_MB_SC AS CSEG_MB_SC,
    CSEG_MQB_MHI_DS AS CSEG_MQB_MHI_DS,
    CUSTITEM18 AS CUST_ITEM_18,
    CUSTITEM19 AS CUST_ITEM_19,
    CUSTITEM_BMG_OLDPART AS CUST_ITEM_BMG_OLDPART,
    CUSTITEM_CODE_OF_SUPPLY AS CUST_ITEM_CODE_OF_SUPPLY,
    CUSTITEM_COMMODITY_CODE AS CUST_ITEM_COMMODITY_CODE,
    CUSTITEM_CONSIGNMENT_ITEM_COST AS CUST_ITEM_CONSIGNMENT_ITEM_COST,
    CUSTITEM_CONSIGNMENT_VENDOR AS CUST_ITEM_CONSIGNMENT_VENDOR,
    CUSTITEM_COSIGN_ITEM AS CUST_ITEM_COSIGN_ITEM,
    CUSTITEM_ES2_CATALOG AS CUST_ITEM_ES2_CATALOG,
    CUSTITEM_ES_AVAILABLEONDATE AS CUST_ITEM_ES_AVAILABLE_ON_DATE,
    CUSTITEM_ES_CATALOGS AS CUST_ITEM_ES_CATALOGS,
    CUSTITEM_ES_COLOR AS CUST_ITEM_ES_COLOR,
    CUSTITEM_ES_PRODUCTPERMISSIONS AS CUST_ITEM_ES_PRODUCTPERMISSIONS,
    CUSTITEM_ES_REGION AS CUST_ITEM_ES_REGION,
    CUSTITEM_ES_SIZE AS CUST_ITEM_ES_SIZE,
    CUSTITEM_HMI_CUSTOMFIELD_COLOR AS CUST_ITEM_HMI_CUSTOMFIELD_COLOR,
    CUSTITEM_IS_ITEM_A_QUAN_THRESHOLD AS CUST_ITEM_IS_ITEM_A_QUAN_THRESHOLD,
    CUSTITEM_IS_ITEM_AMOUNT_THRESHOLD AS CUST_ITEM_IS_ITEM_AMOUNT_THRESHOLD,
    CUSTITEM_IS_ITEM_AMQ_QUA_PNT_THRESHOLD AS CUST_ITEM_IS_ITEM_AMQ_QUA_PNT_THRESHOLD,
    CUSTITEM_IS_ITEM_AMT_PERCENT_THRESHOLD AS CUST_ITEM_IS_ITEM_AMT_PERCENT_THRESHOLD,
    CUSTITEM_ITEM_PROD_TAG_NAMES AS CUST_ITEM_ITEM_PROD_TAG_NAMES,
    CUSTITEM_ITR_SUPPLEMENTARY_UNIT AS CUST_ITEM_ITR_SUPPLEMENTARY_UNIT,
    CUSTITEM_ITR_SUPPLEMENTARY_UNIT_ABBREV AS CUST_ITEM_ITR_SUPPLEMENTARY_UNIT_ABBREV,
    CUSTITEM_MB_INITIAL_PRICE AS CUST_ITEM_MB_INITIAL_PRICE,
    CUSTITEM_MHI_CUSTFIELD_FABRICCONTENT AS CUST_ITEM_MHI_CUSTFIELD_FABRICCONTENT,
    CUSTITEM_MHI_CUSTFIELD_ITEMHEIGHT AS CUST_ITEM_MHI_CUSTFIELD_ITEMHEIGHT,
    CUSTITEM_MHI_CUSTFIELD_LAUNCHDATE AS CUST_ITEM_MHI_CUSTFIELD_LAUNCHDATE,
    CUSTITEM_MHI_CUSTFIELD_LENGTH AS CUST_ITEM_MHI_CUSTFIELD_LENGTH,
    CUSTITEM_MHI_CUSTFIELD_UPCCODE2 AS CUST_ITEM_MHI_CUSTFIELD_UPCCODE2,
    CUSTITEM_MHI_CUSTFIELD_WIDTH AS CUST_ITEM_MHI_CUSTFIELD_WIDTH,
    CUSTITEM_MHI_CUSTOM_DESIGNER AS CUST_ITEM_MHI_CUSTOM_DESIGNER,
    CUSTITEM_MHI_CUSTOM_LEGACYSKU AS CUST_ITEM_MHI_CUSTOM_LEGACYSKU,
    CUSTITEM_MHI_CUSTOM_PRODTYPE AS CUST_ITEM_MHI_CUSTOM_PRODTYPE,
    CUSTITEM_MHI_MQB_AVALARA_TAX_CODE AS CUST_ITEM_MHI_MQB_AVALARA_TAX_CODE,
    CUSTITEM_MHI_MQB_CATALOG AS CUST_ITEM_MHI_MQB_CATALOG,
    CUSTITEM_MHI_MQB_CATEGORY AS CUST_ITEM_MHI_MQB_CATEGORY,
    CUSTITEM_MHI_MQB_CLOSEOUT AS CUST_ITEM_MHI_MQB_CLOSEOUT,
    CUSTITEM_MHI_MQB_COUNTRY_ORIGIN AS CUST_ITEM_MHI_MQB_COUNTRY_ORIGIN,
    CUSTITEM_MHI_MQB_FACET_TYPE AS CUST_ITEM_MHI_MQB_FACET_TYPE,
    CUSTITEM_MHI_MQB_FIELD_NDC AS CUST_ITEM_MHI_MQB_FIELD_NDC,
    CUSTITEM_MHI_MQB_GENDER AS CUST_ITEM_MHI_MQB_GENDER,
    CUSTITEM_MHI_MQB_HTSC AS CUST_ITEM_MHI_MQB_HTSC,
    CUSTITEM_MHI_MQB_MANUFACTURERTARIFF AS CUST_ITEM_MHI_MQB_MANUFACTURER_TARIFF,
    CUSTITEM_MHI_MQB_MERC_CLASS AS CUST_ITEM_MHI_MQB_MERC_CLASS,
    CUSTITEM_MHI_MQB_MERC_DEPT AS CUST_ITEM_MHI_MQB_MERC_DEPT,
    CUSTITEM_MHI_MQB_MERC_DIVISION AS CUST_ITEM_MHI_MQB_MERC_DIVISION,
    CUSTITEM_MHI_MQB_MERC_SUBCLASS AS CUST_ITEM_MHI_MQB_MERC_SUBCLASS,
    CUSTITEM_MHI_MQB_NRF_COLOR_CODE AS CUST_ITEM_MHI_MQB_NRF_COLOR_CODE,
    CUSTITEM_MHI_MQB_NRF_SIZE_CODE AS CUST_ITEM_MHI_MQB_NRF_SIZE_CODE,
    CUSTITEM_MHI_MQB_PRODUCT_COLOR_DESC AS CUST_ITEM_MHI_MQB_PRODUCT_COLOR_DESC,
    CUSTITEM_MHI_MQB_PRODUCT_SIZE_DESC AS CUST_ITEM_MHI_MQB_PRODUCT_SIZE_DESC,
    CUSTITEM_MHI_MQB_SEASON AS CUST_ITEM_MHI_MQB_SEASON,
    CUSTITEM_MHI_MQB_SELLINGONAVC AS CUST_ITEM_MHI_MQB_SELLING_ON_AVC,
    CUSTITEM_MHI_MQB_SHOPIFYVENDORNAME AS CUST_ITEM_MHI_MQB_SHOPIFY_VENDOR_NAME,
    CUSTITEM_MHI_MQB_STYLE AS CUST_ITEM_MHI_MQB_STYLE,
    CUSTITEM_MHI_MQB_STYLE_NUMBER AS CUST_ITEM_MHI_MQB_STYLE_NUMBER,
    CUSTITEM_MHI_MQB_VARIANT_SORT_ORDER AS CUST_ITEM_MHI_MQB_VARIANT_SORT_ORDER,
    CUSTITEM_MHI_MQB_VENDOR_DEPT AS CUST_ITEM_MHI_MQB_VENDOR_DEPT,
    CUSTITEM_MHI_MQB_YEAR AS CUST_ITEM_MHI_MQB_YEAR,
    CUSTITEM_MHI_PRODUCT_COLOR AS CUST_ITEM_MHI_PRODUCT_COLOR,
    CUSTITEM_MHI_PRODUCT_SIZE AS CUST_ITEM_MHI_PRODUCT_SIZE,
    CUSTITEM_MQB_FASHION_PYRAMID AS CUST_ITEM_MQB_FASHION_PYRAMID,
    CUSTITEM_MQB_MHI_ASSIGN_UPC_SKU AS CUST_ITEM_MQB_MHI_ASSIGN_UPC_SKU,
    CUSTITEM_MQB_MHI_GIFT_CARD AS CUST_ITEM_MQB_MHI_GIFT_CARD,
    CUSTITEM_MQB_MHI_UPCCODENEEDED AS CUST_ITEM_MQB_MHI_UPC_CODE_NEEDED,
    CUSTITEM_MQB_MHI_UPCSKUPROCESSED AS CUST_ITEM_MQB_MHI_UPC_SKU_PROCESSED,
    CUSTITEM_MQB_MHI_VENDOR_REVSHARE_AMT AS CUST_ITEM_MQB_MHI_VENDOR_REV_SHARE_AMT,
    CUSTITEM_NATURE_OF_TRANSACTION_CODES AS CUST_ITEM_NATURE_OF_TRANSACTION_CODES,
    CUSTITEM_NSPBCS_ITEM_PLANNING_CAT AS CUST_ITEM_NSPBCS_ITEM_PLANNING_CAT,
    CUSTITEM_PROMPT_PAYMENT_DISCOUNT_ITEM AS CUST_ITEM_PROMPT_PAYMENT_DISCOUNT_ITEM,
    CUSTITEM_PSGSS_CATALOG AS CUST_ITEM_PSGSS_CATALOG,
    CUSTITEM_PSGSS_CATEGORY AS CUST_ITEM_PSGSS_CATEGORY,
    CUSTITEM_PSGSS_CLOSEOUT AS CUST_ITEM_PSGSS_CLOSEOUT,
    CUSTITEM_PSGSS_FACET_TYPE AS CUST_ITEM_PSGSS_FACET_TYPE,
    CUSTITEM_PSGSS_GENDER AS CUST_ITEM_PSGSS_GENDER,
    CUSTITEM_PSGSS_MERC_CLASS AS CUST_ITEM_PSGSS_MERC_CLASS,
    CUSTITEM_PSGSS_MERC_DEPT AS CUST_ITEM_PSGSS_MERC_DEPT,
    CUSTITEM_PSGSS_MERC_DIVISION AS CUST_ITEM_PSGSS_MERC_DIVISION,
    CUSTITEM_PSGSS_MERC_SUBCLASS AS CUST_ITEM_PSGSS_MERC_SUBCLASS,
    CUSTITEM_PSGSS_NRF_COLOR_CODE AS CUST_ITEM_PSGSS_NRF_COLOR_CODE,
    CUSTITEM_PSGSS_NRF_SIZE_CODE AS CUST_ITEM_PSGSS_NRF_SIZE_CODE,
    CUSTITEM_PSGSS_PRODUCT_COLOR AS CUST_ITEM_PSGSS_PRODUCT_COLOR,
    CUSTITEM_PSGSS_PRODUCT_COLOR_DESC AS CUST_ITEM_PSGSS_PRODUCT_COLOR_DESC,
    CUSTITEM_PSGSS_PRODUCT_SIZE AS CUST_ITEM_PSGSS_PRODUCT_SIZE,
    CUSTITEM_PSGSS_PRODUCT_SIZE_DESC AS CUST_ITEM_PSGSS_PRODUCT_SIZE_DESC,
    CUSTITEM_PSGSS_SEASON AS CUST_ITEM_PSGSS_SEASON,
    CUSTITEM_PSGSS_STYLE AS CUST_ITEM_PSGSS_STYLE,
    CUSTITEM_PSGSS_STYLE_NUMBER AS CUST_ITEM_PSGSS_STYLE_NUMBER,
    CUSTITEM_PSGSS_STYLE_TEXT AS CUST_ITEM_PSGSS_STYLE_TEXT,
    CUSTITEM_PSGSS_VENDOR_DEPT AS CUST_ITEM_PSGSS_VENDOR_DEPT,
    CUSTITEM_PSGSS_YEAR AS CUST_ITEM_PSGSS_YEAR,
    CUSTITEM_SORT_ORDER AS CUST_ITEM_SORT_ORDER,
    CUSTITEM_SPS_ITEM_SYNCH AS CUST_ITEM_SPS_ITEM_SYNCH,
    CUSTITEM_SPS_ITEM_SYNCH_2 AS CUST_ITEM_SPS_ITEM_SYNCH_2,
    CUSTITEM_STOREDESC AS CUST_ITEM_STORE_DESC,
    CUSTITEM_TLD_COLOR AS CUST_ITEM_TLD_COLOR,
    CUSTITEM_TLD_DISCO AS CUST_ITEM_TLD_DISCO,
    CUSTITEM_TLD_MATERIALS AS CUST_ITEM_TLD_MATERIALS,
    CUSTITEM_TLD_PRODLINE AS CUST_ITEM_TLD_PROD_LINE,
    CUSTITEM_TLD_PRODUCT_MODEL AS CUST_ITEM_TLD_PRODUCT_MODEL,
    CUSTITEM_TLD_ROYALTY AS CUST_ITEM_TLD_ROYALTY,
    CUSTITEM_TLD_STYLE AS CUST_ITEM_TLD_STYLE,
    CUSTITEM_TYPE_OF_GOODS AS CUST_ITEM_TYPE_OF_GOODS,
    CUSTITEM_UN_NUMBER AS CUST_ITEM_UN_NUMBER,
    CUSTITEMLOCATION_SPECIFIC AS CUST_ITEM_LOCATION_SPECIFIC,
    CUSTRETURNVARIANCEACCOUNT AS CUST_RETURN_VARIANCE_ACCOUNT,
    DEFERRALACCOUNT AS DEFERRAL_ACCOUNT,
    DEMANDMODIFIER AS DEMAND_MODIFIER,
    DEMANDSOURCE AS DEMAND_SOURCE,
    DEMANDTIMEFENCE AS DEMAND_TIMEFENCE,
    DEPARTMENT AS DEPARTMENT,
    DESCRIPTION AS DESCRIPTION,
    DISPLAYNAME AS DISPLAYNAME,
    DROPSHIPEXPENSEACCOUNT AS DROP_SHIP_EXPENSE_ACCOUNT,
    ENFORCEMINQTYINTERNALLY AS ENFORCE_MIN_QTY_INTERNALLY,
    EXPENSEACCOUNT AS EXPENSE_ACCOUNT,
    EXPENSEAMORTIZATIONRULE AS EXPENSE_AMORTIZATION_RULE,
    EXTERNALID AS EXTERNAL_ID,
    FIXEDLOTSIZE AS FIXED_LOT_SIZE,
    FORWARDCONSUMPTIONDAYS AS FORWARD_CONSUMPTION_DAYS,
    FULLNAME AS FULL_NAME,
    FXCOST AS FX_COST,
    GAINLOSSACCOUNT AS GAIN_LOSS_ACCOUNT,
    GENERATEACCRUALS AS GENERATE_ACCRUALS,
    HANDLINGCOST AS HANDLING_COST,
    INCLUDECHILDREN AS INCLUDE_CHILDREN,
    INCOMEACCOUNT AS INCOME_ACCOUNT,
    INTERCOEXPENSEACCOUNT AS INTER_CO_EXPENSE_ACCOUNT,
    INTERCOINCOMEACCOUNT AS INTER_CO_INCOME_ACCOUNT,
    ISDROPSHIPITEM AS IS_DROP_SHIP_ITEM,
    ISFULFILLABLE AS IS_FULFILLABLE,
    ISINACTIVE AS IS_INACTIVE,
    ISONLINE AS IS_ONLINE,
    ISPHANTOM AS IS_PHANTOM,
    ISSPECIALORDERITEM AS IS_SPECIAL_ORDER_ITEM,
    ISSPECIALWORKORDERITEM AS IS_SPECIAL_WORK_ORDER_ITEM,
    ITEMID AS ITEM_ID,
    ITEMTYPE AS ITEM_TYPE,
    LASTMODIFIEDDATE AS LAST_MODIFIED_DATE,
    LASTPURCHASEPRICE AS LAST_PURCHASE_PRICE,
    LEADTIME AS LEAD_TIME,
    "LOCATION" AS "LOCATION",
    MANUFACTURER AS MANUFACTURER,
    MATCHBILLTORECEIPT AS MATCH_BILL_TO_RECEIPT,
    MATRIXOPTIONCUSTITEM_PSGSS_PRODUCT_COLOR AS MATRIX_OPTION_CUST_ITEM_PSGSS_PRODUCT_COLOR,
    MATRIXOPTIONCUSTITEM_PSGSS_PRODUCT_SIZE AS MATRIX_OPTION_CUST_ITEM_PSGSS_PRODUCT_SIZE,
    MAXIMUMQUANTITY AS MAXIMUM_QUANTITY,
    MINIMUMQUANTITY AS MINIMUM_QUANTITY,
    MPN AS MPN,
    PARENT AS PARENT,
    PERIODICLOTSIZEDAYS AS PERIODIC_LOT_SIZE_DAYS,
    PERIODICLOTSIZETYPE AS PERIODIC_LOT_SIZE_TYPE,
    PREFERREDLOCATION AS PREFERRED_LOCATION,
    PRICINGGROUP AS PRICING_GROUP,
    PRINTITEMS AS PRINT_ITEMS,
    PRODPRICEVARIANCEACCT AS PROD_PRICE_VARIANCE_ACCT,
    PRODQTYVARIANCEACCT AS PROD_QTY_VARIANCE_ACCT,
    PURCHASEDESCRIPTION AS PURCHASE_DESCRIPTION,
    PURCHASEORDERAMOUNT AS PURCHASE_ORDER_AMOUNT,
    PURCHASEORDERQUANTITY AS PURCHASE_ORDER_QUANTITY,
    PURCHASEORDERQUANTITYDIFF AS PURCHASE_ORDER_QUANTITY_DIFF,
    PURCHASEPRICEVARIANCEACCT AS PURCHASE_PRICE_VARIANCE_ACCT,
    RECEIPTAMOUNT AS RECEIPT_AMOUNT,
    RECEIPTQUANTITY AS RECEIPT_QUANTITY,
    RECEIPTQUANTITYDIFF AS RECEIPT_QUANTITY_DIFF,
    RESCHEDULEINDAYS AS RESCHEDULE_IN_DAYS,
    RESCHEDULEOUTDAYS AS RESCHEDULE_OUT_DAYS,
    RESIDUAL AS RESIDUAL,
    ROUNDUPASCOMPONENT AS ROUNDUP_AS_COMPONENT,
    SAFETYSTOCKLEVEL AS SAFETY_STOCK_LEVEL,
    SCRAPACCT AS SCRAP_ACCT,
    SEASONALDEMAND AS SEASONAL_DEMAND,
    SHIPINDIVIDUALLY AS SHIP_INDIVIDUALLY,
    SHIPPACKAGE AS SHIP_PACKAGE,
    SHIPPINGCOST AS SHIPPING_COST,
    STOCKDESCRIPTION AS STOCK_DESCRIPTION,
    SUBSIDIARY AS SUBSI_DIARY,
    SUBTYPE AS SUB_TYPE,
    SUPPLYLOTSIZINGMETHOD AS SUPPLY_LOT_SIZING_METHOD,
    SUPPLYREPLENISHMENTMETHOD AS SUPPLY_REPLENISHMENT_METHOD,
    SUPPLYTIMEFENCE AS SUPPLY_TIMEFENCE,
    SUPPLYTYPE AS SUPPLY_TYPE,
    TOTALQUANTITYONHAND AS TOTAL_QUANTITY_ON_HAND,
    TOTALVALUE AS TOTAL_VALUE,
    TRACKLANDEDCOST AS TRACK_LANDED_COST,
    TRANSFERPRICE AS TRANSFER_PRICE,
    UNBUILDVARIANCEACCOUNT AS UNBUILD_VARIANCE_ACCOUNT,
    UPCCODE AS UPC_CODE,
    VENDORNAME AS VENDOR_NAME,
    VENDRETURNVARIANCEACCOUNT AS VENDRE_TURN_VARIANCE_ACCOUNT,
    WEIGHT AS WEIGHT,
    WEIGHTUNIT AS WEIGHT_UNIT,
    WIPACCT AS WIP_ACCT,
    WIPVARIANCEACCT AS WIP_VARIANCE_ACCT,
    CUSTITEM_MQB_CONCEPT_NUMBER AS CUST_ITEM_MQB_CONCEPT_NUMBER,
    "_FIVETRAN_DELETED" AS "_FIVETRAN_DELETED",
    DATE_DELETED AS DATE_DELETED,
    "_FIVETRAN_SYNCED" AS "_FIVETRAN_SYNCED",
    CUSTITEM_STOREDESC_2 AS CUST_ITEM_STOREDESC_2
FROM
    base