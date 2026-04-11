import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_colors.dart';
import '../../routes/app_routes.dart';
import '../workout/discover_category_detail_view.dart';
import '../workout/discover_grid_detail_view.dart';

class DiscoverMainView extends StatelessWidget {
  const DiscoverMainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Light theme
      appBar: AppBar(
        title: Row(
          children: [
            const Text('KHÁM PHÁ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24, letterSpacing: 1.2)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.amber[700],
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text('PRO', style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildFocusArea(),
            const SizedBox(height: 24),
            _buildPromoBanners(),
            const SizedBox(height: 24),
            _buildWorkoutList(),
            const SizedBox(height: 24),
            _buildKegelExercises(),
            const SizedBox(height: 48), // Bottom padding
          ],
        ),
      ),
    );
  }

  Widget _buildFocusArea() {
    final areas = [
      {'title': 'Toàn thân', 'img': 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80'},
      {'title': 'Bụng', 'img': 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80'},
      {'title': 'Cánh tay', 'img': 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80'},
      {'title': 'Ngực', 'img': 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80'},
      {'title': 'Mông & chân', 'img': 'https://images.unsplash.com/photo-1434682881908-b43d0467b798?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Vùng tập trung', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: areas.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final a = areas[index];
              return GestureDetector(
                onTap: () => Get.to(() => DiscoverCategoryDetailView(categoryTitle: a['title']!)),
                child: Column(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                        image: DecorationImage(
                          image: NetworkImage(a['img']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(a['title']!, style: const TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w600)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPromoBanners() {
    return SizedBox(
      height: 170,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildBannerCard('ĐỐT MỠ', '12 Bài tập', [const Color(0xFF1CB5E0).withOpacity(0.8), const Color(0xFF000046).withOpacity(0.8)], 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
          const SizedBox(width: 16),
          _buildBannerCard('CHO NGƯỜI MỚI', '12 Bài tập', [const Color(0xFF4A00E0).withOpacity(0.8), const Color(0xFF8E2DE2).withOpacity(0.8)], 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
        ],
      ),
    );
  }

  Widget _buildBannerCard(String title, String subtitle, List<Color> gradient, String imageUrl) {
    return GestureDetector(
      onTap: () => Get.to(() => DiscoverGridDetailView(categoryTitle: title)),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
            const SizedBox(height: 8),
            Text(subtitle, style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutList() {
    final workouts = [
      {'title': 'HIIT đốt mỡ cường độ cao', 'level': 'Trung bình', 'img': 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80'},
      {'title': 'HIIT giảm mỡ bụng cơ bản', 'level': 'Cơ bản', 'img': 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80'},
      {'title': 'HIIT giảm mỡ ngực săn chắc', 'level': 'Cơ bản', 'img': 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          for (var item in workouts)
            GestureDetector(
              onTap: () => Get.to(() => DiscoverGridDetailView(categoryTitle: item['title']!)),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(item['img']!, width: 75, height: 75, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['title']!, style: const TextStyle(color: Colors.black87, fontSize: 17, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text(item['level']!, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Get.to(() => const DiscoverGridDetailView(categoryTitle: 'Tất cả bài tập')),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Tất cả', style: TextStyle(color: AppColors.primary, fontSize: 15)),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios, color: AppColors.primary, size: 12),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildKegelExercises() {
    final workouts = [
      {'title': 'Khỏe mạnh dài lâu', 'desc': 'Cơ bản • 5 Phút', 'img': 'https://images.unsplash.com/photo-1518611012118-696072aa579a?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
      {'title': 'Thăng hoa cảm xúc', 'desc': 'Nâng cao • 16 Phút', 'img': 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
      {'title': 'Cải thiện xương chậu', 'desc': 'Trung bình • 10 Phút', 'img': 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Bài tập Kegel', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () => Get.to(() => const DiscoverGridDetailView(categoryTitle: 'Bài tập Kegel')),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Tất cả', style: TextStyle(color: AppColors.primary, fontSize: 15)),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward_ios, color: AppColors.primary, size: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 220,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: workouts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final w = workouts[index];
              return buildKegelCard(w);
            },
          ),
        ),
      ],
    );
  }

  Widget buildKegelCard(Map<String, String> w) {
    return GestureDetector(
      onTap: () => Get.to(() => DiscoverGridDetailView(categoryTitle: w['title']!)),
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(w['img']!, width: 140, height: 140, fit: BoxFit.cover),
            ),
            const SizedBox(height: 12),
            Text(w['title']!, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15), maxLines: 1),
            const SizedBox(height: 4),
            Text(w['desc']!, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
