import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final Widget content;

  const Input({
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        child: content,
      ),
    );
  }
}