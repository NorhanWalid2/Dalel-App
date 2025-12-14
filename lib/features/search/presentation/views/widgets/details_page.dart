
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> item;
  const DetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final wars = item['wars'] as List<dynamic>? ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(item['name'] ?? '')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة رئيسية
            if (item['image'] != null && item['image'] != '')
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item['image'],
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),

            // الوصف
            if (item['description'] != null)
              Text(item['description'], style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),

            // الحروب
            if (wars.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Wars:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  for (var war in wars)
                    Card(
                      child: ListTile(
                        leading:
                            war['image'] != null && war['image'] != ''
                                ? Image.network(
                                  war['image'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )
                                : const Icon(Icons.image),
                        title: Text(war['title'] ?? ''),
                        subtitle: Text(war['description'] ?? ''),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
