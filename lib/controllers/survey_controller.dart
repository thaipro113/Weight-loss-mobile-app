import 'package:get/get.dart';

class SurveyController extends GetxController {
  // Survey State
  var gender = 'Nam'.obs;
  var goal = ''.obs;
  var focusArea = ''.obs;
  var currentBodyShape = ''.obs;
  var targetBodyShape = ''.obs;
  var age = 25.obs;
  var height = 170.obs;
  var weight = 60.obs;
  var targetWeight = 55.obs;
  var injuryList = <String>[].obs;
  var frequency = ''.obs;
  var activityLevel = ''.obs;

  void toggleInjury(String injury) {
    if (injuryList.contains(injury)) {
      injuryList.remove(injury);
    } else {
      injuryList.add(injury);
    }
  }

  void nextScreen(String route) {
    Get.toNamed(route);
  }
}
