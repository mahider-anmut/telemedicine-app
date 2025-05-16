import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {

  static setString(String key,String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static setInt(String key,int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static setDouble(String key,double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  static setBool(String key,bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static setStringList(String key,List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }


  static Future<String> getString(String key,[String defaultValue=""]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key) ?? defaultValue;
    return value;
  }

  static Future<bool> getBool(String key,[bool defaultValue=false]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool(key) ?? defaultValue;
    return value;
  }

  static Future<int> getInt(String key, [int defaultValue=0]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(key) ?? defaultValue;
    return value;
  }

  static Future<double> getDouble(String key,[double defaultValue=0.0]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double value = prefs.getDouble(key) ?? defaultValue;
    return value;
  }

  static Future<List<String>> getStringList(String key,[List<String> defaultValue= const <String>[]]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> value = prefs.getStringList(key) ?? defaultValue;
    return value;
  }

  static Future<Set<String>> getKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> value = prefs.getKeys();
    return value;
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static contains(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.containsKey(key);
  }
}