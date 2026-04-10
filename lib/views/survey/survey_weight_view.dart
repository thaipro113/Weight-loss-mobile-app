import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/survey_controller.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class SurveyWeightView extends StatelessWidget {
  const SurveyWeightView({Key? key}) : super(key: key);

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
                'Cân nặng của bạn?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Hãy chân thành, điều này giúp kế hoạch chính xác hơn.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Obx(() => Text(
                        '${curController.weight.value}',
                        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.black87),
                      )),
                  const SizedBox(width: 8),
                  const Text(
                    'kg',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Obx(() => Slider(
                    value: curController.weight.value.toDouble(),
                    min: 30,
                    max: 200,
                    activeColor: AppColors.primary,
                    inactiveColor: Colors.grey[300],
                    onChanged: (val) {
                      curController.weight.value = val.toInt();
                    },
                  )),
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
          value: 0.6,
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
            onPressed: () => Get.toNamed(AppRoutes.SURVEY_FREQUENCY), // Chuyển sang Frequency
            child: const Text('TIẾP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
