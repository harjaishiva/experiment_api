import 'package:car_rental_app/screens/on_oarding_screen/view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>const OnBoardingScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Image.asset("assets/images/spalsh_screen_logo.jpg"),),
    );
  }
}