import 'package:flutter/material.dart';
import '../../../../cores/constants/colors.dart';

class WearableSignalsWidget extends StatelessWidget {
  final Color primary;
  final bool isDark;
  const WearableSignalsWidget({super.key, required this.primary, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? primaryTextColor : primaryBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.white24 : Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Wearable Signals', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('❤️ HR: 72bpm', style: TextStyle(fontSize: 12, color: greyText)),
              Text('👟 Steps: 3,456', style: TextStyle(fontSize: 12, color: greyText)),
              Text('🌙 Sleep: 7h 30m', style: TextStyle(fontSize: 12, color: greyText)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(
              value: 0.85,
              color: primary,
              backgroundColor: isDark ? Colors.white10 : Colors.black12,
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Confidence: 85%', style: TextStyle(fontSize: 10, color: greyText)),
              TextButton(
                onPressed: () {},
                child: Text('Sync now', style: TextStyle(color: primary, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
