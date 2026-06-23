// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProgressModelAdapter extends TypeAdapter<ProgressModel> {
  @override
  final int typeId = 0;

  @override
  ProgressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProgressModel(
      songName: fields[0] as String,
      difficulty: fields[1] as String,
      score: fields[2] as int,
      performanceLevel: fields[3] as String,
      date: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProgressModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.songName)
      ..writeByte(1)
      ..write(obj.difficulty)
      ..writeByte(2)
      ..write(obj.score)
      ..writeByte(3)
      ..write(obj.performanceLevel)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
