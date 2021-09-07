import 'package:flutter/material.dart';
import '../../../utils/appcolors.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  const GradientButton({
    required this.onPressed,
    required this.text,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Ink(
          decoration: enabled
              ? BoxDecoration(
                  gradient: AppColors.orangeGradient,
                  borderRadius: BorderRadius.circular(20),
                )
              : BoxDecoration(
                  color: AppColors.inactive,
                  borderRadius: BorderRadius.circular(20),
                ),
          child: Container(
            width: double.infinity,
            height: 44,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
