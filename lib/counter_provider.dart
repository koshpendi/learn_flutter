import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  var value = 0;

  void increment() {
    value++;

    notifyListeners();
  }
}
