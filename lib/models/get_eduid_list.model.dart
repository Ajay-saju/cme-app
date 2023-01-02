class GetEducationIdList {
  String? massege;
  List<UniversityList>? universityList;
  List<CollegeList>? collegeList;
  List<CourseList>? courseList;

  GetEducationIdList(
      {this.massege, this.universityList, this.collegeList, this.courseList});

  GetEducationIdList.fromJson(Map<String, dynamic> json) {
    massege = json['massege'];
    if (json['University_List'] != null) {
      universityList = <UniversityList>[];
      json['University_List'].forEach((v) {
        universityList!.add(new UniversityList.fromJson(v));
      });
    }
    if (json['College_List'] != null) {
      collegeList = <CollegeList>[];
      json['College_List'].forEach((v) {
        collegeList!.add(new CollegeList.fromJson(v));
      });
    }
    if (json['Course_List'] != null) {
      courseList = <CourseList>[];
      json['Course_List'].forEach((v) {
        courseList!.add(new CourseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massege'] = this.massege;
    if (this.universityList != null) {
      data['University_List'] =
          this.universityList!.map((v) => v.toJson()).toList();
    }
    if (this.collegeList != null) {
      data['College_List'] = this.collegeList!.map((v) => v.toJson()).toList();
    }
    if (this.courseList != null) {
      data['Course_List'] = this.courseList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UniversityList {
  String? universitCode;
  String? universitName;

  UniversityList({this.universitCode, this.universitName});

  UniversityList.fromJson(Map<String, dynamic> json) {
    universitCode = json['Universit_Code'];
    universitName = json['Universit_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Universit_Code'] = this.universitCode;
    data['Universit_Name'] = this.universitName;
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

class CourseList {
  String? courseId;
  String? courseName;

  CourseList({this.courseId, this.courseName});

  CourseList.fromJson(Map<String, dynamic> json) {
    courseId = json['Course_Id'];
    courseName = json['Course_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Course_Id'] = this.courseId;
    data['Course_Name'] = this.courseName;
    return data;
  }
}