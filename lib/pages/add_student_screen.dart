// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/controllers/id_card_controller.dart';
import 'package:student_app/controllers/student_controller.dart';
import 'package:student_app/model/student_model.dart';

import '../widgets/text_widget.dart';


class ScreenAddStudent extends StatelessWidget {
  ScreenAddStudent({super.key, this.student});
  Rx<Student>? student;

  File? profileImage;
  StudentController studentController = Get.find();
  IdCardController idCardController = Get.find();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final batchController = TextEditingController();
  final regController = TextEditingController();

  populateStudentDatas(){
  nameController.text = student?.value.name??'';
      ageController.text = student?.value.age.toString()??'';
      batchController.text = student?.value.batch.toString()??'';
      regController.text = student?.value.regnum.toString()??'';
     idCardController.name.value=nameController.text;
  }

  @override
  Widget build(BuildContext context) {
    populateStudentDatas();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            idCardController.clearFields();
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('New Student'),
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 30),
            SizedBox(
              height: 100,
              child: Obx(() => Text(idCardController.name.value)),
            ),
            GestureDetector(
              onTap: getImage,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: profileImage == null
                    ? null
                    : FileImage(File(profileImage!.path)),
                child: profileImage == null ? const Text('Add Photo') : null,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: nameController,
              label: 'Name',
              type: TextInputType.text,
              onChanged: (value) {
                idCardController.updateName(value);
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: ageController,
              label: 'Age',
              type: TextInputType.number,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: regController,
              label: 'Register Number',
              type: TextInputType.number,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: batchController,
              label: 'Batch',
              type: TextInputType.number,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addStudent();
        },
        child: const Icon(Icons.done),
      ),
    );
  }

  addStudent() async {
    final name = nameController.text;
    final age = ageController.text;
    final batch = batchController.text;
    final reg = regController.text;
    int? ag = int.tryParse(age);
    int? bh = int.tryParse(batch);
    int? rg = int.tryParse(reg);
    if (student == null) {
      final student =
          Student(age: ag!, batch: bh!, name: name, regnum: rg!).obs;
      studentController.addStd(student);
    } else {
      student!.update((std) {
        std!.name = name;
      });
    }
    idCardController.clearFields();
    Get.back();
  }

  getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
   
        profileImage = File(image.path);

    }
  }
}
