import 'package:car_rental_app/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:car_rental_app/screens/home_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmail = false;
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back, size: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 13,
                      width: 68,
                      color: const Color.fromARGB(255, 88, 195, 182),
                    ),
                  ),
                  const Text(
                    'Log In to Chatbox',
                    style: TextStyle(
                      fontSize: 26,
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
                "Welcome back! Sign in using your email to continue us",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                color: Colors.grey,
                height: 2,
                width: double.infinity,
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
                      style: TextStyle(color: Colors.black, fontSize: 22)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Form(
                key: _emailFormKey, // Add FormKey to manage validation state
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: emailController,
                  decoration: InputDecoration(
                    border: borderStyle(),
                    errorBorder: borderStyle(),
                    enabledBorder: borderStyle(),
                    focusedBorder: borderStyle(),
                    disabledBorder: borderStyle(),
                    focusedErrorBorder: borderStyle(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email address cannot be null";
                    }
                    final emailTest = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                    if (!emailTest.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    } else {
                      setState(() {
                        isEmail = true; // Mark email as valid
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
                  child: const Text("Your Password :",
                      style: TextStyle(color: Colors.black, fontSize: 22)),
                ),
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
                    if (value == null || value.isEmpty) {
                      return "Password cannot be null";
                    } else {
                      setState(() {
                        isPassword = true; // Mark password as valid
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
            SizedBox(height: MediaQuery.of(context).size.height - 650),
            InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>BlocProvider(create:(context)=>HomeScreenBloc(),child:const HomeScreen())));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color:
                          (((_emailFormKey.currentState?.validate() ?? false) ==
                                      true) &&
                                  ((_passwordFormKey.currentState?.validate() ??
                                          false) ==
                                      true))
                              ? const Color.fromARGB(255, 36, 120, 109)
                              : Colors.grey,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color:
                          (((_emailFormKey.currentState?.validate() ?? false) ==
                                      true) &&
                                  ((_passwordFormKey.currentState?.validate() ??
                                          false) ==
                                      true))
                              ? Colors.white
                              : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
                onTap: () {},
                child: const Text("Forgot password?",
                    style: TextStyle(
                        color: Color.fromARGB(255, 36, 120, 109),
                        fontSize: 20,
                        fontWeight: FontWeight.w600)))
          ],
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
