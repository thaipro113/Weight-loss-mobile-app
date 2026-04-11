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
      {'title': '1-2 lần/tuần', 'desc': 'Phù hợp cho người bận rộn'},
      {'title': '3-4 lần/tuần', 'desc': 'Tôi thích tập luyện như một phần của lối sống'},
      {'title': '5-7 lần/tuần', 'desc': 'Tôi muốn thấy kết quả nhanh nhất có thể'},
    ];

    // Set default if empty
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.find<SurveyController>().frequency.value.isEmpty) {
          Get.find<SurveyController>().frequency.value = '3-4 lần/tuần';
      }
    });

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
                  Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(2), child: const LinearProgressIndicator(value: 0.5, backgroundColor: Color(0xFFE0E0E0), valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1CB096)), minHeight: 4))),
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
                        text: 'Mật độ tập luyện\ncủa bạn?',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.black, height: 1.1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                 final currentVal = Get.find<SurveyController>().frequency.value;
                 int currentIndex = 1; // default to 3-4 times
                 if (currentVal == '1-2 lần/tuần') currentIndex = 0;
                 if (currentVal == '5-7 lần/tuần') currentIndex = 2;

                 return Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     // Calendar icon
                     const Icon(Icons.calendar_month, size: 100, color: Colors.blueAccent),
                     const SizedBox(height: 24),
                     Text(
                       curFrequencies[currentIndex]['title']!,
                       style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                     ),
                     const SizedBox(height: 8),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 40.0),
                       child: Text(
                         curFrequencies[currentIndex]['desc']!,
                         textAlign: TextAlign.center,
                         style: const TextStyle(fontSize: 16, color: Colors.black54),
                       ),
                     ),
                     const SizedBox(height: 40),
                     // Custom slider
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 40.0),
                       child: Column(
                         children: [
                           SliderTheme(
                             data: SliderTheme.of(context).copyWith(
                               activeTrackColor: const Color(0xFFE8F7F5),
                               inactiveTrackColor: const Color(0xFFE8F7F5),
                               thumbColor: const Color(0xFF1CB096),
                               activeTickMarkColor: const Color(0xFF1CB096).withOpacity(0.5),
                               inactiveTickMarkColor: const Color(0xFF1CB096).withOpacity(0.5),
                               trackHeight: 12.0,
                               thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                               tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 4.0),
                             ),
                             child: Slider(
                               value: currentIndex.toDouble(),
                               min: 0,
                               max: 2,
                               divisions: 2,
                               onChanged: (value) {
                                  Get.find<SurveyController>().frequency.value = curFrequencies[value.toInt()]['title']!;
                               },
                             ),
                           ),
                           const Padding(
                             padding: EdgeInsets.symmetric(horizontal: 10.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text('Ít hơn', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                 Text('Nhiều hơn', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                               ],
                             ),
                           )
                         ],
                       ),
                     )
                   ],
                 );
              }),
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
                    if (Get.find<SurveyController>().frequency.value.isNotEmpty) {
                      Get.toNamed(AppRoutes.SURVEY_INJURY);
                    } else {
                      Get.snackbar('Thông báo', 'Vui lòng chọn mật độ tập', snackPosition: SnackPosition.BOTTOM);
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
