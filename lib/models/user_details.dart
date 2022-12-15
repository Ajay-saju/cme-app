class GetUserDetails {
  int? iD;
  int? countryId;
  String? stateId;
  String? councilId;
  String? memberID;
  String? memberCnt;
  String? title;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? gender;
  String? registrationNo;
  String? designation;
  String? roleId;
  String? photo;
  String? emailID;
  String? phoneNumber;
  String? status;
  String? regType;
  String? specialty;
  String? password;
  String? active;
  String? createdBy;
  String? createdOn;
  String? updatedBy;
  String? updatedOn;
  String? districId;
  String? categoryname;

  GetUserDetails(
      {this.iD,
      this.countryId,
      this.stateId,
      this.councilId,
      this.memberID,
      this.memberCnt,
      this.title,
      this.firstName,
      this.lastName,
      this.birthDate,
      this.gender,
      this.registrationNo,
      this.designation,
      this.roleId,
      this.photo,
      this.emailID,
      this.phoneNumber,
      this.status,
      this.regType,
      this.specialty,
      this.password,
      this.active,
      this.createdBy,
      this.createdOn,
      this.updatedBy,
      this.updatedOn,
      this.districId,
      this.categoryname});

  GetUserDetails.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    countryId = json['CountryId'];
    stateId = json['StateId'];
    councilId = json['CouncilId'];
    memberID = json['MemberID'];
    memberCnt = json['MemberCnt'];
    title = json['title'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    birthDate = json['BirthDate'];
    gender = json['Gender'];
    registrationNo = json['RegistrationNo'];
    designation = json['Designation'];
    roleId = json['RoleId'];
    photo = json['Photo'];
    emailID = json['EmailID'];
    phoneNumber = json['PhoneNumber'];
    status = json['Status'];
    regType = json['Reg_Type'];
    specialty = json['Specialty'];
    password = json['Password'];
    active = json['Active'];
    createdBy = json['CreatedBy'];
    createdOn = json['CreatedOn'];
    updatedBy = json['UpdatedBy'];
    updatedOn = json['UpdatedOn'];
    districId = json['Distric_id'];
    categoryname = json['categoryname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CountryId'] = this.countryId;
    data['StateId'] = this.stateId;
    data['CouncilId'] = this.councilId;
    data['MemberID'] = this.memberID;
    data['MemberCnt'] = this.memberCnt;
    data['title'] = this.title;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['BirthDate'] = this.birthDate;
    data['Gender'] = this.gender;
    data['RegistrationNo'] = this.registrationNo;
    data['Designation'] = this.designation;
    data['RoleId'] = this.roleId;
    data['Photo'] = this.photo;
    data['EmailID'] = this.emailID;
    data['PhoneNumber'] = this.phoneNumber;
    data['Status'] = this.status;
    data['Reg_Type'] = this.regType;
    data['Specialty'] = this.specialty;
    data['Password'] = this.password;
    data['Active'] = this.active;
    data['CreatedBy'] = this.createdBy;
    data['CreatedOn'] = this.createdOn;
    data['UpdatedBy'] = this.updatedBy;
    data['UpdatedOn'] = this.updatedOn;
    data['Distric_id'] = this.districId;
    data['categoryname'] = this.categoryname;
    return data;
  }
}
