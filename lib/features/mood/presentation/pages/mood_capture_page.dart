import 'package:flutter/material.dart';
import '../widgets/button_widget.dart';
import '../widgets/bottom_nav_widget.dart';
import '../widgets/manual_jornal_widget.dart';
import '../widgets/voice_jornal_widget.dart';
import '../widgets/wearable_signals_widget.dart';
import '../widgets/music_breathing_widget.dart';
import '../widgets/mood_grid_widget.dart';
class MoodCapturePage extends StatefulWidget {
  const MoodCapturePage({super.key});

  @override
  State<MoodCapturePage> createState() => _MoodCapturePageState();
}

class _MoodCapturePageState extends State<MoodCapturePage> {
  int _selectedIndex = 0;
  bool _cloudSync = false;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    final secondary = Theme.of(context).secondaryHeaderColor;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    debugPrint("isDark: $isDark $primary");

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              "How are you feeling right now?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              "Select a mood, or describe it below.",
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Mood Grid
            MoodGrid(primary: primary),

            const SizedBox(height: 12),

            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: primary.withOpacity(0.5), width: 2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: Text('+ Custom Mood', style: TextStyle(color: primary, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),

            VoiceJournalWidget(primary: primary, isDark: isDark),
            const SizedBox(height: 16),
            ManualJournalWidget(isDark: isDark),
            const SizedBox(height: 16),
            WearableSignalsWidget(primary: primary, isDark: isDark),
            const SizedBox(height: 16),
            MusicBreathingWidget(primary: primary, secondary: secondary,),
            const SizedBox(height: 16),
            ButtonWidget(label: "Save Mood", onPressed: () {}),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavWidget(
        selectedIndex: _selectedIndex,
        isDark: isDark,
        primary: primary,
        cloudSync: _cloudSync,
        onIndexChanged: (index) => setState(() => _selectedIndex = index),
        onCloudChanged: (val) => setState(() => _cloudSync = val),
      ),
    );
  }
}
