import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int bottomIndex = 0; //원래는 1임 테스트를 위해 사용 중.

  void initialize() {
    notifyListeners();
  }

  void setBottomIndex(int i) {
    bottomIndex = i;
    notifyListeners();
  }
}
