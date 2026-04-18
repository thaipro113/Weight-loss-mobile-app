import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PremiumUpgradeView extends StatelessWidget {
  const PremiumUpgradeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE65C00), Color(0xFFF9D423)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: () => Get.back(),
                  ),
                ),
                const SizedBox(height: 40),
                const Icon(Icons.workspace_premium, color: Colors.white, size: 80),
                const SizedBox(height: 16),
                const Text('NÂNG CẤP PREMIUM', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                const SizedBox(height: 8),
                const Text('Mở khóa tiềm năng tối đa của bạn', style: TextStyle(color: Colors.white70, fontSize: 16)),
                const SizedBox(height: 40),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF111111),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Quyền lợi khi nâng cấp:', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 24),
                        _buildFeatureRow('Truy cập toàn bộ 500+ Bài tập chuyên gia'),
                        _buildFeatureRow('Lộ trình tập luyện cá nhân hóa 100%'),
                        _buildFeatureRow('Thống kê cơ thể chi tiết từng tuần'),
                        _buildFeatureRow('Tắt hoàn toàn quảng cáo'),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                            child: const Text('BẮT ĐẦU DÙNG THỬ MIỄN PHÍ 7 NGÀY', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Center(child: Text('Chỉ 49.000đ / tháng sau khi hết dùng thử. Hủy bất kỳ lúc nào.', style: TextStyle(color: Colors.grey, fontSize: 12), textAlign: TextAlign.center))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.amber, size: 24),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 15))),
        ],
      ),
    );
  }
}
