class AllCmeVideos {
  String? status;
  List<VideoList>? videoList;

  AllCmeVideos({this.status, this.videoList});

  AllCmeVideos.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Video_List'] != null) {
      videoList = <VideoList>[];
      json['Video_List'].forEach((v) {
        videoList!.add(new VideoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.videoList != null) {
      data['Video_List'] = this.videoList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VideoList {
  String? message;
  String? videoPath;
  String? videoTimingHour;
  String? videoAmount;
  String? videoId;
  String? speakerSpecialty;
  String? creditPoint;
  String? videoName;
  String? speakerName;

  VideoList(
      {this.message,
      this.videoPath,
      this.videoTimingHour,
      this.videoAmount,
      this.videoId,
      this.speakerSpecialty,
      this.creditPoint,
      this.videoName,
      this.speakerName});

  VideoList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    videoPath = json['VideoPath'];
    videoTimingHour = json['VideoTiming_Hour'];
    videoAmount = json['VideoAmount'];
    videoId = json['VideoId'];
    speakerSpecialty = json['SpeakerSpecialty'];
    creditPoint = json['CreditPoint'];
    videoName = json['VideoName'];
    speakerName = json['SpeakerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['VideoPath'] = this.videoPath;
    data['VideoTiming_Hour'] = this.videoTimingHour;
    data['VideoAmount'] = this.videoAmount;
    data['VideoId'] = this.videoId;
    data['SpeakerSpecialty'] = this.speakerSpecialty;
    data['CreditPoint'] = this.creditPoint;
    data['VideoName'] = this.videoName;
    data['SpeakerName'] = this.speakerName;
    return data;
  }
}