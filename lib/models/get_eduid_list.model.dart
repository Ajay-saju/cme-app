// class GetEducationIdList {
//   String? massege;
//   List<UniversityList>? universityList;
//   List<CollegeList>? collegeList;
//   List<SpecialtyList>? specialtyList;

//   GetEducationIdList(
//       {this.massege,
//       this.universityList,
//       this.collegeList,
//       this.specialtyList});

//   GetEducationIdList.fromJson(Map<String, dynamic> json) {
//     massege = json['massege'];
//     if (json['University_List'] != null) {
//       universityList = <UniversityList>[];
//       json['University_List'].forEach((v) {
//         universityList!.add(new UniversityList.fromJson(v));
//       });
//     }
//     if (json['College_List'] != null) {
//       collegeList = <CollegeList>[];
//       json['College_List'].forEach((v) {
//         collegeList!.add(new CollegeList.fromJson(v));
//       });
//     }
//     if (json['Specialty_List'] != null) {
//       specialtyList = <SpecialtyList>[];
//       json['Specialty_List'].forEach((v) {
//         specialtyList!.add(new SpecialtyList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['massege'] = this.massege;
//     if (this.universityList != null) {
//       data['University_List'] =
//           this.universityList!.map((v) => v.toJson()).toList();
//     }
//     if (this.collegeList != null) {
//       data['College_List'] = this.collegeList!.map((v) => v.toJson()).toList();
//     }
//     if (this.specialtyList != null) {
//       data['Specialty_List'] =
//           this.specialtyList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class UniversityList {
//   String? universitCode;
//   String? universitName;

//   UniversityList({this.universitCode, this.universitName});

//   UniversityList.fromJson(Map<String, dynamic> json) {
//     universitCode = json['Universit_Code'];
//     universitName = json['Universit_Name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Universit_Code'] = this.universitCode;
//     data['Universit_Name'] = this.universitName;
//     return data;
//   }
// }



// class SpecialtyList {
//   int? specialtyId;
//   String? specialtyName;

//   SpecialtyList({this.specialtyId, this.specialtyName});

//   SpecialtyList.fromJson(Map<String, dynamic> json) {
//     specialtyId = json['Specialty_Id'];
//     specialtyName = json['Specialty_Name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Specialty_Id'] = this.specialtyId;
//     data['Specialty_Name'] = this.specialtyName;
//     return data;
//   }
// }
class GetEducationIdList {
  String? massege;
  List<UniversityList>? universityList;
  List<SpecialtyList>? specialtyList;

  GetEducationIdList({this.massege, this.universityList, this.specialtyList});

  GetEducationIdList.fromJson(Map<String, dynamic> json) {
    massege = json['massege'];
    if (json['University_List'] != null) {
      universityList = <UniversityList>[];
      json['University_List'].forEach((v) {
        universityList!.add(new UniversityList.fromJson(v));
      });
    }
    if (json['Specialty_List'] != null) {
      specialtyList = <SpecialtyList>[];
      json['Specialty_List'].forEach((v) {
        specialtyList!.add(new SpecialtyList.fromJson(v));
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
    if (this.specialtyList != null) {
      data['Specialty_List'] =
          this.specialtyList!.map((v) => v.toJson()).toList();
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

class SpecialtyList {
  int? specialtyId;
  String? specialtyName;

  SpecialtyList({this.specialtyId, this.specialtyName});

  SpecialtyList.fromJson(Map<String, dynamic> json) {
    specialtyId = json['Specialty_Id'];
    specialtyName = json['Specialty_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Specialty_Id'] = this.specialtyId;
    data['Specialty_Name'] = this.specialtyName;
    return data;
  }
}


