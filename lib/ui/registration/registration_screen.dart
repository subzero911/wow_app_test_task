import 'package:flutter/material.dart' hide Title;
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:wow_app_test_task/controllers/auth_controller.dart';
import 'package:wow_app_test_task/ui/registration/validators/reg_validator.dart';
import 'widgets/gradient_button.dart';
import 'widgets/header.dart';
import 'widgets/info.dart';
import 'widgets/input.dart';

class RegistrationScreen extends GetView<AuthController> {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validator = Get.find<RegValidator>(tag: 'REG');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          Image.asset('assets/images/info.png'),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Header(
              title: 'Введите номер телефона',
              subtitle: 'Для использования приложения пройдите авторизацию по номеру телефона',
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
                      autofocus: true,
                      controller: validator.controller,
                      onChanged: validator.updateText,
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
            Obx(() => GradientButton(
                  text: 'Получить код',
                  onPressed: () {                    
                    controller.setPhone(validator.controller.text);
                    controller.claimSms(); // unawaited
                    Get.toNamed('/reg/sms?phone=${validator.controller.text}');
                  },
                  enabled: validator.navigationEnabled.value,
                )),
            const SizedBox(height: 24),
            Info(),
          ],
        ),
      ),
    );
  }
}
