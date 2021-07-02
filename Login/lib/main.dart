// 구글 디자인 (추천)
import 'package:flutter/material.dart';
import 'package:loginpage/data/join_or_login.dart';
import './screens/login.dart';
import 'package:provider/provider.dart';
// 플러터는 모든 요소가 위젯

void main() => runApp(MyApp());

// StatelessWidget : 상태 변화가 없는 위젯 / StatefulWidget : 상태 변화가 있는 위젯
// MyApp : 전체 화면
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<JoinOrLogin>.value(
        // 생성을 하고 전달해주기
          value: JoinOrLogin(),
          child: AuthPage()),
    );
  }
}