import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wow_app_test_task/ui/registration/registration_screen.dart';
import 'package:wow_app_test_task/ui/registration/sms_screen.dart';
import 'package:wow_app_test_task/ui/registration/validators/reg_validator.dart';
import 'package:wow_app_test_task/utils/appcolors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wow App',
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: AppColors.darkOrange,
          primaryVariant: AppColors.lightOrange,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: AppColors.mainText),
          bodyText1: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.lightText),
          caption: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.mainText),
        ),
      ),
      initialRoute: '/reg',
      getPages: [
        GetPage(
          name: '/reg',
          page: () => RegistrationScreen(),
          binding: BindingsBuilder.put(() => RegValidator(), tag: 'REG'),
          children: [
            GetPage(
              name: '/sms',
              page: () => SmsScreen(),
              binding: BindingsBuilder.put(() => RegValidator(), tag: 'SMS'),
              transition: Transition.cupertino,
            ),
            GetPage(
              name: '/name',
              page: () => Container(),
            ),
          ],
        ),
      ],
    );
  }
}
