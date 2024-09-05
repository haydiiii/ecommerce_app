import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? pref;

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future<void> cacheData(key, value)async {
    if (value is int) {
      pref!.setInt(key, value);
    } else if (value is double) {
      pref!.setDouble(key, value);
    } else if (value is bool) {
      pref!.setBool(key, value);
    } else {
     await pref!.setString(key, value);
    }
  }

  static dynamic getData(key) {
   return pref!.get(key);
  }
  static Future <void> removeData({required String key}) async {
    await pref!.remove(key);
  }
}

