import 'package:flutter/material.dart';
import 'package:piano_app/pianoScreens/song_selection_screen.dart';
import 'package:piano_app/pianoScreens/progress_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Melora",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF8F8F6), Color(0xFFE4F2FD), Color(0xFFB9B4E8)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFD7E6ED),
                  radius: 60,
                  child: Icon(
                    Icons.volume_up_rounded,
                    size: 40,
                    color: Color(0xFF5C35ED),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "The Resonant \n Space ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "FIND YOUR RHYTHM . HOLD THE NOTE",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueGrey[200],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 45),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFFB9B4E8), Color(0xFF7E6FED)],
                    ),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SongSelectionScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.play_arrow, color: Colors.white, size: 30),
                    label: Text(
                      "Start Practice",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProgressScreen()),
                    );
                  },
                  child: Text(
                    "Progress",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
