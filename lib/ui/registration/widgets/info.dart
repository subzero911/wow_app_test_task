import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}