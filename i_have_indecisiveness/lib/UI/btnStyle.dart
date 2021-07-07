import 'package:flutter/material.dart';
import 'package:i_have_indecisiveness/UI/MainColor.dart';

class btnStyle {
  static ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor:
    MaterialStateProperty.all<Color>(MainColor.mainColor),
  );
}