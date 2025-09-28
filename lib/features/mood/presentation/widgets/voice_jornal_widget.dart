import 'package:flutter/material.dart';
import '../../../../cores/constants/colors.dart';
import 'wave_bar_widget.dart';

class VoiceJournalWidget extends StatelessWidget {
  final Color primary;
  final bool isDark;

  const VoiceJournalWidget({
    super.key,
    required this.primary,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? primaryDarkBackgroundColor : primaryBackgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.white24 : Colors.black12),
      ),
      child: Column(
        children: [
          const Text(
            'Voice Journal',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: primaryTextColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Tap the mic to record your thoughts',
            style: TextStyle(color: greyText, fontSize: 12),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const WaveBarWidget(height: 20),
              const WaveBarWidget(height: 50),
              const WaveBarWidget(height: 20),
              const SizedBox(width: 12),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: primaryButtonColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryButtonColor.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(Icons.mic, color: Colors.black, size: 32),
              ),
              const SizedBox(width: 12),
              const WaveBarWidget(height: 20),
              const WaveBarWidget(height: 50),
              const WaveBarWidget(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
