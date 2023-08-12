import 'package:get/get.dart';

class Student {
  int? id;
  String name;
  int age;
  int batch;
  int regnum;
  Student(
      {this.id,
      required this.age,
      required this.batch,
      required this.name,
      required this.regnum});

  static Map<String, dynamic> toJson(Student student) => {
        'id': student.id,
        'name': student.name,
        'age': student.age,
        'batch': student.batch,
        'regnum': student.regnum,
      };

  static Rx<Student> fromStudent(Map<String, dynamic> json) {
    final student = Student(
        id: json['id'],
        age: json['age'],
        batch: json['batch'],
        name: json['name'],
        regnum: json['regnum']);

    return Rx(student);
  }

  // factory Student.fromJson(Map<String, dynamic> json) => Student(
  //     age: json['age'],
  //     batch: json['batch'],
  //     name: json['name'],
  //     regnum: json['regnum']);
}
