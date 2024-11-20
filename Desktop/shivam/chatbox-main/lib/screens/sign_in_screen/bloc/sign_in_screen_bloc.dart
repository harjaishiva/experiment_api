import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_screen_event.dart';
part 'sign_in_screen_state.dart';

class SignInScreenBloc extends Bloc<SignInScreenEvent, SignInScreenState> {
  SignInScreenBloc() : super(SignInScreenInitial()) {
    on<SignInScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
