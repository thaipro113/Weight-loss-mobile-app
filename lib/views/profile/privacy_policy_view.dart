import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Chính Sách Bảo Mật', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Get.back()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Cập nhật lần cuối: Tháng 4, 2026', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            _buildSection('1. Giới thiệu', 'Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi. Chúng tôi cam kết bảo vệ toàn vẹn thông tin cá nhân của bạn, bao gồm chỉ số khối cơ thể (BMI), cân nặng, chiều cao và lịch sử luyện tập.'),
            _buildSection('2. Thu thập dữ liệu', 'Chúng tôi chỉ thu thập các dữ liệu mà bạn tự nguyện cung cấp (tuổi, cân nặng, mục tiêu) để cung cấp trải nghiệm luyện tập và bài báo cáo tốt nhất, phù hợp nhất với bản thân bạn.'),
            _buildSection('3. Dữ liệu bên thứ 3', 'Ứng dụng không bán hoặc chia sẻ thông tin nhận dạng cá nhân của bạn cho bên thứ 3 dưới mọi hình thức, ngoại trừ các dịch vụ xác thực tài khoản và đám mây máy chủ.'),
            _buildSection('4. Xóa dữ liệu', 'Bạn có quyền chọn "Xóa tài khoản" bất kỳ lúc nào trong cài đặt. Toàn bộ hồ sơ cá nhân và lịch sử luyện tập sẽ bị xóa bỏ vĩnh viễn khỏi toàn bộ hệ thống của chúng tôi sau 7 ngày xử lý.'),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(content, style: TextStyle(color: Colors.grey[400], fontSize: 15, height: 1.5)),
        ],
      ),
    );
  }
}
