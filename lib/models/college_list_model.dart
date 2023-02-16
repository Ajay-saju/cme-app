class GetCollegeList {
  String? messege;
  List<CollegeList>? collegeList;

  GetCollegeList({this.messege, this.collegeList});

  GetCollegeList.fromJson(Map<String, dynamic> json) {
    messege = json['messege'];
    if (json['College_List'] != null) {
      collegeList = <CollegeList>[];
      json['College_List'].forEach((v) {
        collegeList!.add(new CollegeList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messege'] = this.messege;
    if (this.collegeList != null) {
      data['College_List'] = this.collegeList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CollegeList {
  String? collegeCode;
  String? collegeName;

  CollegeList({this.collegeCode, this.collegeName});

  CollegeList.fromJson(Map<String, dynamic> json) {
    collegeCode = json['College_Code'];
    collegeName = json['College_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['College_Code'] = this.collegeCode;
    data['College_Name'] = this.collegeName;
    return data;
  }
}