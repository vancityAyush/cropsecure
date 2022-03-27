// To parse this JSON data, do
//
//     final responseFarmer = responseFarmerFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

ResponseFarmercount responseFarmerFromJson(String str) =>
    ResponseFarmercount.fromJson(json.decode(str));

String responseFarmerToJson(ResponseFarmercount data) =>
    json.encode(data.toJson());

class ResponseFarmercount {
  ResponseFarmercount({
    this.errorCode,
    this.responseString,
    this.data,
    this.data1,
    this.data2,
    this.data3,
  });

  int errorCode;
  String responseString;
  List<Data> data;
  List<Data1> data1;
  dynamic data2;
  dynamic data3;

  factory ResponseFarmercount.fromJson(Map<String, dynamic> json) =>
      ResponseFarmercount(
        errorCode: json["error_code"] == null ? null : json["error_code"],
        responseString:
            json["response_string"] == null ? null : json["response_string"],
        data: json["data"] == null
            ? null
            : List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        data1: json["data1"] == null
            ? null
            : List<Data1>.from(json["data1"].map((x) => Data1.fromJson(x))),
        data2: json["data2"],
        data3: json["data3"],
      );

  Map<String, dynamic> toJson() => {
        "error_code": errorCode == null ? null : errorCode,
        "response_string": responseString == null ? null : responseString,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "data1": data1 == null
            ? null
            : List<dynamic>.from(data1.map((x) => x.toJson())),
        "data2": data2,
        "data3": data3,
      };
}

class Data {
  Data({
    this.count,
  });

  String count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
      };
}

class Data1 {
  Data1({
    this.area,
  });

  dynamic area;

  factory Data1.fromJson(Map<String, dynamic> json) => Data1(
        area: json["area"],
      );

  Map<String, dynamic> toJson() => {
        "area": area,
      };
}
