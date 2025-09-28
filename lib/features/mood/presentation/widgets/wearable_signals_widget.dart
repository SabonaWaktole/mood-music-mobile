import 'package:flutter/material.dart';
import '../../../../cores/constants/colors.dart';

class WearableSignalsWidget extends StatelessWidget {
  final Color primary;
  final bool isDark;
  const WearableSignalsWidget({super.key, required this.primary, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24), // increased padding for more height
      decoration: BoxDecoration(
        color: isDark ? primaryTextColor : primaryBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        // border removed
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Wearable Signals',
            style: TextStyle(
              fontFamily: 'Roboto', // consistent font
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '❤️ HR: 72bpm',
                style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: greyText),
              ),
              Text(
                '👟 Steps: 3,456',
                style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: greyText),
              ),
              Text(
                '🌙 Sleep: 7h 30m',
                style: TextStyle(fontFamily: 'Roboto', fontSize: 12, color: greyText),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(
              value: 0.85,
              color: primary,
              backgroundColor: isDark ? Colors.white10 : Colors.black12,
              minHeight: 12, // increased height of progress bar
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Confidence: 85%',
                style: TextStyle(fontFamily: 'Roboto', fontSize: 10, color: greyText),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sync now',
                  style: TextStyle(fontFamily: 'Roboto', color: primary, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
