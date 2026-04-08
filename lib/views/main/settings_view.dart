import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài Đặt', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Tài Khoản & Hồ Sơ', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryDark)),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Hồ sơ của tôi'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Nhắc nhở tập luyện'),
            trailing: Switch(value: true, onChanged: (v) {}, activeColor: AppColors.primary),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Tùy Chọn Luyện Tập', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryDark)),
          ),
          ListTile(
            leading: const Icon(Icons.volume_up),
            title: const Text('Âm thanh hướng dẫn'),
            trailing: Switch(value: true, onChanged: (v) {}, activeColor: AppColors.primary),
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Thời gian đếm ngược chuẩn bị'),
            subtitle: const Text('10 giây'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Ngôn ngữ'),
            subtitle: const Text('Tiếng Việt'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
