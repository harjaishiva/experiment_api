import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuron/utils/app_variables/app_variables.dart';
import 'package:neuron/utils/common_widgets/constant_widgets/detail_column_widget.dart';
import 'package:neuron/utils/common_widgets/scroll_picker_custom.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../../../screens/inbox_screen/inbox_screen.dart';
import '../../../../screens/pop_up/view/pop_up_view.dart';
import '../../../../utils/colors_used/colors_used.dart';
import '../../../../utils/common_widgets/appbar_with_back_button_only.dart';
import '../../../../utils/common_widgets/constant_widgets/my_bullet_widget.dart';
import '../../../../utils/common_widgets/constant_widgets/no_record_found_widget.dart';
import '../../../../utils/common_widgets/constant_widgets/recordTile_hearderTile_widgets.dart';
import '../../../../utils/common_widgets/constant_widgets/remark_button_widget.dart';
import '../../../../utils/common_widgets/text_field_outline_border.dart';
import '../../../../utils/functions/no_leading_space_formatter.dart';
import '../../../../utils/text_constants/text_constants.dart';
import '../../../utils/common_widgets/constant_widgets/detail_row_widget.dart';
import '../../../utils/functions/url_launcher_function.dart';
import '../customer_on_boarding_details_screen_bloc/customer_on_boarding_details_screen_bloc.dart';

part 'customer_on_boarding_details_screen_list.dart';

class CustomerOnBoardingScreen extends StatefulWidget {
  const CustomerOnBoardingScreen({Key? key}) : super(key: key);

  @override
  _CustomerOnBoardingScreenState createState() =>
      _CustomerOnBoardingScreenState();
}

class _CustomerOnBoardingScreenState extends State<CustomerOnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CustomerOnBoardingBloc>().callGetOnBoardingData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerOnBoardingBloc, CustomerOnBoardingState>(
      listener: (context, state) {
        if (state.submissionFormStatus == CustomerOnBoardingStatus.failure) {
          Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => PopUpView(
                    popUpTitle: state.errorMessage ?? "",
                    voidCallback: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  )));
        } else if (state.submissionFormStatus ==
            CustomerOnBoardingStatus.backRouteSuccess) {
          Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => PopUpView(
                    popUpTitle: state.backRouteMessage,
                    voidCallback: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (_) {
                        return BlocProvider(
                          create: (context) => InboxScreenBloc(context),
                          child: const InboxScreen(),
                        );
                      }), (route) => false);
                    },
                  )));
        } else if (state.submissionFormStatus ==
            CustomerOnBoardingStatus.backRouteError) {
          Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => PopUpView(
                    popUpTitle: state.errorMessage ?? "",
                    voidCallback: () {
                      Navigator.pop(context);
                    },
                  )));
        }
      },
      child: Scaffold(
        appBar: backButtonAppBar(context, customerOnBoardingViewTitle,
            isBackBtnReq: true),
        body: Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 20),
          child: BlocBuilder<CustomerOnBoardingBloc, CustomerOnBoardingState>(
              builder: (context, state) {
            return (state.submissionFormStatus ==
                        CustomerOnBoardingStatus.success ||
                    state.submissionFormStatus ==
                        CustomerOnBoardingStatus.backRouteError ||
                    state.submissionFormStatus ==
                        CustomerOnBoardingStatus.initial)
                ? CustomerOnBoardingScreenList()
                : const SizedBox();
          }),
        ),
      ),
    );
  }
}
