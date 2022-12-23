class UserDetails {
  String? message;
  String? loginName;
  String? mobileNumber;
  String? countryName;
  String? emailID;
  String? specialty;
  String? councilName;
  String? regNo;
  String? stateDesc;
  String? districtName;

  UserDetails(
      {this.message,
      this.loginName,
      this.mobileNumber,
      this.countryName,
      this.emailID,
      this.specialty,
      this.councilName,
      this.regNo,
      this.stateDesc,
      this.districtName});

  UserDetails.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    loginName = json['LoginName'];
    mobileNumber = json['MobileNumber'];
    countryName = json['CountryName'];
    emailID = json['EmailID'];
    specialty = json['Specialty'];
    councilName = json['CouncilName'];
    regNo = json['RegNo'];
    stateDesc = json['StateDesc'];
    districtName = json['DistrictName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['LoginName'] = this.loginName;
    data['MobileNumber'] = this.mobileNumber;
    data['CountryName'] = this.countryName;
    data['EmailID'] = this.emailID;
    data['Specialty'] = this.specialty;
    data['CouncilName'] = this.councilName;
    data['RegNo'] = this.regNo;
    data['StateDesc'] = this.stateDesc;
    data['DistrictName'] = this.districtName;
    return data;
  }
}
