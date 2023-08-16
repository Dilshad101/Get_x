import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controllers/student_controller.dart';

class CustomBottomAppBar extends StatelessWidget {
   CustomBottomAppBar({
    super.key,
  });
  final StudentController studentController =Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(6),
          color: Colors.white),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child:  TextField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.search_rounded,
            size: 30,
          ),
          hintText: 'Search...',
          suffixIconColor: Colors.black54,
        ),
        onChanged: (value) {
           studentController.onSearch(value);
        },
      ),
    );
  }
}
