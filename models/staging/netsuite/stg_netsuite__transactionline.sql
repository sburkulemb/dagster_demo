with base as (select * from {{ source("raw_netsuite", "TRANSACTIONLINE") }})


select
    "TRANSACTION" as TRANSACTION_ID,
    ID as ID,
    ACCOUNTINGLINETYPE as ACCOUNTING_LINE_TYPE,
    ACTUALSHIPDATE as ACTUAL_SHIP_DATE,
    ALLOCATIONALERT as ALLOCATION_ALERT,
    AMORTIZATIONENDDATE as AMORTIZATIONEND_DATE,
    AMORTIZATIONRESIDUAL as AMORTIZATION_RESIDUAL,
    AMORTIZATIONSCHED as AMORTIZATION_SCHED,
    AMORTIZSTARTDATE as AMORTIZSTART_DATE,
    "ASSEMBLY" as _ASSEMBLY,
    ASSEMBLYCOMPONENT as ASSEMBLY_COMPONENT,
    ASSEMBLYUNITS as ASSEMBLY_UNITS,
    BILLEDDATE as BILLED_DATE,
    BILLINGSCHEDULE as BILLING_SCHEDULE,
    BILLOFMATERIALS as BILL_OF_MATERIALS,
    BILLOFMATERIALSREVISION as BILL_OF_MATERIALS_REVISION,
    BILLVARIANCESTATUS as BILL_VARIANCE_STATUS,
    BLANDEDCOST as BLANDED_COST,
    BOMQUANTITY as BOM_QUANTITY,
    BUILDVARIANCE as BUILD_VARIANCE,
    CATEGORY as CATEGORY,
    CLASS as CLASS,
    CLEARED as CLEARED,
    CLEAREDDATE as CLEAREDDATE,
    COMMITMENTFIRM as COMMITMENT_FIRM,
    COMPONENTYIELD as COMPONENT_YIELD,
    COSTESTIMATE as COST_ESTIMATE,
    COSTESTIMATERATE as COST_ESTIMATE_RATE,
    COSTESTIMATETYPE as COST_ESTIMATE_TYPE,
    CREATEDFROM as CREATED_FROM,
    CREATEDPO as CREATED_PO,
    CREATEOUTSOURCEDWO as CREATE_OUTSOURCE_DWO,
    CREDITFOREIGNAMOUNT as CREDIT_FOREIGN_AMOUNT,
    CSEG_MB_SC as CSEG_MB_SC,
    CSEG_MQB_MHI_DS as CSEG_MQB_MHI_DS,
    CUSTCOL1 as CUSTCOL1,
    CUSTCOL2 as CUSTCOL2,
    CUSTCOL2_2 as CUSTCOL2_2,
    CUSTCOL3 as CUSTCOL3,
    CUSTCOL_5892_EUTRIANGULATION as CUSTCOL_5892_EUTRIANGULATION,
    CUSTCOL_ADJUSTMENT_FIELD as CUSTCOL_ADJUSTMENT_FIELD,
    CUSTCOL_ADJUSTMENT_TAX_CODE as CUSTCOL_ADJUSTMENT_TAX_CODE,
    CUSTCOL_COUNTERPARTY_VAT as CUSTCOL_COUNTERPARTY_VAT,
    CUSTCOL_COUNTRY_OF_ORIGIN_CODE as CUSTCOL_COUNTRY_OF_ORIGIN_CODE,
    CUSTCOL_COUNTRY_OF_ORIGIN_NAME as CUSTCOL_COUNTRY_OF_ORIGIN_NAME,
    CUSTCOL_EMIRATE as CUSTCOL_EMIRATE,
    CUSTCOL_ESTABLISHMENT_CODE as CUSTCOL_ESTABLISHMENT_CODE,
    CUSTCOL_EXPENSE_CODE_OF_SUPPLY as CUSTCOL_EXPENSE_CODE_OF_SUPPLY,
    CUSTCOL_FAR_TRN_RELATEDASSET as CUSTCOL_FAR_TRN_RELATEDASSET,
    CUSTCOL_IS_ASN_REFERENCE as CUSTCOL_IS_ASN_REFERENCE,
    CUSTCOL_IS_ORIGINAL_PO_QTY as CUSTCOL_IS_ORIGINAL_PO_QTY,
    CUSTCOL_IS_PARENT_PO_REFERENCE as CUSTCOL_IS_PARENT_PO_REFERENCE,
    CUSTCOL_IS_Z_CHILD_PO_REFERENCE as CUSTCOL_IS_Z_CHILD_PO_REFERENCE,
    CUSTCOL_MHI_MQB_COLOR as CUSTCOL_MHI_MQB_COLOR,
    CUSTCOL_MHI_MQB_COUNTRY_ORIG_PO_LINE as CUSTCOL_MHI_MQB_COUNTRY_ORIG_PO_LINE,
    CUSTCOL_MHI_MQB_HTSC as CUSTCOL_MHI_MQB_HTSC,
    CUSTCOL_MHI_MQB_HTSV as CUSTCOL_MHI_MQB_HTSV,
    CUSTCOL_MHI_MQB_MP_ORDER_LINE_ID as CUSTCOL_MHI_MQB_MP_ORDER_LINE_ID,
    CUSTCOL_MHI_MQB_RETURN_CAUSE as CUSTCOL_MHI_MQB_RETURN_CAUSE,
    CUSTCOL_MHI_MQB_RETURN_SHIPPING_PAID as CUSTCOL_MHI_MQB_RETURN_SHIPPING_PAID,
    CUSTCOL_MHI_MQB_SHOPIFY_IF_ITEM_ID as CUSTCOL_MHI_MQB_SHOPIFY_IF_ITEM_ID,
    CUSTCOL_MHI_MQB_SHOPIFYLINEITEMID as CUSTCOL_MHI_MQB_SHOPIFYLINEITEMID,
    CUSTCOL_MHI_MQB_SKU as CUSTCOL_MHI_MQB_SKU,
    CUSTCOL_MHI_MQB_SKUSIZE as CUSTCOL_MHI_MQB_SKUSIZE,
    CUSTCOL_MQB_CANCELLATION_REASON as CUSTCOL_MQB_CANCELLATION_REASON,
    CUSTCOL_MQB_FREIGHT_FWD_DATE as CUSTCOL_MQB_FREIGHT_FWD_DATE,
    CUSTCOL_MQB_IN_DC_DATE as CUSTCOL_MQB_IN_DC_DATE,
    CUSTCOL_MQB_MHI_ALLOC_ORDER_DISCOUNT as CUSTCOL_MQB_MHI_ALLOC_ORDER_DISCOUNT,
    CUSTCOL_MQB_MHI_BUFFER_COST_PERCENT as CUSTCOL_MQB_MHI_BUFFER_COST_PERCENT,
    CUSTCOL_MQB_MHI_DISC_RATE as CUSTCOL_MQB_MHI_DISC_RATE,
    CUSTCOL_MQB_MHI_DROP_SHIP_TRANS as CUSTCOL_MQB_MHI_DROP_SHIP_TRANS,
    CUSTCOL_MQB_MHI_EDI_RATE_APPRV_REQ as CUSTCOL_MQB_MHI_EDI_RATE_APPRV_REQ,
    CUSTCOL_MQB_MHI_EDI_RATE_NUMBER as CUSTCOL_MQB_MHI_EDI_RATE_NUMBER,
    CUSTCOL_MQB_MHI_FABRIC_SORATE as CUSTCOL_MQB_MHI_FABRIC_SORATE,
    CUSTCOL_MQB_MHI_GIFT_CARD as CUSTCOL_MQB_MHI_GIFT_CARD,
    CUSTCOL_MQB_MHI_MQB_REVSHARE_AMT as CUSTCOL_MQB_MHI_MQB_REVSHARE_AMT,
    CUSTCOL_MQB_MHI_MQB_REVSHARE_PERC as CUSTCOL_MQB_MHI_MQB_REVSHARE_PERC,
    CUSTCOL_MQB_MHI_OTHER_COST_PERCENT as CUSTCOL_MQB_MHI_OTHER_COST_PERCENT,
    CUSTCOL_MQB_MHI_PO_FABRIC_CANQTY as CUSTCOL_MQB_MHI_PO_FABRIC_CANQTY,
    CUSTCOL_MQB_MHI_PO_VENDOR as CUSTCOL_MQB_MHI_PO_VENDOR,
    CUSTCOL_MQB_MHI_REVSHARE_PERC as CUSTCOL_MQB_MHI_REVSHARE_PERC,
    CUSTCOL_MQB_MHI_REVSHARE_VENDOR as CUSTCOL_MQB_MHI_REVSHARE_VENDOR,
    CUSTCOL_MQB_MHI_TRUE_DS_VENDOR as CUSTCOL_MQB_MHI_TRUE_DS_VENDOR,
    CUSTCOL_MQB_MHI_VENDOR_REVSHARE_AMT as CUSTCOL_MQB_MHI_VENDOR_REVSHARE_AMT,
    CUSTCOL_MQB_TRANSACTION_LINE_PROPERTI as CUSTCOL_MQB_TRANSACTION_LINE_PROPERTI,
    CUSTCOL_MQB_VENDOR_PART_NUMBER as CUSTCOL_MQB_VENDOR_PART_NUMBER,
    CUSTCOL_NATURE_OF_TRANSACTION_CODES as CUSTCOL_NATURE_OF_TRANSACTION_CODES,
    CUSTCOL_NM_SS_EX_FLAG as CUSTCOL_NM_SS_EX_FLAG,
    CUSTCOL_NM_SS_EXPORT_STATUS as CUSTCOL_NM_SS_EXPORT_STATUS,
    CUSTCOL_NM_SS_IS_ORDER_LINE_ITEM as CUSTCOL_NM_SS_IS_ORDER_LINE_ITEM,
    CUSTCOL_NM_SS_ITEM_ORDER_KEY as CUSTCOL_NM_SS_ITEM_ORDER_KEY,
    CUSTCOL_NM_SS_ITEM_ORDER_NUMBER as CUSTCOL_NM_SS_ITEM_ORDER_NUMBER,
    CUSTCOL_NM_SS_ORDER_ID as CUSTCOL_NM_SS_ORDER_ID,
    CUSTCOL_NM_SS_SBI as CUSTCOL_NM_SS_SBI,
    CUSTCOL_NM_SS_STORE_ID as CUSTCOL_NM_SS_STORE_ID,
    CUSTCOL_NONDEDUCTIBLE_ACCOUNT as CUSTCOL_NONDEDUCTIBLE_ACCOUNT,
    CUSTCOL_PRODUCT_COLOR as CUSTCOL_PRODUCT_COLOR,
    CUSTCOL_PRODUCT_SIZE as CUSTCOL_PRODUCT_SIZE,
    CUSTCOL_SCM_COSTCAT_PROFILE as CUSTCOL_SCM_COSTCAT_PROFILE,
    CUSTCOL_SCM_CUSTOMERPARTNUMBER as CUSTCOL_SCM_CUSTOMERPARTNUMBER,
    CUSTCOL_SCM_ITEMSUB_ORIGINAL_ITEM as CUSTCOL_SCM_ITEMSUB_ORIGINAL_ITEM,
    CUSTCOL_SII_ANNUAL_PRORATE as CUSTCOL_SII_ANNUAL_PRORATE,
    CUSTCOL_SII_EXEMPT_LINE_DETAILS as CUSTCOL_SII_EXEMPT_LINE_DETAILS,
    CUSTCOL_SII_SERVICE_DATE as CUSTCOL_SII_SERVICE_DATE,
    CUSTCOL_SPS_BPN as CUSTCOL_SPS_BPN,
    CUSTCOL_SPS_CCG_NOTEINFORMATIONFIELD as CUSTCOL_SPS_CCG_NOTEINFORMATIONFIELD,
    CUSTCOL_SPS_DATE_002 as CUSTCOL_SPS_DATE_002,
    CUSTCOL_SPS_DEPARTMENT as CUSTCOL_SPS_DEPARTMENT,
    CUSTCOL_SPS_DEPARTMENTDESCRIPTION as CUSTCOL_SPS_DEPARTMENTDESCRIPTION,
    CUSTCOL_SPS_EAN as CUSTCOL_SPS_EAN,
    CUSTCOL_SPS_GEN_NOTEINFORMATIONFIELD as CUSTCOL_SPS_GEN_NOTEINFORMATIONFIELD,
    CUSTCOL_SPS_GFT_NOTEINFORMATIONFIELD as CUSTCOL_SPS_GFT_NOTEINFORMATIONFIELD,
    CUSTCOL_SPS_GTIN as CUSTCOL_SPS_GTIN,
    CUSTCOL_SPS_INNERPACK as CUSTCOL_SPS_INNERPACK,
    CUSTCOL_SPS_ISBN as CUSTCOL_SPS_ISBN,
    CUSTCOL_SPS_ITEMSCHEDULEDATE1 as CUSTCOL_SPS_ITEMSCHEDULEDATE1,
    CUSTCOL_SPS_ITEMSCHEDULEDATE2 as CUSTCOL_SPS_ITEMSCHEDULEDATE2,
    CUSTCOL_SPS_ITEMSCHEDULEDATE3 as CUSTCOL_SPS_ITEMSCHEDULEDATE3,
    CUSTCOL_SPS_ITEMSCHEDULEQTY1 as CUSTCOL_SPS_ITEMSCHEDULEQTY1,
    CUSTCOL_SPS_ITEMSCHEDULEQTY2 as CUSTCOL_SPS_ITEMSCHEDULEQTY2,
    CUSTCOL_SPS_ITEMSCHEDULEQTY3 as CUSTCOL_SPS_ITEMSCHEDULEQTY3,
    CUSTCOL_SPS_ITEMSCHEDULEQUALIFIER1 as CUSTCOL_SPS_ITEMSCHEDULEQUALIFIER1,
    CUSTCOL_SPS_ITEMSCHEDULEQUALIFIER2 as CUSTCOL_SPS_ITEMSCHEDULEQUALIFIER2,
    CUSTCOL_SPS_ITEMSCHEDULEQUALIFIER3 as CUSTCOL_SPS_ITEMSCHEDULEQUALIFIER3,
    CUSTCOL_SPS_ITEMSTATUSCODE1 as CUSTCOL_SPS_ITEMSTATUSCODE1,
    CUSTCOL_SPS_ITEMSTATUSCODE2 as CUSTCOL_SPS_ITEMSTATUSCODE2,
    CUSTCOL_SPS_ITEMSTATUSCODE3 as CUSTCOL_SPS_ITEMSTATUSCODE3,
    CUSTCOL_SPS_LINESEQUENCENUMBER as CUSTCOL_SPS_LINESEQUENCENUMBER,
    CUSTCOL_SPS_MPN as CUSTCOL_SPS_MPN,
    CUSTCOL_SPS_MSR_UNITPRICE as CUSTCOL_SPS_MSR_UNITPRICE,
    CUSTCOL_SPS_NDC as CUSTCOL_SPS_NDC,
    CUSTCOL_SPS_NRFCOLORCODE as CUSTCOL_SPS_NRFCOLORCODE,
    CUSTCOL_SPS_NRFSIZECODE as CUSTCOL_SPS_NRFSIZECODE,
    CUSTCOL_SPS_ORDERQTYUOM as CUSTCOL_SPS_ORDERQTYUOM,
    CUSTCOL_SPS_OUTERPACK as CUSTCOL_SPS_OUTERPACK,
    CUSTCOL_SPS_PACKSIZE as CUSTCOL_SPS_PACKSIZE,
    CUSTCOL_SPS_PACKUOM as CUSTCOL_SPS_PACKUOM,
    CUSTCOL_SPS_PRN_NOTEINFORMATIONFIELD as CUSTCOL_SPS_PRN_NOTEINFORMATIONFIELD,
    CUSTCOL_SPS_PRODUCTCOLORCODE as CUSTCOL_SPS_PRODUCTCOLORCODE,
    CUSTCOL_SPS_PRODUCTCOLORDESCRIPTION as CUSTCOL_SPS_PRODUCTCOLORDESCRIPTION,
    CUSTCOL_SPS_PRODUCTFABRICDESCRIPTION as CUSTCOL_SPS_PRODUCTFABRICDESCRIPTION,
    CUSTCOL_SPS_PRODUCTSIZECODE as CUSTCOL_SPS_PRODUCTSIZECODE,
    CUSTCOL_SPS_PRODUCTSIZEDESCRIPTION as CUSTCOL_SPS_PRODUCTSIZEDESCRIPTION,
    CUSTCOL_SPS_PURCHASEPRICE as CUSTCOL_SPS_PURCHASEPRICE,
    CUSTCOL_SPS_QTYPACKED as CUSTCOL_SPS_QTYPACKED,
    CUSTCOL_SPS_RTL_UNITPRICE as CUSTCOL_SPS_RTL_UNITPRICE,
    CUSTCOL_SPS_SHP_NOTEINFORMATIONFIELD as CUSTCOL_SPS_SHP_NOTEINFORMATIONFIELD,
    CUSTCOL_SPS_SPE_NOTEINFORMATIONFIELD as CUSTCOL_SPS_SPE_NOTEINFORMATIONFIELD,
    CUSTCOL_SPS_TAX_TX as CUSTCOL_SPS_TAX_TX,
    CUSTCOL_SPS_TP_ORDER_QTY as CUSTCOL_SPS_TP_ORDER_QTY,
    CUSTCOL_SPS_UPC as CUSTCOL_SPS_UPC,
    CUSTCOL_SPS_UPCCASECODE as CUSTCOL_SPS_UPCCASECODE,
    CUSTCOL_SPS_VENDORPARTNUMBER as CUSTCOL_SPS_VENDORPARTNUMBER,
    CUSTCOL_STATISTICAL_PROCEDURE_PURC as CUSTCOL_STATISTICAL_PROCEDURE_PURC,
    CUSTCOL_STATISTICAL_PROCEDURE_SALE as CUSTCOL_STATISTICAL_PROCEDURE_SALE,
    CUSTCOL_STATISTICAL_VALUE as CUSTCOL_STATISTICAL_VALUE,
    CUSTCOL_STATISTICAL_VALUE_BASE_CURR as CUSTCOL_STATISTICAL_VALUE_BASE_CURR,
    CUSTCOL_WRM_REG_WARRANTYEXPIRE as CUSTCOL_WRM_REG_WARRANTYEXPIRE,
    CUSTCOL_WRM_REG_WARRANTYREG as CUSTCOL_WRM_REG_WARRANTYREG,
    CUSTCOL_WRM_REG_WARRANTYTERMS as CUSTCOL_WRM_REG_WARRANTYTERMS,
    CUSTCOLBOOM_SPF_CXL_INTEGRATION_STATU as CUSTCOLBOOM_SPF_CXL_INTEGRATION_STATU,
    CUSTCOLBOOMI_SPF_CXL_INTEGR_MESSAGE as CUSTCOLBOOMI_SPF_CXL_INTEGR_MESSAGE,
    CUSTCOLCUSTMBLIFECYCLEEXPORTSTATUS as CUSTCOLCUSTMBLIFECYCLEEXPORTSTATUS,
    DAYSLATE as DAYS_LATE,
    DEBITFOREIGNAMOUNT as DEBIT_FOREIGN_AMOUNT,
    DEPARTMENT as DEPARTMENT,
    DOCUMENTNUMBER as DOCUMENT_NUMBER,
    DONOTDISPLAYLINE as DO_NOT_DISPLAY_LINE,
    DROPSHIP as DROP_SHIP,
    ELIMINATE as ELIMINATE,
    ENTITY as ENTITY,
    ESTGROSSPROFIT as EST_GROSSPROFIT,
    ESTGROSSPROFITPERCENT as EST_GROSSPROFIT_PERCENT,
    ESTIMATEDAMOUNT as ESTIMATED_AMOUNT,
    EXPECTEDRECEIPTDATE as EXPECTED_RECEIPT_DATE,
    EXPECTEDSHIPDATE as EXPECTED_SHIP_DATE,
    EXPENSEACCOUNT as EXPENSE_ACCOUNT,
    FOREIGNAMOUNT as FOREIGN_AMOUNT,
    FOREIGNAMOUNTPAID as FOREIGN_AMOUNT_PAID,
    FOREIGNAMOUNTUNPAID as FOREIGN_AMOUNT_UNPAID,
    FOREIGNPAYMENTAMOUNTUNUSED as FOREIGN_PAYMENT_AMOUNT_UNUSED,
    FOREIGNPAYMENTAMOUNTUSED as FOREIGN_PAYMENT_AMOUNT_USED,
    FULFILLABLE as FULFILLABLE,
    FXAMOUNTLINKED as FX_AMOUNT_LINKED,
    HASFULFILLABLEITEMS as HAS_FULFILLABLE_ITEMS,
    ISBILLABLE as IS_BILLABLE,
    ISCLOSED as IS_CLOSED,
    ISCOGS as IS_COGS,
    ISCUSTOMGLLINE as IS_CUSTOM_GL_LINE,
    ISFULLYSHIPPED as IS_FULLYSHIPPED,
    ISFXVARIANCE as IS_FX_VARIANCE,
    ISINVENTORYAFFECTING as IS_INVENTORY_AFFECTING,
    ISREVRECTRANSACTION as IS_REVREC_TRANSACTION,
    ITEM as ITEM,
    ITEMSOURCE as ITEM_SOURCE,
    ITEMTYPE as ITEM_TYPE,
    KITCOMPONENT as KIT_COMPONENT,
    LANDEDCOSTCATEGORY as LANDED_COST_CATEGORY,
    LANDEDCOSTPERLINE as LANDED_COST_PERLINE,
    LINELASTMODIFIEDDATE as LINE_LAST_MODIFIED_DATE,
    LINESEQUENCENUMBER as LINE_SEQUENCE_NUMBER,
    "LOCATION" as _LOCATION,
    MAINLINE as MAIN_LINE,
    MATCHBILLTORECEIPT as MATCH_BILL_TO_RECEIPT,
    MEMO as MEMO,
    NETAMOUNT as NET_AMOUNT,
    OLDCOMMITMENTFIRM as OLD_COMMITMENT_FIRM,
    ORDERALLOCATIONSTRATEGY as ORDER_ALLOCATION_STRATEGY,
    ORDERPRIORITY as ORDER_PRIORITY,
    PAYMENTMETHOD as PAYMENT_METHOD,
    PRICE as PRICE,
    PROCESSEDBYREVCOMMIT as PROCESSED_BY_REV_COMMIT,
    PRODUCTIONENDDATE as PRODUCTIONEND_DATE,
    PRODUCTIONSTARTDATE as PRODUCTION_START_DATE,
    QUANTITY as QUANTITY,
    QUANTITYALLOCATED as QUANTITY_ALLOCATED,
    QUANTITYBACKORDERED as QUANTITY_BACKORDERED,
    QUANTITYBILLED as QUANTITY_BILLED,
    QUANTITYCOMMITTED as QUANTIT_YCOMMITTED,
    QUANTITYDEMANDALLOCATED as QUANTITY_DEMAND_ALLOCATED,
    QUANTITYONSHIPMENTS as QUANTITY_ON_SHIPMENTS,
    QUANTITYREJECTED as QUANTITY_REJECTED,
    QUANTITYSHIPRECV as QUANTITY_SHIPRECV,
    RATE as RATE,
    RATEAMOUNT as RATE_AMOUNT,
    RATEPERCENT as RATE_PERCENT,
    REQUESTEDDATE as REQUESTED_DATE,
    REQUESTNOTE as REQUEST_NOTE,
    REVENUEELEMENT as REVENUE_ELEMENT,
    SPECIALORDER as SPECIAL_ORDER,
    SUBSIDIARY as SUBSIDIARY,
    TAXLINE as TAXLINE,
    TRANSACTIONDISCOUNT as TRANSACTION_DISCOUNT,
    TRANSACTIONLINETYPE as TRANSACTION_LINE_TYPE,
    TRANSFERORDERITEMLINEID as TRANSFER_ORDER_ITEM_LINE_ID,
    UNIQUEKEY as UNIQUE_KEY,
    VSOEISESTIMATE as VSOEIS_ESTIMATE,
    "_FIVETRAN_DELETED" as "_FIVETRAN_DELETED",
    DATE_DELETED as DATE_DELETED,
    "_FIVETRAN_SYNCED" as "_FIVETRAN_SYNCED",
    CUSTCOL_MHI_MQB_VRMA_LINK as CUSTCOL_MHI_MQB_VRMA_LINK,
    CUSTCOL_MQB_AMAZON_LINE_NUMBER as CUSTCOL_MQB_AMAZON_LINE_NUMBER,
    CLOSEDATE as CLOSE_DATE
    FROM base