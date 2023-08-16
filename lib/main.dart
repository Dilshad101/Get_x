import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:student_app/controllers/init_controller.dart';
import 'package:student_app/pages/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      initialBinding: Init(),
      home: const ScreenHome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.grey.shade700,
        scaffoldBackgroundColor: const Color(0xffF2F2F2),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xffF2F2F2),
            titleTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff171515),
            ),elevation: 0,
            iconTheme:IconThemeData(color: Color(0xff171515))),
      ),
    );
  }
}
