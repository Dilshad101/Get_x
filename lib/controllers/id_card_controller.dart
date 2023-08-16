import 'package:get/get.dart';

class IdCardController extends GetxController {
  RxString name = ''.obs;
  RxString age = ''.obs;
  RxString batch = ''.obs;
  RxString regNum = ''.obs;

  RxString imagePath = ''.obs;
  updateName(String val) {
    name.value = val;
  }

  updateAge(String val) {
    age.value = val;
  }

  updateBatch(String val) {
    batch.value = val;
  }

  updateregNum(String val) {
    regNum.value = val;
  }

  addImage(String image) {
    imagePath.value = image;
    refresh();
  }

  clearFields() {
    name.value = '';
    imagePath.value = '';
    age.value = '';
    batch.value = '';
    regNum.value = '';
  }
}
