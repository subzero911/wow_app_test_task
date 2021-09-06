import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:wow_app_test_task/utils/appcolors.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.help),
          ],
        ),
        Text('Введите номер телефона'), // TODO localize
        Text('Для использования приложения пройдите авторизацию по номеру телефона'),
        const SizedBox(height: 36),
        InternationalPhoneNumberInput(onInputChanged: (val) {}),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: AppColors.orangeGradient,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
            onPressed: () {},
            child: Text('Получить код'),
          ),
        ),
      ],
    );
  }
}
