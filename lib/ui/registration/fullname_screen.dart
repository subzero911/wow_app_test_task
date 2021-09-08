import 'package:flutter/material.dart' hide Title;
import 'package:get/get.dart';

import 'validators/reg_validator.dart';
import 'widgets/gradient_button.dart';
import 'widgets/header.dart';
import 'widgets/input.dart';

class FullnameScreen extends StatelessWidget {
  const FullnameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validator = Get.find<RegValidator>(tag: 'NAME');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          Image.asset('assets/images/info.png'),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              title: 'Укажите имя  и фамилию',
              subtitle: 'Добавьте информацию о себе, чтобы вас узнали клиенты',
            ),
            const SizedBox(height: 36),
            Input(
              content: TextFormField(
                controller: validator.controller,
                onChanged: validator.updateText,
                decoration: InputDecoration(
                  hintText: 'Анна Борзова',
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  border: InputBorder.none,
                  counter: const SizedBox.shrink(),
                ),
              ),
            ),
            const Spacer(),
            Obx(() => GradientButton(
                  text: 'Далее',
                  onPressed: () {},
                  enabled: validator.navigationEnabled.value,
                )),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
