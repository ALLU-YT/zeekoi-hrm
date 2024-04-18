import 'package:flutter/material.dart';

class ChangeGeneralShiftColor extends ChangeNotifier {
  Color colors = const Color(0xFFFFD8D4);

  Color get color => colors;

  void changeColorToBlack() {
    colors = const Color(0xFFEBFFE9);
    notifyListeners();
  }

  void changeColorblue() {
    colors = const Color(0xFFFFD8D4);
    notifyListeners();
  }
}
