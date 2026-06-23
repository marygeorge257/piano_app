import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:piano_app/piano_hive/progress_model.dart';

part 'result_dart_state.dart';

class ResultDartCubit extends Cubit<ResultDartState> {
  ResultDartCubit() : super(ResultDartInitial());

  void calculateResult({
    required String songName,
    required String difficulty,
    required int userTime,
    required int targetTime,
    required String noteAnswer,
    required String rhythmAnswer,
  }) {
    try {
      int score = 0;
      if (userTime >= targetTime - 2 && userTime <= targetTime + 2) {
        score += 20;
      } else if (userTime >= targetTime - 5 && userTime <= targetTime + 5) {
        score += 10;
      } else {
        score += 0;
      }
      if (noteAnswer == "Yes") {
        score += 40;
      } else if (noteAnswer == "Somewhat") {
        score += 20;
      } else {
        score += 0;
      }
      if (rhythmAnswer == "Yes") {
        score += 40;
      } else if (rhythmAnswer == "Somewhat") {
        score += 20;
      } else {
        score += 0;
      }
      String performanceLevel(score) {
        if (score >= 90) {
          return "Excellent";
        } else if (score >= 70) {
          return "Good";
        } else if (score >= 50) {
          return "Passed";
        } else {
          return "Try Again!";
        }
      }

      String result = performanceLevel(score);
      final box = Hive.box<ProgressModel>("progressBox");
      box.add(
        ProgressModel(
          songName: songName,
          difficulty: difficulty,
          score: score,
          performanceLevel: result,
          date: DateTime.now().toString(),

        ),
      );
      emit(ResultCalculated(score: score, result: result));
    } catch (e) {
      print(e.toString());
    }
  }
}
