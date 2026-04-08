import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
final List<Map<String, String>> onboardingData = [
  {
    "image": "assets/images/anhbatdau1.jpg",
    "title": "Giảm cân",
    "desc": "Phù hợp để giảm cân tiêu hao mỡ thừa"
  },
  {
    "image": "assets/images/anhbatdau2.webp",
    "title": "Tăng cơ",
    "desc": "Xây dựng cơ bắp khỏe mạnh"
  },
  {
    "image": "assets/images/anhbatdau3.jpg",
    "title": "Giữ dáng",
    "desc": "Duy trì vóc dáng cân đối"
  },
  {
    "image": "assets/images/anhbatdau4.jpg",
    "title": "Sức khỏe",
    "desc": "Nâng cao thể lực và sức bền"
  },
];
class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < 3) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF14171A),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              final item = onboardingData[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  // Image Asset
                  Image.asset(
                    item['image']!,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                  // Dark Shadow Gradient for text visibility
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.4, 1.0],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            item['title']!,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            item['desc']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 100), // Space for indicator
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          
          // Progress Bar fixed at the bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingData.length, (idx) {
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 4,
                        decoration: BoxDecoration(
                          color: _currentPage >= idx ? AppColors.primary : Colors.white30,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          
          // Transparent tap layer for advancing to next page
          Positioned.fill(
            child: GestureDetector(
              onTap: _onNext,
              behavior: HitTestBehavior.translucent,
            ),
          ),
        ],
      ),
    );
  }
}
