import 'dart:convert';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    image:
        "https://lh3.googleusercontent.com/pfnmDo8XF8Tw28NhYPsQidvkqkHebInyvQUxFKPJSeX507N28GvTP48J58oTdxSjKlPpxjGTGAbReY04juygOujZoNk13UfMa2TD_KE9tyQM2e_fl7B2Z4qiDGVvMpDZ56u7PFet34LN7VptayTM3LpPnYa6ADN0JNwqaX1aAk2wwGvZbEhOMlzNfL7B6xOBDommlh8SNLhu5wewqlyp6F25yPr6EIKIXkkYCjdnYZH4WJAjx2PYoGlfu6Xq1NxnhiCbOSZs07sPvoSBdQj0kwXg661_gWDimM5Lv_CNzoNzlenFRR5uOQS6FtvoPExWSqT576OLzHXonE43P_s20ulgzRghQhbSm1j4_Q6HVdAbDd69ksOwaWRFtXA7CpBybgqCGM-7Z79xYwjevtjHI9IqZtXSE8gjx2ZYqKTM2NKkkoItUv6XM_B6DlyQY5AWWAB7Kd8KwGOBHfiZoY4Yvhf9SiK5uhCuZQJu-pM5LmJQdMIayhNfMtdxlbCXb5Mevko-CK0DxTlQeFrzdV5jkc7uqg_04kneSTchrECMxijou9DlfF39ISBNqUd40U_jTpfiQwRGEdNJRNK9mUFTWKhDALYNFeHtYcO9bFbhks145t81Y2WceuQYX0PjVb0Wjmc_fXtBhgUZlNFQct0E_-SDLdcY-wrn3dCl0SmEnw0xffaUYg8O1TdUvydJeZxhPNH0Ztdvi2CzVBbBxGaQLmHn1Q=s958-no?authuser=0",
    name: 'Test Test',
    email: 'test.test@gmail.com',
    phone: '(208) 206-5039',
    aboutMeDescription: 'My dicc shorter than this desc',
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
