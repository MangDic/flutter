import 'package:flutter/material.dart';
import 'package:todayschool/Screens/CalouselScreen.dart';
import 'package:todayschool/Screens/MainPage.dart';
class GuidedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CarouselScreen(),
          _authButton(size, context),
        ],
      ),
    );
  }


  Widget _authButton(Size size, BuildContext context) {
    return Positioned(
      left: size.width * 0.05,
      right: size.width * 0.05,
      bottom: 40,
      child: SizedBox(
        height: 50,
        child:
          RaisedButton(
              child: Text("시작하기",
                style: TextStyle(
                    fontSize: 20, color: Colors.white),),
              color: Colors.blue,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              }),

      ),
    );
  }
}

