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
  String? yEAROFPASSING;
  String? uNIVERSITY;
  String? cOLLEGE;
  String? dEGREE;

  Result(
      {this.message,
      this.yEAROFPASSING,
      this.uNIVERSITY,
      this.cOLLEGE,
      this.dEGREE});

  Result.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    yEAROFPASSING = json['YEAROFPASSING'];
    uNIVERSITY = json['UNIVERSITY'];
    cOLLEGE = json['COLLEGE'];
    dEGREE = json['DEGREE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['YEAROFPASSING'] = this.yEAROFPASSING;
    data['UNIVERSITY'] = this.uNIVERSITY;
    data['COLLEGE'] = this.cOLLEGE;
    data['DEGREE'] = this.dEGREE;
    return data;
  }
}