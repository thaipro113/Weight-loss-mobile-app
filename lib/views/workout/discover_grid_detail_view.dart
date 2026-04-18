import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';

class DiscoverGridDetailView extends StatelessWidget {
  final String categoryTitle;

  const DiscoverGridDetailView({Key? key, required this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Generate dummy workouts data based on category title
    final List<Map<String, dynamic>> workouts = _generateDummyWorkouts(categoryTitle);

    return Scaffold(
      backgroundColor: Colors.black, // Dark background as requested in the image
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Get.back(),
        ),
        title: Text(
          categoryTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              '${workouts.length} Bài tập',
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 24),
                itemCount: workouts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.60, // Adjusted to fit the image and text below
                ),
                itemBuilder: (context, index) {
                  final item = workouts[index];
                  return _buildWorkoutCard(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutCard(Map<String, dynamic> item) {
    Color levelColor;
    switch (item['level']) {
      case 'TRUNG BÌNH':
        levelColor = Colors.amber;
        break;
      case 'CƠ BẢN':
        levelColor = Colors.blueAccent;
        break;
      case 'GIÃN CƠ':
        levelColor = const Color(0xFF1CB096);
        break;
      case 'NÂNG CAO':
        levelColor = Colors.redAccent;
        break;
      default:
        levelColor = Colors.white;
    }

    return GestureDetector(
      onTap: () {
        // Handle navigation to specific exercise
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(item['image']),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 5,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item['level'] ?? '',
            style: TextStyle(
              color: levelColor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item['title'] ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item['duration'] ?? '',
            style: TextStyle(color: Colors.grey[400], fontSize: 13),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _generateDummyWorkouts(String title) {
    final imagesPool = [
      'https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1627483262112-039e9a0a0f16?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1526506159807-6c002c97ae13?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
      'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
    ];

    if (title.toLowerCase().contains('butt') || title.toLowerCase().contains('mông') || title.toLowerCase().contains('chân')) {
      return [
        {
          'title': 'Mông săn chắc • cắt nét bụng',
          'level': 'TRUNG BÌNH',
          'duration': '14 phút',
          'image': imagesPool[0], // Matching the image of the guy doing hip thrusts
        },
        {
          'title': 'Tập mông với dây kháng lực',
          'level': 'CƠ BẢN',
          'duration': '15 phút',
          'image': imagesPool[1], // Guy doing squats
        },
        {
          'title': 'Giãn cơ thân dưới 7 phút',
          'level': 'GIÃN CƠ',
          'duration': '7 phút',
          'image': imagesPool[2], // Guy stretching leg
        },
        {
          'title': 'Tập chân (KHÔNG NHẢY!)',
          'level': 'CƠ BẢN',
          'duration': '9 phút',
          'image': imagesPool[3], // Guy stretching standing
        },
        {
          'title': 'Đốt mỡ cực độ $title',
          'level': 'NÂNG CAO',
          'duration': '20 phút',
          'image': imagesPool[4],
        },
        {
          'title': 'Tập nhanh cho $title',
          'level': 'TRUNG BÌNH',
          'duration': '12 phút',
          'image': imagesPool[5],
        },
      ];
    }

    return [
      {
        'title': 'Sức mạnh $title · Săn chắc',
        'level': 'TRUNG BÌNH',
        'duration': '14 phút',
        'image': imagesPool[0],
      },
      {
        'title': 'Bài tập dây kháng lực cho $title',
        'level': 'CƠ BẢN',
        'duration': '15 phút',
        'image': imagesPool[1],
      },
      {
        'title': 'Giãn cơ nửa dưới 7 phút',
        'level': 'GIÃN CƠ',
        'duration': '7 phút',
        'image': imagesPool[2],
      },
      {
        'title': 'Tập $title (KHÔNG NHẢY!)',
        'level': 'CƠ BẢN',
        'duration': '9 phút',
        'image': imagesPool[3],
      },
      {
        'title': 'Đốt mỡ cực độ $title',
        'level': 'NÂNG CAO',
        'duration': '20 phút',
        'image': imagesPool[4],
      },
      {
        'title': 'Tập nhanh cho $title',
        'level': 'TRUNG BÌNH',
        'duration': '12 phút',
        'image': imagesPool[5],
      },
      {
        'title': 'Giãn cơ và hồi phục $title',
        'level': 'GIÃN CƠ',
        'duration': '10 phút',
        'image': imagesPool[6],
      },
      {
        'title': 'Xé mỡ $title toàn diện',
        'level': 'NÂNG CAO',
        'duration': '25 phút',
        'image': imagesPool[7],
      },
    ];
  }
}
