import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();  // إعلام الويدجات بالتغيير
  }

  void decrement() {
    _count--;
    notifyListeners();  // إعلام الويدجات بالتغيير
  }
}