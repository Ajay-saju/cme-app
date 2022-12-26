class GetPayment {
  String? status;
  List<UserData1>? userData1;

  GetPayment({this.status, this.userData1});

  GetPayment.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['userData1'] != null) {
      userData1 = <UserData1>[];
      json['userData1'].forEach((v) {
        userData1!.add(new UserData1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.userData1 != null) {
      data['userData1'] = this.userData1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserData1 {
  String? message;
  String? date;
  String? videoName;
  String? payId;
  String? receiptNumber;
  String? amount;
  String? certificateLink;
  String? regnum;

  UserData1(
      {this.message,
      this.date,
      this.videoName,
      this.payId,
      this.receiptNumber,
      this.amount,
      this.certificateLink,
      this.regnum});

  UserData1.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    date = json['Date'];
    videoName = json['VideoName'];
    payId = json['pay_id'];
    receiptNumber = json['ReceiptNumber'];
    amount = json['Amount'];
    certificateLink = json['CertificateLink'];
    regnum = json['regnum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['Date'] = this.date;
    data['VideoName'] = this.videoName;
    data['pay_id'] = this.payId;
    data['ReceiptNumber'] = this.receiptNumber;
    data['Amount'] = this.amount;
    data['CertificateLink'] = this.certificateLink;
    data['regnum'] = this.regnum;
    return data;
  }
}