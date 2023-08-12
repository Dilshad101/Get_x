import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controllers/student_controller.dart';
import 'package:student_app/database/database_helper.dart';
import 'package:student_app/model/student_model.dart';
import 'package:student_app/pages/add_student_screen.dart';

class ScreenDetails extends StatelessWidget {
  ScreenDetails({super.key, required this.student, required this.index});
  final Rx<Student> student;
  final int index;
  final StudentController studentController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
              onPressed: () {
                // Get.find<ListController>().deleteStudent(index);
                studentController.deleteStudent(index);
                DatabaseHelper.instence.deleteStudent(student.value.id!);
                Get.back();
              },
              icon: const Icon(Icons.delete)),
          IconButton(
              onPressed: () {
                Get.to(ScreenAddStudent(student: student));
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              student.value.name,
              style: const TextStyle(fontSize: 20, color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
