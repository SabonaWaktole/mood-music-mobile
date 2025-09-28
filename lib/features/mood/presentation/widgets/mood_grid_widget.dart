import 'package:flutter/material.dart';
import 'mood_button_widget.dart';

class MoodGrid extends StatelessWidget {
  final Color primary;
  const MoodGrid({super.key, required this.primary});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: [
        MoodButtonWidget(emoji: '😊', label: 'Happy', primary: primary, selected: true),
        MoodButtonWidget(emoji: '😌', label: 'Calm', primary: primary, selected: false),
        MoodButtonWidget(emoji: '😟', label: 'Anxious', primary: primary, selected: false),
        MoodButtonWidget(emoji: '😢', label: 'Sad', primary: primary, selected: false),
        MoodButtonWidget(emoji: '😴', label: 'Tired', primary: primary, selected: false),
        MoodButtonWidget(emoji: '⚡️', label: 'Energized', primary: primary, selected: false),
      ],
    );
  }
}
