import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';

class DiscoverCategoryDetailView extends StatefulWidget {
  final String categoryTitle;

  const DiscoverCategoryDetailView({Key? key, required this.categoryTitle})
      : super(key: key);

  @override
  State<DiscoverCategoryDetailView> createState() => _DiscoverCategoryDetailViewState();
}

class _DiscoverCategoryDetailViewState extends State<DiscoverCategoryDetailView> {
  final List<String> _tabs = ['Tất cả', 'Toàn thân', 'Bụng', 'Cánh tay', 'Ngực', 'Mông & Chân'];
  late String _selectedTab;

  @override
  void initState() {
    super.initState();
    // Default to the category passed in, or 'Toàn thân' if not in list
    if (_tabs.contains(widget.categoryTitle)) {
      _selectedTab = widget.categoryTitle;
    } else {
      _selectedTab = _tabs[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Thể loại',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          _buildTabs(),
          Expanded(
            child: _buildList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2))),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _tabs.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final tab = _tabs[index];
          final isSelected = tab == _selectedTab;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedTab = tab;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 24),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? const Color(0xFF539C9B) : Colors.transparent, // Teal color from design
                    width: 2,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  tab,
                  style: TextStyle(
                    color: isSelected ? const Color(0xFF539C9B) : Colors.grey[600],
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildList() {
    final items = _getMockDataForTab(_selectedTab);
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = items[index];
        return Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                item['image']!,
                width: 75,
                height: 75,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(width: 75, height: 75, color: Colors.grey[200]),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['desc']!,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  List<Map<String, String>> _getMockDataForTab(String tab) {
    if (tab == 'Bụng') {
      return [
        {'title': 'Tập Luyện Cơ Bụng (KHÔNG GẬP BỤNG!)', 'desc': '7 phút - 99.3 kcal', 'image': 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Cắt Nét Cơ Bụng V-cut', 'desc': '18 phút - 241.2 kcal', 'image': 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Cắt Nét Toàn Bộ Cơ Bụng Cường Độ Cao', 'desc': '35 phút - 439.3 kcal', 'image': 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Diệt Mỡ Bụng: 3 Bài Đơn Giản', 'desc': '5 phút - 63.9 kcal', 'image': 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Bụng Săn Chắc Cho Người Mới Bắt Đầu', 'desc': '11 phút - 136.0 kcal', 'image': 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Giảm Mỡ Bụng', 'desc': '13 phút - 184.6 kcal', 'image': 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Đốt Mỡ Bụng Tạ Cho Người Mới Bắt Đầu', 'desc': '7 phút - 55.5 kcal', 'image': 'https://images.unsplash.com/photo-1434682881908-b43d0467b798?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
      ];
    } else if (tab == 'Toàn thân' || tab == 'Tất cả') {
      return [
        {'title': 'Kéo Dãn Thời Gian Ngủ', 'desc': '8 phút - 56.1 kcal', 'image': 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Khởi Động Trước Khi Tập Luyện', 'desc': '3 phút - 40.8 kcal', 'image': 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Đốt Cháy Mỡ HIIT', 'desc': '9 phút - 117.6 kcal', 'image': 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Kéo Dãn Toàn Thân', 'desc': '7 phút - 48.0 kcal', 'image': 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': '20 Phút Đốt Cháy Calo Cơ Thể', 'desc': '19 phút - 229.1 kcal', 'image': 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Giảm Mỡ (KHÔNG NHẢY!)', 'desc': '14 phút - 162.9 kcal', 'image': 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Giãn Cơ Buổi Sáng Thư Thả', 'desc': '7 phút - 55.5 kcal', 'image': 'https://images.unsplash.com/photo-1434682881908-b43d0467b798?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Khởi Động Để Bắt Đầu Sảng Khoái', 'desc': '6 phút - 58.4 kcal', 'image': 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
      ];
    } else if (tab == 'Ngực') {
      return [
        {'title': 'Tập Luyện Ngực To Hơn Nhanh Chóng', 'desc': '6 phút - 67.2 kcal', 'image': 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Tập Ngực Dành Cho Người Mới Bắt Đầu', 'desc': '4 phút - 51.2 kcal', 'image': 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Ngực Cổ Điển Trung Cấp', 'desc': '6 phút - 95.0 kcal', 'image': 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Pump Ngực Tối Đa', 'desc': '21 phút - 232.8 kcal', 'image': 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
      ];
    } else {
      return [
        {'title': 'Bài tập mẫu cho $tab 1', 'desc': '10 phút - 100 kcal', 'image': 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
        {'title': 'Bài tập mẫu cho $tab 2', 'desc': '15 phút - 150 kcal', 'image': 'https://images.unsplash.com/photo-1434682881908-b43d0467b798?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'},
      ];
    }
  }
}

