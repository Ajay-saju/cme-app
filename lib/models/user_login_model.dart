class UserLogin {
  String? userId;
  String? councilId;
  int? countryId;
  String? stateId;
  String? roleId;
  String? categoryId;

  UserLogin(
      {this.userId,
      this.councilId,
      this.countryId,
      this.stateId,
      this.roleId,
      this.categoryId});

  UserLogin.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    councilId = json['CouncilId'];
    countryId = json['CountryId'];
    stateId = json['StateId'];
    roleId = json['RoleId'];
    categoryId = json['CategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['CouncilId'] = this.councilId;
    data['CountryId'] = this.countryId;
    data['StateId'] = this.stateId;
    data['RoleId'] = this.roleId;
    data['CategoryId'] = this.categoryId;
    return data;
  }
}