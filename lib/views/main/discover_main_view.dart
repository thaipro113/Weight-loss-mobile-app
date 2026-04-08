import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../routes/app_routes.dart';

class DiscoverMainView extends StatelessWidget {
  const DiscoverMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Khám Phá', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textPrimary),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildHighlightCard(),
              const SizedBox(height: 32),
              const Text('Chuyên mục Tập Luyện', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 16),
              _buildCategoryGrid(),
              const SizedBox(height: 32),
              const Text('Thử thách nâng cao', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 16),
              _buildChallengeList(),
              const SizedBox(height: 32),
              const Text('Kiến thức Dinh dưỡng', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 16),
              _buildArticleList(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightCard() {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.DISCOVER_FULLBODY),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryDark]),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 5)),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              bottom: -20,
              child: Icon(Icons.fitness_center, size: 150, color: Colors.white.withOpacity(0.2)),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HIIT Đốt Mỡ Thừa', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('15 phút • Cường độ cao', style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Text('Tập Ngay', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    final categories = [
      {'title': 'Cơ Bụng', 'route': AppRoutes.DISCOVER_ABS, 'icon': Icons.sports_gymnastics},
      {'title': 'Cơ Ngực', 'route': AppRoutes.DISCOVER_CHEST, 'icon': Icons.fitness_center},
      {'title': 'Cơ Tay', 'route': AppRoutes.DISCOVER_ARMS, 'icon': Icons.sports_kabaddi},
      {'title': 'Cơ Chân', 'route': AppRoutes.DISCOVER_LEGS, 'icon': Icons.directions_run},
      {'title': 'Yoga', 'route': AppRoutes.DISCOVER_YOGA, 'icon': Icons.self_improvement},
      {'title': 'Giãn Cơ', 'route': AppRoutes.DISCOVER_STRETCHING, 'icon': Icons.accessibility_new},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final cat = categories[index];
        return GestureDetector(
          onTap: () => Get.toNamed(cat['route'] as String),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(cat['icon'] as IconData, size: 40, color: AppColors.primary),
                const SizedBox(height: 8),
                Text(cat['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildChallengeList() {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.DISCOVER_CHALLENGES),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF3E0),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.orange.withOpacity(0.5)),
        ),
        child: Row(
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 40),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Thử thách 21 ngày lột xác', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text('Theo dõi lộ trình nâng cao', style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange[800]),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleList() {
    return Column(
      children: List.generate(3, (index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.restaurant, color: Colors.grey),
          ),
          title: const Text('Thực đơn Eat Clean cho 7 ngày', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text('Dinh dưỡng đóng vai trò cốt lõi...', maxLines: 1, overflow: TextOverflow.ellipsis),
          onTap: () => Get.toNamed(AppRoutes.DISCOVER_ARTICLE_DETAIL),
        );
      }),
    );
  }
}
