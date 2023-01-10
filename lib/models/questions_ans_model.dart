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
  String? aNS;

  QAList({this.message, this.qN, this.aNS});

  QAList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    qN = json['QN'];
    aNS = json['ANS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['QN'] = this.qN;
    data['ANS'] = this.aNS;
    return data;
  }
}
