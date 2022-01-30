import 'dart:convert';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    image: "https://i.imgur.com/3PQh19Q.jpeg",
    name: 'Gagas Amukti',
    email: 'test@gmail.com',
    phone: '(081) 206-5039',
    aboutMeDescription:
        'KEQING...... KEQING WANGY WANGY WANGY WANGY WANGY WANGY HU HA HU HA HU HA, aaaah baunya KEQING wangi aku mau nyiumin aroma wanginya KEQING AAAAAAAAH.......',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
