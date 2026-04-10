import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../controllers/survey_controller.dart';

class SurveyWelcomeView extends StatelessWidget {
  const SurveyWelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // Placeholder image for personal trainer / welcome
              Center(
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/homegym.png'), // Mặc định dùng tạm ảnh có sẵn
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              const Text(
                'Cùng bắt đầu xây dựng kế hoạch cá nhân hoá cho bạn',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Để có kết quả tốt nhất, chúng tôi cần biết một vài thông tin về bạn.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Get.put(SurveyController());
                    Get.toNamed(AppRoutes.SURVEY_FOCUS_AREA);
                  },
                  child: const Text(
                    'TÔI ĐÃ SẴN SÀNG',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
