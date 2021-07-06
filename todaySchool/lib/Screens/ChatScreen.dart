import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Text(
                "Chat",
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),

    );
  }
}