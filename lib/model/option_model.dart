import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class OptionModel {
  static const String _key = 'option';
  static final OptionModel _instance = OptionModel._internal();

  factory OptionModel() {
    return _instance;
  }

  OptionModel._internal();

  Future<bool> saveOption(int option) async {
    return Future<bool>.delayed(const Duration(seconds: 1), () async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_key, option);
      return true;
    });
  }

  Future<int> restoreOption() async {
    return Future<int>.delayed(const Duration(seconds: 1), () async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(_key) ?? 1;
    });
  }

  Future<bool> saveOptionRandomly(int option) async {
    return Future<bool>.delayed(const Duration(seconds: 1), () async {
      if (!Random().nextBool()) {
        return false;
      }
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_key, option);
      return true;
    });
  }
}
