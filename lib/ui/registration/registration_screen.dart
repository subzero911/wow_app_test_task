import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:wow_app_test_task/utils/appcolors.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Введите номер телефона', // TODO localize
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Для использования приложения пройдите авторизацию по номеру телефона',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 14),
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 16,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
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
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 0,                  
                ),                
                onPressed: () {},
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: AppColors.orangeGradient,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    alignment: Alignment.center,
                    child: Text(
                      'Получить код',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, bottom: 28),
              child: Row(
                children: [
                  Image.asset('assets/images/checkmark.png'),
                  const SizedBox(width: 17),
                  Flexible(
                    child: Text(
                      'Я ознакомлен и принимаю Пользовательское соглашение и Политику конфиденциальности',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
