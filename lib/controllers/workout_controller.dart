import 'package:get/get.dart';
import '../models/day_plan.dart';
import '../data/dummy_data.dart';

class WorkoutController extends GetxController {
  var plans = <DayPlan>[].obs;
  var selectedPlan = Rxn<DayPlan>();

  @override
  void onInit() {
    super.onInit();
    plans.assignAll(DummyData.get30DaysPlan());
  }

  void selectDay(DayPlan plan) {
    selectedPlan.value = plan;
  }
}
