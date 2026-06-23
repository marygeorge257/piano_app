part of 'result_dart_cubit.dart';

@immutable
sealed class ResultDartState {}

final class ResultDartInitial extends ResultDartState {}
final class ResultCalculated extends ResultDartState{
  final int score;
  final String result;
  ResultCalculated({required this.score,required this.result});
}
