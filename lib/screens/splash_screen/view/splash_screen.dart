import 'package:experiment/screens/login_screen/bloc/login_screen_bloc.dart';
import 'package:experiment/screens/login_screen/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   Future<void> _move() async {
     await Duration(minutes: 1);
    await Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BlocProvider(create:(_)=> LoginScreenBloc(),child: LoginScreen(),)));
   }

   @override
  void initState() {
    _move();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height:(MediaQuery.of(context).size.height*0.5)-275),
            
               const SizedBox(height:350,width:double.infinity,child:  Image(image:  AssetImage('assets/images/loading1.png'))),

               const Text("Loading...",style:  TextStyle(color:Colors.green,fontSize:35,fontWeight: FontWeight.bold),)
               
            ],
          ));
  }
}
