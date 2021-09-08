import 'package:get/get.dart';

typedef Json = Map<String, dynamic>;

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://accounts-dev.wow.app/api/v1';
  }

  Future<Response<Json>> claimSms(String phone) => post('/sms/send', {
        'phone': phone,
      });
  Future<Response<Json>> getTokens(String phone, String smsCode) => post('/jwt/grant', {
        'grant_type': 'secret_code',
        'username': phone,
        'secret_code': smsCode,
      });
}
