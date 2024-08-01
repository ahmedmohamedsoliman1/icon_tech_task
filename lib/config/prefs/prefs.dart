import 'package:shared_preferences/shared_preferences.dart';

class Prefs {

  static late SharedPreferences preferences ;

  static Future <bool> saveData ({required String key , required String value})async{
    return await preferences.setString(key, value);
  }

  static String? getData ({required String key}) {
    return preferences.getString(key);
  }
}