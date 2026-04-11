import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';

class HelpSupportView extends StatelessWidget {
  const HelpSupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Hỗ Trợ & Trợ Giúp', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Get.back()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Câu hỏi thường gặp', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildFAQ('Làm sao để thay đổi mục tiêu cân nặng?', 'Bạn có thể vào trang Hồ sơ cá nhân > Click biểu tượng cái bút góc avatar để cập nhật lại thông số cá nhân và mục tiêu.'),
            _buildFAQ('Làm sao để lấy lại mật khẩu?', 'Ngoài màn hình Đăng nhập, bấm vào "Quên mật khẩu", chúng tôi sẽ gửi mã OTP về email của bạn.'),
            _buildFAQ('Tập bài HIIT bao lâu thì có hiệu quả?', 'Đối với HIIT, bạn cần kiên trì từ 14-21 ngày kết hợp với ăn uống thâm hụt calo để thấy rõ kết quả.'),
            _buildFAQ('Nâng cấp Premium có được hoàn tiền không?', 'Hiện tại chúng tôi áp dụng chính sách hoàn tiền trong vòng 24h từ lúc kích hoạt. Xin vui lòng liên hệ hệ thống.'),
            const SizedBox(height: 48),
            Center(
              child: Column(
                children: [
                  const Text('Không tìm thấy câu trả lời?', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.email, color: Colors.black),
                    label: const Text('GỬI EMAIL CHO CHÚNG TÔI', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFAQ(String question, String answer) {
    return Card(
      color: const Color(0xFF1A1A1A),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(question, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        iconColor: const Color(0xFF1CB5E0),
        collapsedIconColor: Colors.grey,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(answer, style: TextStyle(color: Colors.grey[400], height: 1.5)),
          ),
        ],
      ),
    );
  }
}
