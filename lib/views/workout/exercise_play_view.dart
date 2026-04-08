import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/exercise_controller.dart';
import '../../theme/app_colors.dart';

class ExercisePlayView extends StatelessWidget {
  const ExercisePlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Khởi tạo controller tự động hủy khi rời màn hình
    final ExerciseController controller = Get.put(ExerciseController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tập Luyện'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
      body: Obx(() {
        if (controller.exercises.isEmpty) return const Center(child: Text('Không có dữ liệu'));
        
        final exercise = controller.exercises[controller.currentExerciseIndex.value];
        
        return Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: const Icon(Icons.ondemand_video, size: 100, color: Colors.grey),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      exercise.title.toUpperCase(),
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    if (exercise.isTimeBased)
                      Text(
                        '00:${controller.remainingSeconds.value.toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: AppColors.primary),
                      )
                    else
                      Text(
                        'x${exercise.reps}',
                        style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: AppColors.primary),
                      ),
                    
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.skip_previous, size: 40),
                          onPressed: controller.previousExercise,
                        ),
                        if (exercise.isTimeBased)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                            ),
                            onPressed: controller.pauseResume,
                            child: Icon(controller.isPlaying.value ? Icons.pause : Icons.play_arrow, size: 40),
                          ),
                        IconButton(
                          icon: const Icon(Icons.skip_next, size: 40),
                          onPressed: controller.nextExercise,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
