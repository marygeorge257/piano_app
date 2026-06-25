import 'package:flutter/material.dart';
import 'package:piano_app/pianoScreens/homeScreen.dart';
import 'package:piano_app/pianoScreens/song_selection_screen.dart';
import 'package:piano_app/pianoScreens/progress_screen.dart';

class Buttons extends StatelessWidget {
  final int selectedIndex;

  const Buttons({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {

    final pages = [
      const HomeScreen(),
      const SongSelectionScreen(),
      const ProgressScreen(),
    ];

    return BottomNavigationBar(
      backgroundColor: const Color(0xFFB9B4E8),
      selectedItemColor: const Color(0xFF7B6DEF),
      currentIndex: selectedIndex,

      onTap: (index) {
        if (index != selectedIndex) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => pages[index],
            ),
          );
        }
      },

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.piano),
          label: "Practice",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_outlined),
          label: "Progress",
        ),
      ],
    );
  }
}