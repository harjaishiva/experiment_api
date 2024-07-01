import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:experiment/screens/home_screen/modal/modal_class.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenEvent>((event, emit) {
    });
  }
   
  Future<List<UserData>?> getData() async{
    try{
      var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
      if(response.statusCode == 200){
        List<UserData> model = List<UserData>.from(jsonDecode(response.body).map((x)=>UserData.fromJson(x)));
        return model;
      }
    }catch(e){e.toString();}
    return null;
  }


}
