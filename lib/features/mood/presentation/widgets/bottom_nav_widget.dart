import 'package:flutter/material.dart';
import '../../../../cores/constants/colors.dart';

class BottomNavWidget extends StatelessWidget {
  final int selectedIndex;
  final bool isDark;
  final Color primary;
  final bool cloudSync;
  final ValueChanged<int> onIndexChanged;
  final ValueChanged<bool> onCloudChanged;

  const BottomNavWidget({
    super.key,
    required this.selectedIndex,
    required this.isDark,
    required this.primary,
    required this.cloudSync,
    required this.onIndexChanged,
    required this.onCloudChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: secondaryBackgroundColor.withOpacity(0.2))),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // prevent overflow
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.spa, color: primary, size: 16),
                      const SizedBox(width: 4),
                      const Text('Mood Garden: Seed', style: TextStyle(fontSize: 12, color: primaryTextColor)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Local', style: TextStyle(fontSize: 12, color: secondaryTextColor)),
                      Switch(
                        value: cloudSync,
                        onChanged: onCloudChanged,
                        activeColor: primary,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // smaller switch
                      ),
                      const Text('Cloud', style: TextStyle(fontSize: 12, color: secondaryTextColor)),
                    ],
                  ),
                ],
              ),
            ),
            BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: onIndexChanged,
              selectedItemColor: primary,
              unselectedItemColor: isDark ? secondaryBackgroundColor : unselectedButtonColor,
              type: BottomNavigationBarType.fixed,
              backgroundColor: primaryBackgroundColor,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.mood), label: 'Mood'),
                BottomNavigationBarItem(icon: Icon(Icons.album), label: 'Music'),
                BottomNavigationBarItem(icon: Icon(Icons.local_florist), label: 'Garden'),
                BottomNavigationBarItem(icon: Icon(Icons.insights), label: 'Stats'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
