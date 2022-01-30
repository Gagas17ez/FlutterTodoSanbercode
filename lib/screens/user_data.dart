import 'dart:convert';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    image:
        "https://lh3.googleusercontent.com/elq25xbRfvNTLFJOTIThx5bgaEl89cxgc4uU0bh6emt2DinbwxzPM33jByWZ9-kxuP-zvmw1gZZWAR2fzWQCJR0SCfjC_5XosLXgic9UZcpAp3NA5R0CuNsZk3WonVG9iG6GbFISZ3RS47690Q1AgEEjb5y74epx-NPqA2FC493Tctgo4RdZlnR9FYT8MDnJ_GInb2LEQ1owWQ0eCkamFSDCA4qbOgJPaoFrbHD_ayVv7_1ydDy-eZ6q39wWcpsl2Xp7BKUwTI7-44-LJcqSCx3L978AQOza9eSWtBnuG5TnA6tiqcfuAge8TtrMCr5KJyZqZJCfCnhitzNypD6mjiM4ur_uYtpsORxFs5xDTInMa-YJfMHEv-7_fXQTBh5HBmhso_Y1X7-HigN6MKtZy__NveYzxxmMZK0wqYRGrUwpyDx42j1C7EXz8O8phETWBAWmQoFtwp0x-41rXs6OJwbH9f0G117V0gmINmGxslGW38BbyGGLlvISLK1HIbgqz9nnTNpbcEfTd8gtA4ot_9UyPeHIfoWNJ5iFbboweRxT7twofD-rRh44WJka20UvC-f4tBI4Kivm5dEd8oXwkzVHCtZ1bsDTgeqffy2Q4T95bIT4yNIvo6NY1UX8JL0duXqrN6SgP2u7z9XjcTjnr4kJpK5RpbiC5knN48Voo0E9uOiw5q65WMMQTCoVLCurU80oCDaxY6FwlXXu87tELJypbg=s1007-no?authuser=0",
    name: 'Test Gan',
    email: 'test@gmail.com',
    phone: '085608483234',
    aboutMeDescription: 'My dicc is shorter than this description',
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
