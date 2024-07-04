part of 'customer_on_boarding_details_screen_bloc.dart';

enum CustomerOnBoardingStatus { initial, success, failure,backRouteSuccess,backRouteError }

class CustomerOnBoardingState {
  const CustomerOnBoardingState(
      {this.submissionFormStatus = CustomerOnBoardingStatus.initial, this.errorMessage,this.backRouteMessage,this.dataMain, this.customerOnBoardingModel});

  final CustomerOnBoardingStatus submissionFormStatus;
  final CustomerOnBoardingModel? customerOnBoardingModel;

  final String? errorMessage;
  final String? backRouteMessage;
  final Map<String,dynamic>? dataMain;
  CustomerOnBoardingState copyWith({
    CustomerOnBoardingStatus? submissionFormStatus,
     CustomerOnBoardingModel? customerOnBoardingModel,

    String? errorMessage,
    String? backRouteMessage,
   Map<String,dynamic>? dataMain

  }) {
    return CustomerOnBoardingState(
      customerOnBoardingModel : customerOnBoardingModel ?? this.customerOnBoardingModel,
        submissionFormStatus: submissionFormStatus ?? this.submissionFormStatus,
        errorMessage: errorMessage ?? this.errorMessage,
      backRouteMessage:backRouteMessage??this.backRouteMessage,
      dataMain : dataMain ?? this.dataMain
    );

  }
}
