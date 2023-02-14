class QuestionsAnsList {
  String? status;
  List<QAList>? qAList;

  QuestionsAnsList({this.status, this.qAList});

  QuestionsAnsList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['QA_List'] != null) {
      qAList = <QAList>[];
      json['QA_List'].forEach((v) {
        qAList!.add(new QAList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.qAList != null) {
      data['QA_List'] = this.qAList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QAList {
  String? message;
  String? qN;
  String? qId;
  String? aNS;
  String? cOff;
  String? qlis;

  QAList({this.message, this.qN, this.qId, this.aNS, this.cOff, this.qlis});

  QAList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    qN = json['QN'];
    qId = json['QId'];
    aNS = json['ANS'];
    cOff = json['COff'];
    qlis = json['qlis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['QN'] = this.qN;
    data['QId'] = this.qId;
    data['ANS'] = this.aNS;
    data['COff'] = this.cOff;
    data['qlis'] = this.qlis;
    return data;
  }
}