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
                  Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(2), child: const LinearProgressIndicator(value: 0.33, backgroundColor: Color(0xFFE0E0E0), valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1CB096)), minHeight: 4))),
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
                        text: 'Bạn bao nhiêu \ntuổi?',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.black, height: 1.1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Giúp chúng tôi điều chỉnh lượng bài tập phù hợp.',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (curController.age.value > 10) curController.age.value--;
                  },
                  icon: const Icon(Icons.remove_circle_outline, size: 50, color: Color(0xFF1CB096)),
                ),
                const SizedBox(width: 30),
                Obx(() => Text(
                      '${curController.age.value}',
                      style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.black87),
                    )),
                const SizedBox(width: 30),
                IconButton(
                  onPressed: () {
                    if (curController.age.value < 100) curController.age.value++;
                  },
                  icon: const Icon(Icons.add_circle_outline, size: 50, color: Color(0xFF1CB096)),
                ),
              ],
            ),
            const Spacer(),
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
                  onPressed: () => Get.toNamed(AppRoutes.SURVEY_HEIGHT),
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
