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
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xFFB9B4E8), Color(0xFF7E6FED)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
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
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            Text(
                              song.song,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Performance Level : ${state.result}",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Score : ${state.score}%",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),


                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,

                   children: [
                     ElevatedButton(
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>ProgressScreen()));
                       },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Color(0xFF7E6FED),
                         shadowColor: Colors.transparent,
                       ),
                       child: const Text(
                         "View Progress",
                         style: TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold,
                           color: Color(0xFFD8E5F4),
                         ),
                       ),
                     ),
                     SizedBox(height: 15,),
                     ElevatedButton(
                       onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>SongSelectionScreen()));
                       },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Color(0xFF7E6FED),
                         shadowColor: Colors.transparent,
                       ),
                       child: const Text(
                         "Another Practice",
                         style: TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold,
                           color: Color(0xFFD8E5F4),
                         ),
                       ),
                     ),
                   ],
                 )
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
