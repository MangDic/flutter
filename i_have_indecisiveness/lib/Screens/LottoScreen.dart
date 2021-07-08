import 'dart:math';

import 'package:flutter/material.dart';
import 'package:i_have_indecisiveness/Models/Lotto.dart';
import 'package:i_have_indecisiveness/UI/MainColor.dart';
import 'package:i_have_indecisiveness/UI/btnStyle.dart';
import 'package:i_have_indecisiveness/UI/textStyles.dart';

class LottoScreen extends StatefulWidget {
  @override
  _LottoScreen createState() => _LottoScreen();
}

class _LottoScreen extends State<LottoScreen> {
  var selectedNumbers = Set();
  List lotto = [0, 0, 0, 0, 0, 0];
  List lottos = [];

  bool _isProgress = false;

  void _createLotto() {
    setState(() {
      for (int i = 0; i < 6; i++) {
        lotto.add(_selectNumber());
      }
      selectedNumbers = Set();
      lotto.sort();
      print(lotto);
    });
  }

  int _selectNumber() {
    bool isFind = false;
    int selectedNumber = 0;
    while (!isFind) {
      int randomValue = Random().nextInt(45) + 1;
      if (!_checkValidation(randomValue)) {
        isFind = true;
        selectedNumber = randomValue;
      }
    }
    return selectedNumber;
  }

  void _clearLottoList() {
    lotto = [];
  }

  bool _checkValidation(int number) {
    if (!selectedNumbers.contains(number)) {
      selectedNumbers.add(number);
      return false;
    }
    return true;
  }

  Color _setBallColor(int number) {
    Color ballColor = Colors.white;
    if (number == 0) {
      ballColor = Colors.white;
    } else if (number < 11) {
      ballColor = Colors.amber;
    } else if (number < 21) {
      ballColor = Colors.blueAccent;
    } else if (number < 31) {
      ballColor = Colors.red;
    } else if (number < 41) {
      ballColor = Colors.black54;
    } else {
      ballColor = Colors.green;
    }
    return ballColor;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "행운의 로또!",
          style: textStyles.titleTextStyle,
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: MainColor.mainColor,
        ),
      ),
      backgroundColor: MainColor.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            _generateLottoImage(),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    _createLotto();
                  },
                  style: btnStyle.buttonStyle,
                  child: Text(
                    "뽑아줘!",
                    style: textStyles.buttonTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(child: _lottoList(size)),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _lottoList(Size size) {
    return Container(
      child: ListView.builder(
          itemCount: lottos.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Text("");
            }
            Lotto temp = lottos[index];
            return Container(
              height: size.height*0.08,
              width: size.width*0.8,
              child: Card(
                elevation: 6,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _lottoBall(temp.num1, false, 20),
                      _lottoBall(temp.num2, false, 20),
                      _lottoBall(temp.num3, false, 20),
                      _lottoBall(temp.num4, false, 20),
                      _lottoBall(temp.num5, false, 20),
                      _lottoBall(temp.num6, false, 20),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _generateLottoImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _lottoBall(lotto[0], false, 20),
        _lottoBall(lotto[1], false, 20),
        _lottoBall(lotto[2], false, 20),
        _lottoBall(lotto[3], false, 20),
        _lottoBall(lotto[4], false, 20),
        _lottoBall(lotto[5], true, 20),
      ],
    );
  }

  Widget _lottoBall(int number, bool isLast, double size) {
    if (isLast) {
      Lotto temp = new Lotto(lotto[0],lotto[1],lotto[2],lotto[3],lotto[4],lotto[5]);
      lottos.add(temp);
      _clearLottoList();
    }

    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: CircleAvatar(
          backgroundColor: _setBallColor(number),
          radius: size,
          child: Text(
            "$number",
            style: TextStyle(color: Colors.white, fontSize: size - 4),
          ),
        ),
      ),
    );
  }
}
