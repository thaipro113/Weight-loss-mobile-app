import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/survey_controller.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class SurveyAgeView extends StatelessWidget {
  const SurveyAgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curController = Get.find<SurveyController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Bạn bao nhiêu tuổi?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Giúp chúng tôi điều chỉnh lượng bài tập phù hợp.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (curController.age.value > 10) curController.age.value--;
                    },
                    icon: const Icon(Icons.remove_circle_outline, size: 40, color: AppColors.primary),
                  ),
                  const SizedBox(width: 40),
                  Obx(() => Text(
                        '${curController.age.value}',
                        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.black87),
                      )),
                  const SizedBox(width: 40),
                  IconButton(
                    onPressed: () {
                      if (curController.age.value < 100) curController.age.value++;
                    },
                    icon: const Icon(Icons.add_circle_outline, size: 40, color: AppColors.primary),
                  ),
                ],
              ),
              const Spacer(),
              _buildProgressAndNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressAndNextButton() {
    return Column(
      children: [
        LinearProgressIndicator(
          value: 0.4,
          backgroundColor: Colors.grey[200],
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 0,
            ),
            onPressed: () => Get.toNamed(AppRoutes.SURVEY_HEIGHT),
            child: const Text('TIẾP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
