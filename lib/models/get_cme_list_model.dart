// To parse this JSON data, do
//
//     final getCmeList = getCmeListFromJson(jsonString);

import 'dart:convert';

GetCmeList getCmeListFromJson(String str) => GetCmeList.fromJson(json.decode(str));

String getCmeListToJson(GetCmeList data) => json.encode(data.toJson());

class GetCmeList {
    GetCmeList({
        this.status,
        this.list,
    });

    String? status;
    List<ListElement>? list;

    factory GetCmeList.fromJson(Map<String, dynamic> json) => GetCmeList(
        status: json["status"],
        list: List<ListElement>.from(json["List"].map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "List": List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    ListElement({
        this.message,
        this.videoName,
        this.videoId,
        this.creditPointsNumber,
        this.attendedDate,
        this.createdOn,
        this.attempt,
        this.cmeCertLink,
    });

    String? message;
    String? videoName;
    String? videoId;
    String? creditPointsNumber;
    String? attendedDate;
    String? createdOn;
    String? attempt;
    String? cmeCertLink;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        message: json["message"],
        videoName: json["VideoName"],
        videoId: json["VideoId"],
        creditPointsNumber: json["CreditPointsNumber"],
        attendedDate: json["AttendedDate"],
        createdOn: json["CreatedOn"] == null ? null : json["CreatedOn"],
        attempt: json["Attempt"],
        cmeCertLink: json["CMECertLink"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "VideoName": videoName,
        "VideoId": videoId,
        "CreditPointsNumber": creditPointsNumber,
        "AttendedDate": attendedDate,
        "CreatedOn": createdOn == null ? null : createdOn,
        "Attempt": attempt,
        "CMECertLink": cmeCertLink,
    };
}
