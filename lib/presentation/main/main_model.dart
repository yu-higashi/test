import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String pochiText = 'ポチじゃないよ！';

  void changePochiText() {
    pochiText = 'ポチすげー!!';
    notifyListeners();
  }
}
