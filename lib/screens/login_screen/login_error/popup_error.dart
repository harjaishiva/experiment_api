import 'package:flutter/material.dart';

class PopupMenu{
    void popupMenu(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(255,205,158,141),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                title: Text("Error!!!",style:TextStyle(color:Colors.red,fontWeight:FontWeight.bold)),
                content: SizedBox(
                  height: 84,
                  width: 80,
                  child: Column(children: [
                    Text("User does not exist.",style:TextStyle(fontSize:18)),
                    SizedBox(height: 10),
                    Container(child:
                      Padding(
                          padding: EdgeInsets.only(left: 70),
                          child: ElevatedButton(
                            
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child:  Text("Ok"))),
                     
                    )
                  ]),
                ),
              );
         
        });
  }
}