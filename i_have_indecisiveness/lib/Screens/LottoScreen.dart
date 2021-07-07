import 'package:flutter/material.dart';
import 'package:i_have_indecisiveness/UI/MainColor.dart';

class LottoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: MainColor.mainColor,
        ),
      ),


    );
  }

}