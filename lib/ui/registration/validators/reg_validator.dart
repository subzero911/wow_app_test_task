import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegValidator extends GetxController {
  final controller = TextEditingController();
  final navigationEnabled = false.obs;
  String _previousText = '';

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void updateText(String val) {
    // optimization: rebuild only if changed from 'empty' to 'not empty' and vice versa
    if (val.isNotEmpty && _previousText.isEmpty || val.isEmpty && _previousText.isNotEmpty) {
      navigationEnabled.toggle();
      print('toggle; $navigationEnabled');
    }
    _previousText = val;
  }
}
