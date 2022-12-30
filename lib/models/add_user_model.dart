class AddUserModel {
  String? message;
  String? alert;

  AddUserModel({this.message, this.alert});

  AddUserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    alert = json['alert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['alert'] = this.alert;
    return data;
  }
}