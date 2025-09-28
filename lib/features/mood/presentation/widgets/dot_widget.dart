// lib/widgets/dot_widget.dart
import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final Color color;
  const DotWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
