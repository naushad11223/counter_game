import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  int _count = 0;
  ThemeMode _themeMode = ThemeMode.light;

  int get count => _count;
  ThemeMode get themeMode => _themeMode;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }
}
