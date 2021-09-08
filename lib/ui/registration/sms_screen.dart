import 'package:flutter/material.dart' hide Title;
import 'package:get/get.dart';
import 'package:wow_app_test_task/controllers/auth_controller.dart';
import 'package:wow_app_test_task/utils/appcolors.dart';
import 'validators/reg_validator.dart';
import 'widgets/gradient_button.dart';
import 'widgets/header.dart';
import 'widgets/input.dart';

class SmsScreen extends GetView<AuthController> {
  const SmsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validator = Get.find<RegValidator>(tag: 'SMS');
    final phone = Get.parameters['phone'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
          color: AppColors.inactive,
        ),
        actions: [
          Image.asset('assets/images/info.png'),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              title: 'Введите код из СМС',
              subtitle: 'На номер $phone отправлено СМС с проверочным кодом, введите его',
            ),
            const SizedBox(height: 36),
            Input(
              content: TextFormField(
                controller: validator.controller,
                onChanged: validator.updateText,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '__ __ __ __',
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  border: InputBorder.none,
                  counter: const SizedBox.shrink(),
                ),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2.0),
                maxLength: 4,
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 260),
              padding: const EdgeInsets.only(left: 20, top: 24),
              child: Text(
                'Не пришел код? Вы можете запросить его повторно через 01:00 мин',
                style: Theme.of(context).textTheme.caption!.copyWith(color: AppColors.lightText),
              ),
            ),
            const Spacer(),
            Obx(() => GradientButton(
                  text: 'Получить код',
                  onPressed: () async {
                    await controller.register(validator.controller.text);
                    if (controller.status.value.isSuccess) {
                      Get.offAllNamed('/reg/sms/ok');
                    } else if (controller.status.value.isError) {
                      // TODO show error message
                      print('error: wrong code entered');
                    }
                  },
                  enabled: validator.navigationEnabled.value,
                  loading: controller.status.value.isLoading,
                )),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
