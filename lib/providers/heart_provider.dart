import 'package:flutter/material.dart';

class HeartProvider extends ChangeNotifier {
  bool isPressed = false;

  updateStatus() {
    
    isPressed = !isPressed;
    notifyListeners();
  }

  bool get status => isPressed;
}
