import 'package:bloc/bloc.dart';

part 'sign_in_screen_event.dart';
part 'sign_in_screen_state.dart';

class SignInScreenBloc extends Bloc<SignInScreenEvent, SignInScreenState> {
  SignInScreenBloc() : super(SignInScreenInitial()) {
    on<SignInScreenEvent>((event, emit) {
    });
  }
}
