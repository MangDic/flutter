import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:i_have_indecisiveness/Functions/Sleep.dart';
import 'package:i_have_indecisiveness/UI/FontList.dart';
import 'package:i_have_indecisiveness/UI/MainColor.dart';
import 'package:i_have_indecisiveness/UI/btnStyle.dart';
import 'package:i_have_indecisiveness/UI/textStyles.dart';

class FindFoodScreen extends StatefulWidget {
  @override
  _FindFoodScreen createState() => _FindFoodScreen();
}

class _FindFoodScreen extends State<FindFoodScreen> {
  final TextEditingController _addItemController = TextEditingController();
  final _items = <String>[];

  @override
  void dispose() {
    // 종료시 컨트롤러 해
    _addItemController.dispose();
    super.dispose();
  }

  void _addFood(String foodName) {
    setState(() {
      _items.add(foodName);
      _addItemController.text = "";
    });
  }

  void _deleteFood(String foodName) {
    setState(() {
      _items.remove(foodName);
    });
  }

  void _didTabSelectBtn() {
    int randomValue = Random().nextInt(_items.length);
    String selectedFood = _items[randomValue];

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "$selectedFood 추천해!",
                style: textStyles.titleTextStyle,
              ),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    waitSecond();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "고마워!",
                    style: textStyles.buttonTextStyle,
                  ),
                  style: btnStyle.buttonStyle,
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "뭐 먹지?",
          style: textStyles.titleTextStyle,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: MainColor.mainColor,
        ),
      ),
      backgroundColor: MainColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            _textFieldAndAddBtn(),
            SizedBox(
              height: 30,
            ),
            _foodList(),
            _selectBtn(size),
          ],
        ),
      ),
    );
  }

  Widget _foodList() {
    return Expanded(
      child: ListView(
        children: _items.map((String) => _buildItemWidget(String)).toList(),
      ),
    );
  }

  Widget _textFieldAndAddBtn() {
    return Row(
      children: <Widget>[
        Expanded(
            child: TextField(
          controller: _addItemController,
          cursorColor: MainColor.mainColor,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MainColor.mainColor),

                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MainColor.mainColor),
                ),
              ),
        )),
        SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () => _addFood(_addItemController.text),
          child: Text(
            "추가",
            style: textStyles.buttonTextStyle,
          ),
          style: btnStyle.buttonStyle,
        ),
      ],
    );
  }

  Widget _selectBtn(Size size) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Container(
        width: size.width * 0.7,
        child: ElevatedButton(
          onPressed: () => _didTabSelectBtn(),
          child: Text(
            "골라줘!",
            style: textStyles.buttonTextStyle,
          ),
          style: btnStyle.buttonStyle,
        ),
      ),
    );
  }

  Widget _buildItemWidget(String foodName) {
    return Card(
      elevation: 6,
      child: ListTile(
        onTap: () {},
        trailing: IconButton(
          icon: Icon(Icons.delete),
          iconSize: 30,
          onPressed: () => _deleteFood(foodName),
        ),
        title: Text(
          foodName,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
