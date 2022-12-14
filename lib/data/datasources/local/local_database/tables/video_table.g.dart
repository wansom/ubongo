// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoTableAdapter extends TypeAdapter<VideoTable> {
  @override
  final int typeId = 0;

  @override
  VideoTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoTable(
      id: fields[1] as String,
      description: fields[2] as String,
      completed: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, VideoTable obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.completed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
