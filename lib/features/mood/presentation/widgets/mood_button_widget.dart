import 'package:flutter/material.dart';

class MoodButtonWidget extends StatelessWidget {
  final String emoji;
  final String label;
  final Color primary;
  final bool selected;
  const MoodButtonWidget({
    super.key,
    required this.emoji,
    required this.label,
    required this.primary,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? primary.withOpacity(0.1) : null,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: selected ? Colors.transparent : Colors.black12),
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(padding: const EdgeInsets.all(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
