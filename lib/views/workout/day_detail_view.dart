import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/workout_controller.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class DayDetailView extends StatelessWidget {
  const DayDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WorkoutController controller = Get.find();
    final plan = controller.selectedPlan.value;

    if (plan == null) return const Scaffold();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ngày ${plan.dayNumber}', style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text('${plan.exercises.length} BÀI TẬP • ${plan.durationMinutes} PHÚT', 
              style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: plan.exercises.length,
              itemBuilder: (context, index) {
                final exercise = plan.exercises[index];
                return ListTile(
                  leading: const Icon(Icons.fitness_center),
                  title: Text(exercise.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(exercise.isTimeBased ? '00:${exercise.durationSeconds}' : 'x${exercise.reps}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.EXERCISE_PLAY);
                },
                child: const Text('BẮT ĐẦU', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
