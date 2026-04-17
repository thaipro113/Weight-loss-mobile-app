import 'package:flutter/material.dart';

class GeneralSettingsView extends StatelessWidget {
  const GeneralSettingsView({Key? key}) : super(key: key);

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
          'Tổng cài đặt',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildListTile('Ngôn ngữ', ''),
              const Divider(height: 1),
              _buildListTile('Bắt đầu tuần vào', 'Chủ nhật'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String trailingText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
