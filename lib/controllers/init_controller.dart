import 'package:get/get.dart';
import 'package:student_app/controllers/id_card_controller.dart';
import 'package:student_app/controllers/student_controller.dart';

class Init extends Bindings {
  @override
  void dependencies() {
    Get.put(StudentController());
    Get.put(IdCardController());
    // Get.put(ListController());
  }
}
