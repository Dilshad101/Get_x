import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/controllers/student_controller.dart';
import 'package:student_app/pages/add_student_screen.dart';
import 'package:student_app/pages/details_screen.dart';

import '../widgets/bottom_appbar_widget.dart';
import '../widgets/custom_listtile_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.find();
    final deviceSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.school_outlined,
          size: 30,
        ),
        title: const Text(
          'University of Oxford',
          style: TextStyle(fontSize: 22),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomBottomAppBar(),
        ),
      ),
      body: SizedBox(
        height: deviceSize.height,
        width: deviceSize.width,
        child: GetBuilder<StudentController>(
          builder: (_) {
            return studentController.studentlist.isEmpty
                ? const Center(
                    child: Text(
                      'No Students Available',
                      style: TextStyle(
                          color: Colors.grey, fontSize: 18, letterSpacing: 1),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    itemCount: studentController.studentlist.length,
                    itemBuilder: (context, index) {
                      final item = studentController.studentlist[index];
                      return GestureDetector(
                        child: CustomListTile(item: item),
                        onTap: () {
                          Get.to(
                              () => ScreenDetails(
                                    student: item,
                                    index: index,
                                  ),
                              transition: Transition.rightToLeft);
                        },
                      );
                    },
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff333F63),
        onPressed: () {
          Get.to(() => ScreenAddStudent());
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Student'),
      ),
    );
  }
}
