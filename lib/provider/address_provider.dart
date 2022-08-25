import 'package:dio/dio.dart';

class AddressApi {
  final dio = Dio();

  Future<dynamic> statesApi() async {
    try {
      Response response = await dio.get("https://fs.frantic.in/RestApi/states");
      return response.data['0'];
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<dynamic> districtsApi(String id) async {
    try {
      Response response = await dio
          .get("https://fs.frantic.in/RestApi/get_district_by_state/$id");
      return response.data['0'];
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<dynamic> talukasApi(String id) async {
    try {
      Response response = await dio
          .get("https://fs.frantic.in/RestApi/get_taluka_by_district/$id");
      return response.data['0'];
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<dynamic> hobliApi(String id) async {
    try {
      Response response = await dio
          .get("https://fs.frantic.in/RestApi/get_hobali_by_taluka/$id");
      return response.data['0'];
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<dynamic> gramPanchayat(String id) async {
    try {
      Response response = await dio.get(
          "https://fs.frantic.in/RestApi/get_gram_panchayat_by_hobali/$id");
      return response.data['0'];
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<dynamic> villages(String id) async {
    try {
      Response response = await dio.get(
          "https://fs.frantic.in/RestApi/get_village_by_gram_panchayat/$id");
      return response.data['0'];
    } on DioError catch (e) {
      print(e);
    }
  }
}
