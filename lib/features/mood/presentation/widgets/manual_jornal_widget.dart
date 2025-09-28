import 'package:flutter/material.dart';

class ManualJournalWidget extends StatelessWidget {
  final bool isDark;
  const ManualJournalWidget({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF102221) : const Color(0xFFF6F8F8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.white24 : Colors.black12),
      ),
      child: ExpansionTile(
        title: const Text('Manual Journal', style: TextStyle(fontWeight: FontWeight.bold)),
        children: [
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Or type here... e.g., 'Feeling great after my morning run.'",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}
