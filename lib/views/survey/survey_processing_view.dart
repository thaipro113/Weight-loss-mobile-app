import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class SurveyProcessingView extends StatefulWidget {
  const SurveyProcessingView({Key? key}) : super(key: key);

  @override
  State<SurveyProcessingView> createState() => _SurveyProcessingViewState();
}

class _SurveyProcessingViewState extends State<SurveyProcessingView> {
  double _progress = 0.0;
  String _statusText = 'Đang phân tích thông tin...';

  @override
  void initState() {
    super.initState();
    _startProcessing();
  }

  void _startProcessing() async {
    // Simulate AI processing steps
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      _progress = 0.3;
      _statusText = 'Tính toán chỉ số BMI...';
    });

    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      _progress = 0.7;
      _statusText = 'Lựa chọn bài tập phù hợp...';
    });

    await Future.delayed(const Duration(milliseconds: 1200));
    setState(() {
      _progress = 1.0;
      _statusText = 'Hoàn tất kế hoạch!';
    });

    await Future.delayed(const Duration(milliseconds: 800));
    Get.offAllNamed(AppRoutes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        value: _progress,
                        strokeWidth: 10,
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                      ),
                    ),
                    Text(
                      '${(_progress * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                Text(
                  _statusText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Vui lòng chờ trong giây lát.\nQuá trình này giúp lộ trình của bạn đạt hiệu quả cao nhất.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
