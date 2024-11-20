import 'package:car_rental_app/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:car_rental_app/screens/home_screen/view.dart';
import 'package:car_rental_app/screens/sign_up_screen/bloc/sign_up_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  bool isName = false;

  bool isEmail = false;

  bool isPassword = false;

  bool isCPassword = false;

  bool altColor = false;

  final GlobalKey<FormState> _nameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _cpasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpScreenBloc, SignUpScreenState>(
      listener: (context, state) {
        if (isName && isEmail && isPassword && isCPassword) {
          setState(() {
            altColor = true;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back, size: 25))),
        body: SingleChildScrollView(
          //physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 13,
                        width: 58,
                        color: const Color.fromARGB(255, 88, 195, 182),
                      ),
                    ),
                    const Text(
                      'Sign Up with Email',
                      style: TextStyle(
                        fontSize: 26, // Large font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  alignment: Alignment.center,
                  child: const Text(
                    "Get chatting with friends and family today by signing up for our chat app!",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                    color: Colors.grey, height: 2, width: double.infinity),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 88, 195, 182),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text("Your Name :",
                          style: TextStyle(color: Colors.black, fontSize: 22))),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  key: _nameFormKey,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: borderStyle(),
                      errorBorder: borderStyle(),
                      enabledBorder: borderStyle(),
                      focusedBorder: borderStyle(),
                      disabledBorder: borderStyle(),
                      focusedErrorBorder: borderStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Name field cannot be null";
                      } else {
                        setState(() {
                          isName = true;
                        });
                      }
                      return null;
                    },
                    onChanged: (value){
                      _nameFormKey.currentState?.validate();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 88, 195, 182),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text("Your Email :",
                          style: TextStyle(color: Colors.black, fontSize: 22))),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  key: _emailFormKey,
                  child: TextFormField(
                    controller: emailController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: borderStyle(),
                      errorBorder: borderStyle(),
                      enabledBorder: borderStyle(),
                      focusedBorder: borderStyle(),
                      disabledBorder: borderStyle(),
                      focusedErrorBorder: borderStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Email address cannot be null";
                      }
                      final emailTest = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                      if (!emailTest.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      } else {
                        setState(() {
                          isEmail = true;
                        });
                      }
                      return null;
                    },
                    onChanged: (value){
                      _emailFormKey.currentState?.validate();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 88, 195, 182),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text("Password :",
                          style: TextStyle(color: Colors.black, fontSize: 22))),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  key: _passwordFormKey,
                  child: TextFormField(
                    controller: passwordController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: borderStyle(),
                      errorBorder: borderStyle(),
                      enabledBorder: borderStyle(),
                      focusedBorder: borderStyle(),
                      disabledBorder: borderStyle(),
                      focusedErrorBorder: borderStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Password cannot be null";
                      } else {
                        setState(() {
                          isPassword = true;
                        });
                      }
                      return null;
                    },
                    onChanged: (value){
                      _passwordFormKey.currentState?.validate();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 88, 195, 182),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text("Confirm Password :",
                          style: TextStyle(color: Colors.black, fontSize: 22))),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  key: _cpasswordFormKey,
                  child: TextFormField(
                    controller: confirmPasswordController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: borderStyle(),
                      errorBorder: borderStyle(),
                      enabledBorder: borderStyle(),
                      focusedBorder: borderStyle(),
                      disabledBorder: borderStyle(),
                      focusedErrorBorder: borderStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Password cannot be null";
                      } else if(value != passwordController.text){
                        return "Password does not match";
                      }else {
                        setState(() {
                          isCPassword = true;
                        });
                      }
                      return null;
                    },
                    onChanged: (value){
                      _cpasswordFormKey.currentState?.validate();
                    },
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height - 800),
              InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>BlocProvider(create:(context)=>HomeScreenBloc(),child:HomeScreen())));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: (((_nameFormKey.currentState?.validate() ?? false) == true) &&
                                    ((_emailFormKey.currentState?.validate() ?? false) ==
                                        true) &&
                                    ((_passwordFormKey.currentState?.validate() ?? false) ==
                                        true) &&
                                    ((_cpasswordFormKey.currentState?.validate() ??
                                            false) ==
                                        true))
                                ? const Color.fromARGB(255, 36, 120, 109)
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text("Create an account",
                            style: TextStyle(
                                color: (((_nameFormKey.currentState?.validate() ?? false) == true) &&
                                        ((_emailFormKey.currentState?.validate() ??
                                                false) ==
                                            true) &&
                                        ((_passwordFormKey.currentState?.validate() ?? false) == true) &&
                                        ((_cpasswordFormKey.currentState?.validate() ?? false) == true))
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500))),
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 2, color: Colors.grey),
    );
  }
}
