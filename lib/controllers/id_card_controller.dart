import 'package:get/get.dart';

class IdCardController extends GetxController{

  RxString name=''.obs;
  RxString imagePath=''.obs;
  updateName(String val){
    name.value=val;
  }
  clearFields(){
    name.value='';
    imagePath.value='';
  }
}