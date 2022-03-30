// To parse this JSON data, do
//
//     final responseFarmer = responseFarmerFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

ResponseFarmer responseFarmerFromJson(String str) =>
    ResponseFarmer.fromJson(json.decode(str));

String responseFarmerToJson(ResponseFarmer data) => json.encode(data.toJson());

class ResponseFarmer {
  ResponseFarmer({
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
  List<Data2> data2;
  dynamic data3;

  factory ResponseFarmer.fromJson(Map<String, dynamic> json) => ResponseFarmer(
        errorCode: json["error_code"] == null ? null : json["error_code"],
        responseString:
            json["response_string"] == null ? null : json["response_string"],
        data: json["data"] == null
            ? null
            : List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        data1: json["data1"] == null
            ? null
            : List<Data1>.from(json["data1"].map((x) => Data1.fromJson(x))),
        data2: json["data2"] == null
            ? null
            : List<Data2>.from(json["data2"].map((x) => Data2.fromJson(x))),
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
        "data2": data2 == null
            ? null
            : List<dynamic>.from(data2.map((x) => x.toJson())),
        "data3": data3,
      };
}

enum farmerType { F, C }

class Data {
  Data(
      {this.id,
      this.userId,
      this.name,
      this.fathernameHusbandname,
      this.gender,
      this.dob,
      this.age,
      this.handicapped,
      this.minority,
      this.caste,
      this.mobileNumber,
      this.pincode,
      this.state,
      this.districtName,
      this.taluka,
      this.hobble,
      this.gramaPanchayath,
      this.villageName,
      this.aadhaar,
      this.pan,
      this.rashan,
      this.rashanNo,
      this.panNo,
      this.aadhaarNo,
      this.image,
      this.bank,
      this.createdAt,
      this.deletedAt,
      this.type});

  String id;
  farmerType type;
  String userId;
  String name;
  String fathernameHusbandname;
  String gender;
  String dob;
  String age;
  String handicapped;
  String minority;
  String caste;
  String mobileNumber;
  String pincode;
  String state;
  String districtName;
  String taluka;
  String hobble;
  String gramaPanchayath;
  String villageName;
  String aadhaar;
  String pan;
  String rashan;
  String rashanNo;
  String panNo;
  String aadhaarNo;
  String image;
  dynamic bank;
  String createdAt;
  dynamic deletedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        name: json["name"] == null ? null : json["name"],
        fathernameHusbandname: json["fathername_husbandname"] == null
            ? null
            : json["fathername_husbandname"],
        gender: json["gender"] == null ? null : json["gender"],
        dob: json["dob"] == null ? null : json["dob"],
        age: json["age"] == null ? null : json["age"],
        handicapped: json["handicapped"] == null ? null : json["handicapped"],
        minority: json["minority"] == null ? null : json["minority"],
        caste: json["caste"] == null ? null : json["caste"],
        mobileNumber:
            json["mobile_number"] == null ? null : json["mobile_number"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        state: json["state"] == null ? null : json["state"],
        districtName:
            json["district_name"] == null ? null : json["district_name"],
        taluka: json["taluka"] == null ? null : json["taluka"],
        hobble: json["hobble"] == null ? null : json["hobble"],
        type: json["type_of_farmer"] == 'F' ? farmerType.F : farmerType.C,
        gramaPanchayath:
            json["grama_panchayath"] == null ? null : json["grama_panchayath"],
        villageName: json["village_name"] == null ? null : json["village_name"],
        aadhaar: json["Aadhaar"] == null ? null : json["Aadhaar"],
        pan: json["pan"] == null ? null : json["pan"],
        rashan: json["rashan"] == null ? null : json["rashan"],
        rashanNo: json["rashan_no"] == null ? null : json["rashan_no"],
        panNo: json["pan_no"] == null ? null : json["pan_no"],
        aadhaarNo: json["aadhaar_no"] == null ? null : json["aadhaar_no"],
        image: json["image"] == null ? null : json["image"],
        bank: json["bank"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "name": name == null ? null : name,
        "fathername_husbandname":
            fathernameHusbandname == null ? null : fathernameHusbandname,
        "gender": gender == null ? null : gender,
        "dob": dob == null ? null : dob,
        "age": age == null ? null : age,
        "handicapped": handicapped == null ? null : handicapped,
        "minority": minority == null ? null : minority,
        "caste": caste == null ? null : caste,
        "mobile_number": mobileNumber == null ? null : mobileNumber,
        "pincode": pincode == null ? null : pincode,
        "state": state == null ? null : state,
        "district_name": districtName == null ? null : districtName,
        "taluka": taluka == null ? null : taluka,
        "hobble": hobble == null ? null : hobble,
        "grama_panchayath": gramaPanchayath == null ? null : gramaPanchayath,
        "village_name": villageName == null ? null : villageName,
        "Aadhaar": aadhaar == null ? null : aadhaar,
        "pan": pan == null ? null : pan,
        "rashan": rashan == null ? null : rashan,
        "rashan_no": rashanNo,
        "pan_no": panNo,
        "aadhaar_no": aadhaarNo == null ? null : aadhaarNo,
        "image": image == null ? null : image,
        "bank": bank,
        "created_at": createdAt == null ? null : createdAt,
        "deleted_at": deletedAt,
      };
}

class Data1 {
  Data1({
    this.count,
  });

  String count;

  factory Data1.fromJson(Map<String, dynamic> json) => Data1(
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
      };
}

class Data2 {
  Data2({
    this.area,
  });

  dynamic area;

  factory Data2.fromJson(Map<String, dynamic> json) => Data2(
        area: json["area"],
      );

  Map<String, dynamic> toJson() => {
        "area": area,
      };
}
