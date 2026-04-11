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
                  Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(2), child: const LinearProgressIndicator(value: 1.0, backgroundColor: Color(0xFFE0E0E0), valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1CB096)), minHeight: 4))),
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
                        text: 'Cân nặng \ncủa bạn?',
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
                  'Hãy chân thành, điều này giúp tính BMI chính xác.',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Obx(() => Text(
                      '${curController.weight.value}',
                      style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.black87),
                    )),
                const SizedBox(width: 8),
                const Text(
                  'kg',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Obx(() => Slider(
                    value: curController.weight.value.toDouble(),
                    min: 30,
                    max: 200,
                    activeColor: const Color(0xFF1CB096),
                    inactiveColor: const Color(0xFFE0E0E0),
                    thumbColor: const Color(0xFF1CB096),
                    onChanged: (val) {
                      curController.weight.value = val.toInt();
                    },
                  )),
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
                  onPressed: () => Get.toNamed(AppRoutes.SURVEY_FREQUENCY),
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
