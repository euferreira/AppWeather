import 'dart:io';

import 'package:flutter/foundation.dart';

class Failure implements Exception {
  final String message;

  Failure(this.message) {
    if (kDebugMode && !Platform.environment.containsKey('FLUTTER_TEST')) {
      print("KDebugMode Errors: $this");
      print("\nError type: $runtimeType");
      print("*" * 10);
    }
  }

  @override
  String toString() => message;
}