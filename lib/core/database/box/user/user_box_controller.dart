import 'package:pintupay/core/database/pintupay_box.dart';
import 'package:pintupay/core/usecase/auth_usecase.dart';
import 'package:pintupay/core/util/core_function.dart';

import '../../core_database.dart';
import 'user_box.dart';

class UserBoxController {

  static Future<bool> isLogin() async {
    bool isLogin = false;
    try {
      var userBox = await CoreDatabase.openBoxDatabase(PintuPayBox.user);
      if (userBox.values.isNotEmpty) {
        UserBox userBoxx = userBox.values.first;
        if (userBoxx.id != null) {
          isLogin = userBox.values.toList().length == 1;
        }
      }
    } catch (e) {
      CoreFunction.logPrint("Check Login", e.toString());
      //? TODO Logout
    }
    return isLogin;
  }

  static Future<void> saveUser(UserBox newUserBox) async {
    return await CoreDatabase.openBoxDatabase(PintuPayBox.user).then((userBox) async {
      await userBox.clear().whenComplete(() async {
        await userBox.add(newUserBox).then((value) {
          if (newUserBox.authToken != null) authUsecase.setUser(newUserBox);
        });
      });
    });
  }


  static Future<UserBox?> getUser() async {
    late UserBox userDataBox;
    await CoreDatabase.openBoxDatabase(PintuPayBox.user).then((userBox) {
      if (userBox.values.toList().length == 1) {
        userDataBox = userBox.values.first;
      }
    });
    CoreFunction.logPrint("User", userDataBox.toJson());
    return userDataBox;
  }
}