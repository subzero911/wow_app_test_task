import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wow_app_test_task/global_bindings.dart';
import 'package:wow_app_test_task/ui/registration/fullname_screen.dart';
import 'package:wow_app_test_task/ui/registration/registration_screen.dart';
import 'package:wow_app_test_task/ui/registration/sms_screen.dart';
import 'package:wow_app_test_task/ui/registration/validators/reg_validator.dart';
import 'package:wow_app_test_task/utils/appcolors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wow App',
      theme: ThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.darkOrange,
          primaryVariant: AppColors.lightOrange,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: AppColors.mainText),
          bodyText1: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.lightText),
          caption: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.mainText),
        ),
      ),
      initialRoute: '/reg',
      initialBinding: GlobalBindings(),
      getPages: [
        GetPage(
          name: '/reg',
          page: () => const RegistrationScreen(),
          binding: BindingsBuilder.put(() => RegValidator(), tag: 'REG'),
          children: [
            GetPage(
                name: '/sms',
                page: () => const SmsScreen(),
                binding: BindingsBuilder.put(() => RegValidator(), tag: 'SMS'),
                transition: Transition.cupertino,
                children: [
                  GetPage(
                    name: '/ok',
                    page: () => const FullnameScreen(),
                    binding: BindingsBuilder.put(() => RegValidator(), tag: 'NAME'),
                    transition: Transition.cupertino,
                  ),
                ]),
          ],
        ),
      ],
    );
  }
}
