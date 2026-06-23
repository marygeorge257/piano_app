import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piano_app/pianoModels/song_model.dart';
import 'package:piano_app/pianoScreens/evaluation_screen.dart';
import 'package:piano_app/piano_cubit/result_dart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';

class ResultScreen extends StatefulWidget {
  final SongModel song;

  const ResultScreen({super.key, required this.song});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final TextEditingController timeController = TextEditingController();
  String noteAnswer = "";
  String rhythmAnswer = "";
  final AudioPlayer player = AudioPlayer();

  @override
  void dispose() {
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded, size: 25),
        ),
        centerTitle: true,
        title: Text(
          "Melora",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.deepPurple,
                    child: Icon(
                      Icons.done_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  "Session Complete",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),

                SizedBox(height: 20),

                Text(
                  "You've mastered another session.\nTake a moment to review",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFFB9B4E8), Color(0xFF7E6FED)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Review Your Sound",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: () async {
                          player.play(AssetSource(widget.song.audio));
                        },

                        icon: Icon(
                          Icons.play_circle,
                          size: 20,
                          color: Colors.deepPurple,
                        ),
                        label: Text(
                          "Play Reference Sound",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      ElevatedButton.icon(
                        onPressed: () async {
                          await player.pause();
                        },
                        icon: const Icon(Icons.pause_circle_filled_rounded, size: 20,
                          color: Colors.deepPurple,),
                        label: const Text(
                          "Pause",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: TextField(
                    controller: timeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        "Time in seconds",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      hintText: "Enter your time in seconds",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.deepPurple),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Did you play the correct notes?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ChoiceChip(
                      label: Text("Yes"),
                      selected: noteAnswer == "Yes",
                      onSelected: (value) {
                        setState(() {
                          noteAnswer = "Yes";
                        });
                      },
                    ),
                    ChoiceChip(
                      label: Text("Somewhat"),
                      selected: noteAnswer == "Somewhat",
                      onSelected: (value) {
                        setState(() {
                          noteAnswer = "Somewhat";
                        });
                      },
                    ),
                    ChoiceChip(
                      label: Text("No"),
                      selected: noteAnswer == "No",
                      onSelected: (value) {
                        setState(() {
                          noteAnswer = "No";
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Did you follow the rhythm?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ChoiceChip(
                      label: Text("Yes"),
                      selected: rhythmAnswer == "Yes",
                      onSelected: (value) {
                        setState(() {
                          rhythmAnswer = "Yes";
                        });
                      },
                    ),
                    ChoiceChip(
                      label: Text("Somewhat"),
                      selected: rhythmAnswer == "Somewhat",
                      onSelected: (value) {
                        setState(() {
                          rhythmAnswer = "Somewhat";
                        });
                      },
                    ),
                    ChoiceChip(
                      label: Text("No"),
                      selected: rhythmAnswer == "No",
                      onSelected: (value) {
                        setState(() {
                          rhythmAnswer = "No";
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<ResultDartCubit>().calculateResult(
                      userTime: int.parse(timeController.text),
                      targetTime: widget.song.duration,
                      noteAnswer: noteAnswer,
                      rhythmAnswer: rhythmAnswer,
                      songName: widget.song.song,
                      difficulty: widget.song.difficulty,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EvaluationScreen(song: widget.song),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7E6FED),
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    "Calculate Result",
                    style: TextStyle(
                      fontSize: 20,
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
    );
  }
}
