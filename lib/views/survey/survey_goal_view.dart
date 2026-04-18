import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/survey_controller.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class SurveyGoalView extends StatelessWidget {
  const SurveyGoalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final curGoals = [
      {'title': 'Giảm cân', 'image': 'assets/images/anhbatdau1.jpg'}, // Mapped to existing local asset
      {'title': 'Tăng cơ', 'image': 'assets/images/anhbatdau3.jpg'}, // Mapped to existing local asset
      {'title': 'Giữ dáng', 'image': 'assets/images/anhbatdau4.jpg'}, // Mapped to existing local asset
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(2), child: const LinearProgressIndicator(value: 1.0, backgroundColor: Color(0xFFE0E0E0), valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1CB096)), minHeight: 4))),
                  const SizedBox(width: 8),
                  Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(2), child: const LinearProgressIndicator(value: 0.0, backgroundColor: Color(0xFFE0E0E0), valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1CB096)), minHeight: 4))),
                  const SizedBox(width: 8),
                  Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(2), child: const LinearProgressIndicator(value: 0.0, backgroundColor: Color(0xFFE0E0E0), valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1CB096)), minHeight: 4))),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '\"\n',
                        style: TextStyle(fontSize: 50, color: Colors.grey, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, height: 0.8),
                      ),
                      TextSpan(
                        text: 'Mục tiêu chính \ncủa bạn?',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.black, height: 1.1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F7F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.water_drop, color: Color(0xFF0075FF), size: 30),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Chúng tôi sẽ thiết kế kết hợp tốt nhất bài tập sức mạnh và cardio phù hợp với mục tiêu của bạn.',
                        style: TextStyle(fontSize: 14, color: Colors.black87.withOpacity(0.7)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemCount: curGoals.length,
                itemBuilder: (context, index) {
                  final item = curGoals[index];
                  return Obx(() {
                    final isSelected = Get.find<SurveyController>().goal.value == item['title'];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: GestureDetector(
                        onTap: () => Get.find<SurveyController>().goal.value = item['title']!,
                        child: Container(
                          height: 100, // Fixed height to clip image correctly
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: isSelected ? const Color(0xFF1CB096) : Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // Text
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    item['title']!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: isSelected ? const Color(0xFF1CB096) : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              // Image Placeholder
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(bottomRight: Radius.circular(14), topRight: Radius.circular(14)),
                                  child: Image.asset(
                                    item['image']!,
                                    width: 150, // Image from right side
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 150,
                                        color: Colors.grey[100],
                                        child: const Center(child: Icon(Icons.image, color: Colors.grey)),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // Checkmark
                              if (isSelected)
                                const Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Icon(Icons.check_circle, color: Color(0xFF1CB096), size: 24),
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
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: () {
                    if (Get.find<SurveyController>().goal.value.isNotEmpty) {
                      Get.toNamed(AppRoutes.SURVEY_AGE); // Navigate
                    } else {
                      Get.snackbar('Thông báo', 'Vui lòng chọn mục tiêu', snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child: const Text('Tiếp', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
