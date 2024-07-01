import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenInitial()) {
    on<LoginScreenEvent>((event, emit) {
    });
  }

   List<String> userName = ["sh1v@m","y@sh","p@r@s"];
   List<String> passWord = ["123456",'234567','345678'];

  bool onUserExist(String value1,String value2){
    
    for(int i=0;i<3;i++){
      if(value1 == userName[i] && value2 == passWord[i]){
        return true;
      }
    }
    return false;

  }


  

}
