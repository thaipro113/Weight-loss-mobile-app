import 'dart:async';
import 'package:get/get.dart';
import '../../models/exercise.dart';
import '../../controllers/workout_controller.dart';

enum WorkoutState { ready, playing, resting }

class ExerciseController extends GetxController {
  var workoutState = WorkoutState.ready.obs;
  var remainingSeconds = 0.obs;
  var currentExerciseIndex = 0.obs;
  var isPlaying = true.obs;
  
  Timer? _timer;
  
  final WorkoutController _workoutController = Get.find();
  
  List<Exercise> get exercises => _workoutController.selectedPlan.value?.exercises ?? [];

  @override
  void onInit() {
    super.onInit();
    if (exercises.isNotEmpty) {
      _startReadyPhase();
    }
  }

  void _startReadyPhase() {
    workoutState.value = WorkoutState.ready;
    remainingSeconds.value = 5;
    _startTimer();
  }

  void _startCurrentExercise() {
    workoutState.value = WorkoutState.playing;
    if (currentExerciseIndex.value < exercises.length) {
      final currentExercise = exercises[currentExerciseIndex.value];
      if (currentExercise.isTimeBased) {
        remainingSeconds.value = currentExercise.durationSeconds;
        _startTimer();
      } else {
        remainingSeconds.value = 0; // Chờ người dùng tự bấm Xong
        _timer?.cancel();
        isPlaying.value = true;
      }
    }
  }

  void _startRestPhase() {
    workoutState.value = WorkoutState.resting;
    remainingSeconds.value = 10;
    _startTimer();
  }

  void addRestTime(int seconds) {
    if (workoutState.value == WorkoutState.resting) {
      remainingSeconds.value += seconds;
    }
  }

  void skipReady() {
    if (workoutState.value == WorkoutState.ready) {
      _startCurrentExercise();
    }
  }

  void skipRest() {
    if (workoutState.value == WorkoutState.resting) {
      _startCurrentExercise();
    }
  }

  void finishCurrentExercise() {
    if (currentExerciseIndex.value < exercises.length - 1) {
      currentExerciseIndex.value++;
      _startRestPhase();
    } else {
      _finishWorkout();
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
        _handleTimerComplete();
      }
    });
  }

  void _handleTimerComplete() {
    if (workoutState.value == WorkoutState.ready) {
      _startCurrentExercise();
    } else if (workoutState.value == WorkoutState.playing) {
      finishCurrentExercise();
    } else if (workoutState.value == WorkoutState.resting) {
      _startCurrentExercise();
    }
  }

  void pauseResume() {
    if (workoutState.value == WorkoutState.playing && exercises[currentExerciseIndex.value].isTimeBased) {
      if (isPlaying.value) {
        _timer?.cancel();
        isPlaying.value = false;
      } else {
        _startTimer();
      }
    }
  }

  void nextExercise() {
    _timer?.cancel();
    if (currentExerciseIndex.value < exercises.length - 1) {
      if (workoutState.value == WorkoutState.resting) {
        skipRest();
      } else {
        currentExerciseIndex.value++;
        _startRestPhase();
      }
    } else {
      _finishWorkout();
    }
  }

  void previousExercise() {
    if (currentExerciseIndex.value > 0) {
      _timer?.cancel();
      currentExerciseIndex.value--;
      _startReadyPhase();
    }
  }

  void _finishWorkout() {
    _timer?.cancel();
    Get.back();
    Get.snackbar('Hoàn thành', 'Chúc mừng bạn đã hoàn thành bài tập hôm nay!');
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
