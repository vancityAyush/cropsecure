import 'package:dio/dio.dart';

/**
 * Created by : Ayush Kumar
 * Created on : 07-06-2022
 */
class CropTypeServiceNew {
  final dio = Dio();
  var data;
  dynamic cropType;
  dynamic cropName;
  dynamic cropSeason;
  dynamic cropVariety;

  CropTypeServiceNew() {
    getCropType();
  }

  String get cropTypeS => cropVariety['crop_type'];
  String get cropNameS => cropVariety['crop_name'];
  String get cropSeasonS => cropVariety['crop_season'];
  String get cropVarietyS => cropVariety['crop_varity'];

  Future<List<dynamic>> getCropType() async {
    try {
      final res = await dio.get('https://fs.frantic.in/RestApi/crop_types');
      data = res.data['0'];
    } catch (e) {
      print(e);
    }
    return data;
  }

  Future<List<dynamic>> getCropSeason() async {
    try {
      final res = await dio.get(
          'https://fs.frantic.in/RestApi/crop_seasons_by_crop_type/${cropType['id']}');
      data = res.data['0'];
    } catch (e) {
      print(e);
    }
    return data;
  }

  Future<List<dynamic>> getCropName() async {
    try {
      final res = await dio.get(
          'https://fs.frantic.in/RestApi/crop_name_by_crop_season/${cropSeason['id']}');
      data = res.data['0'];
    } catch (e) {
      print(e);
    }
    return data;
  }

  Future<List<dynamic>> getCropVariety() async {
    try {
      final res = await dio.get(
          'https://fs.frantic.in/RestApi/crop_varity_by_crop_name/${cropName['id']}');
      data = res.data['0'];
    } catch (e) {
      print(e);
    }
    return data;
  }
}
