import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';

class ReportView extends StatelessWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), // Light theme
      appBar: AppBar(
        title: const Text('11 Tháng 4', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24)),
        backgroundColor: const Color(0xFFF9F9F9),
        elevation: 0,
        actions: [
          Row(
            children: [
              const Text('Sửa', style: TextStyle(color: Colors.black87, fontSize: 16)),
              const Icon(Icons.arrow_downward, color: Colors.black87, size: 16),
              const SizedBox(width: 16),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildActionButtons(),
            const SizedBox(height: 24),
            const Text('Mục tiêu Sức khỏe', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildHealthGoals(),
            const SizedBox(height: 32),
            const Text('Cân nặng hôm nay', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildTodaysWeight(),
            const SizedBox(height: 32),
            const Text('Tuần này', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildThisWeekCards(),
            const SizedBox(height: 32),
            const Text('Biểu đồ Cân nặng', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildWeightHistoryChart(),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1CB5E0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Bắt đầu bài tập', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.black87, size: 20),
                SizedBox(width: 8),
                Text('Thêm hoạt động', style: TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHealthGoals() {
    return Row(
      children: [
        Expanded(
          child: _buildGoalCard(
            title: 'BƯỚC CHÂN',
            type: 'Steps',
            current: '0',
            target: '8000 Bước',
            iconData: Icons.directions_walk,
            color: Colors.orange,
            progress: 0.1,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildGoalCard(
            title: 'NƯỚC',
            type: 'Cups',
            current: '0',
            target: '8 Cốc',
            iconData: Icons.water_drop,
            color: Colors.blue,
            progress: 0.1,
          ),
        ),
      ],
    );
  }

  Widget _buildGoalCard({required String title, required String type, required String current, required String target, required IconData iconData, required Color color, required double progress}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(title, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1.0)),
          ),
          const SizedBox(height: 24),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 4,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(iconData, color: color, size: 28),
                  const SizedBox(height: 4),
                  Text(current, style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(target, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.lock_open, color: Color(0xFF1CB5E0), size: 16),
              SizedBox(width: 4),
              Text('Mở khóa', style: TextStyle(color: Color(0xFF1CB5E0), fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTodaysWeight() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      Text('75.0', style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Text('kg', style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text('+3.0 kg', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                      Text(' tới Mục tiêu', style: TextStyle(color: Colors.grey)),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 120,
                height: 60,
                child: _buildMiniWeightChart(),
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.green, size: 16),
                    SizedBox(width: 4),
                    Text('Đã cập nhật!', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Row(
                  children: [
                    Text('Thêm', style: TextStyle(color: Color(0xFF1CB5E0), fontSize: 14)),
                    Icon(Icons.arrow_forward_ios, color: Color(0xFF1CB5E0), size: 12),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMiniWeightChart() {
    return Column(
      children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: const [
             Text('80 kg', style: TextStyle(color: Colors.grey, fontSize: 10)),
             Text('75 kg', style: TextStyle(color: Colors.grey, fontSize: 10)),
             Text('70 kg', style: TextStyle(color: Colors.grey, fontSize: 10)),
           ],
         ),
         const SizedBox(height: 8),
         Expanded(
           child: CustomPaint(
             painter: MiniChartPainter(),
             child: const SizedBox(width: double.infinity, height: double.infinity),
           ),
         ),
      ],
    );
  }

  Widget _buildThisWeekCards() {
    return Row(
      children: [
        Expanded(
          child: _buildBarChartCard(
            title: 'Thời lượng',
            value: '0',
            unit: 'phút',
            barColor: const Color(0xFF4A4A8A),
            highlightColor: const Color(0xFF5A5AFF), 
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildBarChartCard(
            title: 'Calo',
            value: '0',
            unit: 'kcal',
            barColor: const Color(0xFF8B4513),
            highlightColor: const Color(0xFFD2691E),
          ),
        ),
      ],
    );
  }

  Widget _buildBarChartCard({required String title, required String value, required String unit, required Color barColor, required Color highlightColor}) {
    final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold)),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 12),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: const TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(width: 4),
              Text(unit, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              return Column(
                children: [
                  Container(
                    width: 12,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 12,
                      height: 8, // mock minimal value
                      decoration: BoxDecoration(
                        color: index == 6 ? highlightColor : barColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(days[index], style: TextStyle(color: index == 6 ? highlightColor : Colors.grey[500], fontSize: 10)),
                  if (index == 6) Icon(Icons.arrow_drop_up, color: highlightColor, size: 12),
                ],
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _buildWeightHistoryChart() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hiện tại', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: const [
                      Text('75.0', style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Text('kg  ✎', style: TextStyle(color: Colors.black87, fontSize: 16)),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Mục tiêu', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  const Text('72.0 kg  ✎', style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          const Text('Tháng Tư', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(color: Colors.grey.withOpacity(0.2), strokeWidth: 1, dashArray: [5, 5]),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 2.5,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(value.toStringAsFixed(1), style: TextStyle(color: Colors.grey[500], fontSize: 10), textAlign: TextAlign.right),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(value.toInt().toString(), style: TextStyle(color: Colors.grey[500], fontSize: 10)),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 8,
                maxX: 14,
                minY: 70,
                maxY: 80,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [FlSpot(11, 75.0)], // Mock dot for 11 Apr
                    isCurved: true,
                    color: Colors.greenAccent,
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      checkToShowDot: (spot, barData) => true,
                      getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                        radius: 4,
                        color: Colors.grey[800]!,
                        strokeWidth: 2,
                        strokeColor: Colors.greenAccent,
                      ),
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 72,
                      color: Colors.teal.withOpacity(0.5),
                      strokeWidth: 1,
                      dashArray: [5, 5],
                      label: HorizontalLineLabel(
                        show: true,
                        alignment: Alignment.bottomLeft,
                        style: const TextStyle(color: Colors.teal, fontSize: 10),
                        labelResolver: (line) => 'Mục tiêu',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MiniChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = Colors.teal.withOpacity(0.5)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    
    double startX = 0;
    while(startX < size.width) {
      canvas.drawLine(Offset(startX, size.height * 0.7), Offset(startX + 3, size.height * 0.7), paintLine);
      startX += 6;
    }

    final paintLabel = TextPainter(
      text: const TextSpan(text: 'Mục tiêu', style: TextStyle(color: Colors.teal, fontSize: 10)),
      textDirection: TextDirection.ltr,
    );
    paintLabel.layout();
    paintLabel.paint(canvas, Offset(0, size.height * 0.7 + 2));

    final paintDot = Paint()..color = Colors.greenAccent..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.3), 3, paintDot);
    
    final days = ['8', '9', '10', '11', '12', '13', '14'];
    double stepX = size.width / 7;
    for (int i = 0; i < days.length; i++) {
        final pt = TextPainter(text: TextSpan(text: days[i], style: TextStyle(color: Colors.grey[600], fontSize: 8)), textDirection: TextDirection.ltr);
        pt.layout();
        pt.paint(canvas, Offset(i * stepX, size.height * 0.9));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
