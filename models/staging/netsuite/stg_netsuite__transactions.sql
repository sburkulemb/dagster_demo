with base as (select * from {{ source("raw_netsuite", "TRANSACTION") }})

select
    ID as TRANSACTION_ID,
    ABBREVTYPE as ABBREV_TYPE,
    ACCOUNTBASEDNUMBER as ACCOUNT_BASED_NUMBER,
    ACTUALPRODUCTIONENDDATE as ACTUAL_PRODUCTION_END_DATE,
    ACTUALPRODUCTIONSTARTDATE as ACTUAL_PRODUCTION_START_DATE,
    ACTUALSHIPDATE as ACTUAL_SHIP_DATE,
    ALTSALESTOTAL as ALT_SALES_TOTAL,
    APPROVALSTATUS as APPROVAL_STATUS,
    BALSEGSTATUS as BAL_SEG_STATUS,
    BILLINGADDRESS as BILLING_ADDRESS,
    BILLINGSTATUS as BILLING_STATUS,
    BILLOFMATERIALS as BILL_OF_MATERIALS,
    BILLOFMATERIALSREVISION as BILL_OF_MATERIALS_REVISION,
    BULKPROCSUBMISSION as BULK_PROC_SUBMISSION,
    BUSINESSEVENTSPROCESSINGHISTORY as BUSINESS_EVENTS_PROCESSING_HISTORY,
    CLOSEDATE as CLOS_EDATE,
    "COMMITTED" as _COMMITTED,
    CREATEDBY as CREATED_BY,
    CREATEDDATE as CREATED_DATE,
    CSEG_MB_SC as CSEG_MB_SC,
    CSEG_MQB_MHI_DS as CSEG_MQB_MHI_DS,
    CURRENCY as CURRENCY,
    CUSTBODY_11187_PREF_ENTITY_BANK as CUSTBODY_11187_PREF_ENTITY_BANK,
    CUSTBODY_11724_BANK_FEE as CUSTBODY_11724_BANK_FEE,
    CUSTBODY_11724_PAY_BANK_FEES as CUSTBODY_11724_PAY_BANK_FEES,
    CUSTBODY_15529_EMP_ENTITY_BANK as CUSTBODY_15529_EMP_ENTITY_BANK,
    CUSTBODY_15529_VENDOR_ENTITY_BANK as CUSTBODY_15529_VENDOR_ENTITY_BANK,
    CUSTBODY_15699_EXCLUDE_FROM_EP_PROCESS as CUSTBODY_15699_EXCLUDE_FROM_EP_PROCESS,
    CUSTBODY_2663_REFERENCE_NUM as CUSTBODY_2663_REFERENCE_NUM,
    CUSTBODY_4110_CUSTOMREGNUM as CUSTBODY_4110_CUSTOMREGNUM,
    CUSTBODY_4599_MX_OPERATION_TYPE as CUSTBODY_4599_MX_OPERATION_TYPE,
    CUSTBODY_4599_SG_IMPORT_PERMIT_NUM as CUSTBODY_4599_SG_IMPORT_PERMIT_NUM,
    CUSTBODY_9997_AUTOCASH_ASSERTION_FIELD as CUSTBODY_9997_AUTOCASH_ASSERTION_FIELD,
    CUSTBODY_9997_IS_FOR_EP_DD as CUSTBODY_9997_IS_FOR_EP_DD,
    CUSTBODY_9997_IS_FOR_EP_EFT as CUSTBODY_9997_IS_FOR_EP_EFT,
    CUSTBODY_9997_PFA_RECORD as CUSTBODY_9997_PFA_RECORD,
    CUSTBODY_ADJUSTMENT_JOURNAL as CUSTBODY_ADJUSTMENT_JOURNAL,
    CUSTBODY_AVA_DISCOUNTAMOUNT as CUSTBODY_AVA_DISCOUNTAMOUNT,
    CUSTBODY_BOOMI_RTN_DELIV_INT_STATUSMSG as CUSTBODY_BOOMI_RTN_DELIV_INT_STATUSMSG,
    CUSTBODY_BOOMI_RTN_DELIVERY_INTG_STATU as CUSTBODY_BOOMI_RTN_DELIVERY_INTG_STATU,
    CUSTBODY_BOOMI_SPH_IR_INTG_STATUS as CUSTBODY_BOOMI_SPH_IR_INTG_STATUS,
    CUSTBODY_BOOMI_SPH_IR_INTG_STATUS_MSG as CUSTBODY_BOOMI_SPH_IR_INTG_STATUS_MSG,
    CUSTBODY_CASH_REGISTER as CUSTBODY_CASH_REGISTER,
    CUSTBODY_CELIGO_DISC_TOTAL_VARIANCE as CUSTBODY_CELIGO_DISC_TOTAL_VARIANCE,
    CUSTBODY_CELIGO_EXPORT_COUNT as CUSTBODY_CELIGO_EXPORT_COUNT,
    CUSTBODY_CELIGO_LINKED_TRANSID as CUSTBODY_CELIGO_LINKED_TRANSID,
    CUSTBODY_CELIGO_ORDER_TOTAL_VARIANCE as CUSTBODY_CELIGO_ORDER_TOTAL_VARIANCE,
    CUSTBODY_CELIGO_PAYOUT as CUSTBODY_CELIGO_PAYOUT,
    CUSTBODY_CELIGO_PAYOUT_SRC_ACCT_NAME as CUSTBODY_CELIGO_PAYOUT_SRC_ACCT_NAME,
    CUSTBODY_CELIGO_SHIP_TOTAL_VARIANCE as CUSTBODY_CELIGO_SHIP_TOTAL_VARIANCE,
    CUSTBODY_CELIGO_TAX_TOTAL_VARIANCE as CUSTBODY_CELIGO_TAX_TOTAL_VARIANCE,
    CUSTBODY_COUNTERPARTY_VAT as CUSTBODY_COUNTERPARTY_VAT,
    CUSTBODY_COUNTRY_OF_ORIGIN as CUSTBODY_COUNTRY_OF_ORIGIN,
    CUSTBODY_CPS_TROY_LOOP_RET_ID as CUSTBODY_CPS_TROY_LOOP_RET_ID,
    CUSTBODY_DATE_LSA as CUSTBODY_DATE_LSA,
    CUSTBODY_DATE_OF_TAXABLE_SUPPLY as CUSTBODY_DATE_OF_TAXABLE_SUPPLY,
    CUSTBODY_DELIVERY_TERMS as CUSTBODY_DELIVERY_TERMS,
    CUSTBODY_DOCUMENT_DATE as CUSTBODY_DOCUMENT_DATE,
    CUSTBODY_ES_SHIPTOID as CUSTBODY_ES_SHIPTOID,
    CUSTBODY_ESC_CAMPAIGN_CATEGORY as CUSTBODY_ESC_CAMPAIGN_CATEGORY,
    CUSTBODY_ESTABLISHMENT_CODE as CUSTBODY_ESTABLISHMENT_CODE,
    CUSTBODY_FAM_JRN_IS_REVERSAL as CUSTBODY_FAM_JRN_IS_REVERSAL,
    CUSTBODY_FAM_JRN_REVERSAL_DATE as CUSTBODY_FAM_JRN_REVERSAL_DATE,
    CUSTBODY_FAM_JRN_REVERSAL_NO as CUSTBODY_FAM_JRN_REVERSAL_NO,
    CUSTBODY_FAM_LP_ASSET as CUSTBODY_FAM_LP_ASSET,
    CUSTBODY_FAM_LP_ASSETDESC as CUSTBODY_FAM_LP_ASSETDESC,
    CUSTBODY_FAM_LP_ASSETPROP as CUSTBODY_FAM_LP_ASSETPROP,
    CUSTBODY_FAM_LP_COMPANY as CUSTBODY_FAM_LP_COMPANY,
    CUSTBODY_FAM_LP_CONTRACT as CUSTBODY_FAM_LP_CONTRACT,
    CUSTBODY_FAM_LP_CONTRACTNUM as CUSTBODY_FAM_LP_CONTRACTNUM,
    CUSTBODY_FAM_LP_FINANCELEASE as CUSTBODY_FAM_LP_FINANCELEASE,
    CUSTBODY_FAM_LP_GAINONMOD as CUSTBODY_FAM_LP_GAINONMOD,
    CUSTBODY_FAM_LP_INTEXPENSE as CUSTBODY_FAM_LP_INTEXPENSE,
    CUSTBODY_FAM_LP_LEASELIABILITY as CUSTBODY_FAM_LP_LEASELIABILITY,
    CUSTBODY_FAM_LP_RIGHTOFUSE as CUSTBODY_FAM_LP_RIGHTOFUSE,
    CUSTBODY_FAM_LP_STARTDATE as CUSTBODY_FAM_LP_STARTDATE,
    CUSTBODY_FAM_LP_TOTALINTEREST as CUSTBODY_FAM_LP_TOTALINTEREST,
    CUSTBODY_FAM_LP_TOTALLEASELIAB as CUSTBODY_FAM_LP_TOTALLEASELIAB,
    CUSTBODY_FAM_LP_TOTALLEASEPAYMENT as CUSTBODY_FAM_LP_TOTALLEASEPAYMENT,
    CUSTBODY_FAM_LP_TOTALNPV as CUSTBODY_FAM_LP_TOTALNPV,
    CUSTBODY_FAM_LP_TOTALPRINCIPAL as CUSTBODY_FAM_LP_TOTALPRINCIPAL,
    CUSTBODY_FAM_SPECDEPRJRN_SHORTAGE as CUSTBODY_FAM_SPECDEPRJRN_SHORTAGE,
    CUSTBODY_FAM_SPECDEPRJRN_SPECIALDEPR as CUSTBODY_FAM_SPECDEPRJRN_SPECIALDEPR,
    CUSTBODY_FB_MHI_CREATED_FROM_EXPENSIFY as CUSTBODY_FB_MHI_CREATED_FROM_EXPENSIFY,
    CUSTBODY_FB_MHI_PARENT_ORDER as CUSTBODY_FB_MHI_PARENT_ORDER,
    CUSTBODY_FB_MHI_TRUCK as CUSTBODY_FB_MHI_TRUCK,
    CUSTBODY_FB_PO_COMPLETION_STATUS as CUSTBODY_FB_PO_COMPLETION_STATUS,
    CUSTBODY_INVOICE_SENT as CUSTBODY_INVOICE_SENT,
    CUSTBODY_ITR_DOC_NUMBER as CUSTBODY_ITR_DOC_NUMBER,
    CUSTBODY_ITR_NEXUS as CUSTBODY_ITR_NEXUS,
    CUSTBODY_JOURNAL_CREATED_BY as CUSTBODY_JOURNAL_CREATED_BY,
    CUSTBODY_JOURNAL_CREATED_BY_2 as CUSTBODY_JOURNAL_CREATED_BY_2,
    CUSTBODY_JPMC_BILL_CHECK as CUSTBODY_JPMC_BILL_CHECK,
    CUSTBODY_JPMC_BILL_TRAN as CUSTBODY_JPMC_BILL_TRAN,
    CUSTBODY_LINK_LSA as CUSTBODY_LINK_LSA,
    CUSTBODY_LINK_NAME_LSA as CUSTBODY_LINK_NAME_LSA,
    CUSTBODY_MARQUEE_ADDBACK as CUSTBODY_MARQUEE_ADDBACK,
    CUSTBODY_MB_APPROVER as CUSTBODY_MB_APPROVER,
    CUSTBODY_MB_BENEFICIARY_ACCOUNT_NAME as CUSTBODY_MB_BENEFICIARY_ACCOUNT_NAME,
    CUSTBODY_MB_BENEFICIARY_ACCOUNT_NUM as CUSTBODY_MB_BENEFICIARY_ACCOUNT_NUM,
    CUSTBODY_MB_BENEFICIARY_SWIFT_ID as CUSTBODY_MB_BENEFICIARY_SWIFT_ID,
    CUSTBODY_MB_CHECKS_PAYABLE_ADDRESS as CUSTBODY_MB_CHECKS_PAYABLE_ADDRESS,
    CUSTBODY_MB_FUND as CUSTBODY_MB_FUND,
    CUSTBODY_MB_IROF_RECEIPT as CUSTBODY_MB_IROF_RECEIPT,
    CUSTBODY_MB_PROPOSED_PMT_DATE as CUSTBODY_MB_PROPOSED_PMT_DATE,
    CUSTBODY_MB_READY_TO_DELIVER as CUSTBODY_MB_READY_TO_DELIVER,
    CUSTBODY_MB_ROUTING_NUMBER as CUSTBODY_MB_ROUTING_NUMBER,
    CUSTBODY_MB_SO_SOURCESYSTEM as CUSTBODY_MB_SO_SOURCESYSTEM,
    CUSTBODY_MB_WIRE_INFORMATION as CUSTBODY_MB_WIRE_INFORMATION,
    CUSTBODY_MHI_3WAY_DIFFERENCE_EXIST as CUSTBODY_MHI_3WAY_DIFFERENCE_EXIST,
    CUSTBODY_MHI_ACCOUNTING_3WAY_REVW as CUSTBODY_MHI_ACCOUNTING_3WAY_REVW,
    CUSTBODY_MHI_ACCOUNTING_REVIEWER as CUSTBODY_MHI_ACCOUNTING_REVIEWER,
    CUSTBODY_MHI_ACCOUNTING_REVW_DATE as CUSTBODY_MHI_ACCOUNTING_REVW_DATE,
    CUSTBODY_MHI_BILL_WO_PO as CUSTBODY_MHI_BILL_WO_PO,
    CUSTBODY_MHI_DELETE_ME as CUSTBODY_MHI_DELETE_ME,
    CUSTBODY_MHI_HOLD_IR_3WAY as CUSTBODY_MHI_HOLD_IR_3WAY,
    CUSTBODY_MHI_INTERGRATION_TRACKER as CUSTBODY_MHI_INTERGRATION_TRACKER,
    CUSTBODY_MHI_IR_POST_BILL_APPRV as CUSTBODY_MHI_IR_POST_BILL_APPRV,
    CUSTBODY_MHI_MQB_ACTUAL_SHIP_CODE as CUSTBODY_MHI_MQB_ACTUAL_SHIP_CODE,
    CUSTBODY_MHI_MQB_CARRIER as CUSTBODY_MHI_MQB_CARRIER,
    CUSTBODY_MHI_MQB_CARTON_CODE as CUSTBODY_MHI_MQB_CARTON_CODE,
    CUSTBODY_MHI_MQB_CARTON_NUMBER as CUSTBODY_MHI_MQB_CARTON_NUMBER,
    CUSTBODY_MHI_MQB_COUNTRYOFORIGINPO as CUSTBODY_MHI_MQB_COUNTRYOFORIGINPO,
    CUSTBODY_MHI_MQB_CUTORDERNUMBER as CUSTBODY_MHI_MQB_CUTORDERNUMBER,
    CUSTBODY_MHI_MQB_FABRIC_INVID as CUSTBODY_MHI_MQB_FABRIC_INVID,
    CUSTBODY_MHI_MQB_FABRIC_INVNUM as CUSTBODY_MHI_MQB_FABRIC_INVNUM,
    CUSTBODY_MHI_MQB_FABRIC_ORDERID as CUSTBODY_MHI_MQB_FABRIC_ORDERID,
    CUSTBODY_MHI_MQB_FABRIC_RMAID as CUSTBODY_MHI_MQB_FABRIC_RMAID,
    CUSTBODY_MHI_MQB_FABRIC_SHIPID as CUSTBODY_MHI_MQB_FABRIC_SHIPID,
    CUSTBODY_MHI_MQB_FLURRY_INTEG_STATUS as CUSTBODY_MHI_MQB_FLURRY_INTEG_STATUS,
    CUSTBODY_MHI_MQB_INTEGRATION_STAT_MSG as CUSTBODY_MHI_MQB_INTEGRATION_STAT_MSG,
    CUSTBODY_MHI_MQB_MP_ORDER_ID as CUSTBODY_MHI_MQB_MP_ORDER_ID,
    CUSTBODY_MHI_MQB_REASONCODE as CUSTBODY_MHI_MQB_REASONCODE,
    CUSTBODY_MHI_MQB_RMA_ID as CUSTBODY_MHI_MQB_RMA_ID,
    CUSTBODY_MHI_MQB_RMASOURCESYSTEM as CUSTBODY_MHI_MQB_RMASOURCESYSTEM,
    CUSTBODY_MHI_MQB_SHOPIFY_SOURCE as CUSTBODY_MHI_MQB_SHOPIFY_SOURCE,
    CUSTBODY_MHI_MQB_SO_MP_RETAILE as CUSTBODY_MHI_MQB_SO_MP_RETAILE,
    CUSTBODY_MHI_MQB_TOTALRECEIVEDQTY as CUSTBODY_MHI_MQB_TOTALRECEIVEDQTY,
    CUSTBODY_MHI_MQB_TRACKING_NUMBER as CUSTBODY_MHI_MQB_TRACKING_NUMBER,
    CUSTBODY_MHI_OVERRIDE_HOLD_IR as CUSTBODY_MHI_OVERRIDE_HOLD_IR,
    CUSTBODY_MHI_PAYPAL_TRANSACTION_ID as CUSTBODY_MHI_PAYPAL_TRANSACTION_ID,
    CUSTBODY_MHI_PURCHASECATEGORY as CUSTBODY_MHI_PURCHASECATEGORY,
    CUSTBODY_MHI_TOTAL_SHOPIFY_TAX as CUSTBODY_MHI_TOTAL_SHOPIFY_TAX,
    CUSTBODY_MHI_TRANSACTION_DISCOUNT_STOR as CUSTBODY_MHI_TRANSACTION_DISCOUNT_STOR,
    CUSTBODY_MHI_TRANSACTION_SUBTOTAL_STOR as CUSTBODY_MHI_TRANSACTION_SUBTOTAL_STOR,
    CUSTBODY_MHI_VENDORSTATUS as CUSTBODY_MHI_VENDORSTATUS,
    CUSTBODY_MODE_OF_TRANSPORT as CUSTBODY_MODE_OF_TRANSPORT,
    CUSTBODY_MQB_APPROVAL_DATE as CUSTBODY_MQB_APPROVAL_DATE,
    CUSTBODY_MQB_CUST_SHIPPMETHOD as CUSTBODY_MQB_CUST_SHIPPMETHOD,
    CUSTBODY_MQB_CUSTOM_SHIPPINGCOST as CUSTBODY_MQB_CUSTOM_SHIPPINGCOST,
    CUSTBODY_MQB_FACTOR as CUSTBODY_MQB_FACTOR,
    CUSTBODY_MQB_FREIGHT_FWDR_DATE as CUSTBODY_MQB_FREIGHT_FWDR_DATE,
    CUSTBODY_MQB_INDIA_AGENT as CUSTBODY_MQB_INDIA_AGENT,
    CUSTBODY_MQB_LINKED_PO as CUSTBODY_MQB_LINKED_PO,
    CUSTBODY_MQB_MASS_UPDATED as CUSTBODY_MQB_MASS_UPDATED,
    CUSTBODY_MQB_MHI_ADJUSTMENT_REASON as CUSTBODY_MQB_MHI_ADJUSTMENT_REASON,
    CUSTBODY_MQB_MHI_CH_PLID as CUSTBODY_MQB_MHI_CH_PLID,
    CUSTBODY_MQB_MHI_CH_POTYPECODE as CUSTBODY_MQB_MHI_CH_POTYPECODE,
    CUSTBODY_MQB_MHI_CH_SALESDIVISION as CUSTBODY_MQB_MHI_CH_SALESDIVISION,
    CUSTBODY_MQB_MHI_CREATED_BY as CUSTBODY_MQB_MHI_CREATED_BY,
    CUSTBODY_MQB_MHI_EDI_APPROVED as CUSTBODY_MQB_MHI_EDI_APPROVED,
    CUSTBODY_MQB_MHI_EDI_APPROVER as CUSTBODY_MQB_MHI_EDI_APPROVER,
    CUSTBODY_MQB_MHI_EDI_RATE_APPRV_REQ as CUSTBODY_MQB_MHI_EDI_RATE_APPRV_REQ,
    CUSTBODY_MQB_MHI_FABRICSCRIPTPROCESSED as CUSTBODY_MQB_MHI_FABRICSCRIPTPROCESSED,
    CUSTBODY_MQB_MHI_FB_FLURRY_ADJ_TRAN_ID as CUSTBODY_MQB_MHI_FB_FLURRY_ADJ_TRAN_ID,
    CUSTBODY_MQB_MHI_FBFLURRY_SHIPMENT_NUM as CUSTBODY_MQB_MHI_FBFLURRY_SHIPMENT_NUM,
    CUSTBODY_MQB_MHI_FBTENANT_IF as CUSTBODY_MQB_MHI_FBTENANT_IF,
    CUSTBODY_MQB_MHI_FINANCIAL_STATUS as CUSTBODY_MQB_MHI_FINANCIAL_STATUS,
    CUSTBODY_MQB_MHI_IF_FABRIC_BISMSG as CUSTBODY_MQB_MHI_IF_FABRIC_BISMSG,
    CUSTBODY_MQB_MHI_IF_FABRIC_BISTATUS as CUSTBODY_MQB_MHI_IF_FABRIC_BISTATUS,
    CUSTBODY_MQB_MHI_IF_SBISTATUS as CUSTBODY_MQB_MHI_IF_SBISTATUS,
    CUSTBODY_MQB_MHI_IF_SBISTATUSMSG as CUSTBODY_MQB_MHI_IF_SBISTATUSMSG,
    CUSTBODY_MQB_MHI_INV_QTY_SYNC_TIME as CUSTBODY_MQB_MHI_INV_QTY_SYNC_TIME,
    CUSTBODY_MQB_MHI_MBISTATUS as CUSTBODY_MQB_MHI_MBISTATUS,
    CUSTBODY_MQB_MHI_MBISTATUSMSG as CUSTBODY_MQB_MHI_MBISTATUSMSG,
    CUSTBODY_MQB_MHI_PO_EMPLOYEE as CUSTBODY_MQB_MHI_PO_EMPLOYEE,
    CUSTBODY_MQB_MHI_PO_FABRIC_BISMSG as CUSTBODY_MQB_MHI_PO_FABRIC_BISMSG,
    CUSTBODY_MQB_MHI_PO_FABRIC_BISTATUS as CUSTBODY_MQB_MHI_PO_FABRIC_BISTATUS,
    CUSTBODY_MQB_MHI_PO_FBFLURRY_BISMSG as CUSTBODY_MQB_MHI_PO_FBFLURRY_BISMSG,
    CUSTBODY_MQB_MHI_PO_FBFLURRY_BISTATUS as CUSTBODY_MQB_MHI_PO_FBFLURRY_BISTATUS,
    CUSTBODY_MQB_MHI_RMA_CM_INTERNAL_ID as CUSTBODY_MQB_MHI_RMA_CM_INTERNAL_ID,
    CUSTBODY_MQB_MHI_RMA_IR_INTERNAL_ID as CUSTBODY_MQB_MHI_RMA_IR_INTERNAL_ID,
    CUSTBODY_MQB_MHI_SHOPIFY_IF_ID as CUSTBODY_MQB_MHI_SHOPIFY_IF_ID,
    CUSTBODY_MQB_MHI_SHOPIFY_ORDER_ID as CUSTBODY_MQB_MHI_SHOPIFY_ORDER_ID,
    CUSTBODY_MQB_MHI_SO_INTEGRATION_STATUS as CUSTBODY_MQB_MHI_SO_INTEGRATION_STATUS,
    CUSTBODY_MQB_MHI_SO_INV_TAX_RATE as CUSTBODY_MQB_MHI_SO_INV_TAX_RATE,
    CUSTBODY_MQB_MHI_SO_STATUS_MESSAGE as CUSTBODY_MQB_MHI_SO_STATUS_MESSAGE,
    CUSTBODY_MQB_MHI_VRA_FABRIC_BISMSG as CUSTBODY_MQB_MHI_VRA_FABRIC_BISMSG,
    CUSTBODY_MQB_MHI_VRA_FABRIC_BISTATUS as CUSTBODY_MQB_MHI_VRA_FABRIC_BISTATUS,
    CUSTBODY_MQB_MHI_VRMA_INTERNAL_ID as CUSTBODY_MQB_MHI_VRMA_INTERNAL_ID,
    CUSTBODY_MQB_PAYMENT_METHOD as CUSTBODY_MQB_PAYMENT_METHOD,
    CUSTBODY_MQB_PO_CATEGORY as CUSTBODY_MQB_PO_CATEGORY,
    CUSTBODY_MQB_PO_TYPE as CUSTBODY_MQB_PO_TYPE,
    CUSTBODY_MQB_READY_FOR_APPROVAL as CUSTBODY_MQB_READY_FOR_APPROVAL,
    CUSTBODY_MQB_SHIP_CODE as CUSTBODY_MQB_SHIP_CODE,
    CUSTBODY_MQB_SHIP_CODE_ID as CUSTBODY_MQB_SHIP_CODE_ID,
    CUSTBODY_MQB_SHIP_MODE as CUSTBODY_MQB_SHIP_MODE,
    CUSTBODY_MQB_SHOPIFY_STOREID as CUSTBODY_MQB_SHOPIFY_STOREID,
    CUSTBODY_MY_IMPORT_DECLARATION_NUM as CUSTBODY_MY_IMPORT_DECLARATION_NUM,
    CUSTBODY_NEXUS_NOTC as CUSTBODY_NEXUS_NOTC,
    CUSTBODY_NM_SHIPSTATION_CARRIER as CUSTBODY_NM_SHIPSTATION_CARRIER,
    CUSTBODY_NM_SHIPSTATION_SHIP_TRKNG_URL as CUSTBODY_NM_SHIPSTATION_SHIP_TRKNG_URL,
    CUSTBODY_NM_SHIPSTATION_SVCODE as CUSTBODY_NM_SHIPSTATION_SVCODE,
    CUSTBODY_NM_SS_ID_ORDER_KEY as CUSTBODY_NM_SS_ID_ORDER_KEY,
    CUSTBODY_NM_SS_IF_ORDER_ID as CUSTBODY_NM_SS_IF_ORDER_ID,
    CUSTBODY_NM_SS_IF_UNIQUE_IDENTIFIER as CUSTBODY_NM_SS_IF_UNIQUE_IDENTIFIER,
    CUSTBODY_NM_SS_ORDER_NUMBER as CUSTBODY_NM_SS_ORDER_NUMBER,
    CUSTBODY_NM_SS_SHIPPINGCOST as CUSTBODY_NM_SS_SHIPPINGCOST,
    CUSTBODY_NM_SS_SO_CANCELLED as CUSTBODY_NM_SS_SO_CANCELLED,
    CUSTBODY_NONDEDUCTIBLE_PROCESSED as CUSTBODY_NONDEDUCTIBLE_PROCESSED,
    CUSTBODY_NONDEDUCTIBLE_REF_GENJRNL as CUSTBODY_NONDEDUCTIBLE_REF_GENJRNL,
    CUSTBODY_NONDEDUCTIBLE_REF_TRAN as CUSTBODY_NONDEDUCTIBLE_REF_TRAN,
    CUSTBODY_NOTC as CUSTBODY_NOTC,
    CUSTBODY_NS_POS_BILLING as CUSTBODY_NS_POS_BILLING,
    CUSTBODY_NS_POS_FB_TRANSACTION as CUSTBODY_NS_POS_FB_TRANSACTION,
    CUSTBODY_NS_POS_TRANSACTION_STATUS as CUSTBODY_NS_POS_TRANSACTION_STATUS,
    CUSTBODY_PAYMENT_URL_STAMPLI as CUSTBODY_PAYMENT_URL_STAMPLI,
    CUSTBODY_PSGSS_CHANNEL as CUSTBODY_PSGSS_CHANNEL,
    CUSTBODY_PSGSS_RETURN_REASON_BODY as CUSTBODY_PSGSS_RETURN_REASON_BODY,
    CUSTBODY_RA_BANKDEPOSIT as CUSTBODY_RA_BANKDEPOSIT,
    CUSTBODY_REFNO_ORIGINVOICE as CUSTBODY_REFNO_ORIGINVOICE,
    CUSTBODY_REGIME_CODE as CUSTBODY_REGIME_CODE,
    CUSTBODY_REGIME_CODE_OF_SUPPLY as CUSTBODY_REGIME_CODE_OF_SUPPLY,
    CUSTBODY_REPORT_TIMESTAMP as CUSTBODY_REPORT_TIMESTAMP,
    CUSTBODY_SII_ACCOUNTING_DATE as CUSTBODY_SII_ACCOUNTING_DATE,
    CUSTBODY_SII_ARTICLE_61D as CUSTBODY_SII_ARTICLE_61D,
    CUSTBODY_SII_ARTICLE_72_73 as CUSTBODY_SII_ARTICLE_72_73,
    CUSTBODY_SII_CORRECTION_TYPE as CUSTBODY_SII_CORRECTION_TYPE,
    CUSTBODY_SII_EXEMPT_DETAILS as CUSTBODY_SII_EXEMPT_DETAILS,
    CUSTBODY_SII_EXTERNAL_REFERENCE as CUSTBODY_SII_EXTERNAL_REFERENCE,
    CUSTBODY_SII_INTRA_TXN_TYPE as CUSTBODY_SII_INTRA_TXN_TYPE,
    CUSTBODY_SII_INVOICE_DATE as CUSTBODY_SII_INVOICE_DATE,
    CUSTBODY_SII_IS_THIRD_PARTY as CUSTBODY_SII_IS_THIRD_PARTY,
    CUSTBODY_SII_ISSUED_INV_TYPE as CUSTBODY_SII_ISSUED_INV_TYPE,
    CUSTBODY_SII_LAND_REGISTER as CUSTBODY_SII_LAND_REGISTER,
    CUSTBODY_SII_NOT_REPORTED_IN_TIME as CUSTBODY_SII_NOT_REPORTED_IN_TIME,
    CUSTBODY_SII_OPERATION_DATE as CUSTBODY_SII_OPERATION_DATE,
    CUSTBODY_SII_ORIG_BILL as CUSTBODY_SII_ORIG_BILL,
    CUSTBODY_SII_ORIG_INVOICE as CUSTBODY_SII_ORIG_INVOICE,
    CUSTBODY_SII_PROPERTY_LOCATION as CUSTBODY_SII_PROPERTY_LOCATION,
    CUSTBODY_SII_RECEIVED_INV_TYPE as CUSTBODY_SII_RECEIVED_INV_TYPE,
    CUSTBODY_SII_REF_NO as CUSTBODY_SII_REF_NO,
    CUSTBODY_SII_REGISTRATION_CODE as CUSTBODY_SII_REGISTRATION_CODE,
    CUSTBODY_SII_REGISTRATION_MSG as CUSTBODY_SII_REGISTRATION_MSG,
    CUSTBODY_SII_REGISTRATION_STATUS as CUSTBODY_SII_REGISTRATION_STATUS,
    CUSTBODY_SII_SPCL_SCHEME_CODE_PURCHASE as CUSTBODY_SII_SPCL_SCHEME_CODE_PURCHASE,
    CUSTBODY_SII_SPCL_SCHEME_CODE_SALES as CUSTBODY_SII_SPCL_SCHEME_CODE_SALES,
    CUSTBODY_SPS_ACKNOWLEDGEMENT_STATUS as CUSTBODY_SPS_ACKNOWLEDGEMENT_STATUS,
    CUSTBODY_SPS_ACKNOWLEDGEMENT_TYPE as CUSTBODY_SPS_ACKNOWLEDGEMENT_TYPE,
    CUSTBODY_SPS_AUTHORIZATIONNUMBER as CUSTBODY_SPS_AUTHORIZATIONNUMBER,
    CUSTBODY_SPS_BATCHED_PRINT_COM as CUSTBODY_SPS_BATCHED_PRINT_COM,
    CUSTBODY_SPS_BILLOFLADINGNUMBER as CUSTBODY_SPS_BILLOFLADINGNUMBER,
    CUSTBODY_SPS_BT_ADDRESSLOCATIONNUMBER as CUSTBODY_SPS_BT_ADDRESSLOCATIONNUMBER,
    CUSTBODY_SPS_BT_LOCATIONCODEQUALIFIER as CUSTBODY_SPS_BT_LOCATIONCODEQUALIFIER,
    CUSTBODY_SPS_BUYERSCURRENCY as CUSTBODY_SPS_BUYERSCURRENCY,
    CUSTBODY_SPS_CARRIERACCOUNTNUMBER as CUSTBODY_SPS_CARRIERACCOUNTNUMBER,
    CUSTBODY_SPS_CARRIERALPHACODE as CUSTBODY_SPS_CARRIERALPHACODE,
    CUSTBODY_SPS_CARRIEREQUIPMENTNUMBER as CUSTBODY_SPS_CARRIEREQUIPMENTNUMBER,
    CUSTBODY_SPS_CARRIERPRONUMBER as CUSTBODY_SPS_CARRIERPRONUMBER,
    CUSTBODY_SPS_CARRIERROUTING as CUSTBODY_SPS_CARRIERROUTING,
    CUSTBODY_SPS_CARRIERTRANSMETHODCODE as CUSTBODY_SPS_CARRIERTRANSMETHODCODE,
    CUSTBODY_SPS_CCG_NOTEINFORMATIONFIELD as CUSTBODY_SPS_CCG_NOTEINFORMATIONFIELD,
    CUSTBODY_SPS_CONTACTTYPECODE as CUSTBODY_SPS_CONTACTTYPECODE,
    CUSTBODY_SPS_CUSTOMER_LABEL as CUSTBODY_SPS_CUSTOMER_LABEL,
    CUSTBODY_SPS_CUSTOMERACCOUNTNUMBER as CUSTBODY_SPS_CUSTOMERACCOUNTNUMBER,
    CUSTBODY_SPS_CUSTOMERORDERNUMBER as CUSTBODY_SPS_CUSTOMERORDERNUMBER,
    CUSTBODY_SPS_DATE_001 as CUSTBODY_SPS_DATE_001,
    CUSTBODY_SPS_DATE_002 as CUSTBODY_SPS_DATE_002,
    CUSTBODY_SPS_DATE_006 as CUSTBODY_SPS_DATE_006,
    CUSTBODY_SPS_DATE_007 as CUSTBODY_SPS_DATE_007,
    CUSTBODY_SPS_DATE_010 as CUSTBODY_SPS_DATE_010,
    CUSTBODY_SPS_DATE_015 as CUSTBODY_SPS_DATE_015,
    CUSTBODY_SPS_DATE_016 as CUSTBODY_SPS_DATE_016,
    CUSTBODY_SPS_DATE_017 as CUSTBODY_SPS_DATE_017,
    CUSTBODY_SPS_DATE_018 as CUSTBODY_SPS_DATE_018,
    CUSTBODY_SPS_DATE_037 as CUSTBODY_SPS_DATE_037,
    CUSTBODY_SPS_DATE_038 as CUSTBODY_SPS_DATE_038,
    CUSTBODY_SPS_DATE_063 as CUSTBODY_SPS_DATE_063,
    CUSTBODY_SPS_DATE_064 as CUSTBODY_SPS_DATE_064,
    CUSTBODY_SPS_DATE_067 as CUSTBODY_SPS_DATE_067,
    CUSTBODY_SPS_DATE_069 as CUSTBODY_SPS_DATE_069,
    CUSTBODY_SPS_DATE_097 as CUSTBODY_SPS_DATE_097,
    CUSTBODY_SPS_DATE_118 as CUSTBODY_SPS_DATE_118,
    CUSTBODY_SPS_DATE_ORS as CUSTBODY_SPS_DATE_ORS,
    CUSTBODY_SPS_DELIVERYDATE as CUSTBODY_SPS_DELIVERYDATE,
    CUSTBODY_SPS_DEPARTMENT as CUSTBODY_SPS_DEPARTMENT,
    CUSTBODY_SPS_DEPARTMENTDESCRIPTION as CUSTBODY_SPS_DEPARTMENTDESCRIPTION,
    CUSTBODY_SPS_DIVISION as CUSTBODY_SPS_DIVISION,
    CUSTBODY_SPS_EQUIPMENTDESCRIPTIONCODE as CUSTBODY_SPS_EQUIPMENTDESCRIPTIONCODE,
    CUSTBODY_SPS_FOBLOCATIONDESCRIPTION as CUSTBODY_SPS_FOBLOCATIONDESCRIPTION,
    CUSTBODY_SPS_FOBLOCATIONQUALIFIER as CUSTBODY_SPS_FOBLOCATIONQUALIFIER,
    CUSTBODY_SPS_FOBPAYCODE as CUSTBODY_SPS_FOBPAYCODE,
    CUSTBODY_SPS_GEN_NOTEINFORMATIONFIELD as CUSTBODY_SPS_GEN_NOTEINFORMATIONFIELD,
    CUSTBODY_SPS_GFT_NOTEINFORMATIONFIELD as CUSTBODY_SPS_GFT_NOTEINFORMATIONFIELD,
    CUSTBODY_SPS_IC_CONTACTEMAIL as CUSTBODY_SPS_IC_CONTACTEMAIL,
    CUSTBODY_SPS_IC_CONTACTFAX as CUSTBODY_SPS_IC_CONTACTFAX,
    CUSTBODY_SPS_IC_CONTACTNAME as CUSTBODY_SPS_IC_CONTACTNAME,
    CUSTBODY_SPS_IC_CONTACTPHONE as CUSTBODY_SPS_IC_CONTACTPHONE,
    CUSTBODY_SPS_LBL_MSG as CUSTBODY_SPS_LBL_MSG,
    CUSTBODY_SPS_MASTERBILLOFLADING as CUSTBODY_SPS_MASTERBILLOFLADING,
    CUSTBODY_SPS_ORDER_WGT_QUAL as CUSTBODY_SPS_ORDER_WGT_QUAL,
    CUSTBODY_SPS_PACKAGE_DATA_SOURCE as CUSTBODY_SPS_PACKAGE_DATA_SOURCE,
    CUSTBODY_SPS_PACKAGE_NOTES as CUSTBODY_SPS_PACKAGE_NOTES,
    CUSTBODY_SPS_PACKAGE_VALIDATION_BYPASS as CUSTBODY_SPS_PACKAGE_VALIDATION_BYPASS,
    CUSTBODY_SPS_PACKING_SLIP as CUSTBODY_SPS_PACKING_SLIP,
    CUSTBODY_SPS_PACKINGLISTNUMBER as CUSTBODY_SPS_PACKINGLISTNUMBER,
    CUSTBODY_SPS_POTYPE as CUSTBODY_SPS_POTYPE,
    CUSTBODY_SPS_PRN_NOTEINFORMATIONFIELD as CUSTBODY_SPS_PRN_NOTEINFORMATIONFIELD,
    CUSTBODY_SPS_PROMOTIONDEALNUMB as CUSTBODY_SPS_PROMOTIONDEALNUMB,
    CUSTBODY_SPS_PURCHASEORDERDATE as CUSTBODY_SPS_PURCHASEORDERDATE,
    CUSTBODY_SPS_REFERENCE_AH as CUSTBODY_SPS_REFERENCE_AH,
    CUSTBODY_SPS_REFERENCE_DK as CUSTBODY_SPS_REFERENCE_DK,
    CUSTBODY_SPS_REFERENCE_MR as CUSTBODY_SPS_REFERENCE_MR,
    CUSTBODY_SPS_REFERENCE_YD as CUSTBODY_SPS_REFERENCE_YD,
    CUSTBODY_SPS_RELEASENUMBER as CUSTBODY_SPS_RELEASENUMBER,
    CUSTBODY_SPS_RI_ADDRESS1 as CUSTBODY_SPS_RI_ADDRESS1,
    CUSTBODY_SPS_RI_ADDRESS2 as CUSTBODY_SPS_RI_ADDRESS2,
    CUSTBODY_SPS_RI_ADDRESSLOCATIONNUMBER as CUSTBODY_SPS_RI_ADDRESSLOCATIONNUMBER,
    CUSTBODY_SPS_RI_ADDRESSNAME as CUSTBODY_SPS_RI_ADDRESSNAME,
    CUSTBODY_SPS_RI_CITY as CUSTBODY_SPS_RI_CITY,
    CUSTBODY_SPS_RI_COUNTRY as CUSTBODY_SPS_RI_COUNTRY,
    CUSTBODY_SPS_RI_LOCATIONCODEQUALIFIER as CUSTBODY_SPS_RI_LOCATIONCODEQUALIFIER,
    CUSTBODY_SPS_RI_POSTALCODE as CUSTBODY_SPS_RI_POSTALCODE,
    CUSTBODY_SPS_RI_STATE as CUSTBODY_SPS_RI_STATE,
    CUSTBODY_SPS_ROUTINGKEY as CUSTBODY_SPS_ROUTINGKEY,
    CUSTBODY_SPS_SEAL_NUMBER as CUSTBODY_SPS_SEAL_NUMBER,
    CUSTBODY_SPS_SERVICELEVELCODE as CUSTBODY_SPS_SERVICELEVELCODE,
    CUSTBODY_SPS_SHIP_QTY_PACKING_CODE as CUSTBODY_SPS_SHIP_QTY_PACKING_CODE,
    CUSTBODY_SPS_SHIPMENT_WGT_QUAL as CUSTBODY_SPS_SHIPMENT_WGT_QUAL,
    CUSTBODY_SPS_SHIPMENTID as CUSTBODY_SPS_SHIPMENTID,
    CUSTBODY_SPS_SHP_NOTEINFORMATIONFIELD as CUSTBODY_SPS_SHP_NOTEINFORMATIONFIELD,
    CUSTBODY_SPS_SPE_NOTEINFORMATIONFIELD as CUSTBODY_SPS_SPE_NOTEINFORMATIONFIELD,
    CUSTBODY_SPS_ST_ADDRESSLOCATIONNUMBER as CUSTBODY_SPS_ST_ADDRESSLOCATIONNUMBER,
    CUSTBODY_SPS_ST_LOCATIONCODEQUALIFIER as CUSTBODY_SPS_ST_LOCATIONCODEQUALIFIER,
    CUSTBODY_SPS_STATUSCODE as CUSTBODY_SPS_STATUSCODE,
    CUSTBODY_SPS_TERMNETDUEDAYS as CUSTBODY_SPS_TERMNETDUEDAYS,
    CUSTBODY_SPS_TERMSBASISDATECODE as CUSTBODY_SPS_TERMSBASISDATECODE,
    CUSTBODY_SPS_TERMSDESCRIPTION as CUSTBODY_SPS_TERMSDESCRIPTION,
    CUSTBODY_SPS_TERMSDISCOUNTAMOUNT as CUSTBODY_SPS_TERMSDISCOUNTAMOUNT,
    CUSTBODY_SPS_TERMSDISCOUNTDATE as CUSTBODY_SPS_TERMSDISCOUNTDATE,
    CUSTBODY_SPS_TERMSDISCOUNTDUEDAYS as CUSTBODY_SPS_TERMSDISCOUNTDUEDAYS,
    CUSTBODY_SPS_TERMSDISCOUNTPERCENT as CUSTBODY_SPS_TERMSDISCOUNTPERCENT,
    CUSTBODY_SPS_TERMSNETDUEDATE as CUSTBODY_SPS_TERMSNETDUEDATE,
    CUSTBODY_SPS_TERMSTYPE as CUSTBODY_SPS_TERMSTYPE,
    CUSTBODY_SPS_THIRDPARTYREFERENCENUMBER as CUSTBODY_SPS_THIRDPARTYREFERENCENUMBER,
    CUSTBODY_SPS_TOTALALLOWENCESAMOUNT as CUSTBODY_SPS_TOTALALLOWENCESAMOUNT,
    CUSTBODY_SPS_TOTALFREIGHTCHARGES as CUSTBODY_SPS_TOTALFREIGHTCHARGES,
    CUSTBODY_SPS_TOTALNONFREIGHTCHARGES as CUSTBODY_SPS_TOTALNONFREIGHTCHARGES,
    CUSTBODY_SPS_TOTALTAXESANDCHARGES as CUSTBODY_SPS_TOTALTAXESANDCHARGES,
    CUSTBODY_SPS_TRANS_CARTON_CT as CUSTBODY_SPS_TRANS_CARTON_CT,
    CUSTBODY_SPS_TRANSPORTATIONTERMS as CUSTBODY_SPS_TRANSPORTATIONTERMS,
    CUSTBODY_SPS_TRANSPORTATIONTERMSTYPE as CUSTBODY_SPS_TRANSPORTATIONTERMSTYPE,
    CUSTBODY_SPS_TSETPURPOSECODE as CUSTBODY_SPS_TSETPURPOSECODE,
    CUSTBODY_SPS_VENDOR as CUSTBODY_SPS_VENDOR,
    CUSTBODY_SPS_VN_ADDRESS1 as CUSTBODY_SPS_VN_ADDRESS1,
    CUSTBODY_SPS_VN_ADDRESS2 as CUSTBODY_SPS_VN_ADDRESS2,
    CUSTBODY_SPS_VN_ADDRESSNAME as CUSTBODY_SPS_VN_ADDRESSNAME,
    CUSTBODY_SPS_VN_CITY as CUSTBODY_SPS_VN_CITY,
    CUSTBODY_SPS_VN_COUNTRY as CUSTBODY_SPS_VN_COUNTRY,
    CUSTBODY_SPS_VN_POSTALCODE as CUSTBODY_SPS_VN_POSTALCODE,
    CUSTBODY_SPS_VN_STATE as CUSTBODY_SPS_VN_STATE,
    CUSTBODY_SPS_XREF_QUEUED as CUSTBODY_SPS_XREF_QUEUED,
    CUSTBODY_SPS_XREF_RESTRICTED as CUSTBODY_SPS_XREF_RESTRICTED,
    CUSTBODY_SPS_Z7_ADDRESSLOCATIONNUMBER as CUSTBODY_SPS_Z7_ADDRESSLOCATIONNUMBER,
    CUSTBODY_SPS_Z7_LOCATIONCODEQUALIFIER as CUSTBODY_SPS_Z7_LOCATIONCODEQUALIFIER,
    CUSTBODY_STAMPLI_AP_INVOICE_URL as CUSTBODY_STAMPLI_AP_INVOICE_URL,
    CUSTBODY_STAMPLI_HOLD_BILL_PAYMENT as CUSTBODY_STAMPLI_HOLD_BILL_PAYMENT,
    CUSTBODY_STC_AMOUNT_AFTER_DISCOUNT as CUSTBODY_STC_AMOUNT_AFTER_DISCOUNT,
    CUSTBODY_STC_PAYMENT_TRANSACTION_ID as CUSTBODY_STC_PAYMENT_TRANSACTION_ID,
    CUSTBODY_STC_TAX_AFTER_DISCOUNT as CUSTBODY_STC_TAX_AFTER_DISCOUNT,
    CUSTBODY_STC_TOTAL_AFTER_DISCOUNT as CUSTBODY_STC_TOTAL_AFTER_DISCOUNT,
    CUSTBODY_TRANSACTION_REGION as CUSTBODY_TRANSACTION_REGION,
    CUSTBODY_WRM_CLAIMNUMBER as CUSTBODY_WRM_CLAIMNUMBER,
    CUSTBODY_WRM_REPLACEMENTSO as CUSTBODY_WRM_REPLACEMENTSO,
    CUSTBODY_WRM_SO_RETURNAUTHORIZATION as CUSTBODY_WRM_SO_RETURNAUTHORIZATION,
    CUSTBODYBOOMI_FBFLURRY_SO_INTEGRATION_ as CUSTBODYBOOMI_FBFLURRY_SO_INTEGRATION_,
    CUSTBODYINTEGRATIONSTATUS as CUSTBODYINTEGRATIONSTATUS,
    CUSTBODYMQB_SHIP_CODE_ID as CUSTBODYMQB_SHIP_CODE_ID,
    CUSTBODYMQB_TRANS_SUBTOTAL as CUSTBODYMQB_TRANS_SUBTOTAL,
    CUSTOMTYPE as CUSTOM_TYPE,
    DAYSOPEN as DAYS_OPEN,
    DAYSOVERDUESEARCH as DAYS_OVERDUE_SEARCH,
    DUEDATE as DUE_DATE,
    EMAIL as EMAIL,
    EMPLOYEE as EMPLOYEE,
    ENDDATE as END_DATE,
    ENTITY as ENTITY,
    ENTITYSTATUS as ENTITY_STATUS,
    ESTGROSSPROFIT as EST_GROSSPROFIT,
    ESTGROSSPROFITPERCENT as EST_GROSSPROFIT_PERCENT,
    EXCHANGERATE as EXCHANGE_RATE,
    EXPECTEDCLOSEDATE as EXPECTED_CLOSE_DATE,
    EXTERNALID as EXTERNAL_ID,
    FAX as FAX,
    FIRMED as FIRMED,
    FOREIGNAMOUNTPAID as FOREIGN_AMOUNT_PAID,
    FOREIGNAMOUNTUNPAID as FOREIGN_AMOUNTUN_PAID,
    FOREIGNPAYMENTAMOUNTUNUSED as FOREIGN_PAYMENT_AMOUNT_UNUSED,
    FOREIGNPAYMENTAMOUNTUSED as FOREIGN_PAYMENT_AMOUNT_USED,
    FOREIGNTOTAL as FOREIGN_TOTAL,
    FULFILLMENTTYPE as FULFILLMENT_TYPE,
    FXALTSALESTOTAL as FXA_LT_SALES_TOTAL,
    FXNETALTSALESTOTAL as FX_NET_ALT_SALES_TOTAL,
    INCLUDEINFORECAST as INCLUDE_IN_FORECAST,
    INCOTERM as IN_CO_TERM,
    INTERCOSTATUS as INTER_CO_STATUS,
    INTERCOTRANSACTION as INTER_CO_TRANSACTION,
    ISACTUALPRODENDDATEENTEREDMANUALLY as IS_ACTUAL_PRODENDDATEENTEREDM_ANUALLY,
    ISACTUALPRODSTARTDATEENTEREDMANUALLY as IS_ACTUAL_PRODSTARTDATEENTEREDM_ANUALLY,
    ISAOMAUTOMATED as IS_AOM_AUTOMATED,
    ISFINCHRG as IS_FINCHRG,
    ISREVERSAL as IS_REVERSAL,
    JOURNALTYPE as JOURNAL_TYPE,
    LASTMODIFIEDBY as LAST_MODIFIED_BY,
    LASTMODIFIEDDATE as LAST_MODIFIED_DATE,
    LINKEDINVENTORYTRANSFER as LINKED_INVENTORY_TRANSFER,
    LINKEDIR as LINKED_IR,
    LINKEDPO as LINKED_PO,
    LINKEDTRACKINGNUMBERLIST as LINKED_TRACKING_NUMBER_LIST,
    MEMDOC as MEMDOC,
    MEMO as MEMO,
    "MESSAGE" as _MESSAGE,
    NETALTSALESTOTAL as NET_ALT_SALES_TOTAL,
    NEXTAPPROVER as NEXT_APPROVER,
    NEXTBILLDATE as NEXT_BILL_DATE,
    NEXUS as NEXUS,
    "NUMBER" as _NUMBER,
    ORDPICKED as ORD_PICKED,
    ORDRECEIVED as ORD_RECEIVED,
    OTHERREFNUM as OTHER_REF_NUM,
    OUTSOURCED as OUTSOURCED,
    OUTSOURCINGCHARGE as OUTSOURCING_CHARGE,
    OUTSOURCINGCHARGEUNITPRICE as OUTSOURCING_CHARGE_UNIT_PRICE,
    PAYMENTHOLD as PAYMENT_HOLD,
    PAYMENTMETHOD as PAYMENT_METHOD,
    PAYMENTOPTION as PAYMENT_OPTION,
    POSTING as POSTING,
    POSTINGPERIOD as POSTING_PERIOD,
    PRINTEDPICKINGTICKET as PRINTED_PICKING_TICKET,
    PROBABILITY as PROBABILITY,
    RECORDTYPE as RECORD_TYPE,
    REVERSAL as REVERSAL,
    REVERSALDATE as REVERSAL_DATE,
    REVERSALDEFER as REVERSAL_DEFER,
    SALESCHANNEL as SALES_CHANNEL,
    SALESCHANNELORDERPRIORITY as SALES_CHANNEL_ORDER_PRIORITY,
    SHIPCARRIER as SHIP_CARRIER,
    SHIPCOMPLETE as SHIP_COMPLETE,
    SHIPDATE as SHIP_DATE,
    SHIPPINGADDRESS as SHIPPING_ADDRESS,
    SOURCE as SOURCE,
    SOURCETRANSACTION as SOURCE_TRANSACTION,
    STARTDATE as START_DATE,
    "STATUS" as _STATUS,
    TERMS as TERMS,
    TITLE as TITLE,
    TOSUBSIDIARY as TO_SUBSIDIARY,
    TOTALCOSTESTIMATE as TOTAL_COSTESTIMATE,
    TRACKINGNUMBERLIST as TRACKING_NUMBERLIST,
    TRANDATE as TRAN_DATE,
    TRANDISPLAYNAME as TRAN_DISPLAY_NAME,
    TRANID as TRAN_ID,
    TRANSACTIONNUMBER as TRANSACTION_NUMBER,
    TRANSFERLOCATION as TRANSFER_LOCATION,
    "TYPE" as _TYPE,
    TYPEBASEDDOCUMENTNUMBER as TYPE_BASE_DDOCUMENT_NUMBER,
    USEITEMCOSTASTRANSFERCOST as USE_ITEM_COST_AS_TRANSFER_COST,
    USEREVENUEARRANGEMENT as USE_REVENUE_ARRANGEMENT,
    VENDOR as VENDOR,
    VISIBLETOCUSTOMER as VISIBLE_TO_CUSTOMER,
    VOID as VOID,
    VOIDED as VOIDED,
    WEBSITE as WEBSITE,
    _FIVETRAN_DELETED as _FIVETRAN_DELETED,
    DATE_DELETED as DATE_DELETED,
    _FIVETRAN_SYNCED as _FIVETRAN_SYNCED,
    CUSTBODY_MQB_MHI_SHOPIFY_UNQID as CUSTBODY_MQB_MHI_SHOPIFY_UNQID,
    CUSTBODY_MHI_AMZ_CXL_DATE as CUSTBODY_MHI_AMZ_CXL_DATE,
    CUSTBODY_MHI_AMZ_SHIP_BY_DATE as CUSTBODY_MHI_AMZ_SHIP_BY_DATE,
    CUSTBODY_MQB_PRE_SALES_ORDER as CUSTBODY_MQB_PRE_SALES_ORDER,
    CUSTBODY_MHI_AMZ_DC_ID as CUSTBODY_MHI_AMZ_DC_ID,
    CUSTBODY_MQB_AMZ_FACILITY_ACCESS_CODE as CUSTBODY_MQB_AMZ_FACILITY_ACCESS_CODE,
    CUSTBODY_ES_ORDERCATALOG_TXT as CUSTBODY_ES_ORDERCATALOG_TXT,
    CUSTBODY_AVA_DISCOUNTAMOUNT_2 as CUSTBODY_AVA_DISCOUNTAMOUNT_2,
    CUSTBODY_SO_ELASTIC_ORDER_NUMBER as CUSTBODY_SO_ELASTIC_ORDER_NUMBER,
    CUSTBODY_MQB_SYS_INTEGRATION_MESSAGE as CUSTBODY_MQB_SYS_INTEGRATION_MESSAGE,
    CUSTBODYMQB_SYS_INTEGRATION_STATUS as CUSTBODYMQB_SYS_INTEGRATION_STATUS,
    CUSTBODY_SII_CODE as CUSTBODY_SII_CODE,
    CUSTBODY_SII_CODE_ISSUED_INV as CUSTBODY_SII_CODE_ISSUED_INV,
    CUSTBODY_DOC_NUM_SUMM_INVOICE as CUSTBODY_DOC_NUM_SUMM_INVOICE,
    CUSTBODY_10184_CUSTOMER_ENTITY_BANK as CUSTBODY_10184_CUSTOMER_ENTITY_BANK
from base
