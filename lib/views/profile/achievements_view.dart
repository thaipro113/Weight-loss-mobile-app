import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';

class AchievementsView extends StatelessWidget {
  const AchievementsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Thành Tích Cá Nhân', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Get.back()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Đã đạt được (3)', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildGrid(isUnlocked: true),
            const SizedBox(height: 32),
            const Text('Chưa mở khóa (15)', style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildGrid(isUnlocked: false),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid({required bool isUnlocked}) {
    final unlockedBadges = [
      {'title': 'Người Mới Bắt Đầu', 'icon': Icons.emoji_events, 'color': Colors.amber},
      {'title': 'Tập 3 Ngày Liên Tiếp', 'icon': Icons.local_fire_department, 'color': Colors.redAccent},
      {'title': 'Vua Thức Dậy Sớm', 'icon': Icons.wb_sunny, 'color': Colors.orangeAccent},
    ];

    final lockedBadges = [
      {'title': 'Chiến Thần Đốt Mỡ', 'icon': Icons.flash_on},
      {'title': 'Tập 7 Ngày Liên Tiếp', 'icon': Icons.calendar_month},
      {'title': 'Rèn Luyện 30 Ngày', 'icon': Icons.shield},
      {'title': 'Vóc Dáng Lý Tưởng', 'icon': Icons.accessibility_new},
      {'title': 'Trăm Hiệp HIIT', 'icon': Icons.speed},
      {'title': 'Chuyên Gia Tự Nhiên', 'icon': Icons.eco},
    ];

    final list = isUnlocked ? unlockedBadges : lockedBadges;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 24,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final item = list[index];
        final iconColor = isUnlocked ? (item['color'] as Color) : Colors.grey[800];
        final bgColor = isUnlocked ? (item['color'] as Color).withOpacity(0.1) : const Color(0xFF1A1A1A);

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
                border: Border.all(color: isUnlocked ? (item['color'] as Color).withOpacity(0.5) : Colors.grey[800]!, width: 2),
              ),
              child: Icon(item['icon'] as IconData, color: iconColor, size: 36),
            ),
            const SizedBox(height: 12),
            Text(
              item['title'] as String,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isUnlocked ? Colors.white : Colors.grey[600],
                fontSize: 12,
                fontWeight: isUnlocked ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        );
      },
    );
  }
}
