import 'package:get/get.dart';
import 'package:student_app/database/database_helper.dart';
import 'package:student_app/model/student_model.dart';

class StudentController extends GetxController {
  List<Rx<Student>> _studentList = [];

  List<Rx<Student>> get studentlist => _studentList;

  addStudent(Rx<Student> std) {
    _studentList.add(std);
    update();
  }

  deleteStudent(int index) {
    _studentList.removeAt(index);
    update();
  }

  @override
  void onReady() async {
    super.onReady();
    final students = await DatabaseHelper.instence.getAllStudent();
    _studentList = students.map((json) => Student.fromStudent(json)).toList();
    update();
  }
}
