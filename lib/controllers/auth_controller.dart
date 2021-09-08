import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';

import 'package:wow_app_test_task/repository/auth_service.dart';

class AuthController extends GetxController {
  AuthService auth;
  AuthController({
    required this.auth,
  });

  String phone = '';

  // set on registration screen
  void setPhone(String rawPhone) {
    phone = toNumericString(rawPhone, allowHyphen: false);
  }

  Future<void> claimSms() async {
    if (phone.isNotEmpty) {      
      await auth.claimSms(phone);
    }
  }

  Future<void> register(String smsCode) async {
    await auth.getTokens(phone, smsCode);
  }
}
