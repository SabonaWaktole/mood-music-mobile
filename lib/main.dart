import 'package:flutter/material.dart';
import './cores/constants/colors.dart';
import 'package:mood_music_mobile/features/mood/presentation/pages/mood_capture_page.dart';
// import 'package:mood_music_mobile/features/mood/presentation/pages/on_boarding_page.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Music Mobile',
      theme: ThemeData(
  useMaterial3: true,
  primaryColor: primaryButtonColor,
  secondaryHeaderColor: secondaryButtonColor,
  colorScheme: ColorScheme.light(
    primary: primaryButtonColor,
    secondary: secondaryButtonColor, // optional
    background: Colors.white, // optional
    surface: Colors.white, // optional
  ),
),

      // darkTheme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.deepPurple,
      //     brightness: Brightness.dark,
      //   ),
      //   useMaterial3: true,
      // ),
      // themeMode: ThemeMode.system, // auto-switch based on system theme

      home: const MoodCapturePage(), // Replace with your desired page
    );
  }
}
