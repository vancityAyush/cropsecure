import 'dart:convert';

import 'package:flutter/services.dart';

/**
 * Created by : Ayush Kumar
 * Created on : 07-06-2022
 */
class CropTypeService {
  var data;
  String cropType;
  String cropName;
  String cropVariety;

  CropTypeService() {
    readJson();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/crop.json');
    data = await json.decode(response);
  }

  List<String> getCropType() {
    return data.keys.toList();
  }

  List<String> getCropName() {
    if (cropType != null) {
      return data[cropType].keys.toList();
    } else {
      return [];
    }
  }

  List<String> getCropVariety() {
    if (cropType != null && cropName != null) {
      return data[cropType][cropName].keys.toList();
    } else
      return [];
  }
}
