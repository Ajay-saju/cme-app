class GetEduDEtails {
  String? status;
  List<Result>? result;

  GetEduDEtails({this.status, this.result});

  GetEduDEtails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Result'] != null) {
      result = <Result>[];
      json['Result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['Result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? message;
  Null? yEAROFPASSING;
  String? uNIVERSITY;
  String? cOLLEGE;
  String? dEGREE;
  String? uNIVERSITYId;
  String? cOLLEGEId;
  String? dEGREEId;

  Result(
      {this.message,
      this.yEAROFPASSING,
      this.uNIVERSITY,
      this.cOLLEGE,
      this.dEGREE,
      this.uNIVERSITYId,
      this.cOLLEGEId,
      this.dEGREEId});

  Result.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    yEAROFPASSING = json['YEAROFPASSING'];
    uNIVERSITY = json['UNIVERSITY'];
    cOLLEGE = json['COLLEGE'];
    dEGREE = json['DEGREE'];
    uNIVERSITYId = json['UNIVERSITY_id'];
    cOLLEGEId = json['COLLEGE_id'];
    dEGREEId = json['DEGREE_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['YEAROFPASSING'] = this.yEAROFPASSING;
    data['UNIVERSITY'] = this.uNIVERSITY;
    data['COLLEGE'] = this.cOLLEGE;
    data['DEGREE'] = this.dEGREE;
    data['UNIVERSITY_id'] = this.uNIVERSITYId;
    data['COLLEGE_id'] = this.cOLLEGEId;
    data['DEGREE_id'] = this.dEGREEId;
    return data;
  }
}