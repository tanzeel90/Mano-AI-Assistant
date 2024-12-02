import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Use hive_flutter for Flutter integration
//import 'package:path_provider/path_provider.dart';
//import 'dart:io'; // For Directory

class Pref {
  static late Box _box;

  static Future<void> initialize() async {
    // Initialize Hive for Flutter
    await Hive.initFlutter(); // Use HiveFlutter for initialization

    _box = await Hive.openBox('myData'); // Open the box
  }

  static bool get showOnboarding =>
      _box.get('showOnboarding', defaultValue: true);
  static set showOnboarding(bool value) => _box.put('showOnboarding', value);

//for storing theme data
  static bool get isDarkMode => _box.get('isDarkMode') ?? false;
  static set isDarkMode(bool v) => _box.put('isDarkMode', v);

  static ThemeMode get defaultTheme {
    final data = _box.get('isDarkMode');
    log('data: $data');
    if (data == null) return ThemeMode.system;
    if (data == true) return ThemeMode.dark;
    return ThemeMode.light;
  }
}
