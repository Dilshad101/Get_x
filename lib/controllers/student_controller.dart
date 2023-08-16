import 'package:get/get.dart';
import 'package:student_app/database/database_helper.dart';
import 'package:student_app/model/student_model.dart';

class StudentController extends GetxController {
  List<Rx<Student>> _students = [];
  List<Rx<Student>> _serachstudentList = [];

  List<Rx<Student>> get studentlist => _serachstudentList;

  addStudent(Rx<Student> std) {
    _students.add(std);
    _serachstudentList.add(std);
    update();
  }

  deleteStudent(int index) {
    _students.removeAt(index);
    _serachstudentList.removeAt(index);
    update();
  }

  @override
  void onReady() async {
    super.onReady();
    final students = await DatabaseHelper.instence.getAllStudent();
    _students = students.map((json) => Student.fromStudent(json)).toList();
    _serachstudentList = students.map((json) => Student.fromStudent(json)).toList();
    update();
  }

  onSearch(String? value) {
    if (value == null) {
      _serachstudentList = _students;
    } else {
      _serachstudentList = _students
          .where((student) =>
              student.value.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
   
    update();
  }
}
