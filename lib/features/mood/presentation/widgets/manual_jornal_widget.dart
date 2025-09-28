import 'package:flutter/material.dart';
import '../../../../cores/constants/colors.dart';

class ManualJournalWidget extends StatelessWidget {
  final bool isDark;
  const ManualJournalWidget({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24), // increased padding for height
      decoration: BoxDecoration(
        color: isDark ? primaryDarkBackgroundColor : primaryBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        // border removed
      ),
      child: ExpansionTile(
        title: const Text(
          'Manual Journal',
          style: TextStyle(
            fontFamily: 'Roboto', // consistent font
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        children: [
          TextField(
            maxLines: 6, // increased height
            style: const TextStyle(fontFamily: 'Roboto'),
            decoration: InputDecoration(
              hintText: "Or type here... e.g., 'Feeling great after my morning run.'",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none, // removed inner black line
              ),
              filled: true,
              fillColor: isDark ? const Color(0xFF102221).withOpacity(0.3) : const Color(0xFFF6F8F8),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }
}
