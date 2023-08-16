import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackbar(
    {required String title, required subtitle, bool isError = true}) {
  return Get.snackbar(
    'Warning',
    subtitle,
    backgroundColor: isError ? Colors.redAccent : Colors.green,
    icon:  Icon(
     isError? Icons.warning_amber_rounded:Icons.done_rounded,
      size: 30,
      color: Colors.white,
    ),
    titleText: Text(
      title,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    ),
    colorText: Colors.grey.shade200,
  );
}
