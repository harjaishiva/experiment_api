part of 'customer_on_boarding_details_screen_view.dart';

class CustomerOnBoardingScreenList extends StatefulWidget {
  const CustomerOnBoardingScreenList({
    Key? key,
  }) : super(key: key);

  @override
  _CustomerOnBoardingScreenListState createState() =>
      _CustomerOnBoardingScreenListState();
}

class _CustomerOnBoardingScreenListState
    extends State<CustomerOnBoardingScreenList> {
  final List<String> headerTitles = ["Customer Portfolio", "Payment Entry"];
  final TextEditingController _sapDocNoController = TextEditingController();

  final TextEditingController _remarkController = TextEditingController();
  final TextEditingController _approvedReasonController =
      TextEditingController();

  String gstValue = "--Select--";
  String paymentTypeValue = "--Select--";
  String paymentValueCode = "";

  String creditedBankValue = "--Select--";
  List<String> gstValueList = ["--Select--"];
  String reasonValue = "--Select--";

  List<String> reasonValueList = ["--Select--"];
  List<String> reasonCodeValueList = ["--Select--"];

  String daysValue = "--Select--";
  String daysCodeValue = "--Select--";
  String reasonCodeValue = "--Select--";
  bool firstTime = false;
  List<String> daysTypeValueList = ["--Select--"];
  List<String> daysTypeCodeList = ["--Select--"];

  List<String> creditedBankValueList = ["--Select--"];
  String invoiceTotal = "";
  String rechargeTotal = "";
  String creditedTotal = "";
  String grandTotal = "";
  String totalTdsSum = "";
  List<String> smsCountList = <String>[];
  DateTime selectedDate = DateTime.now();
  int activeCount = 0;

  final _daysKey = GlobalKey();

  final _scrollController = ScrollController();
  PlatformFile? file;
  PlatformFile? otherFile;

  String selectedFileName = '';
  String selectedOtherFileName = '';
  final List<TextEditingController> _remarksArrayController =
      <TextEditingController>[];
  List<Map<String, dynamic>> cSDModelsList = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
        builder: (context, state) {
      if ((state.customerOnBoardingModel) != null) {
        if (firstTime == false) {
          firstTime = true;
          setCSDModelsList(state: state);
        }

//     if (state.customerOnBoardingModel!.noofDays != null)
//     {
//   if (firstTime == false){
//       firstTime = true;
// daysValue = state.customerOnBoardingModel!.data?.masterInfo?.nOOFDAYS ?? "--Select--";

//     }
//    state.customerOnBoardingModel!.noofDays!.forEach((element) {
//           if (!daysTypeValueList.contains(element.toString())) {
//             daysTypeValueList.add(element.toString() ?? "");
//           }
//         });
//          state.customerOnBoardingModel!.noofDays!.forEach((element) {
//           if (!daysTypeCodeList.contains(element.toString())) {
//             daysTypeCodeList.add(element.toString() ?? "");
//           }
//         });
//     }
      }
      return SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              state.customerOnBoardingModel != null
                  ? StickyHeader(
                      header: Container(
                        height: 40.0,
                        color: themeColor,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Customer Details",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      content: customerDetails(state),
                    )
                  : SizedBox(),
              state.customerOnBoardingModel != null
                  ? StickyHeader(
                      header: Container(
                        height: 40.0,
                        color: themeColor,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Permanent Address",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      content: addressView(0))
                  : SizedBox(),
              state.customerOnBoardingModel != null
                  ? StickyHeader(
                      header: Container(
                        height: 40.0,
                        color: themeColor,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Billing Address",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      content: billingAddressView(1))
                  : SizedBox(),
              state.customerOnBoardingModel != null
                  ? StickyHeader(
                      header: Container(
                        height: 40.0,
                        color: themeColor,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Contact Details",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      content: contactDetails())
                  : SizedBox(),
              state.customerOnBoardingModel != null
                  ? StickyHeader(
                      header: Container(
                        height: 40.0,
                        color: themeColor,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Payment Terms",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      content: paymentTerms(state),
                    )
                  : SizedBox(),
              state.customerOnBoardingModel != null
                  ? StickyHeader(
                      header: Container(
                        height: 40.0,
                        color: themeColor,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Document Section",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      content: documentSection())
                  : SizedBox(),
              SizedBox(
                height: 20,
              ),
              state.customerOnBoardingModel != null
                  ? Text(
                      "Deviation Date " +
                          (state.customerOnBoardingModel?.data?.customerDetail
                                  ?.customer?.dEVIATIONDATE ??
                              "N/A"),
                      style: TextStyle(
                        color: themeColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    )
                  : SizedBox(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              state.customerOnBoardingModel != null
                  ? state.dataMain!["Commerical"] != null
                      ? StickyHeader(
                          header: Container(
                            height: 40.0,
                            color: themeColor,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Existing Commercials",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          content: commercialData())
                      : SizedBox()
                  : SizedBox(),
              SizedBox(
                height: 20,
              ),
              state.customerOnBoardingModel != null
                  ? state.dataMain!["RequestedCommerical"] != null
                      ? StickyHeader(
                          header: Container(
                            height: 40.0,
                            color: themeColor,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: Text(
                              "New Commercials to be Approved",
                              style: GoogleFonts.lato(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          content: newCommercialData())
                      : SizedBox()
                  : SizedBox(),
              SizedBox(
                height: 20,
              ),
              state.customerOnBoardingModel != null
                  ? state.customerOnBoardingModel!.data!.customerMIGs != null
                      ? StickyHeader(
                          header: Container(
                            height: 60.0,
                            color: themeColor,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: Text(
                              "CMG Services (Note: Please enter CAF for all mentioned services.)",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          content: cmgServicesView())
                      : const SizedBox()
                  : const SizedBox(),
              state.customerOnBoardingModel != null
                  ? StickyHeader(
                      header: Container(
                        height: 40.0,
                        color: themeColor,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Remarks History",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      content: remarksWidget(state: state))
                  : const SizedBox(),
            ],
          ),
        ),
      );
      // : const SizedBox();
    });
  }

  void selectSingleItem(
      {required int selectedIndex,
      required CustomerOnBoardingState state,
      required bool isSelected}) {
    print("this is the selected index----->$selectedIndex}");
    for (int i = 0;
        i <
            state.customerOnBoardingModel!.data!.customerDetail!.cafDocumentDet!
                .length;
        i++) {
      if (i == selectedIndex) {
        state.customerOnBoardingModel!.data!.customerDetail!.cafDocumentDet![i]
                .isSelected =
            !state.customerOnBoardingModel!.data!.customerDetail!
                .cafDocumentDet![i].isSelected;

        if (state.customerOnBoardingModel!.data!.customerDetail!
                .cafDocumentDet![i].isSelected ==
            true) {
          var map = {
            "CUST_REQ_SERV_ID": "",
            "FILENAME": state.customerOnBoardingModel!.data!.customerDetail!
                    .cafDocumentDet![i].fILENAME ??
                "",
            "ProofType": state.customerOnBoardingModel!.data!.customerDetail!
                    .cafDocumentDet![i].proofType ??
                "",
            "CSD_VALIDATED": "Y",
            "IS_DEVIATION": "",
            "Remarks": _remarksArrayController[i].text
          };
          cSDModelsList.add(map);
          cSDModelsList.toSet().toList();
        } else if (state.customerOnBoardingModel!.data!.customerDetail!
                .cafDocumentDet![i].isSelected ==
            false) {
          for (int j = 0; j < cSDModelsList.length; j++) {
            if (cSDModelsList[j]["ProofType"] ==
                state.customerOnBoardingModel!.data!.customerDetail!
                    .cafDocumentDet![i].proofType) {
              cSDModelsList.removeAt(j);
            }
          }
        }
      }
      print(cSDModelsList);
      context.read<CustomerOnBoardingBloc>().updateCode();
    }
  }

  void setCSDModelsList({required CustomerOnBoardingState state}) {
    for (int i = 0;
        i <
            state.customerOnBoardingModel!.data!.customerDetail!.cafDocumentDet!
                .length;
        i++) {
      _remarksArrayController.add(TextEditingController());
      if ((state.customerOnBoardingModel!.data!.customerDetail!
                  .cafDocumentDet![i].cSDVALIDATED ==
              'N') &&
          (state.customerOnBoardingModel!.data!.customerDetail!
                  .cafDocumentDet![i].iSDEVIATION !=
              'Y')) {
        activeCount += 1;
      }
      if (state.customerOnBoardingModel!.data!.customerDetail!
              .cafDocumentDet![i].cSDVALIDATED ==
          'Y') {
        state.customerOnBoardingModel!.data!.customerDetail!.cafDocumentDet![i]
            .isSelected = true;
        _remarksArrayController[i].text = state.customerOnBoardingModel!.data!
                .customerDetail!.cafDocumentDet![i].rEMARKS ??
            "";
        //      var map = {
        // "CUST_REQ_SERV_ID": "",
        // "FILENAME": state.customerOnBoardingModel!.data!.customerDetail!.cafDocumentDet![i].fILENAME ?? "",
        // "ProofType": state.customerOnBoardingModel!.data!.customerDetail!.cafDocumentDet![i].proofType ?? "",
        // "CSD_VALIDATED":  "Y",
        // "IS_DEVIATION":  "",
        // "Remarks": _remarksArrayController[i].text

        //      };
        //     cSDModelsList.add(map);
        //     cSDModelsList.toSet().toList();
      }

      print(cSDModelsList);
      context.read<CustomerOnBoardingBloc>().updateCode();
    }
  }

  Widget customerDetails(CustomerOnBoardingState state) {
    return Column(children: [
      DetailRow(
        title1: "Region",
        title2: "Zone",
        value1: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.cIRCLENAME ??
            "N/A",
        value2: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.zONEDESCRIPTION ??
            "N/A",
      ),
      DetailRow(
        title1: "Group Company Associate if any",
        title2: "Plan Type",
        value1: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.gROUPCOMPNAME ??
            "N/A",
        value2: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.pLANTYPE ??
            "N/A",
      ),
      DetailRow(
        title1: "Customer Type",
        title2: "TM ID",
        value1: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.cUSTOMERTYPE ??
            "N/A",
        value2: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.tMLICENNO ??
            "N/A",
      ),
      (state.customerOnBoardingModel?.data?.customerDetail?.customer
                  ?.bUSINESSVERTICALDISP ==
              null)
          ? SizedBox()
          : DetailColumn(
              title1: "Business Vertical",
              value1: state.customerOnBoardingModel?.data?.customerDetail
                      ?.customer?.bUSINESSVERTICALDISP ??
                  "N/A"),
      state.customerOnBoardingModel?.data?.customerDetail?.customer
                  ?.eNTERPRISETYPEDESC ==
              null
          ? SizedBox()
          : DetailColumn(
              title1: "Enterprise Type",
              value1: state.customerOnBoardingModel?.data?.customerDetail
                      ?.customer?.eNTERPRISETYPEDESC ??
                  "N/A"),
      DetailRowDynamic(
        title1: "PE ID",
        title2: "Name of person/Company/Firm/Association/Trust",
        value1: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.pEID ??
            "N/A",
        value2: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.cUSTNAME ??
            "N/A",
      ),
      DetailRow(
        title1: "Account Manager",
        title2: "Sales Person",
        value1: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.aCCOUNTMGRNAME ??
            "N/A",
        value2: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.aCCSALEPERSONNAME ??
            "N/A",
      ),
      DetailRow(
        title1: "Company",
        title2: "Customer Account No",
        value1: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.cOMPNAME ??
            "N/A",
        value2: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.cUSTACCNO ??
            "N/A",
      ),
      DetailRow(
        title1: "Channel Partner",
        title2: "Charging Mode",
        value1: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.cHANNELPARTNAME ??
            "N/A",
        value2: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.oBCHARGINGMODEDESCRIPTION ??
            "N/A",
      ),
      // state.customerOnBoardingModel?.data?.customerDetail?.customer?.iSNM == "Y"
      //     ? DetailRow(
      //         title1: "CMG Customer",
      //         title2: "CMG Date",
      //         value1: "Yes",
      //         value2: state.customerOnBoardingModel?.data?.customerDetail
      //                 ?.customer?.mIGDATE ??
      //             "N/A",
      //       )
      //     : DetailColumn(title1: "CMG Customer", value1: "No"),
    ]);
  }

  Widget paymentTerms(CustomerOnBoardingState state) {
    return Column(children: [
      DetailRow(
        title1: "Invoice Period (In Days) *",
        title2: "Agreed Payment Term (In Days)",
        value1: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.iNVOICEPERIOD ??
            "N/A",
        value2: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.aGREEDPAYMENTTERM ??
            "N/A",
      ),
      DetailRow(
        title1: "Payment Term as per Agreement (In Days) *",
        title2: "PDC / BG (In Rupees) *",
        value1: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.pAYMENTTERMS ??
            "N/A",
        value2: state.customerOnBoardingModel?.data?.customerDetail?.customer
                ?.pDCBG ??
            "N/A",
      ),
      DetailColumn(
          title1: "Credit Limit (In Rupees) *",
          value1: state.customerOnBoardingModel?.data?.customerDetail?.customer
                  ?.cREDITLIMIT ??
              "N/A"),
    ]);
  }

  Widget addressView(int index) {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        return Container(
          color: Colors.transparent,
          child: Column(children: [
            DetailRow(
              title1: "House/SCO/SCF/Plot/Shop/Booth No",
              title2: "Floor No",
              value1: state.customerOnBoardingModel?.data?.permanentAddressDet
                      ?.hOUSENO ??
                  "N/A",
              value2: state.customerOnBoardingModel?.data?.permanentAddressDet
                      ?.fLOORNO ??
                  "N/A",
            ),
            DetailRow(
              title1: "Building/Estb. Name",
              title2: "Street Name/No/Block No",
              value1: state.customerOnBoardingModel?.data?.permanentAddressDet
                      ?.bUILDINGNAME ??
                  "N/A",
              value2: state.customerOnBoardingModel?.data?.permanentAddressDet
                      ?.sTREETNAME ??
                  "N/A",
            ),
            DetailRow(
              title1: "Locality",
              title2: "Landmark",
              value1: state.customerOnBoardingModel?.data?.permanentAddressDet
                      ?.lOCALITY ??
                  "N/A",
              value2: state.customerOnBoardingModel?.data?.permanentAddressDet
                      ?.lANDMARK ??
                  "N/A",
            ),
            DetailRow(
              title1: "City/Town/Tehsil",
              title2: "Post Office",
              value1: state.customerOnBoardingModel?.data?.permanentAddressDet
                      ?.cITY ??
                  "N/A",
              value2: state.customerOnBoardingModel?.data?.permanentAddressDet
                      ?.pOSTOFFICE ??
                  "N/A",
            ),
            DetailRow(
              title1: "District",
              title2: "State",
              value1: state.customerOnBoardingModel?.data?.permanentAddressDet
                      ?.dISTRICT ??
                  "N/A",
              value2: state.customerOnBoardingModel?.data?.permanentAddressDet
                      ?.sTATE ??
                  "N/A",
            ),
            DetailRow(
              title1: "Pin Code",
              title2: "Contact Number",
              value1: state.customerOnBoardingModel?.data?.permanentAddressDet
                      ?.pINCODE ??
                  "N/A",
              value2: state.customerOnBoardingModel?.data?.permanentAddressDet
                      ?.tELNO ??
                  "N/A",
            ),
          ]),
        );
      },
    );
  }

  Widget billingAddressView(int index) {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        return Container(
          color: Colors.transparent,
          child: Column(children: [
            DetailRow(
              title1: "House/SCO/SCF/Plot/Shop/Booth No",
              title2: "Floor No",
              value1: state.customerOnBoardingModel?.data?.billingAddressDet
                      ?.hOUSENO ??
                  "N/A",
              value2: state.customerOnBoardingModel?.data?.billingAddressDet
                      ?.fLOORNO ??
                  "N/A",
            ),
            DetailRow(
              title1: "Building/Estb. Name",
              title2: "Street Name/No/Block No",
              value1: state.customerOnBoardingModel?.data?.billingAddressDet
                      ?.bUILDINGNAME ??
                  "N/A",
              value2: state.customerOnBoardingModel?.data?.billingAddressDet
                      ?.sTREETNAME ??
                  "N/A",
            ),
            DetailRow(
              title1: "Locality",
              title2: "Landmark",
              value1: state.customerOnBoardingModel?.data?.billingAddressDet
                      ?.lOCALITY ??
                  "N/A",
              value2: state.customerOnBoardingModel?.data?.billingAddressDet
                      ?.lANDMARK ??
                  "N/A",
            ),
            DetailRow(
              title1: "City/Town/Tehsil",
              title2: "Post Office",
              value1: state
                      .customerOnBoardingModel?.data?.billingAddressDet?.cITY ??
                  "N/A",
              value2: state.customerOnBoardingModel?.data?.billingAddressDet
                      ?.pOSTOFFICE ??
                  "N/A",
            ),
            DetailRow(
              title1: "District",
              title2: "State",
              value1: state.customerOnBoardingModel?.data?.billingAddressDet
                      ?.dISTRICT ??
                  "N/A",
              value2: state.customerOnBoardingModel?.data?.billingAddressDet
                      ?.sTATE ??
                  "N/A",
            ),
            DetailRow(
              title1: "Pin Code",
              title2: "Contact Number",
              value1: state.customerOnBoardingModel?.data?.billingAddressDet
                      ?.pINCODE ??
                  "N/A",
              value2: state.customerOnBoardingModel?.data?.billingAddressDet
                      ?.tELNO ??
                  "N/A",
            ),
          ]),
        );
      },
    );
  }

  Widget contactInfoView(int index) {
    if (index == 0) {
      return Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  headerTile(width: 120, title: "Function"),
                  headerTile(width: 120, title: "Contact Person"),
                  headerTile(width: 150, title: "Contact Number"),
                  headerTile(width: 250, title: "E-mail ID"),
                ],
              ),
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey.shade300,
          ),
        ],
      );
    } else {
      Color listBgClr = textFieldColor;

      if ((index & 1) == 0) {
        // even
        listBgClr = textFieldColor;
      } else {
        // odd
        listBgClr = Colors.white;
      }
      int indx = index - 1;
      return contactInfoViewList(index: indx, listBgClr: listBgClr);
    }
  }

  Widget contactInfoViewList({required int index, required Color listBgClr}) {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        return Container(
          color: listBgClr,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                recordTile(
                    width: 120,
                    value: state.customerOnBoardingModel!.data!
                            .contactInfo![index].cONTACTTYPE ??
                        "N/A"),
                recordTile(
                    width: 120,
                    value: state.customerOnBoardingModel!.data!
                            .contactInfo![index].cONTACTPERSON ??
                        "N/A"),
                recordTile(
                    width: 150,
                    value: state.customerOnBoardingModel!.data!
                            .contactInfo![index].cONTACTNUMBER ??
                        "N/A"),
                recordTile(
                    width: 250,
                    value: state.customerOnBoardingModel!.data!
                            .contactInfo![index].cONTACTEMAIL ??
                        "N/A"),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget remarksTableView() {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        return state.customerOnBoardingModel!.data!.remarksList!.length == 0
            ? NoRecordFound()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                  child: Container(
                      width: 790,
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: state.customerOnBoardingModel!.data!
                                .remarksList!.length +
                            1,

                        /// *** ( 2 is list count : '+1' is for title header)
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return remarksTableViewHeader(i);
                        },
                      )),
                ),
              );
      },
    );
  }

  Widget remarksTableViewHeader(int index) {
    if (index == 0) {
      return Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  headerTile(width: 120, title: "Remarks"),
                  headerTile(width: 120, title: "Submitted by"),
                  headerTile(width: 120, title: "Routed To"),
                  headerTile(width: 120, title: "Processed By"),
                  headerTile(width: 150, title: "Workflow"),
                  headerTile(width: 150, title: "Submitted Date"),
                ],
              ),
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey.shade300,
          ),
        ],
      );
    } else {
      Color listBgClr = textFieldColor;

      if ((index & 1) == 0) {
        // even
        listBgClr = textFieldColor;
      } else {
        // odd
        listBgClr = Colors.white;
      }
      int indx = index - 1;
      return remarksTableViewColumns(index: indx, listBgClr: listBgClr);
    }
  }

  Widget remarksTableViewColumns(
      {required int index, required Color listBgClr}) {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        return Container(
          color: listBgClr,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                recordTile(
                    width: 120,
                    value: state.customerOnBoardingModel!.data!
                            .remarksList![index].rEMARKS ??
                        "N/A"),
                recordTile(
                    width: 120,
                    value: state.customerOnBoardingModel!.data!
                            .remarksList![index].nAME ??
                        "N/A"),
                recordTile(
                    width: 120,
                    value: state.customerOnBoardingModel!.data!
                            .remarksList![index].routedTo ??
                        "N/A"),
                recordTile(
                    width: 120,
                    value: state.customerOnBoardingModel!.data!
                            .remarksList![index].processedBY ??
                        "N/A"),
                recordTile(
                    width: 150,
                    value: state.customerOnBoardingModel!.data!
                            .remarksList![index].wORKFLOWTYPEDESC ??
                        "N/A"),
                recordTile(
                    width: 150,
                    value: state.customerOnBoardingModel!.data!
                            .remarksList![index].jOBDATE ??
                        "N/A"),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget cmgServicesView() {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        return state.customerOnBoardingModel!.data!.customerMIGs!.length == 0
            ? NoRecordFound()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                  child: Container(
                      width: 415,
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: state.customerOnBoardingModel!.data!
                                .customerMIGs!.length +
                            1,

                        /// *** ( 2 is list count : '+1' is for title header)
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return cmgServicesViewHeader(i);
                        },
                      )),
                ),
              );
      },
    );
  }

  Widget cmgServicesViewHeader(int index) {
    if (index == 0) {
      return Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  headerTile(width: 120, title: "S.No"),
                  headerTile(width: 120, title: "Customer Name"),
                  headerTile(width: 150, title: "Service Type"),
                ],
              ),
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey.shade300,
          ),
        ],
      );
    } else {
      Color listBgClr = textFieldColor;

      if ((index & 1) == 0) {
        // even
        listBgClr = textFieldColor;
      } else {
        // odd
        listBgClr = Colors.white;
      }
      int indx = index - 1;
      return rcmgServicesViewColumns(index: indx, listBgClr: listBgClr);
    }
  }

  Widget rcmgServicesViewColumns(
      {required int index, required Color listBgClr}) {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        return Container(
          color: listBgClr,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                recordTile(width: 120, value: (index + 1).toString()),
                recordTile(
                    width: 120,
                    value: state.customerOnBoardingModel!.data!
                            .customerMIGs![index].cUSTNAME ??
                        "N/A"),
                recordTile(
                    width: 150,
                    value: state.customerOnBoardingModel!.data!
                            .customerMIGs![index].serviceType ??
                        "N/A"),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget documentSection() {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        return state.customerOnBoardingModel!.data!.customerDetail!
                    .cafDocumentDet!.length ==
                0
            ? NoRecordFound()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                  child: Container(
                      width: AppVariables.currentStage == "CSD" ? 910 : 630,
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: state.customerOnBoardingModel!.data!
                                .customerDetail!.cafDocumentDet!.length +
                            1,

                        /// *** ( 2 is list count : '+1' is for title header)
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          if (_remarksArrayController.length <
                              state.customerOnBoardingModel!.data!
                                  .customerDetail!.cafDocumentDet!.length) {
                            print("======++++$i");

                            print(_remarksArrayController.length);
                          }
                          return documentSectionView(i);
                        },
                      )),
                ),
              );
      },
    );
  }

  Widget documentSectionView(int index) {
    if (index == 0) {
      return Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  headerTile(width: 120, title: "Sr No"),
                  headerTile(width: 120, title: "Proof Type"),
                  headerTile(width: 170, title: "Value"),
                  headerTile(width: 120, title: "File Name"),
                  headerTile(width: 100, title: "Deviation"),
                  AppVariables.currentStage == "CSD"
                      ? headerTile(width: 120, title: "Approved by CSD")
                      : SizedBox(),
                  AppVariables.currentStage == "CSD"
                      ? headerTile(width: 160, title: "Remarks")
                      : SizedBox()
                ],
              ),
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey.shade300,
          ),
        ],
      );
    } else {
      Color listBgClr = Colors.white;
      if ((index & 1) == 0) {
        // even
        listBgClr = textFieldColor;
      } else {
        // odd
        listBgClr = Colors.white;
      }
      int indx = index - 1;
      return documentSectionList(index: indx, listBgClr: listBgClr);
    }
  }

  Widget documentSectionList({required int index, required Color listBgClr}) {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        return Container(
          color: listBgClr,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                recordTile(width: 120, value: (index + 1).toString()),
                recordTile(
                    width: 120,
                    value: state.customerOnBoardingModel!.data!.customerDetail!
                            .cafDocumentDet![index].proofTypeText ??
                        "N/A"),
                recordTile(
                    width: 170,
                    value: state.customerOnBoardingModel!.data!.customerDetail!
                            .cafDocumentDet![index].docValue ??
                        "N/A"),
                InkWell(
                    onTap: () {
                      if (state.customerOnBoardingModel!.data!.customerDetail!
                              .cafDocumentDet![index].fILE_NAME !=
                          null) {
                        launchURLBrowser(
                            downloadUrl: state
                                .customerOnBoardingModel!
                                .data!
                                .customerDetail!
                                .cafDocumentDet![index]
                                .fILE_NAME!,
                            context: context);
                      }
                    },
                    child: SizedBox(
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                          child: Text(
                            state.customerOnBoardingModel!.data!.customerDetail!
                                    .cafDocumentDet![index].uSERFILENAME ??
                                "N/A",
                            style: TextStyle(color: themeColor),
                          ),
                        ))),
                // recordTile(width: 120, value:  state.customerOnBoardingModel!.data!.customerDetail!.cafDocumentDet![index].??"N/A"),
                state.customerOnBoardingModel!.data!.customerDetail!
                            .cafDocumentDet![index].iSDEVIATION ==
                        "Y"
                    ? recordTile2(width: 100, value: "YES")
                    : recordTile(width: 100, value: "-"),
                AppVariables.currentStage == "CSD"
                    ? Container(
                        alignment: Alignment.center,
                        width: 100,
                        child: Checkbox(
                          side: BorderSide(
                            // ======> CHANGE THE BORDER COLOR HERE <======
                            color: ((state
                                            .customerOnBoardingModel!
                                            .data!
                                            .customerDetail!
                                            .cafDocumentDet![index]
                                            .cSDVALIDATED ==
                                        'Y') ||
                                    (state
                                            .customerOnBoardingModel!
                                            .data!
                                            .customerDetail!
                                            .cafDocumentDet![index]
                                            .iSDEVIATION) ==
                                        "Y"
                                ? Colors.grey
                                : Colors.black),
                            // Give your checkbox border a custom width
                            width: 1.5,
                          ),
                          activeColor: ((state
                                          .customerOnBoardingModel!
                                          .data!
                                          .customerDetail!
                                          .cafDocumentDet![index]
                                          .cSDVALIDATED ==
                                      'Y') ||
                                  (state
                                          .customerOnBoardingModel!
                                          .data!
                                          .customerDetail!
                                          .cafDocumentDet![index]
                                          .iSDEVIATION) ==
                                      "Y"
                              ? Colors.grey
                              : themeColor),
                          onChanged: (_) {
                            ((state
                                            .customerOnBoardingModel!
                                            .data!
                                            .customerDetail!
                                            .cafDocumentDet![index]
                                            .cSDVALIDATED ==
                                        'Y') ||
                                    (state
                                            .customerOnBoardingModel!
                                            .data!
                                            .customerDetail!
                                            .cafDocumentDet![index]
                                            .iSDEVIATION) ==
                                        "Y"
                                ? print("Done")
                                : selectSingleItem(
                                    selectedIndex: index,
                                    state: state,
                                    isSelected: state
                                        .customerOnBoardingModel!
                                        .data!
                                        .customerDetail!
                                        .cafDocumentDet![index]
                                        .isSelected));
                          },
                          value: state
                              .customerOnBoardingModel!
                              .data!
                              .customerDetail!
                              .cafDocumentDet![index]
                              .isSelected,
                        ),
                      )
                    : SizedBox(),
                AppVariables.currentStage == "CSD"
                    ? Container(
                        width: 150,
                        child: textField(
                          color: Colors.white,
                          isBorder: true,
                          textColor: ((state
                                          .customerOnBoardingModel!
                                          .data!
                                          .customerDetail!
                                          .cafDocumentDet![index]
                                          .cSDVALIDATED ==
                                      'Y') ||
                                  (state
                                          .customerOnBoardingModel!
                                          .data!
                                          .customerDetail!
                                          .cafDocumentDet![index]
                                          .iSDEVIATION) ==
                                      "Y"
                              ? Colors.grey
                              : Colors.black),
                          borderColor: ((state
                                          .customerOnBoardingModel!
                                          .data!
                                          .customerDetail!
                                          .cafDocumentDet![index]
                                          .cSDVALIDATED ==
                                      'Y') ||
                                  (state
                                          .customerOnBoardingModel!
                                          .data!
                                          .customerDetail!
                                          .cafDocumentDet![index]
                                          .iSDEVIATION) ==
                                      "Y"
                              ? Colors.grey
                              : Colors.black),
                          controller: _remarksArrayController[index],
                          inputFormatters: [],
                          isReadonly: ((state
                                          .customerOnBoardingModel!
                                          .data!
                                          .customerDetail!
                                          .cafDocumentDet![index]
                                          .cSDVALIDATED ==
                                      'Y') ||
                                  (state
                                          .customerOnBoardingModel!
                                          .data!
                                          .customerDetail!
                                          .cafDocumentDet![index]
                                          .iSDEVIATION) ==
                                      "Y"
                              ? true
                              : false),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget contactDetails() {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        return state.customerOnBoardingModel!.data!.contactInfo!.length == 0
            ? NoRecordFound()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                  child: Container(
                      width: 640,
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: state.customerOnBoardingModel!.data!
                                .contactInfo!.length +
                            1,

                        /// *** ( 2 is list count : '+1' is for title header)
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return contactInfoView(i);
                        },
                      )),
                ),
              );
      },
    );
  }

  Widget textField(
      {required TextEditingController controller,
      required bool isReadonly,
      void Function(String)? onChanged,
      required List<TextInputFormatter> inputFormatters,
      TextInputType? keyboardType,
      Color? color,
      Color? textColor,
      Color? borderColor,
      bool? isBorder,
      void Function()? onTap,
      Key? key,
      FocusNode? focusNode}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        children: [
          // Align(alignment: Alignment.centerLeft, child: Text(titleText)),
          TextFormField(
            key: key,
            focusNode: focusNode,
            cursorColor: Colors.black,
            textInputAction: TextInputAction.done,
            // keyboardType: const TextInputType.numberWithOptions(signed: true),
            inputFormatters: inputFormatters,
            readOnly: isReadonly,
            controller: controller,
            keyboardType: keyboardType,
            style: TextStyle(color: textColor ?? Colors.black),

            decoration: InputDecoration(
                isDense: true,
                hintText: '',
                fillColor: color ?? textFieldColor,
                filled: true,
                contentPadding: const EdgeInsets.fromLTRB(
                  13,
                  8,
                  8,
                  8,
                ),
                focusedBorder: isBorder == true
                    ? buildOutlineInputBorderWidth(borderColor)
                    : buildOutlineInputBorder(),
                disabledBorder: buildOutlineInputBorder(),
                enabledBorder: isBorder == true
                    ? buildOutlineInputBorderWidth(borderColor)
                    : buildOutlineInputBorder(),
                errorBorder: buildOutlineInputBorder(),
                focusedErrorBorder: buildOutlineInputBorder(),
                border: buildOutlineInputBorder()),
            onChanged: onChanged,
            onTap: onTap,
          ),
        ],
      ),
    );
  }

  Widget rowFormTile(
      {required String title1,
      required Widget widget,
      required String title2,
      required Widget widget2}) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: (MediaQuery.of(context).size.width / 2) - 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: MyBullet(),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width / 2) - 36,
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                title1,
                                style: GoogleFonts.lato(color: themeColor),
                              ),
                            )
                          ],
                        ),
                        widget
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: (MediaQuery.of(context).size.width / 2) - 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const MyBullet(),
                          Container(
                            width: (MediaQuery.of(context).size.width / 2) - 60,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                title2,
                                maxLines: 2,
                                style: GoogleFonts.lato(color: themeColor),
                              ),
                            ),
                          )
                        ],
                      ),
                      widget2
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 5, top: 10, bottom: 5),
              child: Container(
                color: Colors.grey.shade300,
                height: 1,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dropDownWidget(
      {required String initialValue,
      required List<String> dropDownValueList,
      Key? key,
      required void Function(String?)? onChanged}) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.only(top: 10.0),
      child: DropdownButton<String>(
        key: key,
        isExpanded: true,
        isDense: true,
        icon: const Icon(Icons.keyboard_arrow_down),
        underline: Container(),
        value: initialValue,
        onChanged: onChanged,
        onTap: () {},
        items: dropDownValueList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget newCommercialData() {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        List listKeys =
            state.dataMain!["RequestedCommerical"][0].keys.toList() ?? [];

        return state.dataMain!["RequestedCommerical"].length! == 0
            ? NoRecordFound()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                  child: Container(
                      width: (listKeys.length - 1) == 2
                          ? ((state.dataMain!["RequestedCommerical"][0]
                                      .length! -
                                  1) *
                              200.0)
                          : ((state.dataMain!["RequestedCommerical"][0]
                                      .length! -
                                  1) *
                              140.0),
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount:
                            state.dataMain!["RequestedCommerical"].length!,

                        /// *** ( 2 is list count : '+1' is for title header)
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return newCommercialView(i, state);
                        },
                      )),
                ),
              );
      },
    );
  }

  Widget newCommercialView(int index, CustomerOnBoardingState state) {
    List listKeys =
        state.dataMain!["RequestedCommerical"][index].keys.toList() ?? [];
    if (index == 0) {
      return Column(
        children: [
          SizedBox(
            width: (listKeys.length - 1) == 2
                ? ((state.dataMain!["RequestedCommerical"][0].length! - 1) *
                    200.0)
                : ((state.dataMain!["RequestedCommerical"][0].length! - 1) *
                    140.0),
            height: 70,
            child: Row(
              children: List.generate(
                listKeys.length - 1,
                (i) => Center(
                    child: headerTile(
                        width: 140,
                        title: state.dataMain!["RequestedCommerical"][index]
                                [(listKeys[i])] ??
                            "N/A")),
              ),
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey.shade300,
          ),
        ],
      );
    } else {
      Color listBgClr = textFieldColor;

      if ((index & 1) == 0) {
        // even
        listBgClr = textFieldColor;
      } else {
        // odd
        listBgClr = Colors.white;
      }
      return newCommercialList(
          index: index, listBgClr: listBgClr, state: state);
    }
  }

  Widget newCommercialList(
      {required int index,
      required Color listBgClr,
      required CustomerOnBoardingState state}) {
    List listKeys =
        state.dataMain!["RequestedCommerical"][index].keys.toList() ?? [];
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        return Container(
          color: listBgClr,
          child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                  width:
                      ((state.dataMain!["RequestedCommerical"][0].length! - 1) *
                          140.0),
                  height: 50,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      listKeys.length - 1,
                      (i) => Center(
                          child: recordTile(
                              width: 140,
                              value: state.dataMain!["RequestedCommerical"]
                                      [index][(listKeys[i])] ??
                                  "N/A")),
                    ),
                  ))),
        );
      },
    );
  }

  Widget commercialData() {
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        List listKeys = state.dataMain!["Commerical"][0].keys.toList() ?? [];

        return state.dataMain!["Commerical"].length! == 0
            ? NoRecordFound()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                  child: Container(
                      width: (listKeys.length) == 2
                          ? ((state.dataMain!["Commerical"][0].length! - 1) *
                              200.0)
                          : ((state.dataMain!["Commerical"][0].length!) *
                              140.0),
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: state.dataMain!["Commerical"].length!,

                        /// *** ( 2 is list count : '+1' is for title header)
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return commercialView(i, state);
                        },
                      )),
                ),
              );
      },
    );
  }

  Widget commercialView(int index, CustomerOnBoardingState state) {
    List listKeys = state.dataMain!["Commerical"][index].keys.toList() ?? [];
    if (index == 0) {
      return Column(
        children: [
          SizedBox(
            width: (listKeys.length) == 2
                ? ((state.dataMain!["Commerical"][0].length! - 1) * 200.0)
                : ((state.dataMain!["Commerical"][0].length!) * 140.0),
            height: 70,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(
                listKeys.length,
                (i) => Center(
                    child: headerTile(
                        width: 140,
                        title: state.dataMain!["Commerical"][index]
                                [(listKeys[i])] ??
                            "N/A")),
              ),
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey.shade300,
          ),
        ],
      );
    } else {
      Color listBgClr = textFieldColor;

      if ((index & 1) == 0) {
        // even
        listBgClr = textFieldColor;
      } else {
        // odd
        listBgClr = Colors.white;
      }
      return commercialList(index: index, listBgClr: listBgClr, state: state);
    }
  }

  Widget commercialList(
      {required int index,
      required Color listBgClr,
      required CustomerOnBoardingState state}) {
    List listKeys = state.dataMain!["Commerical"][index].keys.toList() ?? [];
    return BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      builder: (context, state) {
        return Container(
          color: listBgClr,
          child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                  width: ((state.dataMain!["Commerical"][0].length!) * 140.0),
                  height: 50,
                  child: Row(
                    children: List.generate(
                      listKeys.length,
                      //      (i) =>  Center(child: recordTile(width: 140, value: state.dataMain!["Commerical"][index][(listKeys[i])] != null ? listKeys[i] == "STATUS" ? state.dataMain!["Commerical"][index][(listKeys[i])] == "ACT" ? "Active" : "In Progress" : state.dataMain!["Commerical"][index][(listKeys[i])]  : "N/A")),

                      (i) => Center(
                          child: recordTile(
                              width: 140,
                              value: state.dataMain!["Commerical"][index]
                                      [(listKeys[i])] ??
                                  "N/A")),
                    ),
                  ))),
        );
      },
    );
  }

//pending invoice widget
  Widget remarksWidget({required CustomerOnBoardingState state}) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            remarksTableView(),
            Text(
              remarkStr,
              style: GoogleFonts.lato(
                  color: themeColor, fontSize: 15, fontWeight: FontWeight.w500),
            ),
            // -- remarks text field
            Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: TextFormField(
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.newline,
                  maxLines: 5,
                  controller: _remarkController,
                  inputFormatters: [
                    NoLeadingSpaceFormatter(),
                  ],
                  decoration: InputDecoration(
                      hintText: '',
                      fillColor: textFieldColor,
                      filled: true,
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: buildOutlineInputBorder(),
                      disabledBorder: buildOutlineInputBorder(),
                      enabledBorder: buildOutlineInputBorder(),
                      errorBorder: buildOutlineInputBorder(),
                      focusedErrorBorder: buildOutlineInputBorder(),
                      border: buildOutlineInputBorder()),
                )),
            // -- remark buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                    onTap: () async {
                      validationCall(state: state);
                    },
                    child: const RemarkButton(
                        btnClr: themeColor, btnText: "Submit")),
                InkWell(
                    onTap: () async {
                      if (_remarkController.text.isEmpty) {
                        showAlertMessage(message: "Enter remarks");
                      } else {
                        Map<String, dynamic> map = {
                          "Action": "REJ",
                          "ActionStage": "",
                          "SR_REQ_ID": "",
                          "TASK_UID": AppVariables.taskUID,
                          "SERVICE_ORDER_NO": AppVariables.serviceOrderNO,
                          "REMARKS": _remarkController.text
                        };
                        if (AppVariables.currentStage == "CSD") {
                          map["cSDModels"] = cSDModelsList.length == 0
                              ? [
                                  {
                                    "CUST_REQ_SERV_ID": "",
                                    "FILENAME": "",
                                    "ProofType": "",
                                    "CSD_VALIDATED": "",
                                    "IS_DEVIATION": "",
                                    "Remarks": ""
                                  }
                                ]
                              : cSDModelsList;
                          map["CSDValidate"] = "Y";
                        }

                        context
                            .read<CustomerOnBoardingBloc>()
                            .doActionOnBaording(map: map);
                      }
                    },
                    child: const RemarkButton(
                        btnClr: Colors.red, btnText: "Reject")),
                InkWell(
                    onTap: () async {
                      if (_remarkController.text.isEmpty) {
                        showAlertMessage(message: "Enter remarks");
                      } else {
                        var value = await DialogUtils.customPicker(
                            context,
                            state.customerOnBoardingModel!.data!.moveToList!
                                .map((e) => e.key.toString())
                                .toList());

                        if (value != "") {
                          for (int i = 0;
                              i <
                                  state.customerOnBoardingModel!.data!
                                      .moveToList!.length;
                              i++) {
                            if (value ==
                                state.customerOnBoardingModel!.data!
                                    .moveToList![i].key) {
                              state.customerOnBoardingModel!.data!
                                  .moveToList![i].value
                                  .toString();
                              Map<String, dynamic> map = {
                                "Action": "BAK",
                                "SR_REQ_ID": "",
                                "ActionStage": state.customerOnBoardingModel!
                                    .data!.moveToList![i].value
                                    .toString(),
                                "TASK_UID": AppVariables.taskUID,
                                "SERVICE_ORDER_NO": AppVariables.serviceOrderNO,
                                "REMARKS": _remarkController.text
                              };

                              if (AppVariables.currentStage == "CSD") {
                                map["cSDModels"] = cSDModelsList.length == 0
                                    ? [
                                        {
                                          "CUST_REQ_SERV_ID": "",
                                          "FILENAME": "",
                                          "ProofType": "",
                                          "CSD_VALIDATED": "",
                                          "IS_DEVIATION": "",
                                          "Remarks": ""
                                        }
                                      ]
                                    : cSDModelsList;
                                map["CSDValidate"] = "Y";
                              }
                              context
                                  .read<CustomerOnBoardingBloc>()
                                  .doActionOnBaording(map: map);
                            }
                            print(value);
                          }
                        }
                        // showMaterialScrollPicker<String>(
                        //   // maxLongSide: 100,
                        //   // maxShortSide: 100,
                        //   // confirmText: "Confirm",
                        //   context: context,
                        //   showDivider: false,
                        //   buttonTextColor: themeColor,
                        //   headerColor: themeColor,
                        //   title: 'Move to',
                        //   transformer: (item) {
                        //     print(item);
                        //   },
                        //   items: state
                        //       .customerOnBoardingModel!.data!.moveToList!
                        //       .map((e) => e.key.toString())
                        //       .toList(),
                        //   selectedItem: state.customerOnBoardingModel!.data!
                        //           .moveToList![0].key ??
                        //       "",
                        //   onChanged: (value) {
                        //     for (int i = 0;
                        //         i <
                        //             state.customerOnBoardingModel!.data!
                        //                 .moveToList!.length;
                        //         i++) {
                        //       if (value ==
                        //           state.customerOnBoardingModel!.data!
                        //               .moveToList![i].key) {
                        //         state.customerOnBoardingModel!.data!
                        //             .moveToList![i].value
                        //             .toString();
                        //         Map<String, dynamic> map = {
                        //           "Action": "BAK",
                        //           "SR_REQ_ID": "",
                        //           "ActionStage": state.customerOnBoardingModel!
                        //               .data!.moveToList![i].value
                        //               .toString(),
                        //           "TASK_UID": AppVariables.taskUID,
                        //           "SERVICE_ORDER_NO":
                        //               AppVariables.serviceOrderNO,
                        //           "REMARKS": _remarkController.text
                        //         };

                        //         if (AppVariables.currentStage == "CSD") {
                        //           map["cSDModels"] = cSDModelsList.length == 0
                        //               ? [
                        //                   {
                        //                     "CUST_REQ_SERV_ID": "",
                        //                     "FILENAME": "",
                        //                     "ProofType": "",
                        //                     "CSD_VALIDATED": "",
                        //                     "IS_DEVIATION": "",
                        //                     "Remarks": ""
                        //                   }
                        //                 ]
                        //               : cSDModelsList;
                        //           map["CSDValidate"] = "Y";
                        //         }
                        //         context
                        //             .read<CustomerOnBoardingBloc>()
                        //             .doActionOnBaording(map: map);
                        //       }
                        //       print(value);
                        //     }
                        //   },
                        // );
                      }
                    },
                    child: const RemarkButton(
                        btnClr: themeColor, btnText: "Back route")),
              ],
            )
          ],
        ),
      ),
    );
  }

  void validationCall({required CustomerOnBoardingState state}) {
    if (_remarkController.text.isEmpty) {
      showAlertMessage(message: "Enter remarks");
    } else {
      if (AppVariables.currentStage == "CSD") {
        if (cSDModelsList.length != activeCount) {
          showAlertMessage(message: "Please validate uploaded file");
        } else {
          callapi(state: state, isAdvNewDays: false);
        }
      } else {
        callapi(state: state, isAdvNewDays: false);
      }
    }
  }

  callapi(
      {required CustomerOnBoardingState state, required bool isAdvNewDays}) {
    Map<String, dynamic> map = {
      "Action": "APP",
      "ActionStage": "",
      "SR_REQ_ID": "",
      "TASK_UID": AppVariables.taskUID,
      "SERVICE_ORDER_NO": AppVariables.serviceOrderNO,
      "REMARKS": _remarkController.text,
    };

    if (AppVariables.currentStage == "CSD") {
      map["cSDModels"] = cSDModelsList;
      map["CSDValidate"] = "Y";
    }

    context.read<CustomerOnBoardingBloc>().doActionOnBaording(map: map);
  }

  showAlertMessage({required String message, VoidCallback? voidCallback}) =>
      Navigator.of(context).push(PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) => PopUpView(
                popUpTitle: message,
                voidCallback: () {
                  Navigator.pop(context);
                  if (voidCallback != null) {
                    voidCallback();
                  }
                },
              )));
}
