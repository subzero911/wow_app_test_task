import 'dart:convert';

import 'package:wow_app_test_task/repository/auth_provider.dart';

class AuthService {
  AuthProvider authProvider;
  AuthService({
    required this.authProvider,
  });

  Future<void> claimSms(String phone) async {
    var response = await authProvider.claimSms(phone);
    print('response:\n${response.body}');
    if (response.body?['status'] == 'OK') {
      print('sms sent');
      return;
    } else if (response.body?['status'] == 'ERR') {
      print(response.body?['error']);
      return;
    }
  }

  Future<bool> getTokens(String phone, String smsCode) async {
    var response = await authProvider.getTokens(phone, smsCode);
    print('response:\n${response.body}');
    if (response.body?['status'] == 'OK') {
      final accessToken = response.body?['access_token'];
      final refreshToken = response.body?['refresh_token'];

      print('tokens received:\n$accessToken\n$refreshToken');

      // TODO save it to Hive and add to http client

      return true;
    } else {
      print(response.body?['error']);
      return false;
    }
  }
}
