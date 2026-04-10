import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/survey_controller.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class SurveyFrequencyView extends StatelessWidget {
  const SurveyFrequencyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curFrequencies = [
      {'title': '1-2 ngày / tuần', 'desc': 'Phù hợp người bận rộn'},
      {'title': '3-4 ngày / tuần', 'desc': 'Cân bằng và hiệu quả'},
      {'title': '5-7 ngày / tuần', 'desc': 'Kết quả nhanh nhất'},
    ];

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
                'Mật độ tập luyện?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Tần suất tập luyện bạn có thể duy trì.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  itemCount: curFrequencies.length,
                  itemBuilder: (context, index) {
                    final item = curFrequencies[index];
                    return Obx(() {
                      final isSelected = Get.find<SurveyController>().frequency.value == item['title'];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: GestureDetector(
                          onTap: () => Get.find<SurveyController>().frequency.value = item['title']!,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.grey[100],
                              border: Border.all(
                                color: isSelected ? AppColors.primary : Colors.transparent,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title']!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.bold,
                                    color: isSelected ? AppColors.primary : Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['desc']!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isSelected ? AppColors.primary.withOpacity(0.8) : Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
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
          value: 0.75,
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
            onPressed: () {
              if (Get.find<SurveyController>().frequency.value.isNotEmpty) {
                Get.toNamed(AppRoutes.SURVEY_INJURY);
              } else {
                Get.snackbar('Thông báo', 'Vui lòng chọn mật độ tập', snackPosition: SnackPosition.BOTTOM);
              }
            },
            child: const Text('TIẾP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
