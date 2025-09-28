import 'package:flutter/material.dart';

class WaveBarWidget extends StatelessWidget {
  final double height;
  const WaveBarWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: height * 0.2, end: height),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Container(
          width: 6,
          height: value,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: primary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      },
    );
  }
}
