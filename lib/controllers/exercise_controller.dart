import 'dart:async';
import 'package:get/get.dart';
import '../../models/exercise.dart';
import '../../controllers/workout_controller.dart';

class ExerciseController extends GetxController {
  var remainingSeconds = 0.obs;
  var currentExerciseIndex = 0.obs;
  var isPlaying = true.obs;
  
  Timer? _timer;
  
  final WorkoutController _workoutController = Get.find();
  
  List<Exercise> get exercises => _workoutController.selectedPlan.value?.exercises ?? [];

  @override
  void onInit() {
    super.onInit();
    _startCurrentExercise();
  }

  void _startCurrentExercise() {
    if (currentExerciseIndex.value < exercises.length) {
      final currentExercise = exercises[currentExerciseIndex.value];
      if (currentExercise.isTimeBased) {
        remainingSeconds.value = currentExercise.durationSeconds;
        _startTimer();
      } else {
        remainingSeconds.value = 0; // Chờ người dùng tự bấm next
      }
    }
  }

  void _startTimer() {
    _timer?.cancel();
    isPlaying.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
        nextExercise();
      }
    });
  }

  void pauseResume() {
    if (isPlaying.value) {
      _timer?.cancel();
      isPlaying.value = false;
    } else {
      _startTimer();
    }
  }

  void nextExercise() {
    _timer?.cancel();
    if (currentExerciseIndex.value < exercises.length - 1) {
      currentExerciseIndex.value++;
      _startCurrentExercise();
    } else {
      Get.back(); // hoặc chuyển đến màn hình Complete
      Get.snackbar('Hoàn thành', 'Chúc mừng bạn đã hoàn thành bài tập hôm nay!');
    }
  }

  void previousExercise() {
    if (currentExerciseIndex.value > 0) {
      _timer?.cancel();
      currentExerciseIndex.value--;
      _startCurrentExercise();
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
