import 'package:flutter/material.dart' hide Title;
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'widgets/gradient_button.dart';
import 'widgets/header.dart';
import 'widgets/info.dart';
import 'widgets/input.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      controller: _controller,
                      onChanged: (val) {
                        setState(() {});
                      },
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
              onPressed: () => Get.toNamed('/reg/sms?phone=${_controller.text}'),
              enabled: _controller.text.isNotEmpty,
            ),
            const SizedBox(height: 24),
            Info(),
          ],
        ),
      ),
    );
  }
}
