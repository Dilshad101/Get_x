 import 'package:flutter/material.dart';
import 'package:get/get.dart';

confirmSnackBar({required String title,required String subtitle,required String buttontext,required VoidCallback onPressed,required Color color}) {
    Get.snackbar(
      'Warning',
      subtitle,
      titleText:  Text(
        title,
        style:const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      backgroundColor: color,
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.warning_rounded,color: Colors.white,),
      duration: const Duration(seconds: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      colorText: Colors.white,
      animationDuration: const Duration(milliseconds: 500),
      mainButton: TextButton(
        onPressed: onPressed,
        child:
         Text(
          buttontext,
          style:const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16),
        ),
      ),
    );
  }