import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

/**
* Created by : Ayush Kumar
* Created on : 06-06-2022
*/
class AddressService {
  Dio dio = new Dio();
  Map<String, dynamic> data;
  String state;
  String district;
  String taluka;
  String hobli;
  String gp;
  String village;
  AddressService() {
    readJson();
  }

  void reset() {
    state = null;
    district = null;
    taluka = null;
    hobli = null;
    gp = null;
    village = null;
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/address.json');
    data = await json.decode(response);
  }

  List<String> getState() {
    return data.keys.toList();
  }

  List<String> getDistrict() {
    if (state != null) {
      return data[state].keys.toList();
    } else {
      return [];
    }
  }

  List<String> getTaluka() {
    if (state != null && district != null) {
      return data[state][district].keys.toList();
    } else
      return [];
  }

  List<String> getHobli() {
    if (state != null && district != null && taluka != null) {
      return data[state][district][taluka].keys.toList();
    } else
      return [];
  }

  List<String> getGP() {
    if (state != null && district != null && taluka != null && hobli != null) {
      return data[state][district][taluka][hobli].keys.toList();
    } else
      return [];
  }

  List<String> getVillage() {
    if (state != null &&
        district != null &&
        taluka != null &&
        hobli != null &&
        gp != null) {
      var temp = data[state][district][taluka][hobli][gp].keys.toList();
      return temp;
    } else
      return [];
  }
}
