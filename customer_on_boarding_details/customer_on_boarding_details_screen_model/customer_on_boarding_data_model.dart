class CustomerOnBoardingModel {
  Data? data;
  String? status;
  String? message;

  CustomerOnBoardingModel({this.data, this.status, this.message});

  CustomerOnBoardingModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    status = json['Status'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Status'] = this.status;
    data['Message'] = this.message;
    return data;
  }
}

class Data {
  CustomerDetail? customerDetail;
  List<ContactInfo>? contactInfo;
  List<Commerical>? commerical;
  List<Commerical>? requestedCommerical;
  CustomerAddressDet? permanentAddressDet;
  CustomerAddressDet? billingAddressDet;
  List<CustomerMIGs>? customerMIGs;
  List<RemarksList>? remarksList;
  String? backroute;
  String? backRouteStageName;
  List<MoveToList>? moveToList;

  Data(
      {this.customerDetail,
      this.contactInfo,
      this.commerical,
      this.requestedCommerical,
      this.permanentAddressDet,
      this.billingAddressDet,
      this.customerMIGs,
      this.remarksList,
      this.backroute,
      this.backRouteStageName,
      this.moveToList});

  Data.fromJson(Map<String, dynamic> json) {
    customerDetail = json['CustomerDetail'] != null
        ? new CustomerDetail.fromJson(json['CustomerDetail'])
        : null;
    if (json['ContactInfo'] != null) {
      contactInfo = <ContactInfo>[];
      json['ContactInfo'].forEach((v) {
        contactInfo!.add(new ContactInfo.fromJson(v));
      });
    }
    if (json['Commerical'] != null) {
      commerical = <Commerical>[];
      json['Commerical'].forEach((v) {
        commerical!.add(new Commerical.fromJson(v));
      });
    }
    if (json['RequestedCommerical'] != null) {
      requestedCommerical = <Commerical>[];
      json['RequestedCommerical'].forEach((v) {
        requestedCommerical!.add(new Commerical.fromJson(v));
      });
    }
    permanentAddressDet = json['PermanentAddressDet'] != null
        ? new CustomerAddressDet.fromJson(json['PermanentAddressDet'])
        : null;
    billingAddressDet = json['BillingAddressDet'] != null
        ? new CustomerAddressDet.fromJson(json['BillingAddressDet'])
        : null;
    if (json['CustomerMIGs'] != null) {
      customerMIGs = <CustomerMIGs>[];
      json['CustomerMIGs'].forEach((v) {
        customerMIGs!.add(new CustomerMIGs.fromJson(v));
      });
    }
    if (json['RemarksList'] != null) {
      remarksList = <RemarksList>[];
      json['RemarksList'].forEach((v) {
        remarksList!.add(new RemarksList.fromJson(v));
      });
    }
    backroute = json['Backroute'];
    backRouteStageName = json['BackRouteStageName'];
    if (json['MoveToList'] != null) {
      moveToList = <MoveToList>[];
      json['MoveToList'].forEach((v) {
        moveToList!.add(new MoveToList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerDetail != null) {
      data['CustomerDetail'] = this.customerDetail!.toJson();
    }
    if (this.contactInfo != null) {
      data['ContactInfo'] = this.contactInfo!.map((v) => v.toJson()).toList();
    }
    if (this.commerical != null) {
      data['Commerical'] = this.commerical!.map((v) => v.toJson()).toList();
    }
    if (this.requestedCommerical != null) {
      data['RequestedCommerical'] =
          this.requestedCommerical!.map((v) => v.toJson()).toList();
    }
    if (this.permanentAddressDet != null) {
      data['PermanentAddressDet'] = this.permanentAddressDet!.toJson();
    }
    if (this.billingAddressDet != null) {
      data['BillingAddressDet'] = this.billingAddressDet!.toJson();
    }
    if (this.customerMIGs != null) {
      data['CustomerMIGs'] = this.customerMIGs!.map((v) => v.toJson()).toList();
    }
    if (this.remarksList != null) {
      data['RemarksList'] = this.remarksList!.map((v) => v.toJson()).toList();
    }
    data['Backroute'] = this.backroute;
    data['BackRouteStageName'] = this.backRouteStageName;
    if (this.moveToList != null) {
      data['MoveToList'] = this.moveToList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerDetail {
  Customer? customer;
  List<CustomerAddressDet>? customerAddressDet;
  List<CafDocumentDet>? cafDocumentDet;

  CustomerDetail({this.customer, this.customerAddressDet, this.cafDocumentDet});

  CustomerDetail.fromJson(Map<String, dynamic> json) {
    customer = json['Customer'] != null
        ? new Customer.fromJson(json['Customer'])
        : null;
    if (json['CustomerAddressDet'] != null) {
      customerAddressDet = <CustomerAddressDet>[];
      json['CustomerAddressDet'].forEach((v) {
        customerAddressDet!.add(new CustomerAddressDet.fromJson(v));
      });
    }
    if (json['CafDocumentDet'] != null) {
      cafDocumentDet = <CafDocumentDet>[];
      json['CafDocumentDet'].forEach((v) {
        cafDocumentDet!.add(new CafDocumentDet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['Customer'] = this.customer!.toJson();
    }
    if (this.customerAddressDet != null) {
      data['CustomerAddressDet'] =
          this.customerAddressDet!.map((v) => v.toJson()).toList();
    }
    if (this.cafDocumentDet != null) {
      data['CafDocumentDet'] =
          this.cafDocumentDet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customer {
  String? cUSTACCNO;
  String? cUSTNAME;
  String? iSACTIVE;
  String? sTATUS;
  String? aCCOUNTMGRNAME;
  String? cUSTCODE;
  String? cUSTTYPE;
  String? neuronID;
  String? cOMPCODE;
  String? aCCSALEPERSONNAME;
  String? rEGNO;
  String? kEYCONTACTNAME;
  String? dESIGNATION;
  String? pANGIRNO;
  String? cIRCLECODE;
  String? zONECODE;
  String? mOBILENO;
  String? eMAILID;
  String? cUSTTANNUM;
  String? tINARN;
  String? gST;
  String? wORKFLOWCODE;
  String? sERVICETYPE;
  String? pLANTYPE;
  String? aDVANCECHARGES;
  String? rEGINSTCHARGES;
  String? rENTALUSAGECH;
  String? tYPE;
  String? aCCSALEPERSON;
  String? iSEDITABLE;
  String? cUSTOMERTYPE;
  String? cIRCLENAME;
  String? zONEDESCRIPTION;
  String? cURACCMGR;
  String? gEOCUSTCODE;
  String? bUSINESSVERTICAL;
  String? bUSINESSVERTICALDISP;
  String? tMLICENNO;
  String? aLTMOBILENO;
  String? pAYMENTTERMS;
  String? cOMPNAME;
  String? iSGST;
  String? iSTAN;
  String? sPECIALAPPWODOC;
  String? oBCHARGINGMODEDESCRIPTION;
  String? cREDITLIMIT;
  String? pEID;
  String? gROUPCOMPNAME;
  String? cHANNELPARTNAME;
  String? eNTERPRISETYPEDESC;
  String? iSNM;
  String? mIGDATE;
  String? iNVOICEPERIOD;
  String? pDCBG;
  String? aGREEDPAYMENTTERM;
  String? dEVIATIONDATE;

  Customer(
      {this.cUSTACCNO,
      this.cUSTNAME,
      this.iSACTIVE,
      this.sTATUS,
      this.aCCOUNTMGRNAME,
      this.cUSTCODE,
      this.cUSTTYPE,
      this.neuronID,
      this.cOMPCODE,
      this.aCCSALEPERSONNAME,
      this.rEGNO,
      this.kEYCONTACTNAME,
      this.dESIGNATION,
      this.pANGIRNO,
      this.cIRCLECODE,
      this.zONECODE,
      this.mOBILENO,
      this.eMAILID,
      this.cUSTTANNUM,
      this.tINARN,
      this.gST,
      this.wORKFLOWCODE,
      this.sERVICETYPE,
      this.pLANTYPE,
      this.aDVANCECHARGES,
      this.rEGINSTCHARGES,
      this.rENTALUSAGECH,
      this.tYPE,
      this.aCCSALEPERSON,
      this.iSEDITABLE,
      this.cUSTOMERTYPE,
      this.cIRCLENAME,
      this.zONEDESCRIPTION,
      this.cURACCMGR,
      this.gEOCUSTCODE,
      this.bUSINESSVERTICAL,
      this.bUSINESSVERTICALDISP,
      this.tMLICENNO,
      this.aLTMOBILENO,
      this.pAYMENTTERMS,
      this.cOMPNAME,
      this.iSGST,
      this.iSTAN,
      this.sPECIALAPPWODOC,
      this.oBCHARGINGMODEDESCRIPTION,
      this.cREDITLIMIT,
      this.pEID,
      this.gROUPCOMPNAME,
      this.cHANNELPARTNAME,
      this.eNTERPRISETYPEDESC,
      this.iSNM,
      this.mIGDATE,
      this.iNVOICEPERIOD,
      this.pDCBG,
      this.aGREEDPAYMENTTERM,
      this.dEVIATIONDATE});

  Customer.fromJson(Map<String, dynamic> json) {
    cUSTACCNO = json['CUST_ACC_NO'];
    cUSTNAME = json['CUST_NAME'];
    iSACTIVE = json['IS_ACTIVE'];
    sTATUS = json['STATUS'];
    aCCOUNTMGRNAME = json['ACCOUNT_MGR_NAME'];
    cUSTCODE = json['CUST_CODE'];
    cUSTTYPE = json['CUST_TYPE'];
    neuronID = json['neuron_ID'];
    cOMPCODE = json['COMP_CODE'];
    aCCSALEPERSONNAME = json['ACC_SALE_PERSON_NAME'];
    rEGNO = json['REG_NO'];
    kEYCONTACTNAME = json['KEY_CONTACT_NAME'];
    dESIGNATION = json['DESIGNATION'];
    pANGIRNO = json['PAN_GIR_NO'];
    cIRCLECODE = json['CIRCLE_CODE'];
    zONECODE = json['ZONE_CODE'];
    mOBILENO = json['MOBILE_NO'];
    eMAILID = json['EMAIL_ID'];
    cUSTTANNUM = json['CUST_TAN_NUM'];
    tINARN = json['TIN_ARN'];
    gST = json['GST'];
    wORKFLOWCODE = json['WORKFLOW_CODE'];
    sERVICETYPE = json['SERVICE_TYPE'];
    pLANTYPE = json['PLAN_TYPE'];
    aDVANCECHARGES = json['ADVANCE_CHARGES'];
    rEGINSTCHARGES = json['REG_INST_CHARGES'];
    rENTALUSAGECH = json['RENTAL_USAGE_CH'];
    tYPE = json['TYPE'];
    aCCSALEPERSON = json['ACC_SALE_PERSON'];
    iSEDITABLE = json['IS_EDITABLE'];
    cUSTOMERTYPE = json['CUSTOMER_TYPE'];
    cIRCLENAME = json['CIRCLE_NAME'];
    zONEDESCRIPTION = json['ZONE_DESCRIPTION'];
    cURACCMGR = json['CUR_ACC_MGR'];
    gEOCUSTCODE = json['GEO_CUST_CODE'];
    bUSINESSVERTICAL = json['BUSINESS_VERTICAL'];
    bUSINESSVERTICALDISP = json['BUSINESS_VERTICAL_DISP'];
    tMLICENNO = json['TM_LICEN_NO'];
    aLTMOBILENO = json['ALT_MOBILE_NO'];
    pAYMENTTERMS = json['PAYMENT_TERMS'];
    cOMPNAME = json['COMP_NAME'];
    iSGST = json['IS_GST'];
    iSTAN = json['IS_TAN'];
    sPECIALAPPWODOC = json['SPECIAL_APP_WO_DOC'];
    oBCHARGINGMODEDESCRIPTION = json['OB_CHARGINGMODE_DESCRIPTION'];
    cREDITLIMIT = json['CREDIT_LIMIT'];
    pEID = json['PE_ID'];
    gROUPCOMPNAME = json['GROUP_COMP_NAME'];
    cHANNELPARTNAME = json['CHANNEL_PART_NAME'];
    eNTERPRISETYPEDESC = json['ENTERPRISE_TYPE_DESC'];
    iSNM = json['IS_NM'];
    mIGDATE = json['MIG_DATE'];
    iNVOICEPERIOD = json['INVOICE_PERIOD'];
    pDCBG = json['PDC_BG'];
    aGREEDPAYMENTTERM = json['AGREED_PAYMENT_TERM'];
    dEVIATIONDATE = json['DEVIATION_DATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CUST_ACC_NO'] = this.cUSTACCNO;
    data['CUST_NAME'] = this.cUSTNAME;
    data['IS_ACTIVE'] = this.iSACTIVE;
    data['STATUS'] = this.sTATUS;
    data['ACCOUNT_MGR_NAME'] = this.aCCOUNTMGRNAME;
    data['CUST_CODE'] = this.cUSTCODE;
    data['CUST_TYPE'] = this.cUSTTYPE;
    data['neuron_ID'] = this.neuronID;
    data['COMP_CODE'] = this.cOMPCODE;
    data['ACC_SALE_PERSON_NAME'] = this.aCCSALEPERSONNAME;
    data['REG_NO'] = this.rEGNO;
    data['KEY_CONTACT_NAME'] = this.kEYCONTACTNAME;
    data['DESIGNATION'] = this.dESIGNATION;
    data['PAN_GIR_NO'] = this.pANGIRNO;
    data['CIRCLE_CODE'] = this.cIRCLECODE;
    data['ZONE_CODE'] = this.zONECODE;
    data['MOBILE_NO'] = this.mOBILENO;
    data['EMAIL_ID'] = this.eMAILID;
    data['CUST_TAN_NUM'] = this.cUSTTANNUM;
    data['TIN_ARN'] = this.tINARN;
    data['GST'] = this.gST;
    data['WORKFLOW_CODE'] = this.wORKFLOWCODE;
    data['SERVICE_TYPE'] = this.sERVICETYPE;
    data['PLAN_TYPE'] = this.pLANTYPE;
    data['ADVANCE_CHARGES'] = this.aDVANCECHARGES;
    data['REG_INST_CHARGES'] = this.rEGINSTCHARGES;
    data['RENTAL_USAGE_CH'] = this.rENTALUSAGECH;
    data['TYPE'] = this.tYPE;
    data['ACC_SALE_PERSON'] = this.aCCSALEPERSON;
    data['IS_EDITABLE'] = this.iSEDITABLE;
    data['CUSTOMER_TYPE'] = this.cUSTOMERTYPE;
    data['CIRCLE_NAME'] = this.cIRCLENAME;
    data['ZONE_DESCRIPTION'] = this.zONEDESCRIPTION;
    data['CUR_ACC_MGR'] = this.cURACCMGR;
    data['GEO_CUST_CODE'] = this.gEOCUSTCODE;
    data['BUSINESS_VERTICAL'] = this.bUSINESSVERTICAL;
    data['BUSINESS_VERTICAL_DISP'] = this.bUSINESSVERTICALDISP;
    data['TM_LICEN_NO'] = this.tMLICENNO;
    data['ALT_MOBILE_NO'] = this.aLTMOBILENO;
    data['PAYMENT_TERMS'] = this.pAYMENTTERMS;
    data['COMP_NAME'] = this.cOMPNAME;
    data['IS_GST'] = this.iSGST;
    data['IS_TAN'] = this.iSTAN;
    data['SPECIAL_APP_WO_DOC'] = this.sPECIALAPPWODOC;
    data['OB_CHARGINGMODE_DESCRIPTION'] = this.oBCHARGINGMODEDESCRIPTION;
    data['CREDIT_LIMIT'] = this.cREDITLIMIT;
    data['PE_ID'] = this.pEID;
    data['GROUP_COMP_NAME'] = this.gROUPCOMPNAME;
    data['CHANNEL_PART_NAME'] = this.cHANNELPARTNAME;
    data['ENTERPRISE_TYPE_DESC'] = this.eNTERPRISETYPEDESC;
    data['IS_NM'] = this.iSNM;
    data['MIG_DATE'] = this.mIGDATE;
    data['INVOICE_PERIOD'] = this.iNVOICEPERIOD;
    data['PDC_BG'] = this.pDCBG;
    data['AGREED_PAYMENT_TERM'] = this.aGREEDPAYMENTTERM;
    data['DEVIATION_DATE'] = this.dEVIATIONDATE;
    return data;
  }
}

class CustomerAddressDet {
  String? hOUSENO;
  String? fLOORNO;
  String? sTREETNAME;
  String? lOCALITY;
  String? lANDMARK;
  String? cITY;
  String? pOSTOFFICE;
  String? dISTRICT;
  String? sTATE;
  String? pINCODE;
  String? tELNO;
  String? fAX;
  String? eXISTINGCONTNO;
  String? dPNO;
  String? mSUWLNNODE;
  String? aDDRESSTYPE;
  String? cUSTACCNO;
  String? bUILDINGNAME;
  String? buildingName;

  CustomerAddressDet(
      {this.hOUSENO,
      this.fLOORNO,
      this.sTREETNAME,
      this.lOCALITY,
      this.lANDMARK,
      this.cITY,
      this.pOSTOFFICE,
      this.dISTRICT,
      this.sTATE,
      this.pINCODE,
      this.tELNO,
      this.fAX,
      this.eXISTINGCONTNO,
      this.dPNO,
      this.mSUWLNNODE,
      this.aDDRESSTYPE,
      this.cUSTACCNO,
      this.bUILDINGNAME,
      this.buildingName});

  CustomerAddressDet.fromJson(Map<String, dynamic> json) {
    hOUSENO = json['HOUSE_NO'];
    fLOORNO = json['FLOOR_NO'];
    sTREETNAME = json['STREET_NAME'];
    lOCALITY = json['LOCALITY'];
    lANDMARK = json['LANDMARK'];
    cITY = json['CITY'];
    pOSTOFFICE = json['POST_OFFICE'];
    dISTRICT = json['DISTRICT'];
    sTATE = json['STATE'];
    pINCODE = json['PIN_CODE'];
    tELNO = json['TEL_NO'];
    fAX = json['FAX'];
    eXISTINGCONTNO = json['EXISTING_CONT_NO'];
    dPNO = json['DP_NO'];
    mSUWLNNODE = json['MSU_WLN_NODE'];
    aDDRESSTYPE = json['ADDRESS_TYPE'];
    cUSTACCNO = json['CUST_ACC_NO'];
    bUILDINGNAME = json['BUILDING_NAME'];
    buildingName = json['BuildingName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HOUSE_NO'] = this.hOUSENO;
    data['FLOOR_NO'] = this.fLOORNO;
    data['STREET_NAME'] = this.sTREETNAME;
    data['LOCALITY'] = this.lOCALITY;
    data['LANDMARK'] = this.lANDMARK;
    data['CITY'] = this.cITY;
    data['POST_OFFICE'] = this.pOSTOFFICE;
    data['DISTRICT'] = this.dISTRICT;
    data['STATE'] = this.sTATE;
    data['PIN_CODE'] = this.pINCODE;
    data['TEL_NO'] = this.tELNO;
    data['FAX'] = this.fAX;
    data['EXISTING_CONT_NO'] = this.eXISTINGCONTNO;
    data['DP_NO'] = this.dPNO;
    data['MSU_WLN_NODE'] = this.mSUWLNNODE;
    data['ADDRESS_TYPE'] = this.aDDRESSTYPE;
    data['CUST_ACC_NO'] = this.cUSTACCNO;
    data['BUILDING_NAME'] = this.bUILDINGNAME;
    data['BuildingName'] = this.buildingName;
    return data;
  }
}

class CafDocumentDet {
  String? fILEID;
  String? proofTypeText;
  String? fILENAME;
  String? proofType;
  String? cSDVALIDATED;
  String? iSDEVIATION;
  String? uSERFILENAME;
  String? dOCTYPE;
  String? docValue;
  String? fILE_NAME;
  String? filePath;
  String? rEMARKS;
  bool isSelected = false;
  CafDocumentDet(
      {this.fILEID,
      this.proofTypeText,
      this.fILENAME,
      this.proofType,
      this.cSDVALIDATED,
      this.iSDEVIATION,
      this.uSERFILENAME,
      this.dOCTYPE,
      this.docValue,
      this.fILE_NAME,
      this.filePath,
      this.rEMARKS});

  CafDocumentDet.fromJson(Map<String, dynamic> json) {
    fILEID = json['FILEID'];
    proofTypeText = json['ProofTypeText'];
    fILENAME = json['FILENAME'];
    proofType = json['ProofType'];
    cSDVALIDATED = json['CSD_VALIDATED'];
    iSDEVIATION = json['IS_DEVIATION'];
    uSERFILENAME = json['USER_FILE_NAME'];
    dOCTYPE = json['DOC_TYPE'];
    docValue = json['Doc_Value'];
    fILE_NAME = json['FILE_NAME'];
    filePath = json['File_Path'];
    rEMARKS = json['REMARKS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FILEID'] = this.fILEID;
    data['ProofTypeText'] = this.proofTypeText;
    data['FILENAME'] = this.fILENAME;
    data['ProofType'] = this.proofType;
    data['CSD_VALIDATED'] = this.cSDVALIDATED;
    data['IS_DEVIATION'] = this.iSDEVIATION;
    data['USER_FILE_NAME'] = this.uSERFILENAME;
    data['DOC_TYPE'] = this.dOCTYPE;
    data['Doc_Value'] = this.docValue;
    data['FILE_NAME'] = this.fILE_NAME;
    data['File_Path'] = this.filePath;
    data['REMARKS'] = this.rEMARKS;

    return data;
  }
}

class ContactInfo {
  String? cONTACTPERSON;
  String? cONTACTNUMBER;
  String? cONTACTEMAIL;
  String? cONTACTTYPE;

  ContactInfo(
      {this.cONTACTPERSON,
      this.cONTACTNUMBER,
      this.cONTACTEMAIL,
      this.cONTACTTYPE});

  ContactInfo.fromJson(Map<String, dynamic> json) {
    cONTACTPERSON = json['CONTACT_PERSON'];
    cONTACTNUMBER = json['CONTACT_NUMBER'];
    cONTACTEMAIL = json['CONTACT_EMAIL'];
    cONTACTTYPE = json['CONTACT_TYPE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CONTACT_PERSON'] = this.cONTACTPERSON;
    data['CONTACT_NUMBER'] = this.cONTACTNUMBER;
    data['CONTACT_EMAIL'] = this.cONTACTEMAIL;
    data['CONTACT_TYPE'] = this.cONTACTTYPE;
    return data;
  }
}

class Commerical {
  String? pLANTYPE;
  String? pULSEDURATION;
  String? pULSERATE;
  String? rECORDINGDURATION;
  String? rECORDINGRATE;
  String? sTATUS;

  Commerical(
      {this.pLANTYPE,
      this.pULSEDURATION,
      this.pULSERATE,
      this.rECORDINGDURATION,
      this.rECORDINGRATE,
      this.sTATUS});

  Commerical.fromJson(Map<String, dynamic> json) {
    pLANTYPE = json['PLAN_TYPE'];
    pULSEDURATION = json['PULSE_DURATION'];
    pULSERATE = json['PULSE_RATE'];
    rECORDINGDURATION = json['RECORDING_DURATION'];
    rECORDINGRATE = json['RECORDING_RATE'];
    sTATUS = json['STATUS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PLAN_TYPE'] = this.pLANTYPE;
    data['PULSE_DURATION'] = this.pULSEDURATION;
    data['PULSE_RATE'] = this.pULSERATE;
    data['RECORDING_DURATION'] = this.rECORDINGDURATION;
    data['RECORDING_RATE'] = this.rECORDINGRATE;
    data['STATUS'] = this.sTATUS;
    return data;
  }
}

class CustomerMIGs {
  String? serialNo;
  String? cUSTACCNO;
  String? cUSTNAME;
  String? serviceType;
  String? serviceCode;

  CustomerMIGs(
      {this.serialNo,
      this.cUSTACCNO,
      this.cUSTNAME,
      this.serviceType,
      this.serviceCode});

  CustomerMIGs.fromJson(Map<String, dynamic> json) {
    serialNo = json['Serial_No'];
    cUSTACCNO = json['CUST_ACC_NO'];
    cUSTNAME = json['CUST_NAME'];
    serviceType = json['Service_Type'];
    serviceCode = json['Service_Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Serial_No'] = this.serialNo;
    data['CUST_ACC_NO'] = this.cUSTACCNO;
    data['CUST_NAME'] = this.cUSTNAME;
    data['Service_Type'] = this.serviceType;
    data['Service_Code'] = this.serviceCode;
    return data;
  }
}

class RemarksList {
  String? rEMARKS;
  String? nAME;
  String? jOBDATE;
  String? wORKFLOWTYPEDESC;
  String? routedTo;
  String? processedBY;

  RemarksList(
      {this.rEMARKS,
      this.nAME,
      this.jOBDATE,
      this.wORKFLOWTYPEDESC,
      this.routedTo,
      this.processedBY});

  RemarksList.fromJson(Map<String, dynamic> json) {
    rEMARKS = json['REMARKS'];
    nAME = json['NAME'];
    jOBDATE = json['JOB_DATE'];
    wORKFLOWTYPEDESC = json['WORKFLOW_TYPE_DESC'];
    routedTo = json['Routed_To'];
    processedBY = json['Processed_BY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['REMARKS'] = this.rEMARKS;
    data['NAME'] = this.nAME;
    data['JOB_DATE'] = this.jOBDATE;
    data['WORKFLOW_TYPE_DESC'] = this.wORKFLOWTYPEDESC;
    data['Routed_To'] = this.routedTo;
    data['Processed_BY'] = this.processedBY;
    return data;
  }
}

class MoveToList {
  String? key;
  String? value;

  MoveToList({this.key, this.value});

  MoveToList.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Key'] = this.key;
    data['Value'] = this.value;
    return data;
  }
}
