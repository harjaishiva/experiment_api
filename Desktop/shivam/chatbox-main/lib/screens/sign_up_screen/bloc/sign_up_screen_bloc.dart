import 'package:bloc/bloc.dart';

part 'sign_up_screen_event.dart';
part 'sign_up_screen_state.dart';

class SignUpScreenBloc extends Bloc<SignUpScreenEvent, SignUpScreenState> {
  SignUpScreenBloc() : super(SignUpScreenInitial()) {
    on<SignUpScreenEvent>((event, emit) {
    });
  }
}
