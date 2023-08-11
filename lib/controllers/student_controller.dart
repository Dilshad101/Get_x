import 'package:get/get.dart';
import 'package:student_app/model/student_model.dart';

class StudentController extends GetxController {
   var name='dd'.obs;
  final List<Rx<Student>> _studentList = [];
  // addStudent(String name, int age, int batch, int regnum, int? id) {
  //   final student =
  //       Student(age: age, batch: batch, name: name, regnum: regnum).obs;
  //   // Get.find<ListController>().addStudentToList(student);
  //   _studentList.add(student);
  // }

  addStd(Rx<Student> std) {
    _studentList.add(std);
    update();
  }
  deleteStudent(int index){
 _studentList.removeAt(index);
 update();
}

  List<Rx<Student>> get studentlist => _studentList;
}
