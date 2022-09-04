import 'package:CropSecure/provider/address_provider.dart';

/**
* Created by : Ayush Kumar
* Created on : 06-06-2022
*/
class AddressServiceNew {
  final api = AddressApi();
  List<dynamic> states = [];
  List<dynamic> districts = [];
  List<dynamic> talukas = [];
  List<dynamic> hoblis = [];
  List<dynamic> gramPanchayats = [];
  List<dynamic> villages = [];
  dynamic currentState;
  dynamic currentDistrict;
  dynamic currentTaluka;
  dynamic currentHobali;
  dynamic currentGramPanchayat;
  dynamic currentVillage;

  AddressServiceNew() {
    api.statesApi().then((value) {
      states = value;
      print(states);
    });
  }

  String get village => currentVillage['village'];
  String get gramPanchayat => currentGramPanchayat['gram_panchayat'];
  String get hobli => currentHobali['hobali'];
  String get taluka => currentTaluka['taluka'];
  String get district => currentDistrict['district'];
  String get state => currentState['state'];

  void reset() {
    currentState = null;
    currentDistrict = null;
    currentTaluka = null;
    currentHobali = null;
    currentGramPanchayat = null;
    currentVillage = null;
  }

  bool check() {
    if (currentState == null ||
        currentDistrict == null ||
        currentTaluka == null ||
        currentHobali == null ||
        currentGramPanchayat == null ||
        currentVillage == null) {
      return true;
    }
    return false;
  }

  Future<List<dynamic>> getDistricts() async {
    if (currentState != null) {
      districts = await api.districtsApi(currentState['id']);
    }
    return districts;
  }

  Future<List<dynamic>> getTalukas() async {
    if (currentDistrict != null) {
      talukas = await api.talukasApi(currentDistrict['id']);
    }
    return talukas;
  }

  Future<List<dynamic>> getHoblis() async {
    if (currentTaluka != null) {
      hoblis = await api.hobliApi(currentTaluka['id']);
    }
    return hoblis;
  }

  Future<List<dynamic>> getGramPanchayat() async {
    if (currentHobali != null) {
      gramPanchayats = await api.gramPanchayat(currentHobali['id']);
    }
    return gramPanchayats;
  }

  Future<List<dynamic>> getVillages() async {
    if (currentGramPanchayat != null) {
      villages = await api.villages(currentGramPanchayat['id']);
    }
    return villages;
  }
}
