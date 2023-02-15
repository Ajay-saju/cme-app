class UserDashBordDetails {
  List<Lastlogin>? lastlogin;
  List<NewVideolist>? newVideolist;
  List<LastBuyVideo>? lastBuyVideo;
  List<LastTest>? lastTest;

  UserDashBordDetails(
      {this.lastlogin, this.newVideolist, this.lastBuyVideo, this.lastTest});

  UserDashBordDetails.fromJson(Map<String, dynamic> json) {
    if (json['Lastlogin'] != null) {
      lastlogin = <Lastlogin>[];
      json['Lastlogin'].forEach((v) {
        lastlogin!.add(new Lastlogin.fromJson(v));
      });
    }
    if (json['NewVideolist'] != null) {
      newVideolist = <NewVideolist>[];
      json['NewVideolist'].forEach((v) {
        newVideolist!.add(new NewVideolist.fromJson(v));
      });
    }
    if (json['LastBuyVideo'] != null) {
      lastBuyVideo = <LastBuyVideo>[];
      json['LastBuyVideo'].forEach((v) {
        lastBuyVideo!.add(new LastBuyVideo.fromJson(v));
      });
    }
    if (json['LastTest'] != null) {
      lastTest = <LastTest>[];
      json['LastTest'].forEach((v) {
        lastTest!.add(new LastTest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lastlogin != null) {
      data['Lastlogin'] = this.lastlogin!.map((v) => v.toJson()).toList();
    }
    if (this.newVideolist != null) {
      data['NewVideolist'] = this.newVideolist!.map((v) => v.toJson()).toList();
    }
    if (this.lastBuyVideo != null) {
      data['LastBuyVideo'] = this.lastBuyVideo!.map((v) => v.toJson()).toList();
    }
    if (this.lastTest != null) {
      data['LastTest'] = this.lastTest!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lastlogin {
  String? message;
  String? lastLogT;

  Lastlogin({this.message, this.lastLogT});

  Lastlogin.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    lastLogT = json['LastLogT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['LastLogT'] = this.lastLogT;
    return data;
  }
}

class NewVideolist {
  String? messege;
  String? latestV;

  NewVideolist({this.messege, this.latestV});

  NewVideolist.fromJson(Map<String, dynamic> json) {
    messege = json['messege'];
    latestV = json['LatestV'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messege'] = this.messege;
    data['LatestV'] = this.latestV;
    return data;
  }
}

class LastBuyVideo {
  String? messege;
  String? lastBuy;

  LastBuyVideo({this.messege, this.lastBuy});

  LastBuyVideo.fromJson(Map<String, dynamic> json) {
    messege = json['messege'];
    lastBuy = json['LastBuy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messege'] = this.messege;
    data['LastBuy'] = this.lastBuy;
    return data;
  }
}

class LastTest {
  String? message;
  String? lastTest;

  LastTest({this.message, this.lastTest});

  LastTest.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    lastTest = json['LastTest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['LastTest'] = this.lastTest;
    return data;
  }
}