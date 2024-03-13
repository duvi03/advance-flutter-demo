
import 'dart:convert';

import 'package:demo/core/common/common_console.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefService {

  static void setKey({required String key, required String? value}) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      if (value != null) {
        sharedPreferences.setString(key, value);
      }
    } catch (e) {
      Console.debug(e);
    }
  }

  static void setStringList({required String key, required List<String> value}) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

      sharedPreferences.setStringList(key, value);
    } catch (e) {
      Console.debug(e);
    }
  }

  static Future<List<String>?> getStringList({required String key}) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getStringList(key);
    } catch (e) {
      Console.debug(e);
      return null;
    }
  }

  static void setMap({required String key, required Map<String, dynamic>? value}) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      if (value != null) {
        Console.debug(value);
        String jsonEncodedString = json.encode(value);
        Console.debug(jsonEncodedString);
        sharedPreferences.setString(key, jsonEncodedString);
      } else {
        Console.debug("The Map is empty there is noting to update to storage");
      }
    } catch (e) {
      Console.debug(e);
    }
  }

  static Future clearSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static void removeKey({required String key}) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.remove(key);
    } catch (e) {
      Console.debug(e);
    }
  }

  static Future<String?> getKey({required String key}) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getString(key);
    } catch (e) {
      Console.debug(e);
      return null;
    }
  }

  static Future saveSharedPref(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }


  static Future<String?> getSharedPref(String key) async {
    final prefs = await SharedPreferences.getInstance();

    if(prefs.getString(key) != null) {
      return prefs.getString(key);
    } else {
      return null;
    }
  }


  static Future<dynamic> getKeyAny({required String key}) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      dynamic temp = sharedPreferences.get(key);
      return json.decode(temp);
    } catch (e) {
      Console.debug(e);
      return null;
    }
  }

  static void setBool({required String key, required bool value}) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setBool(key, value);
    } catch (e) {
      Console.debug(e);
    }
  }

  static Future<bool?> getBool({required String key}) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences.getBool(key);
    } catch (e) {
      Console.debug(e);
      return null;
    }
  }
}
