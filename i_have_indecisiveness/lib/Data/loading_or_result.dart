import 'package:flutter/foundation.dart';

class loading_or_result extends ChangeNotifier{

  bool _isLoad = true;

  bool get isLoad => _isLoad;

  void toggle() {
    _isLoad = !_isLoad;
    notifyListeners();
  }
}