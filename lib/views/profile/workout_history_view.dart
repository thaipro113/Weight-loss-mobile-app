import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutHistoryView extends StatelessWidget {
  const WorkoutHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Lịch Sử Luyện Tập', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: () => Get.back()),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildHistoryCard(index);
        },
      ),
    );
  }

  Widget _buildHistoryCard(int index) {
    // Dummy alternating data
    final isHIIT = index % 2 == 0;
    final title = isHIIT ? 'HIIT giảm mỡ toàn thân' : 'Yoga phục hồi cơ thể';
    final cal = isHIIT ? '320' : '150';
    final time = isHIIT ? '30 Phút' : '20 Phút';
    final date = '1${9 - index} Tháng 4, 2026';
    final icon = isHIIT ? Icons.local_fire_department : Icons.self_improvement;
    final color = isHIIT ? Colors.orange : Colors.teal;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.timer_outlined, color: Colors.grey, size: 14),
                    const SizedBox(width: 4),
                    Text(time, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    const SizedBox(width: 12),
                    const Icon(Icons.local_fire_department_outlined, color: Colors.grey, size: 14),
                    const SizedBox(width: 4),
                    Text('$cal kcal', style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                )
              ],
            ),
          ),
          Text(date, style: TextStyle(color: Colors.grey[700], fontSize: 12)),
        ],
      ),
    );
  }
}
