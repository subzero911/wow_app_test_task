import 'package:flutter/material.dart' hide Title;
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:wow_app_test_task/utils/appcolors.dart';
import 'widgets/gradient_button.dart';
import 'widgets/header.dart';
import 'widgets/info.dart';
import 'widgets/input.dart';

class SmsScreen extends StatelessWidget {
  const SmsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phone = Get.parameters['phone'];

    return Scaffold(
      appBar: AppBar(
        title: Text('SMS Screen'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
          color: AppColors.inactive,
        ),
        actions: [
          Image.asset('assets/images/info.png'),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Header(
              title: 'Введите код из СМС',
              subtitle: 'На номер $phone отправлено СМС с проверочным кодом, введите его',
            ),
            const SizedBox(height: 36),
            Input(
              content: Row(
                children: [
                  Text('RU', style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black)),
                  const SizedBox(width: 8),
                  Image.asset('assets/images/ru_flag.png'),
                  const SizedBox(width: 18),
                  Flexible(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: '+7 (___) ___ __ __',
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        PhoneInputFormatter(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            GradientButton(
              text: 'Получить код',
              onPressed: () {},
              enabled: true,
            ),
            const SizedBox(height: 24),
            Info(),
          ],
        ),
      ),
    );
  }
}
