import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/button_widget.dart';
import '../widgets/dot_widget.dart';
import '../../../../cores/constants/colors.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Stack(
        children: [
          SizedBox(
            height: 260,
            width: double.infinity,
            child: Image.asset(
              "assets/images/bg1.png", 
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 260,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [primaryBackgroundColor, Colors.transparent],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 200),
                  Text(
                    "Welcome to MoodMusic.ai",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSerif(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: primaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Your personal journey to emotional well-being starts here. We're committed to your privacy and offer offline access.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.notoSerif(
                      fontSize: 16,
                      color: secondaryTextColor.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      DotWidget(color: dotActiveColor),
                      DotWidget(color: dotInactiveColor),
                      DotWidget(color: dotInactiveColor),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Column(
                    children: [
                      ButtonWidget(
                        label: "Language",
                        icon: Icons.language,
                        onPressed: () {},
                        //TODO: Handle action when pressed
                      ),
                      const SizedBox(height: 12),
                      ButtonWidget(
                        label: "Accessibility",
                        icon: Icons.visibility,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 24),
                      ButtonWidget(label: "Next", onPressed: () {}),
                      const SizedBox(height: 40),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryButtonColor,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            label: "Mood",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "Music"),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: "Garden",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
