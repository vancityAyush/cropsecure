// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:io';

import 'package:cropsecure/data/datasource/remote/dio/dio_client.dart';
import 'package:cropsecure/data/datasource/remote/exception/api_error_handler.dart';
import 'package:cropsecure/data/model/response/base/api_response.dart';
import 'package:cropsecure/data/model/response/responsefamer.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:cropsecure/utill/sharedprefrence.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  final DioClient dioClient;
  AuthRepo({this.dioClient});

  Future<ApiResponse> registration(
      String name,
      String phone,
      String villageName,
      String grama,
      String hobali,
      String subDistrictm,
      String districtName,
      String stateName,
      String password) async {
    FormData formData = FormData.fromMap({
      "name": name,
      "phone": phone,
      "village_name": villageName,
      "grama_panchayath": grama,
      "hobali": hobali,
      "sub_district": subDistrictm,
      "district_name": districtName,
      "state_name": stateName,
      "password": password,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.registerApi,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> editProfileApi(
      String name,
      String phone,
      String villageName,
      String grama,
      String hobali,
      String subDistrictm,
      String districtName,
      String stateName,
      String password) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.userId);
    FormData formData = FormData.fromMap({
      "name": name,
      "phone": phone,
      "village_name": villageName,
      "grama_panchayath": grama,
      "hobali": hobali,
      "sub_district": subDistrictm,
      "district_name": districtName,
      "state_name": stateName,
      // "password":password,
      "key": key
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.editProfileApi,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////set Verify Otp///////////////////////

  Future<ApiResponse> setVerifyOtpApi(String key) async {
    FormData formData = FormData.fromMap({"key": key});

    print(formData.fields);

    try {
      Response response =
          await dioClient.post(AppConstants.setVerifyOtp, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////verify Otp///////////////////////

  Future<ApiResponse> verifyOtpApi(String otp) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.userId);

    FormData formData = FormData.fromMap({"key": key, "otp": otp});

    print(formData.fields);

    try {
      Response response =
          await dioClient.post(AppConstants.verifyOtp, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ///////////// Fetch Profile //////////////
  Future<ApiResponse> fetchProfileApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.userId);
    FormData formData = FormData.fromMap({"key": key});
    try {
      Response response =
          await dioClient.post(AppConstants.fetchProfileApi, data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ///////////// Fetch Profile //////////////
  Future<ApiResponse> fetchDiseaseAlert(String plotId) async {
    try {
      Response response =
          await dioClient.post(AppConstants.fetchDiseaseAlert + "/" + plotId);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////login User Api///////////////////////

  Future<ApiResponse> loginUserApi(String userName, String password) async {
    FormData formData =
        FormData.fromMap({"phone": userName, "password": password});

    print(formData.fields);

    try {
      Response response =
          await dioClient.post(AppConstants.loginApi, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////Calculator Add Api///////////////////////

  Future<ApiResponse> calculatorAdd(
      String id,
      String method,
      String productMixed,
      String productName,
      String quantity,
      String appliedOn,
      File image) async {
    FormData formData = FormData.fromMap({
      "plot_id": id,
      "method_of_apply": method,
      "product_mixed": productMixed,
      "product_name": productName,
      "quantity": quantity,
      "applied_on": appliedOn,
      "image": MultipartFile.fromFile(image.path, filename: "image.jpg")
    });
    print(formData.fields);

    try {
      Response response =
          await dioClient.post(AppConstants.calculator, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////Disease Alert Add Api///////////////////////

  Future<ApiResponse> diseaseAlertAdd(String plotId, String isAffected,
      String areaDate, String newAdvice, String comment, File image) async {
    FormData formData = FormData.fromMap({
      "plot_id": plotId,
      "is_area_affected": isAffected,
      "area_date": areaDate,
      "new_advice": newAdvice,
      "comment": comment,
      "image": MultipartFile.fromFile(image.path, filename: "image.jpg")
    });
    print(formData.fields);

    try {
      Response response =
          await dioClient.post(AppConstants.addDiseaseAlert, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////feedbackApi///////////////////////

  Future<ApiResponse> feedbackApi(
      String user_id,
      String plot_digitisation,
      String crop_management,
      String specific_crop_advisory,
      String expected_harvest_quantity,
      String masked_linkage,
      String farm_level_meeting,
      String farm_level_alerts,
      String weather_report,
      String welcome_sms,
      String comments) async {
    FormData formData = FormData.fromMap({
      "user_id": user_id,
      "plot_digitisation": plot_digitisation,
      "crop_management": crop_management,
      "specific_crop_advisory": specific_crop_advisory,
      "expected_harvest_quantity": expected_harvest_quantity,
      "masked_linkage": masked_linkage,
      "farm_level_meeting": farm_level_meeting,
      "farm_level_alerts": farm_level_alerts,
      "weather_report": weather_report,
      "welcome_sms": welcome_sms,
      "comments": comments
    });
    try {
      Response response =
          await dioClient.post(AppConstants.feedBackApi, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////profileApi///////////////////////

  Future<ApiResponse> profileApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.userId);
    FormData formData = FormData.fromMap({
      "key": key,
    });

    print(formData.fields);

    try {
      Response response =
          await dioClient.post(AppConstants.loginApi, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// registerFarmer ///////////
  Future<ApiResponse> registerFarmerApi(
      String name,
      String fatherName,
      String mobileNumber,
      String villageName,
      String aadharno,
      String pan,
      String rashanno,
      String gramaPanchayath,
      String hobble,
      String taluka,
      String districtName,
      String state,
      String gender,
      String dob,
      String age,
      String handicapped,
      String minority,
      String caste,
      File adhaar,
      File rashan,
      File panCard,
      File image,
      {farmerType type}) async {
    var key =
        await SharedPrefManager.getPrefrenceString(AppConstants.newUserId);
    var map = {
      "user_id": key,
      "name": name,
      "fathername_husbandname": fatherName,
      "mobile_number": mobileNumber,
      "village_name": villageName,
      "aadhaar_no": aadharno,
      "pan_no": pan,
      "rashan_no": rashanno,
      "grama_panchayath": gramaPanchayath,
      "hobble": hobble,
      "taluka": taluka,
      "district_name": districtName,
      "state": state,
      "gender": gender,
      "dob": dob,
      "age": age,
      "handicapped": handicapped,
      "minority": minority,
      "caste": caste,
      "Aadhaar": MultipartFile.fromFileSync(adhaar.path),
      "rashan": MultipartFile.fromFileSync(rashan.path),
      "image": MultipartFile.fromFileSync(image.path),
      "pan": MultipartFile.fromFileSync(panCard.path),
    };
    if (type == farmerType.C) {
      map.addAll({
        "farmer_type": "C",
      });
    }
    FormData formData = FormData.fromMap(map);

    try {
      Response response = await dioClient.post(
        AppConstants.registerFarmer,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchFarmerApi///////////////////////

  Future<ApiResponse> fetchFarmerApi() async {
    var key =
        await SharedPrefManager.getPrefrenceString(AppConstants.newUserId);
    FormData formData = FormData.fromMap({});

    try {
      Response response = await dioClient
          .post(AppConstants.fetchFarmer + "/" + key, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchIrrigation///////////////////////

  Future<ApiResponse> fetchIrrigationApi() async {
    try {
      Response response = await dioClient.get(AppConstants.fetchIrrigation);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchFarmercountApi///////////////////////

  Future<ApiResponse> fetchFarmercountApi() async {
    var key =
        await SharedPrefManager.getPrefrenceString(AppConstants.newUserId);
    var key2 =
        await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    FormData formData = FormData.fromMap({
      "farmer_id": key2,
    });

    try {
      Response response = await dioClient
          .post(AppConstants.fetchFarmercount + "/" + key, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////// fetch Dashboard ///////

  Future<ApiResponse> fetchDashBoardApi() async {
    var key =
        await SharedPrefManager.getPrefrenceString(AppConstants.newUserId);

    try {
      Response response =
          await dioClient.get(AppConstants.fetchDashboard + "/" + key);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////// fetch Result ///////

  Future<ApiResponse> fetchResult() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);

    try {
      Response response =
          await dioClient.get(AppConstants.fetchResult + "/" + key);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// addBankDetails ///////////
  Future<ApiResponse> addBankDetailsApi(
      String bankName,
      String ifscCode,
      String accountNumber,
      String holderName,
      String branchName,
      String id) async {
    var key =
        await SharedPrefManager.getPrefrenceString(AppConstants.newUserId);
    FormData formData = FormData.fromMap({
      "user_id": key,
      "bank_name": bankName,
      "ifsc": ifscCode,
      "account_no": accountNumber,
      "holder_name": holderName,
      "branch_name": branchName
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.registerFarmer + "/" + id,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// addPlotsApi ///////////
  Future<ApiResponse> addPlotsApi(
      String farmerId,
      String survey_no,
      String area,
      String category,
      String soil_type,
      String source_of_irrigation,
      String source_of_water,
      String district,
      String taluka,
      String gram_panchayath,
      String village,
      String pincode,
      File farmer_plot,
      File phani_plot,
      String latitude,
      String longitude) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    FormData formData = FormData.fromMap({
      "farmer_id": key,
      "survey_no": survey_no,
      "area": area,
      "category": category,
      "soil_type": soil_type,
      "source_of_irrigation": source_of_irrigation,
      "source_of_water": source_of_water,
      "district": district,
      "taluka": taluka,
      "gram_panchayath": gram_panchayath,
      "village": village,
      "pincode": pincode,
      "farmer_plot": MultipartFile.fromFileSync(farmer_plot.path),
      "phani_plot": MultipartFile.fromFileSync(phani_plot.path),
      "latitude": latitude,
      "longitude": longitude,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plots,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// updateLocation ///////////
  Future<ApiResponse> updateLocation(
    dynamic data,
  ) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    FormData formData = FormData.fromMap(data);

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plots + "/" + data['id'],
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchPlotsApi///////////////////////

  Future<ApiResponse> fetchPlotsApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient
          .post(AppConstants.fetchPlots + "/" + key, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetch Calculator///////////////////////

  Future<ApiResponse> fetchCalculator(String plotId) async {
    // var key = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    // FormData formData = FormData.fromMap({});

    // print(formData.fields);

    try {
      Response response =
          await dioClient.post(AppConstants.fetchCalculator + "/" + plotId);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// plotExpenditureApi ///////////
  Future<ApiResponse> plotExpenditureApi(
      String date, String particular_select, String amount) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "date": date,
      "plot_id": key,
      "particular_select": particular_select,
      "amount": amount
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotExpenditure,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// plotExpenditureApi ///////////
  Future<ApiResponse> plotFieldVisit(
      String cropType,
      String cropName,
      String crop_varities,
      String source_of_seeds,
      String specific_technology,
      String showingDate,
      String mixedCrop) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "crop_type": cropType,
      "plot_id": key,
      "crop_name": cropName,
      "crop_varities": crop_varities,
      "source_of_seeds": source_of_seeds,
      "specific_technology": specific_technology,
      "sowing_date": showingDate,
      "mixed_crop": mixedCrop,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotFieldVisit,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchPlotExpenditure///////////////////////

  Future<ApiResponse> fetchPlotExpenditure() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient
          .post(AppConstants.fetchPlotExpenditure + "/" + key, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetch disease popup///////////////////////

  Future<ApiResponse> fetchDiseasePopup() async {
    try {
      Response response = await dioClient.post(AppConstants.popUpDisease);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchPlotExpenditure///////////////////////

  Future<ApiResponse> fetchFieldVisit() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient
          .post(AppConstants.fetchFieldVisit + "/" + key, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// plotYieldsApi ///////////
  Future<ApiResponse> plotYieldsApi(
      String date, String particular_select, String amount) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "date": key,
      "plot_id": key,
      "particular_select": particular_select,
      "amount": amount
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotExpenditure,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// addPlotYieldsApi ///////////
  Future<ApiResponse> addPlotYieldsApi(
      String moisture,
      String grade,
      String pickupdate,
      String pickupTime,
      String weightType,
      String weightController,
      String noOfBags,
      String totalWeights,
      String pricePerKg,
      String totalAmount) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "plot_id": key,
      "moisture": moisture,
      "grade": grade,
      "pickupdate": pickupdate,
      "pickuptime": pickupTime,
      "weight_type": weightType,
      "weight": weightController,
      "no_of_bags": noOfBags,
      "total_weights": totalWeights,
      "price_per_kg": pricePerKg,
      "total_amount": totalAmount,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotYield,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchPlotYieldsApi///////////////////////

  Future<ApiResponse> fetchPlotYieldsApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient
          .post(AppConstants.fetchYields + "/" + key, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// addPlotCce ///////////
  Future<ApiResponse> addPlotCceApi(
      String gpsAccuracy,
      List<String> department,
      List<String> observerName,
      List<String> observerDesignation,
      List<File> observerPhoto,
      String areaInAcre,
      String manuallyEnteredArea,
      String areaAudit,
      String tagSouthWest,
      File southWest,
      File fieldImage,
      String length,
      String breadth,
      String chooseRandom,
      String randomLength,
      String randomNumberBreadth,
      shapeOfCcePlot,
      String dimensionOfCcePlot,
      File markedPlotPhoto,
      File cutHarvestPhoto,
      String bmwotca,
      String bmwotcb,
      String bmwotcc,
      String bioMassWeightOfTheCrop,
      File weightingPhoto,
      File threshingPhoto,
      File cleaningPhoto,
      String weightOfCrops,
      String yieldSumOfAllColumns,
      File cutPlot,
      File cpWeight,
      File moisturePhoto,
      File jointPhoto,
      List<String> obserberMobile) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);

    FormData formData = FormData.fromMap({
      "plot_id": key,
      "gps_accuracy": gpsAccuracy,
      "department": department,
      "observer_name": observerName,
      "observer_mobile": obserberMobile,
      "observer_designation": observerDesignation,
      "observer_photo": MultipartFile.fromFileSync(observerPhoto[0].path),
      "area_in_acre": areaInAcre,
      "manually_entered_area": manuallyEnteredArea,
      "area_audit": areaAudit,
      "is_sw": tagSouthWest,
      "south_west_corner":
          southWest != null ? MultipartFile.fromFileSync(southWest.path) : null,
      "field_images": fieldImage != null
          ? MultipartFile.fromFileSync(fieldImage.path)
          : null,
      "length": length,
      "breadth": breadth,
      "choose_random": chooseRandom,
      "random_number_length": randomLength,
      "random_number_breadth": randomNumberBreadth,
      "shape_of_cce_plot": shapeOfCcePlot,
      "dimension_of_cce_plot": dimensionOfCcePlot,
      "marked_plot_photo": markedPlotPhoto != null
          ? MultipartFile.fromFileSync(markedPlotPhoto.path)
          : null,
      "cut_harvest_photo": cutHarvestPhoto != null
          ? MultipartFile.fromFileSync(cutHarvestPhoto.path)
          : null,
      "bmwotca": bmwotca,
      "bmwotcb": bmwotcb,
      "bmwotcc": bmwotcc,
      "bio_mass_weight_of_the_crop": bioMassWeightOfTheCrop,
      "weightingPhoto": weightingPhoto != null
          ? MultipartFile.fromFileSync(weightingPhoto.path)
          : null,
      "threshing_photo": threshingPhoto != null
          ? MultipartFile.fromFileSync(threshingPhoto.path)
          : null,
      "cleaning_photo": cleaningPhoto != null
          ? MultipartFile.fromFileSync(cleaningPhoto.path)
          : null,
      "weight_of_crops": weightOfCrops,
      "yield_sum_of_all_columns": yieldSumOfAllColumns,
      "cut_plot":
          cutPlot != null ? MultipartFile.fromFileSync(cutPlot.path) : null,
      "cp_weight":
          cpWeight != null ? MultipartFile.fromFileSync(cpWeight.path) : null,
      "moisture_photo": moisturePhoto != null
          ? MultipartFile.fromFileSync(moisturePhoto.path)
          : null,
      "joint_photo": jointPhoto != null
          ? MultipartFile.fromFileSync(jointPhoto.path)
          : null,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotCce,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchPlotCceApi///////////////////////

  Future<ApiResponse> fetchPlotCceApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient
          .post(AppConstants.fetchCce + "/" + key, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// addPlotFieldVisitCropStageApi ///////////
  Future<ApiResponse> addPlotFieldVisitCropStageApi(String cropStage,
      String cropLossDueTo, String lossDate, File image) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    var fvId = await SharedPrefManager.getPrefrenceString(AppConstants.fvId);
    FormData formData = FormData.fromMap({
      "fv_id": fvId,
      "plot_id": key,
      "crop_stage": cropStage,
      "crop_loss_due_to": cropLossDueTo,
      "crop_loss_date": lossDate,
      "image": MultipartFile.fromFileSync(image.path)
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotFieldVisitCropStage,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetch_crop_stage///////////////////////

  Future<ApiResponse> fetchCropStageApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient
          .post(AppConstants.fetchCropStage + "/" + key, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// addLabAnalysisApi ///////////
  Future<ApiResponse> addLabAnalysisApi(
      String date, String quality, String sealNumber) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "sample_date": date,
      "plot_id": key,
      "sample_quality": quality,
      "seal_number": sealNumber,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotLabAnalysis,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// delete alert ///////////
  Future<ApiResponse> deleteAlert(String id) async {
    try {
      Response response = await dioClient.post(
        AppConstants.deleteAlert + "/" + id,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchLabAnalysisAPi///////////////////////

  Future<ApiResponse> fetchLabAnalysisAPi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient
          .post(AppConstants.fetchLabAnalysis + "/" + key, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// plot_soil_information_reg ///////////
  Future<ApiResponse> addPlotSoilInformationReg(
      String date, String sampleCollectedBy, File photo) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "sample_collected_date": date,
      "sample_collected_by": sampleCollectedBy,
      "plot_id": key,
      "photo": MultipartFile.fromFileSync(photo.path)
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotSoilInformationReg,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchLabAnalysisAPi///////////////////////

  Future<ApiResponse> fetchSoilInformationApi() async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.fetchSoilInformationApi + "/" + key,
          data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// plot_soil_information_report ///////////
  Future<ApiResponse> plotSoilInformationReport(
      String sirId,
      String ph,
      String ec,
      String oc,
      String an,
      String ap,
      String ah,
      String as,
      String zn,
      String ab,
      String ai,
      String mn,
      String ca) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "plot_id": key,
      "sir_id": sirId,
      "ph": ph,
      "ec": ec,
      "oc": oc,
      "an": an,
      "ap": ap,
      "ah": ah,
      "a_s": as,
      "zn": zn,
      "ab": ab,
      "ai": ai,
      "mn": mn,
      "ca": ca,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.plotSoilInformationReport,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////fetchLabAnalysisReportAPi///////////////////////

  Future<ApiResponse> fetchSoilInformationReportApi(String id) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({});

    print(formData.fields);

    try {
      Response response = await dioClient.post(
          AppConstants.fetchSoilInformationReport + "/" + id,
          data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// fetchProductsApi ///////////
  Future<ApiResponse> fetchProductsApi(
      String category, String subCategory) async {
    FormData formData = FormData.fromMap({});

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
          AppConstants.fetchProducts + "/" + category + "/" + subCategory,
          data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// fetchProductsApi ///////////
  Future<ApiResponse> fetchProductsTracktorApi(String category) async {
    FormData formData = FormData.fromMap({});

    print(formData.fields.toString());

    try {
      Response response = await dioClient
          .post(AppConstants.fetchProducts + "/" + category, data: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////orderNowApi///////////////////////

  Future<ApiResponse> orderNowApi(String product, String isRent,
      String rentFromDate, String rentToDate) async {
    var key =
        await SharedPrefManager.getPrefrenceString(AppConstants.newUserId);
    var farmerId =
        await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    var plotId =
        await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    var productId =
        await SharedPrefManager.getPrefrenceString(AppConstants.productName);
    FormData formData;

    if (isRent == "Rent") {
      formData = FormData.fromMap({
        "user_id": key,
        "product": productId,
        "is_rent": isRent,
        "amount": "100",
        "rent_from_date": rentFromDate,
        "rent_to_date": rentToDate,
        "farmer_id": farmerId,
        "plot_id": plotId
      });
    } else {
      formData = FormData.fromMap({
        "user_id": key,
        "product": productId,
        "is_rent": isRent,
        "amount": "100",
        "farmer_id": farmerId,
        "plot_id": plotId,
      });
    }

    print(formData.fields);

    try {
      Response response =
          await dioClient.post(AppConstants.orderNow, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////orderNoApi///////////////////////

  Future<ApiResponse> orderNowRentApi(String product, String isRent,
      String rentFromDate, String rentToDate) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.plotId);
    FormData formData = FormData.fromMap({
      "user_id": key,
      "product": product,
      "is_rent": isRent,
      "rent_from_date": rentFromDate,
      "rent_to_date": rentToDate,
    });

    print(formData.fields);

    try {
      Response response =
          await dioClient.post(AppConstants.orderNow, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////newCattleApi///////////////////////

  Future<ApiResponse> newCattleApi(
      String cattieOldNew,
      String cattleName,
      String cattleType,
      String lifeStage,
      String age,
      String breed,
      String bodyWeight,
      String heatDate,
      String remarks,
      File photo) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    FormData formData = FormData.fromMap({
      "farmer_id": key,
      "cattle_old_new": cattieOldNew,
      "cattle_name": cattleName,
      "cattle_type": cattleType,
      "life_stage": lifeStage,
      "age": age,
      "breed": breed,
      "body_weight": bodyWeight,
      "heat_date": heatDate,
      "remarks": remarks,
      "photo": MultipartFile.fromFileSync(photo.path),
    });

    print(formData.fields);

    try {
      Response response =
          await dioClient.post(AppConstants.newCattie, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// fetchCattleApi ///////////
  Future<ApiResponse> fetchCattleApi(String farmerId) async {
    FormData formData = FormData.fromMap({});

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.fetchCattle + "/" + farmerId,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// fetchPlantDoctorHistory ///////////
  Future<ApiResponse> fetchPlantDoctorHistory(String plotId) async {
    try {
      Response response =
          await dioClient.post(AppConstants.fetchPlantDoctor + "/" + plotId);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /////////////////newCattleShedApi///////////////////////

  Future<ApiResponse> newCattleShedApi(String cattleShedOldNew,
      String belowCattleName, String shedName, String shedGeoTag) async {
    var key = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
    FormData formData = FormData.fromMap({
      "farmer_id": key,
      "cattle_shed_new_old": cattleShedOldNew,
      "below_shed_name": belowCattleName,
      "shed_name": shedName,
      "shed_geo_tag": shedGeoTag
    });

    print(formData.fields);

    try {
      Response response =
          await dioClient.post(AppConstants.newCattleShed, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// fetchCattleShedApi ///////////
  Future<ApiResponse> fetchCattleShedApi(String farmerId) async {
    FormData formData = FormData.fromMap({});

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.fetchCattleShed + "/" + farmerId,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  ////////// fetchCattleShedApi ///////////
  Future<ApiResponse> orderListApi() async {
    var key =
        await SharedPrefManager.getPrefrenceString(AppConstants.newUserId);

    FormData formData = FormData.fromMap({"user_id": key});

    print(formData.fields.toString());

    try {
      Response response =
          await dioClient.post(AppConstants.orderListApi, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> addPlantDoctorApi(
      String comment, File image, String id) async {
    FormData formData = FormData.fromMap({
      "plot_id": id,
      "comment": comment,
      "image": MultipartFile.fromFileSync(image.path),
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.addPlantDoctor + "/",
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

///////////////////// crop insurance api//////////////

  Future<ApiResponse> cropIns(
    String plotId,
    String insuranceName,
    String year,
    String season,
    String amount,
    String premium,
    String loaner,
    String policyNo,
    String startingDate,
    String expiryDate,
  ) async {
    FormData formData = FormData.fromMap({
      "plot_id": plotId,
      "insurance_company_name": insuranceName,
      "year": year,
      "season": season,
      "insurance_amount": amount,
      "insurance_premium": premium,
      "loaner": loaner,
      "policy_number": policyNo,
      "starting_date": startingDate,
      "expiry_date": expiryDate,
    });

    print(formData.fields.toString());

    try {
      Response response = await dioClient.post(
        AppConstants.cropInsurance,
        data: formData,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
