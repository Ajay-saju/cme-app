import 'package:hive/hive.dart';
part 'video_list_model.g.dart';

@HiveType(typeId: 0)
class VideoListModel {
  @HiveField(0)
  final String videoName;
  @HiveField(1)
  final String speakerName;
  @HiveField(2)
  final String videothambnails;
  @HiveField(3)
  final String videoTimingHour;
  @HiveField(4)
  final String videoPath;
  @HiveField(5)
  final String creditPoint;

  VideoListModel(this.videoName, this.speakerName, this.videothambnails,
      this.videoTimingHour, this.videoPath, this.creditPoint);
}
