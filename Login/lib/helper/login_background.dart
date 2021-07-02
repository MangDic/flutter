import 'package:flutter/material.dart';
import 'package:loginpage/data/join_or_login.dart';

class LoginBackground extends CustomPainter {

  // 클래스 생성자, {} 는 옵션값 (없어도 상관없음) 꼭 받아야 하는 값이면 required 를 사용
  LoginBackground({required this.isJoin});

  final bool isJoin;

  @override
  void paint(Canvas canvas, Size size) {
    // .. Paint 오브젝트를 생성해서 그 안에 있는 color 값을 set 하고 이 오브젝트를 paint에 넣어줘라
    Paint paint = Paint()..color = isJoin?Colors.red:Colors.blue;
    canvas.drawCircle(Offset(size.width*0.5, size.height*0.2), size.height/2, paint);
  }

  // 1초에 60프레임이 바뀌는 동안 사용할 부분을 계속 다시 그릴 것인가? 여기서는 백그라운드
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}