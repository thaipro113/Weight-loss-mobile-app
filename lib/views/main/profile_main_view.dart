import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../routes/app_routes.dart';

class ProfileMainView extends StatelessWidget {
  const ProfileMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // Light Theme
      appBar: AppBar(
        title: const Text('TÔI', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24, letterSpacing: 1.2)),
        backgroundColor: const Color(0xFFF9F9F9),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black87),
            onPressed: () => Get.toNamed(AppRoutes.SETTINGS_MAIN),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileHeader(),
            const SizedBox(height: 30),
            _buildStats(),
            const SizedBox(height: 30),
            _buildMenuOptions(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF1CB5E0), width: 3),
              ),
              child: const Icon(Icons.person, size: 80, color: Colors.grey),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.PROFILE_EDIT),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1CB5E0),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 20),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Người dùng mới',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Text(
          'Thành viên Miễn phí',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _statItem('Cân Nặng', '75.0 kg', AppRoutes.PROFILE_WEIGHT_TRACKER),
            Container(height: 40, width: 1, color: Colors.grey[300]),
            _statItem('BMI', '23.5', AppRoutes.PROFILE_WEIGHT_TRACKER),
            Container(height: 40, width: 1, color: Colors.grey[300]),
            _statItem('Lịch Sử', '12 bài', AppRoutes.PROFILE_HISTORY),
          ],
        ),
      ),
    );
  }

  Widget _statItem(String label, String value, String route) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildMenuOptions() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, -4)),
        ],
      ),
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _menuTile(Icons.workspace_premium, 'Nâng cấp Premium', AppRoutes.PROFILE_PREMIUM, iconColor: Colors.orange),
          _menuTile(Icons.emoji_events, 'Thành tích của tôi', AppRoutes.PROFILE_ACHIEVEMENTS),
          _menuTile(Icons.history, 'Lịch sử luyện tập', AppRoutes.PROFILE_HISTORY),
          _menuTile(Icons.pie_chart, 'Biểu đồ cân nặng', AppRoutes.PROFILE_WEIGHT_TRACKER),
          const Divider(color: Colors.black12),
          _menuTile(Icons.help_outline, 'Hỗ trợ & Trợ giúp', AppRoutes.SETTINGS_HELP),
          _menuTile(Icons.privacy_tip_outlined, 'Chính sách bảo mật', AppRoutes.SETTINGS_PRIVACY),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _menuTile(IconData icon, String title, String route, {Color iconColor = const Color(0xFF1CB5E0)}) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () => Get.toNamed(route),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    );
  }
}
