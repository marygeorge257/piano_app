import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piano_app/piano_cubit/result_dart_cubit.dart';
import 'package:piano_app/pianoModels/song_model.dart';
import 'package:piano_app/pianoScreens/progress_screen.dart';
import 'package:piano_app/pianoScreens/song_selection_screen.dart';

class EvaluationScreen extends StatelessWidget {
  final SongModel song;

  const EvaluationScreen({super.key, required this.song});

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
        child: BlocBuilder<ResultDartCubit, ResultDartState>(
          builder: (context, state) {
            if (state is ResultCalculated) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xFFB9B4E8), Color(0xFF7E6FED)],
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),

                    child: Column(
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
                          song.song,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Performance Level : ${state.result}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 20),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Score : ${state.score}%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProgressScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7E6FED),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        icon: Icon(Icons.bar_chart, color: Colors.white),
                        label: Text(
                          "View Progress",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SongSelectionScreen(),
                            ),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        icon: Icon(Icons.refresh, color: Color(0xFF7E6FED)),

                        label: Text(
                          "Practice Again",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7E6FED),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),
                ],
              );
            }
            return Center(
              child: Text(
                "No Progress",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }
}
