import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/survey_controller.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class SurveyFocusAreaView extends StatelessWidget {
  const SurveyFocusAreaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curFocusAreas = [
      {'title': 'Toàn thân', 'icon': Icons.accessibility_new},
      {'title': 'Cơ ngực', 'icon': Icons.favorite},
      {'title': 'Cơ bụng', 'icon': Icons.square},
      {'title': 'Cơ chân', 'icon': Icons.directions_run},
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
                'Vùng cơ nào bạn tập trung?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Chọn vùng cơ chính bạn muốn cải thiện.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  itemCount: curFocusAreas.length,
                  itemBuilder: (context, index) {
                    final item = curFocusAreas[index];
                    return Obx(() {
                      final isSelected = Get.find<SurveyController>().focusArea.value == item['title'];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: GestureDetector(
                          onTap: () => Get.find<SurveyController>().focusArea.value = item['title'] as String,
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
                            child: Row(
                              children: [
                                Icon(item['icon'] as IconData, size: 30, color: isSelected ? AppColors.primary : Colors.black54),
                                const SizedBox(width: 16),
                                Text(
                                  item['title'] as String,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    color: isSelected ? AppColors.primary : Colors.black87,
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
          value: 0.2,
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
              if (Get.find<SurveyController>().focusArea.value.isNotEmpty) {
                Get.toNamed(AppRoutes.SURVEY_GOAL);
              } else {
                Get.snackbar('Thông báo', 'Vui lòng chọn vùng cơ trọng tâm', snackPosition: SnackPosition.BOTTOM);
              }
            },
            child: const Text('TIẾP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
