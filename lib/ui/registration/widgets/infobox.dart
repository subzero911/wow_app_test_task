import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 28),
      child: Row(
        children: [
          Image.asset('assets/images/checkmark.png'),   // TODO checkbox
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