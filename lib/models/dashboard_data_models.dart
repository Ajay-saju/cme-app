class UserCmeVideo {
  String? massege;
  String? latest;

  UserCmeVideo({this.massege, this.latest});

  UserCmeVideo.fromJson(Map<String, dynamic> json) {
    massege = json['massege'];
    latest = json['Latest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massege'] = this.massege;
    data['Latest'] = this.latest;
    return data;
  }
}
class UserCmeVideoPurchese {
  String? massege;
  String? latest;

  UserCmeVideoPurchese({this.massege, this.latest});

  UserCmeVideoPurchese.fromJson(Map<String, dynamic> json) {
    massege = json['massege'];
    latest = json['Latest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massege'] = this.massege;
    data['Latest'] = this.latest;
    return data;
  }
}
class UserCmeVideoLastTest {
  String? massege;
  String? latest;

  UserCmeVideoLastTest({this.massege, this.latest});

  UserCmeVideoLastTest.fromJson(Map<String, dynamic> json) {
    massege = json['massege'];
    latest = json['Latest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massege'] = this.massege;
    data['Latest'] = this.latest;
    return data;
  }
}