import 'package:flutter/material.dart';
import 'package:i_have_indecisiveness/Screens/LottoScreen.dart';
import 'package:i_have_indecisiveness/Screens/FindFoodScreen.dart';
import 'package:i_have_indecisiveness/UI/FontList.dart';
import 'package:i_have_indecisiveness/UI/MainColor.dart';
import 'package:i_have_indecisiveness/UI/textStyles.dart';
class MainPage extends StatelessWidget {

  final double btnFontSize = 17;

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: MainColor.mainColor,
      appBar: AppBar(
        title: Text(
          "결정장애가 정말 싫어!",
          style: textStyles.titleTextStyle,
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          elevation: 6,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: size.height*0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _doOrNotBtn(size, context),
                  _findFoodBtn(size, context),
                  _lottoBtn(size, context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _doOrNotBtn(Size size, BuildContext context) {
    return Container(
      width: size.width*0.7,
      height: size.height*0.04,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(MainColor.mainColor),
        ),
        onPressed: () {

        },
        child: Text(
            "할까? 말까?",
          style: TextStyle(
            fontSize: fontSizeList.btnFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _lottoBtn(Size size, BuildContext context) {
    return Container(
      width: size.width*0.7,
      height: size.height*0.04,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(MainColor.mainColor),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LottoScreen()),
          );
        },
        child: Text(
          "행운의 로또!",
          style: TextStyle(
            fontSize: fontSizeList.btnFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _findFoodBtn(Size size, BuildContext context) {
    return Container(
      width: size.width*0.7,
      height: size.height*0.04,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(MainColor.mainColor),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FindFoodScreen()),
          );
        },
        child: Text(
            "뭐 먹지?",
          style: TextStyle(
            fontSize: fontSizeList.btnFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
