import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../cores/constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isPrimary; // determines which color to use

  const ButtonWidget({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = isPrimary
        ? primaryButtonColor
        : primaryDarkBackgroundColor;

    if (icon != null) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor.withOpacity(0.1), // button fill
          foregroundColor: secondaryTextColor,
          minimumSize: const Size(double.infinity, 56),
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          elevation: 0, // remove shadow
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.notoSerif(
                fontSize: 16,
                color: primaryTextColor,
              ),
            ),
            Icon(icon, color: secondaryTextColor.withOpacity(0.5)),
          ],
        ),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: primaryTextColor,
          minimumSize: const Size(double.infinity, 56),
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: GoogleFonts.notoSerif(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      );
    }
  }
}
