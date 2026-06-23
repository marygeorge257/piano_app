import 'package:hive/hive.dart';

part 'progress_model.g.dart';

@HiveType(typeId: 0)
class ProgressModel extends HiveObject {
  @HiveField(0)
  String songName;
  @HiveField(1)
  String difficulty;
  @HiveField(2)
  int score;
  @HiveField(3)
  String performanceLevel;
  @HiveField(4)
  String date;

  ProgressModel({
    required this.songName,
    required this.difficulty,
    required this.score,
    required this.performanceLevel,
    required this.date,
  });
}
