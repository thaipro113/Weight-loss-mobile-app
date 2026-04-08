import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/workout_controller.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  
  final WorkoutController controller = Get.put(WorkoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GIẢM CÂN TRONG 30 NGÀY', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _buildProgressHeader(),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.plans.length,
                itemBuilder: (context, index) {
                  final plan = controller.plans[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      leading: CircleAvatar(
                        backgroundColor: plan.isCompleted ? AppColors.success : AppColors.primaryLight,
                        child: Text(plan.dayNumber.toString(), style: TextStyle(color: plan.isCompleted ? Colors.white : AppColors.primaryDark, fontWeight: FontWeight.bold)),
                      ),
                      title: Text(plan.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      subtitle: plan.exercises.isEmpty 
                        ? const Text('Nghỉ ngơi để cơ bắp phục hồi') 
                        : Text('${plan.exercises.length} bài tập • ${plan.durationMinutes} phút'),
                      trailing: plan.isCompleted 
                        ? const Icon(Icons.check_circle, color: AppColors.success)
                        : const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textSecondary),
                      onTap: () {
                        if (plan.exercises.isEmpty) {
                          Get.snackbar('Ngày nghỉ', 'Hôm nay bạn được nghỉ ngơi!');
                        } else {
                          controller.selectDay(plan);
                          Get.toNamed(AppRoutes.DAY_DETAIL);
                        }
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('2', 'NGÀY MỤC TIÊU'),
          _buildStatItem('12', 'BAO NHIÊU PHÚT'),
          _buildStatItem('340', 'KCAL'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
