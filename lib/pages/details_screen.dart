import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controllers/student_controller.dart';
import 'package:student_app/database/database_helper.dart';
import 'package:student_app/model/student_model.dart';
import 'package:student_app/pages/add_student_screen.dart';
import 'package:student_app/widgets/confirmation_snackbar_widget.dart';

import '../widgets/details_text_widget.dart';

class ScreenDetails extends StatelessWidget {
  ScreenDetails({super.key, required this.student, required this.index});
  final Rx<Student> student;
  final int index;
  final StudentController studentController = Get.find();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 0,
                  child: Text('Edit'),
                ),
                const PopupMenuItem(
                  value: 1,
                  child: Text('Delete'),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                editConfirmation();
              } else {
                deleteConfirmation(context);
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => BackdropFilter(
            filter: const ColorFilter.linearToSrgbGamma(),
            child: Container(
              height: size.height * .7,
              width: size.width,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffE9E6E2),
                      Colors.white,
                    ]),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image
                  Container(
                    height: size.height * .3,
                    width: size.width * .6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(File(student.value.imagePath)),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  const SizedBox(height: 50),
                  // details
                  DetailsTextWidget(
                    value: student.value.name,
                    label: 'Name',
                    isSub: false,
                  ),
                  DetailsTextWidget(
                    value: student.value.age,
                    label: 'Age',
                  ),
                  DetailsTextWidget(
                    value: student.value.batch,
                    label: 'Batch',
                  ),
                  DetailsTextWidget(
                    value: student.value.regnum,
                    label: 'Register Number',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  deleteConfirmation(BuildContext context) {
    confirmSnackBar(
      title: 'Warning',
      subtitle: "This Action can't be undone",
      buttontext: 'Delete',
      color: Colors.redAccent,
      onPressed: () {
        studentController.deleteStudent(index);
        DatabaseHelper.instence.deleteStudent(student.value.id!);
        Get.closeCurrentSnackbar();
        Navigator.of(context).pop();
      },
    );
  }

  editConfirmation() {
    confirmSnackBar(
      title: 'Warning',
      subtitle: 'Edit Student will loose old Data',
      buttontext: 'Edit',
      color: Colors.blue.shade800,
      onPressed: () {
        Get.to(() => ScreenAddStudent(student: student));
        Get.closeCurrentSnackbar();
      },
    );
  }
}
