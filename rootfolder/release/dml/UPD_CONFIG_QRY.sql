DECLARE
    V_CHK_TAB   NUMBER;
    V_ERR       VARCHAR2 (1000);
    V_CNT       NUMBER (2);
BEGIN
    SELECT COUNT (1)
      INTO V_CHK_TAB
      FROM ALL_OBJECTS
     WHERE     OBJECT_TYPE = 'TABLE'
           AND OWNER = 'VMSCMS'
           AND OBJECT_NAME = 'VMS_CONFIG_QUERY_EBR';

    IF V_CHK_TAB = 1
    THEN
        update VMSCMS.VMS_CONFIG_QUERY_EBR set VCQ_QUERY_VALUE ='
		SELECT DISTINCT vol_order_id oid ,
					  vol_partner_id pid,
					  prodCat.CPC_CCF_FORMAT_VERSION vId ,
					  vod_individual_ccf indccf,vod_print_order prinfOdrCcf
                      ,CASE CIM_INTERCHANGE_NAME WHEN ''MASTERCARD'' THEN ''MC'' WHEN ''AMERICAN EXPRESS'' THEN ''AMEX''
						ELSE REPLACE(CIM_INTERCHANGE_NAME,'' '','''') END NETWORKNAME
					FROM CMS_PROD_CATTYPE prodCat,
					  cms_prod_cardpack cardpack,
					  vms_packageid_mast packidmast,
					  vms_order_lineitem,
					  vms_order_details
				,cms_bin_param,
                VMSCMS.CMS_PROD_MAST,
				VMSCMS.CMS_INTERCHANGE_MAST
					WHERE cpc_product_id         =vol_product_id
					AND vol_ccf_flag             =''1''
					AND vol_order_id             =vod_order_id
					AND vol_partner_id           =vod_partner_id
					AND CARDPACK.CPC_PROD_CODE   =PRODCAT.CPC_PROD_CODE
					AND packidmast.vpm_package_id=cpc_card_details
					AND packIdMast.Vpm_Vendor_Id = ?
			  AND cbp_profile_code=cpc_profile_code
			  and cbp_param_name=''CARD_VERIFY_TYPE''
			  and CBP_PARAM_VALUE = ?
					AND vol_partner_id          <> ''Replace_Partner_ID''
					AND CPM_PROD_CODE = PRODCAT.CPC_PROD_CODE
					AND CPM_INST_CODE = PRODCAT.CPC_INST_CODE
					AND CPM_INST_CODE = CIM_INST_CODE 
					AND CPM_INTERCHANGE_CODE = CIM_INTERCHANGE_CODE
					GROUP BY vol_order_id ,
					  vol_partner_id ,
					  prodCat.CPC_CCF_FORMAT_VERSION,
					  vod_individual_ccf,vod_print_order,CIM_INTERCHANGE_NAME' WHERE VCQ_INST_CODE=1 and VCQ_QUERY_ID = 'B2B_ORDER_IDQRYNAME';
					  
					  
update VMSCMS.VMS_CONFIG_QUERY set VCQ_QUERY_VALUE ='SELECT DISTINCT vol_order_id oid ,
				  vol_partner_id pid,
				  prodCat.cpc_prod_code prId,
				  prodCat.CPC_CCF_FORMAT_VERSION vId,
				  vod_individual_ccf indccf ,vod_print_order prinfOdrCcf,
				  CASE CIM_INTERCHANGE_NAME WHEN ''MASTERCARD'' THEN ''MC'' WHEN ''AMERICAN EXPRESS'' THEN ''AMEX''
						ELSE REPLACE(CIM_INTERCHANGE_NAME,'' '','''') END NETWORKNAME 
				FROM CMS_PROD_CATTYPE prodCat,
				  cms_prod_cardpack cardpack,
				  vms_packageid_mast packidmast,
				  vms_order_lineitem,
				  vms_order_details
          ,cms_bin_param,
		  VMSCMS.CMS_PROD_MAST,
				VMSCMS.CMS_INTERCHANGE_MAST
				WHERE cpc_product_id         =vol_product_id
				AND vol_ccf_flag             =''1''
				AND vol_order_id             =vod_order_id
				AND vol_partner_id           =vod_partner_id
				AND vol_partner_id           =''Replace_Partner_ID''
				AND CARDPACK.CPC_PROD_CODE   =PRODCAT.CPC_PROD_CODE
				AND packidmast.vpm_package_id=cpc_card_details
				AND packIdMast.Vpm_Vendor_Id =?
        AND cbp_profile_code=cpc_profile_code
        and cbp_param_name=''CARD_VERIFY_TYPE''
        and CBP_PARAM_VALUE = ?
		AND CPM_PROD_CODE = PRODCAT.CPC_PROD_CODE
					AND CPM_INST_CODE = PRODCAT.CPC_INST_CODE
					AND CPM_INST_CODE = CIM_INST_CODE 
					AND CPM_INTERCHANGE_CODE = CIM_INTERCHANGE_CODE
				GROUP BY vol_order_id ,
				  vol_partner_id ,
				  prodCat.CPC_CCF_FORMAT_VERSION,
				  prodCat.cpc_prod_code,
				  vod_individual_ccf,vod_print_order,CIM_INTERCHANGE_NAME' WHERE VCQ_INST_CODE=1 and VCQ_QUERY_ID = 'CCF_B2BREPL_ORDERQRY';

        DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT || ' rows Updated ');
    ELSE
        DBMS_OUTPUT.PUT_LINE ('Backup Object Not Found');
    END IF;
EXCEPTION
    WHEN OTHERS
    THEN
        V_ERR := SUBSTR (SQLERRM, 1, 100);
        DBMS_OUTPUT.PUT_LINE ('Main Excp ' || V_ERR);
END;
/
