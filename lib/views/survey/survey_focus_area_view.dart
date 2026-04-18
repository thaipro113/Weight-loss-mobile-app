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
      'Vai',
      'Ngực',
      'Bụng',
      'Bắp chân',
      'Toàn thân',
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
                  Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(2), child: const LinearProgressIndicator(value: 0.5, backgroundColor: Color(0xFFE0E0E0), valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1CB096)), minHeight: 4))),
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
                        text: 'Vùng cơ nào bạn\ntập trung?',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.black, height: 1.1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  // Image Placeholder
                  Positioned(
                    left: -30,
                    bottom: 0,
                    top: 20,
                    child: IgnorePointer(
                      child: Image.asset(
                        'assets/images/body_focus.png', // Save your image here
                        width: 250,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                           return Container(
                             width: 250,
                             color: Colors.transparent,
                             child: const Center(child: Icon(Icons.accessibility, size: 200, color: Colors.black12)),
                           );
                        },
                      ),
                    ),
                  ),
                  // Options
                  Positioned(
                    right: 24,
                    top: 20,
                    bottom: 0,
                    width: 210,
                    child: ListView.builder(
                      itemCount: curFocusAreas.length,
                      itemBuilder: (context, index) {
                        final item = curFocusAreas[index];
                        return Obx(() {
                          final isSelected = Get.find<SurveyController>().focusArea.value == item;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: GestureDetector(
                              onTap: () => Get.find<SurveyController>().focusArea.value = item,
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: isSelected ? const Color(0xFFF2FBF9) : Colors.white,
                                  border: Border.all(
                                    color: isSelected ? const Color(0xFF1CB096) : Colors.transparent,
                                    width: 1.5,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                                          color: isSelected ? const Color(0xFF1CB096) : Colors.black87,
                                        ),
                                      ),
                                    ),
                                    if (isSelected)
                                      const Icon(Icons.check_circle, color: Color(0xFF1CB096), size: 20),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                ],
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
                    if (Get.find<SurveyController>().focusArea.value.isNotEmpty) {
                      Get.toNamed(AppRoutes.SURVEY_GOAL);
                    } else {
                      Get.snackbar('Thông báo', 'Vui lòng chọn vùng cơ trọng tâm', snackPosition: SnackPosition.BOTTOM);
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
