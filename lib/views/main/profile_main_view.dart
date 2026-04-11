import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../routes/app_routes.dart';

class ProfileMainView extends StatefulWidget {
  const ProfileMainView({Key? key}) : super(key: key);

  @override
  State<ProfileMainView> createState() => _ProfileMainViewState();
}

class _ProfileMainViewState extends State<ProfileMainView> {
  @override
  Widget build(BuildContext context) {
    final isDark = Get.isDarkMode;
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text('TÔI', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black, fontSize: 24, letterSpacing: 1.2)),
        backgroundColor: isDark ? Theme.of(context).appBarTheme.backgroundColor : const Color(0xFFF9F9F9),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: isDark ? Colors.white : Colors.black87),
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
    final isDark = Get.isDarkMode;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.grey[200],
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
        Text(
          'Người dùng mới',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black),
        ),
        const SizedBox(height: 4),
        Text(
          'Thành viên Miễn phí',
          style: TextStyle(fontSize: 16, color: isDark ? Colors.grey[400] : Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildStats() {
    final isDark = Get.isDarkMode;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _statItem('Cân Nặng', '75.0 kg', AppRoutes.PROFILE_WEIGHT_TRACKER),
            Container(height: 40, width: 1, color: isDark ? Colors.grey[800] : Colors.grey[300]),
            _statItem('BMI', '23.5', AppRoutes.PROFILE_WEIGHT_TRACKER),
            Container(height: 40, width: 1, color: isDark ? Colors.grey[800] : Colors.grey[300]),
            _statItem('Lịch Sử', '12 bài', AppRoutes.PROFILE_HISTORY),
          ],
        ),
      ),
    );
  }

  Widget _statItem(String label, String value, String route) {
    final isDark = Get.isDarkMode;
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black87)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 14, color: isDark ? Colors.grey[400] : Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildMenuOptions() {
    final isDark = Get.isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
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
          
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.dark_mode, color: AppColors.primary),
            ),
            title: Text('Giao diện tối', style: TextStyle(fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black87)),
            trailing: Switch(
              value: isDark,
              onChanged: (v) {
                Get.changeThemeMode(v ? ThemeMode.dark : ThemeMode.light);
                setState(() {});
              },
              activeColor: AppColors.primary,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          ),
          
          _menuTile(Icons.help_outline, 'Hỗ trợ & Trợ giúp', AppRoutes.SETTINGS_HELP),
          _menuTile(Icons.privacy_tip_outlined, 'Chính sách bảo mật', AppRoutes.SETTINGS_PRIVACY),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _menuTile(IconData icon, String title, String route, {Color iconColor = const Color(0xFF1CB5E0)}) {
    final isDark = Get.isDarkMode;
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: isDark ? Colors.white : Colors.black87)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () => Get.toNamed(route),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
    );
  }
}
