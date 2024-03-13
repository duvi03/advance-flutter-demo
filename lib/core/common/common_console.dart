import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

/// Custom Class for printing in console without needing to instantiate Console class. print methods can be invoked directly.
class Console {
  /// This method will print no matter whether you are in debug or release.
  static noCheckConsole(Object? msg) {
    print(msg);
  }

  /// This method will print only in debug mode.
  static debug(Object? msg, {String? key}) {
    if (kDebugMode) {
      if (key == null) {
        print("*****Debug Mode*****");
      } else {
        print("*****$key*****");
      }
      print(msg);
    }
  }

  static void printLongString({String? title, Object? data}) {
    if(kDebugMode){
      developer.log('---------${title??"No Title Given"}-------\n${data??""}');
    }
  }

  /// This method will print only in release mode.
  static prod(Object? msg) {
    if (!kDebugMode) {
      // ignore: avoid_print
      print(msg);
    }
  }
}
