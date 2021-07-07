import 'package:flutter/material.dart';
import 'package:i_have_indecisiveness/UI/FontList.dart';
import 'package:i_have_indecisiveness/UI/MainColor.dart';

class textStyles {
  static TextStyle buttonTextStyle = TextStyle(
      fontSize: fontSizeList.btnFontSize,
      fontWeight: FontWeight.bold,
  );

  static TextStyle titleTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: MainColor.mainColor,
  );
}