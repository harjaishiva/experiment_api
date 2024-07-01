import 'package:experiment/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:experiment/screens/home_screen/modal/modal_class.dart';
import 'package:experiment/screens/home_screen/view/home_screen.dart';
import 'package:experiment/screens/item_screen/bloc/item_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemScreen extends StatefulWidget {
  ItemScreen() : super();

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  late UserData? object;

  @override
  void initState() {
    object = context.read<ItemScreenBloc>().getObj();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemScreenBloc, ItemScreenState>(
        listener: (context, state) {},
        child: Scaffold(
          backgroundColor: Colors.grey,
            appBar: AppBar(
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return BlocProvider(
                          create: (context) => HomeScreenBloc(),
                          child: const HomeScreen(),
                        );
                      }));
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                backgroundColor: Colors.black,
                title: Text(object?.category ?? "",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold))),
            body: Column(children: [
              Container(
                  color: const Color.fromARGB(255, 205, 158, 141),
                  height: 200,
                  child: Center(
                      child: Image(image: NetworkImage(object?.image ?? "")))),

              const SizedBox(height: 15),
               Padding(
                 padding: const EdgeInsets.only(left:15,right:15),
                 child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 205, 158, 141)),
                      // height: 60,
                      // width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(object?.title ?? "",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )),
               ),
              

              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left:15,right:15),
                child: Container(
                  decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),color:const Color.fromARGB(255, 205, 158, 141)),
                    height: 140,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        
                        Padding(
                          padding: const EdgeInsets.only(top:10),
                          child: Container(
                              alignment: Alignment.center,
                              child: const Text("Description:\n",
                                  style:  TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:15,right:15,top:0),
                          child: Container(alignment:Alignment.center,child: Text(object?.description ?? "")),
                        )
                      ]),
                    )),
              ),

                  Padding(
                    padding: const EdgeInsets.only(top:18.0,left:25),
                    child: Row(
                      children:[
                        Container(alignment:Alignment.center,
                            height:35,width:70,
                            decoration:BoxDecoration(color:const Color.fromARGB(255, 205, 158, 141),borderRadius:BorderRadius.circular(14)),
                            child:const Text("Price",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          ),
                    
                          const SizedBox(width: 15),
                                  SizedBox(
                    
                    height: 20,
                    width:100,
                    child: Center(
                        child: Text("₹ "+'${object?.price ?? 00}',style:const TextStyle(fontSize:15,fontWeight:FontWeight.bold)))),
                      ]
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top:18.0,left:25),
                    child: Row(
                      children:[
                        Container(alignment:Alignment.center,
                            height:35,width:70,
                            decoration:BoxDecoration(color:const Color.fromARGB(255, 205, 158, 141),borderRadius:BorderRadius.circular(14)),
                            child:const Text("Rate",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          ),
                    
                         const SizedBox(width: 15),
                                  SizedBox(
                    
                    height: 20,
                    width:100,
                    child: Center(
                        child: Text("⭐"+'${object?.rating!.rate ?? 00}',style:const TextStyle(fontSize:15,fontWeight:FontWeight.bold)))),
                      ]
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top:18.0,left:25),
                    child: Row(
                      children:[
                        Container(alignment:Alignment.center,
                            height:35,width:70,
                            decoration:BoxDecoration(color:const Color.fromARGB(255, 205, 158, 141),borderRadius:BorderRadius.circular(14)),
                            child:const Text("InStock",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          ),
                    
                          const SizedBox(width: 15),
                                  SizedBox(
                    
                    height: 20,
                    width:100,
                    child: Center(
                        child: Text('${object?.rating!.count ?? 00}',style:const TextStyle(fontSize:15,fontWeight:FontWeight.bold)))),
                      ]
                    ),
                  ),

                      
            ])));
  }
}
