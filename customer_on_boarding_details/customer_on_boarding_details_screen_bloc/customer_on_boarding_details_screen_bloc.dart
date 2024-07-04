import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neuron/network_class_response/network_class_and_response.dart';
import 'package:neuron/screens/advance_credit_obd_details/advance_credit_obd_details_screen_model/advance_credit_data_model.dart';
import 'package:neuron/screens/customer_on_boarding_details/customer_on_boarding_details_screen_model/customer_on_boarding_data_model.dart';

import '../../../../utils/shared_preferences_class/shared_preferences_class.dart';
import '../../../utils/app_variables/app_variables.dart';

part 'customer_on_boarding_details_screen_event.dart';

part 'customer_on_boarding_details_screen_state.dart';

class CustomerOnBoardingBloc
    extends Bloc<CustomerOnBoardingEvent, CustomerOnBoardingState>
    implements NetworkResponse {
  CustomerOnBoardingBloc(
      {required BuildContext context, required String customerId})
      : _context = context,
        _customerId = customerId,
        super(const CustomerOnBoardingState());
  final BuildContext _context;
  final String _customerId;
  CustomerOnBoardingModel? _customerOnBoardingModel;
  Map<String, dynamic>? _dataMain;
  void callGetOnBoardingData() async {
    SharedPreferencesClass.initializeSharedPref();
    //ignore:await_only_futures
    String myToken = await SharedPreferencesClass.prefs.getString(tokenKey)!;
    Map map = {
      "TASK_UID": AppVariables.taskUID,
      "SERVICE_ORDER_NO": AppVariables.serviceOrderNO
    };
    print(map);

    NetworkClass.fromNetworkClass(
            postGetOBApproveData, this, reqGetOBApproveData, map)
        .callPostServiceToken(_context, myToken, true);
  }

  void doActionOnBaording({required Map<String, dynamic> map}) async {
    SharedPreferencesClass.initializeSharedPref();
    //ignore:await_only_futures
    String myToken = await SharedPreferencesClass.prefs.getString(tokenKey)!;

    log("map values----->${map.toString()}");
    NetworkClass.fromNetworkClass(
            AppVariables.currentStage == "CSD"
                ? postDoActionOnBaordingCSDSatge
                : postDoActionOnBaording,
            this,
            AppVariables.currentStage == "CSD"
                ? reqDoActionOnBaordingCSDSatge
                : reqDoActionOnBaording,
            map)
        .callPostServiceToken(_context, myToken, true);
  }

  void updateCode() {
    emit(state.copyWith(
        dataMain: _dataMain,
        submissionFormStatus: CustomerOnBoardingStatus.initial,
        errorMessage: ""));
  }

  int checkRechargeEntryLength() {
    return 0;
    //return _advCreditPaymentEntryModel.data!.paymentEntryAccountList!.length;
  }

  @override
  void onHTTPError({required int requestCode, required String response}) {
    try {
      throw const ResponseError();
    } on ResponseError catch (e) {
      emit(state.copyWith(
          submissionFormStatus: CustomerOnBoardingStatus.failure,
          errorMessage: e.message));
    }
  }

  @override
  void onHTTPResponse({required int requestCode, required String response}) {
    try {
      switch (requestCode) {
        case reqGetOBApproveData:
          _dataMain = jsonDecode(response)["Data"];
          _customerOnBoardingModel =
              CustomerOnBoardingModel.fromJson(jsonDecode(response));

          switch (_customerOnBoardingModel?.status) {
            case "S":
              emit(state.copyWith(
                  submissionFormStatus: CustomerOnBoardingStatus.success,
                  customerOnBoardingModel: _customerOnBoardingModel,
                  dataMain: _dataMain));
              break;
            default:
              throw ResponseError.fromStatus(
                  _customerOnBoardingModel?.status ?? "E",
                  _customerOnBoardingModel?.message ?? "");
          }
          break;

        // case reqGetAdvCreditPaymentEntryScreen:
        // print(response);
        //           _advCreditPaymentEntryModel = AdvCreditPaymentEntryModel.fromJson(jsonDecode(response));

        //   switch (_advCreditPaymentEntryModel.status) {
        //     case "S":
        //       emit(state.copyWith(
        //           submissionFormStatus: SubmissionFormStatus.success,
        //           advCreditPaymentEntryModel: _advCreditPaymentEntryModel));
        //       break;
        //     case "E":
        //       emit(state.copyWith(
        //           submissionFormStatus: SubmissionFormStatus.failure,
        //           errorMessage: _advCreditPaymentEntryModel.message));
        //       break;
        //     default:
        //       throw ResponseError.fromStatus(_advCreditPaymentEntryModel.status ?? "", _advCreditPaymentEntryModel.message ?? "");
        //   }
        //   break;
        case reqDoActionOnBaording:
          var responseData = jsonDecode(response);
          switch (responseData["Status"]) {
            case "S":
              emit(state.copyWith(
                  submissionFormStatus:
                      CustomerOnBoardingStatus.backRouteSuccess,
                  backRouteMessage: responseData["Message"]));
              break;
            default:
              print("error in response-------->");
              emit(state.copyWith(
                  submissionFormStatus: CustomerOnBoardingStatus.backRouteError,
                  errorMessage: responseData["Message"]));
          }
        case reqDoActionOnBaordingCSDSatge:
          var responseData = jsonDecode(response);
          switch (responseData["Status"]) {
            case "S":
              emit(state.copyWith(
                  submissionFormStatus:
                      CustomerOnBoardingStatus.backRouteSuccess,
                  backRouteMessage: responseData["Message"]));
              break;
            default:
              print("error in response-------->");
              emit(state.copyWith(
                  submissionFormStatus: CustomerOnBoardingStatus.backRouteError,
                  errorMessage: responseData["Message"]));
          }
      }
    } on ResponseError catch (e) {
      emit(state.copyWith(
          submissionFormStatus: CustomerOnBoardingStatus.failure,
          errorMessage: e.message));
    }
  }

  @override
  void onNoInternetAndServerError({required String message}) {
    emit(state.copyWith(
        submissionFormStatus: CustomerOnBoardingStatus.failure,
        errorMessage: message));
  }
}
