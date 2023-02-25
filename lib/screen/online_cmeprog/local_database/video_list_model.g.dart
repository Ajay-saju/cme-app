// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoListModelAdapter extends TypeAdapter<VideoListModel> {
  @override
  final int typeId = 0;

  @override
  VideoListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoListModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VideoListModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.videoName)
      ..writeByte(1)
      ..write(obj.speakerName)
      ..writeByte(2)
      ..write(obj.videothambnails)
      ..writeByte(3)
      ..write(obj.videoTimingHour)
      ..writeByte(4)
      ..write(obj.videoPath)
      ..writeByte(5)
      ..write(obj.creditPoint)
      ..writeByte(6)
      ..write(obj.videoId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
