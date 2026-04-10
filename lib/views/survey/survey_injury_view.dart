import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/survey_controller.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class SurveyInjuryView extends StatelessWidget {
  const SurveyInjuryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final injuries = ['Không, tôi khỏe mạnh', 'Lưng', 'Đầu gối', 'Vai', 'Cổ', 'Khác'];

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
                'Bạn có chấn thương nào không?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Chọn tất cả các mục áp dụng để chúng tôi loại bỏ bài tập nguy hiểm.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  itemCount: injuries.length,
                  itemBuilder: (context, index) {
                    final item = injuries[index];
                    return Obx(() {
                      final isSelected = Get.find<SurveyController>().injuryList.contains(item);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            if (item == 'Không, tôi khỏe mạnh') {
                              Get.find<SurveyController>().injuryList.clear();
                              Get.find<SurveyController>().injuryList.add(item);
                            } else {
                              Get.find<SurveyController>().injuryList.remove('Không, tôi khỏe mạnh');
                              Get.find<SurveyController>().toggleInjury(item);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                                Expanded(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                      color: isSelected ? AppColors.primary : Colors.black87,
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(Icons.check_circle, color: AppColors.primary),
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
          value: 0.9,
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
              if (Get.find<SurveyController>().injuryList.isNotEmpty) {
                Get.toNamed(AppRoutes.SURVEY_PROCESSING);
              } else {
                Get.snackbar('Thông báo', 'Vui lòng chọn hoặc báo cáo không có chấn thương', snackPosition: SnackPosition.BOTTOM);
              }
            },
            child: const Text('TIẾP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
