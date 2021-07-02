import 'package:flutter/foundation.dart';

// ChangeNotifier : 오브젝트가 변경될 때마다 노티피케이션을 받음
class JoinOrLogin extends ChangeNotifier{
  // _를 붙이면 private
  bool _isJoin = false;

  bool get isJoin => _isJoin;

  void toggle() {
    print("토글!");
    _isJoin = !_isJoin;
    // 실행하면 ChangeNotifierProvider 를 통해 제공된 데이터를 사용하는 위젯들에게 알림을 보냄 -> 데이터가 변경되었으니 처리를 해라!
    notifyListeners();
  }
}