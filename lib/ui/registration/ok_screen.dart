import 'package:flutter/material.dart' hide Title;
import 'package:get/get.dart';
import 'package:wow_app_test_task/controllers/auth_controller.dart';
import 'package:wow_app_test_task/utils/appcolors.dart';
import 'widgets/gradient_button.dart';
import 'widgets/header.dart';
import 'widgets/input.dart';

class OkScreen extends StatelessWidget {
  const OkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Header(
              title: 'Укажите имя  и фамилию',
              subtitle: 'Добавьте информацию о себе, чтобы вас узнали клиенты',
            ),
            const SizedBox(height: 36),
            Input(
              content: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Анна Борзова',
                  hintStyle: Theme.of(context).textTheme.bodyText1,
                  border: InputBorder.none,
                  counter: const SizedBox.shrink(),
                ),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2.0),
                maxLength: 4,
              ),
            ),
            Spacer(),
            GradientButton(
              text: 'Далее',
              onPressed: () {},
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
