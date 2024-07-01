import 'package:experiment/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:experiment/screens/home_screen/modal/modal_class.dart';
import 'package:experiment/screens/item_screen/bloc/item_screen_bloc.dart';
import 'package:experiment/screens/item_screen/view/item_screen.dart';
import 'package:experiment/screens/login_screen/bloc/login_screen_bloc.dart';
import 'package:experiment/screens/login_screen/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isReady = false;
  List<UserData> obj = [];


  List<UserData> getdata() {
    isReady = true;
    context.read<HomeScreenBloc>().getData().then((value) {
      setState(() {
        obj = value!;
        isReady = true;
      });
    });
    return obj;
  }

  @override
  void initState() {
getdata();    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return BlocProvider(
                      create: (context) =>
                          LoginScreenBloc(),
                      child: LoginScreen(),
                    );
                  }));
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            backgroundColor: Colors.black,
            title: const Text("HomePage",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))),
        body: isReady == false
            ? const Center(child: LinearProgressIndicator())
            : ListView.builder(
                itemCount: obj.length,
                itemBuilder: (context, index1) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                    child: Card(
                        color: const Color.fromARGB(255, 205, 158, 141),
                        child: ListTile(
                          onTap: () {
                            
                              
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (conext) => BlocProvider(
                                    create: (_) => ItemScreenBloc(object:obj[index1]),
                                    child: ItemScreen())));
                          },
                          leading: SizedBox(
                              height: 50,
                              width: 40,
                              child: Image(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(obj[index1].image!))),
                          title: Text(obj[index1].title.toString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 21, 25, 134))),
                          subtitle: Text("₹" + obj[index1].price.toString(),
                              style:
                                 const  TextStyle(color: Colors.black, fontSize: 15)),
                        )),
                  );
                },
              ));
  }
}
