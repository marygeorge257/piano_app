import 'package:flutter/material.dart';
import 'package:piano_app/pianoModels/song_model.dart';
import 'package:piano_app/pianoScreens/song_selection_screen.dart';
import 'package:piano_app/pianoScreens/result_screen.dart';

class PracticeScreen extends StatelessWidget {
  final SongModel song;

  const PracticeScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(song.song), centerTitle: true),
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
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(song.image, width: double.infinity),
              Text(
                "Instructions :",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.music_note, color: Color(0xFF7E6FED)),
                  SizedBox(width: 8),
                  Text("1. Practice the piece", style: TextStyle(fontSize: 17)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.piano, color: Color(0xFF7E6FED)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "2. Try to play all notes correctly\nand maintain a steady rhythm.",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.timer, color: Color(0xFF7E6FED)),
                  SizedBox(width: 8),
                  Text(
                    "3. Measure your time using a timer",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.check_circle, color: Color(0xFF7E6FED)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "4. Press Done to proceed to the next step.",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(song: song),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7E6FED),
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD8E5F4),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
