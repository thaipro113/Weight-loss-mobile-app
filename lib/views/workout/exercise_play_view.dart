import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/exercise_controller.dart';
import '../../theme/app_colors.dart';
import '../../models/exercise.dart';

class ExercisePlayView extends StatelessWidget {
  const ExercisePlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExerciseController controller = Get.put(ExerciseController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.exercises.isEmpty) return const Center(child: Text('Không có dữ liệu'));
        
        final state = controller.workoutState.value;
        final exercise = controller.exercises[controller.currentExerciseIndex.value];
        
        if (state == WorkoutState.ready) return _buildReadyScreen(controller, exercise);
        if (state == WorkoutState.resting) {
          final nextIdx = controller.currentExerciseIndex.value;
          final nextExercise = nextIdx < controller.exercises.length ? controller.exercises[nextIdx] : null;
          return _buildRestScreen(controller, nextExercise);
        }
        
        return _buildPlayScreen(context, controller, exercise);
      }),
    );
  }

  Widget _buildReadyScreen(ExerciseController controller, Exercise exercise) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Get.back()),
          ),
          const Spacer(),
          Image.asset(exercise.imageUrl, height: 250, fit: BoxFit.contain),
          const SizedBox(height: 40),
          const Text('ĐÃ SẴN SÀNG TẬP!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primary)),
          const SizedBox(height: 10),
          Text(exercise.title, style: const TextStyle(fontSize: 18, color: Colors.grey)),
          const SizedBox(height: 30),
          Text('00:0${controller.remainingSeconds.value}', style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            onPressed: controller.skipReady, 
            child: const Text('Bỏ qua', style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildPlayScreen(BuildContext context, ExerciseController controller, Exercise exercise) {
    return Column(
      children: [
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Get.back()),
          ),
        ),
        Image.asset(exercise.imageUrl, height: 250, fit: BoxFit.contain),
        const SizedBox(height: 20),
        Text(exercise.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        if (exercise.isTimeBased)
          Text(
            '00:${controller.remainingSeconds.value.toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          )
        else
          Text(
            'x ${exercise.reps}',
            style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: controller.previousExercise,
                icon: const Icon(Icons.arrow_back_ios, size: 14, color: Colors.black54),
                label: const Text('TRƯỚC', style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold)),
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
              ),
              if (exercise.isTimeBased)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  ),
                  onPressed: controller.pauseResume,
                  child: Text(controller.isPlaying.value ? 'TẠM DỪNG' : 'TIẾP TỤC', style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                )
              else
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                  ),
                  onPressed: controller.finishCurrentExercise,
                  child: const Text('XONG ✓', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              TextButton(
                onPressed: controller.nextExercise,
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: const Row(
                  children: [
                    Text('BỎ QUA', style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black54),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRestScreen(ExerciseController controller, Exercise? nextExercise) {
    return Container(
      color: AppColors.primaryDark,
      width: double.infinity,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text('NGHỈ NGƠI', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 20),
            Text('00:${controller.remainingSeconds.value.toString().padLeft(2, '0')}', style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  onPressed: () => controller.addRestTime(20),
                  child: const Text('+20s', style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primaryDark,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  onPressed: controller.skipRest,
                  child: const Text('Bỏ qua', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const Spacer(),
            if (nextExercise != null)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('TIẾP THEO ${controller.currentExerciseIndex.value + 1}/${controller.exercises.length}', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(nextExercise.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        if (nextExercise.isTimeBased)
                          Text('00:${nextExercise.durationSeconds.toString().padLeft(2, '0')}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary))
                        else
                          Text('x ${nextExercise.reps}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary))
                      ],
                    ),
                    const SizedBox(height: 20),
                    Image.asset(nextExercise.imageUrl, height: 150, fit: BoxFit.contain),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
