import 'package:bloc/bloc.dart';
import 'package:experiment/screens/home_screen/modal/modal_class.dart';
import 'package:meta/meta.dart';

part 'item_screen_event.dart';
part 'item_screen_state.dart';

class ItemScreenBloc extends Bloc<ItemScreenEvent, ItemScreenState> {
  ItemScreenBloc({required UserData object}) : _obj = object,super(ItemScreenInitial()) {
    on<ItemScreenEvent>((event, emit) {});
  }

  
final UserData _obj;

 UserData getObj()
 {return _obj;}

 
}
