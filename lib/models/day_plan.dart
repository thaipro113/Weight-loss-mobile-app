import 'exercise.dart';

class DayPlan {
  final int dayNumber;
  final String title;
  final int totalKcal;
  final int durationMinutes;
  final List<Exercise> exercises;
  final bool isCompleted;

  DayPlan({
    required this.dayNumber,
    required this.title,
    required this.totalKcal,
    required this.durationMinutes,
    required this.exercises,
    this.isCompleted = false,
  });
}
