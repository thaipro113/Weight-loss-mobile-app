import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../theme/app_colors.dart';

class WeightTrackerView extends StatefulWidget {
  const WeightTrackerView({Key? key}) : super(key: key);

  @override
  State<WeightTrackerView> createState() => _WeightTrackerViewState();
}

class _WeightTrackerViewState extends State<WeightTrackerView> {
  int _selectedTabIndex = 2; // Default to Cân nặng, simulating the 3 tabs layout

  @override
  Widget build(BuildContext context) {
    final isDark = Get.isDarkMode;
    final bgColor = isDark ? const Color(0xFF121212) : const Color(0xFFF9F9F9);
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    final subtitleColor = isDark ? Colors.grey[400] : Colors.grey[600];

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Biểu đồ cân nặng', style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: textColor, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Thg 4 2026',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
              ),
            ),
            const SizedBox(height: 20),
            _buildTabs(isDark),
            const SizedBox(height: 20),
            _buildChartCard(cardColor, textColor, subtitleColor!),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Lịch sử thay đổi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
              ),
            ),
            const SizedBox(height: 16),
            _buildHistoryList(cardColor, textColor, subtitleColor),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Open modal to add weight entry
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildTabs(bool isDark) {
    final textColor = isDark ? Colors.grey[400] : Colors.grey[600];
    final activeColor = isDark ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem('1 Tháng', 0, textColor!, activeColor),
          _buildTabItem('3 Tháng', 1, textColor, activeColor),
          _buildTabItem('1 Năm', 2, textColor, activeColor),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index, Color textColor, Color activeColor) {
    final isActive = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? activeColor : textColor,
            ),
          ),
          const SizedBox(height: 8),
          if (isActive)
            Container(
              height: 3,
              width: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF1CB5E0),
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildChartCard(Color cardColor, Color textColor, Color subtitleColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Cân nặng ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
              ),
              Text(
                '(kg)',
                style: TextStyle(fontSize: 14, color: subtitleColor),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.withOpacity(0.15),
                    strokeWidth: 1,
                    dashArray: [5, 5],
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 20,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(color: subtitleColor, fontSize: 12),
                          textAlign: TextAlign.left,
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 5,
                      getTitlesWidget: (value, meta) {
                        if (value == 0) return const SizedBox.shrink();
                        return Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            value.toInt().toString(),
                            style: TextStyle(color: subtitleColor, fontSize: 12),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 1,
                maxX: 30,
                minY: 40,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(1, 80),
                      FlSpot(5, 79),
                      FlSpot(10, 78.5),
                      FlSpot(15, 77),
                      FlSpot(20, 76.5),
                      FlSpot(25, 75.8),
                      FlSpot(29, 75.0),
                    ],
                    isCurved: true,
                    color: const Color(0xFF1CB5E0),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                         if (index == barData.spots.length - 1) {
                            return FlDotCirclePainter(
                              radius: 4,
                              color: Colors.white,
                              strokeWidth: 3,
                              strokeColor: const Color(0xFF1CB5E0),
                            );
                         }
                         return FlDotCirclePainter(radius: 0, color: Colors.transparent);
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: const Color(0xFF1CB5E0).withOpacity(0.1),
                    ),
                  ),
                  // Goal line
                  LineChartBarData(
                    spots: const [
                      FlSpot(1, 70),
                      FlSpot(30, 70),
                    ],
                    isCurved: false,
                    color: Colors.teal.withOpacity(0.6),
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dashArray: [5, 5],
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 12, height: 2, color: const Color(0xFF1CB5E0)),
              const SizedBox(width: 8),
              Text('Thực tế', style: TextStyle(color: subtitleColor, fontSize: 12)),
              const SizedBox(width: 20),
              Container(
                width: 12,
                height: 2,
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.teal, width: 2, style: BorderStyle.none)), // dash hack
                ),
                child: CustomPaint(
                   painter: DashedLinePainter(),
                ),
              ),
              const SizedBox(width: 8),
              Text('Mục tiêu (70kg)', style: TextStyle(color: subtitleColor, fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHistoryList(Color cardColor, Color textColor, Color subtitleColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildWeeklyHeader(textColor, subtitleColor, '22 thg 4 - 28 thg 4', '2 Lần đo', '-0.8 kg'),
          const SizedBox(height: 12),
          _buildRecordItem(cardColor, textColor, subtitleColor, '28 thg 4', '08:00 SA', 75.0, -0.8),
          _buildRecordItem(cardColor, textColor, subtitleColor, '24 thg 4', '07:30 SA', 75.8, -0.7),
          
          const SizedBox(height: 24),
          _buildWeeklyHeader(textColor, subtitleColor, '15 thg 4 - 21 thg 4', '1 Lần đo', '-0.5 kg'),
          const SizedBox(height: 12),
          _buildRecordItem(cardColor, textColor, subtitleColor, '20 thg 4', '08:15 SA', 76.5, -0.5),

          const SizedBox(height: 24),
          _buildWeeklyHeader(textColor, subtitleColor, '8 thg 4 - 14 thg 4', '1 Lần đo', '-1.5 kg'),
          const SizedBox(height: 12),
          _buildRecordItem(cardColor, textColor, subtitleColor, '15 thg 4', '07:00 SA', 77.0, -1.5),
        ],
      ),
    );
  }

  Widget _buildWeeklyHeader(Color textColor, Color subtitleColor, String dateRange, String count, String lost) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dateRange, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
            const SizedBox(height: 4),
            Text(count, style: TextStyle(fontSize: 13, color: subtitleColor)),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.arrow_downward, color: Colors.green, size: 16),
            const SizedBox(width: 4),
            Text(lost, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        )
      ],
    );
  }

  Widget _buildRecordItem(Color cardColor, Color textColor, Color subtitleColor, String date, String time, double weight, double diff) {
    final isLoss = diff <= 0;
    final diffColor = isLoss ? Colors.green : Colors.red;
    final diffIcon = isLoss ? Icons.arrow_downward : Icons.arrow_upward;
    final diffText = '${diff > 0 ? '+' : ''}$diff kg';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1CB5E0).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.monitor_weight_outlined, color: Color(0xFF1CB5E0)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ghi nhận cân nặng',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(time, style: TextStyle(fontSize: 13, color: subtitleColor)),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 1,
                      height: 12,
                      color: Colors.grey[300],
                    ),
                    Text(date, style: TextStyle(fontSize: 13, color: subtitleColor)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$weight kg',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(diffIcon, color: diffColor, size: 12),
                  const SizedBox(width: 2),
                  Text(
                    diffText,
                    style: TextStyle(fontSize: 13, color: diffColor, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 4, dashSpace = 2, startX = 0;
    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, size.height/2), Offset(startX + dashWidth, size.height/2), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
