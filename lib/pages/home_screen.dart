import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controllers/student_controller.dart';
import 'package:student_app/pages/add_student_screen.dart';
import 'package:student_app/pages/details_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.find();
    final deviceSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SizedBox(
        height: deviceSize.height,
        width: deviceSize.width,
        child: GetBuilder<StudentController>(builder: (_) {
          return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount:studentController.studentlist.length,
              itemBuilder: (context, index) {
                final item =studentController.studentlist[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(ScreenDetails(student: item,index: index,),
                        transition: Transition.rightToLeft);
                  },
                  child: Obx(
                    () => Container(
                      color: Colors.grey,
                      height: 150,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(item.value.name),
                    ),
                  ),
                );
              });
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.grey.shade700,
        onPressed: () {
          Get.to(ScreenAddStudent());
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Student'),
      ),
    );
  }
}
