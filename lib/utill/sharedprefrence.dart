// @dart=2.9
import 'package:CropSecure/screen/authscreen/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static SharedPreferences sharedPreferences;

  static savePrefString(String key, String value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (value != null) {
      sharedPreferences.setString(key, value);
    } else {
      sharedPreferences.setString(key, "Not available");
    }
  }

  static Future<dynamic> getPrefrenceString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String val = prefs.getString(key);
    return val;
  }

  static savePreferenceBoolean(bool b) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLoggedIn", b);
  }

  static savePreferenceBooleanFlag(String key, bool b) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, b);
  }

  static Future<bool> getPreferenceBooleanFlag(String key) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var res = await sharedPreferences.get(key);
    return res;
  }

  static getBooleanPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("isLoggedIn");
  }

  static clearPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Get.offAll(() => LoginScreen(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: 600));
    return sharedPreferences.clear();
  }
}
