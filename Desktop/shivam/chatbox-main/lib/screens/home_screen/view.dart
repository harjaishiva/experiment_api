import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(leading:const Icon(Icons.search_outlined,color:Colors.white),centerTitle: true,title:const Text("Home",style:TextStyle(color:Colors.white,fontSize:26,fontWeight:FontWeight.w600)),backgroundColor: Colors.black,),
      bottomNavigationBar: BottomNavigationBar(
        items:const[
          BottomNavigationBarItem(icon: Icon(Icons.message_outlined),label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
        ],
      ),
    );
  }
}