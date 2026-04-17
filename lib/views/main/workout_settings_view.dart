import 'package:flutter/material.dart';

class WorkoutSettingsView extends StatefulWidget {
  const WorkoutSettingsView({Key? key}) : super(key: key);

  @override
  State<WorkoutSettingsView> createState() => _WorkoutSettingsViewState();
}

class _WorkoutSettingsViewState extends State<WorkoutSettingsView> {
  int _jumpOption = 0; // 0: Tiêu chuẩn, 1: Không nhảy, 2: Thấp
  double _musicVolume = 0.3;
  double _voiceVolume = 0.7;
  bool _autoStart = true;
  bool _duckAudio = true;

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      child: child,
    );
  }

  Widget _buildJumpOption(int index, String text, IconData icon) {
    bool isSelected = _jumpOption == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _jumpOption = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00E676) : Colors.grey[200], // Màu xanh lục lá cây giống ảnh
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: Colors.black87),
            const SizedBox(width: 4),
            Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Cài đặt tập luyện',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card 1: Các lựa chọn nhảy
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Các lựa chọn nhảy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildJumpOption(0, 'Tiêu chuẩn', Icons.sentiment_satisfied_alt),
                      _buildJumpOption(1, 'Không nhảy', Icons.directions_walk),
                      _buildJumpOption(2, 'Thấp', Icons.accessibility_new),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _jumpOption == 0 
                      ? 'Tiêu chuẩn: Tôi ổn. Tất cả bài tập đều OK đối với tôi!'
                      : (_jumpOption == 1 ? 'Không nhảy: Tôi muốn tránh tạo tiếng ồn hoặc bảo vệ đầu gối.' : 'Thấp: Tôi muốn tập các bài cường độ thấp.'),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),

            // Card 2: Huấn luyện viên
            _buildCard(
              child: Row(
                children: [
                  const Expanded(
                    child: Text('Huấn luyện viên', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.person_outline, size: 20, color: Colors.black54),
                  ),
                  const SizedBox(width: 8),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey[200],
                        child: const Icon(Icons.person, size: 20, color: Colors.black87),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(Icons.check_circle, color: Color(0xFF00E676), size: 12),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black54),
                ],
              ),
            ),

            // Card 3: Âm nhạc
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Âm nhạc', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Row(
                    children: [
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 3,
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                          ),
                          child: Slider(
                            value: _musicVolume,
                            activeColor: Colors.black,
                            inactiveColor: const Color(0xFFE0C9C9), 
                            onChanged: (v) { setState(() => _musicVolume = v); },
                          ),
                        ),
                      ),
                      const Icon(Icons.volume_up, size: 32),
                    ],
                  ),
                  SwitchListTile(
                    title: const Text('Tự động bắt đầu với tập\nluyện', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, height: 1.2)),
                    value: _autoStart,
                    activeColor: Colors.black,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (v) { setState(() => _autoStart = v); }
                  ),
                  SwitchListTile(
                    title: const Text('Giảm âm lượng nhạc', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                    subtitle: const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text('Giảm âm lượng nhạc từ tất cả ứng dụng khi huấn luyện viên nói trong quá trình tập luyện', style: TextStyle(fontSize: 13, color: Colors.black87)),
                    ),
                    value: _duckAudio,
                    activeColor: Colors.black,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (v) { setState(() => _duckAudio = v); }
                  ),
                ],
              )
            ),

            // Card 4: Giọng nói
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Giọng nói hướng\ndẫn', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, height: 1.2)),
                  const SizedBox(height: 8),
                  const Text('Lời khuyên của\nHLV', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, height: 1.2)),
                  const SizedBox(height: 8),
                  const Text('Công cụ Giọng nói', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.volume_down, size: 24),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 3,
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                          ),
                          child: Slider(
                            value: _voiceVolume,
                            activeColor: Colors.black,
                            inactiveColor: const Color(0xFFE0C9C9),
                            onChanged: (v) { setState(() => _voiceVolume = v); },
                          ),
                        ),
                      ),
                      const Icon(Icons.volume_up, size: 32),
                    ],
                  ),
                ],
              )
            ),

            // Card 5: Đồng hồ & Cài đặt bổ sung
            _buildCard(
              child: Column(
                children: [
                  _buildListTileAction('Đếm tự động', 'Tắt'),
                  const SizedBox(height: 4),
                  _buildListTileAction('Hẹn giờ nghỉ ngơi', ''),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Đếm ngược', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            SizedBox(height: 4),
                            Text('Trước khi bài tập bắt đầu', style: TextStyle(fontSize: 13, color: Colors.black87)),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('5 s', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black54),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTileAction(String title, String trailingText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Row(
            children: [
              if (trailingText.isNotEmpty) 
                 Text(trailingText, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              if (trailingText.isNotEmpty) 
                 const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black54),
            ],
          )
        ],
      ),
    );
  }
}
