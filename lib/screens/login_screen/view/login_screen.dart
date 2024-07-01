import 'package:experiment/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:experiment/screens/home_screen/view/home_screen.dart';
import 'package:experiment/screens/login_screen/bloc/login_screen_bloc.dart';
import 'package:experiment/screens/login_screen/login_error/popup_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool doesUserExist = false;

  PopupMenu pop = PopupMenu();

  bool isClicked = false;

  String _username = "";

  String _password = "";

  @override
  void initState() {
    super.initState();
    //context.read<LoginScreenBloc>().calldata();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenBloc, LoginScreenState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor:Colors.grey,
        body: Column(
          children: [
             SizedBox(
                height: (MediaQuery.of(context).size.height*0.257),
                width: double.infinity,
                child: Image(image: AssetImage('assets/images/welcome.jpeg'))),
            const SizedBox(height: 50),
            const Text("Login",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                style:TextStyle(backgroundColor: Colors.white),
                decoration: InputDecoration(
                    icon: const Icon(Icons.person,color:Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Enter Username",
                    labelText: "USERNAME"),
                onChanged: (value) {
                  _username = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                style:TextStyle(backgroundColor: Colors.white),
                obscureText: isClicked ? false : true,
                decoration: InputDecoration(
                hoverColor: Colors.blue,
                    icon: const Icon(Icons.key,color:Colors.black),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isClicked = !isClicked;
                          });
                        },
                        child: Icon(isClicked
                            ? Icons.visibility_off
                            : Icons.visibility,color:Colors.black)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    hintText: "Enter Password",
                    labelText: "PASSWORD"),
                onChanged: (value) {
                  _password = value;
                },
              ),
            ),
            BlocBuilder<LoginScreenBloc, LoginScreenState>(
              builder: (context, state) {
                return GestureDetector(
                    onTap: () {
                      doesUserExist = context
                          .read<LoginScreenBloc>()
                          .onUserExist(_username,_password);

                      if (doesUserExist == true) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return BlocProvider(
                            create: (context) => HomeScreenBloc(),
                            child: const HomeScreen(),
                          );
                        }));
                      } else {
                        pop.popupMenu(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 205, 158, 141),
                              borderRadius: BorderRadius.circular(10)),
                          height: 50,
                          width: double.infinity,
                          child: const Text("Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold))),
                    ));
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
