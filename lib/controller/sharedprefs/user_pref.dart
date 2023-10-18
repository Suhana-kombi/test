import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
   static saveUserId(int id) async {
    SharedPreferences idPref = await SharedPreferences.getInstance();
    idPref.setInt("id", id);
  }

  static Future<int?> getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final id = preferences.getInt("id");
    return id;
  }
  static saveToken(String token) async {
    SharedPreferences tokenpref = await SharedPreferences.getInstance();
    tokenpref.setString("token", token);
  }

  static Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("token");
    return token;
  }
}
