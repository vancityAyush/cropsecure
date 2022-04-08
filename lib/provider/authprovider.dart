//@dart=2.9
import 'dart:io';

import 'package:cropsecure/data/model/response/base/api_response.dart';
import 'package:cropsecure/data/model/response/base/error_response.dart';
import 'package:cropsecure/data/model/response/response_model.dart';
import 'package:cropsecure/data/model/response/responsefamer.dart';
import 'package:cropsecure/data/model/response/responseprofile.dart';
import 'package:cropsecure/data/repository/repo/auth_repo/auth_repo.dart';
import 'package:cropsecure/screen/addfarmer/addfarmersuccessfull.dart';
import 'package:cropsecure/screen/addfarmer/farmerdetail.dart';
import 'package:cropsecure/screen/addfarmer/viewplots.dart';
import 'package:cropsecure/screen/authscreen/login.dart';
import 'package:cropsecure/screen/authscreen/otpscreen.dart';
import 'package:cropsecure/screen/bankdetail/addbankdetail.dart';
import 'package:cropsecure/screen/cattie/cattie.dart';
import 'package:cropsecure/screen/dashboard.dart';
import 'package:cropsecure/screen/soil/soil.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:cropsecure/utill/sharedprefrence.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../data/model/response/base/response_farmercount.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;

  AuthProvider({this.authRepo});

// for registration section
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _registrationErrorMessage = '';

  String get registrationErrorMessage => _registrationErrorMessage;

  Future<ResponseModel> registration(
      String name,
      String phone,
      String villageName,
      String grama,
      String hobali,
      String subDistrictm,
      String districtName,
      String stateName,
      String password) async {
    _isLoading = true;
    _registrationErrorMessage = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepo.registration(
        name,
        phone,
        villageName,
        grama,
        hobali,
        subDistrictm,
        districtName,
        stateName,
        password);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        await SharedPrefManager.savePrefString(
            AppConstants.userId, apiResponse.response.data['data'].toString());
        // await SharedPrefManager.savePreferenceBoolean(true);
        // Get.to(() => OtpScreen(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 400));
        await setVerifyOtpApi(
            apiResponse.response.data['data'].toString(), "USER");
      } else {
        Get.rawSnackbar(
            message: apiResponse.response.data['response_string'].toString());
        responseModel = ResponseModel(true, 'successful');
      }
      responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.errors[0].message;
      }
      print(errorMessage);
      _registrationErrorMessage = errorMessage;
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  /////////editProfileApi

  Future<ResponseModel> editProfileApi(
      String name,
      String phone,
      String villageName,
      String grama,
      String hobali,
      String subDistrictm,
      String districtName,
      String stateName,
      String password) async {
    _isLoading = true;
    _registrationErrorMessage = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepo.editProfileApi(
        name,
        phone,
        villageName,
        grama,
        hobali,
        subDistrictm,
        districtName,
        stateName,
        password);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        Fluttertoast.showToast(
            msg: "Your profile had been updated successfully");
        Get.offAll(() => Dashboard());
      } else {
        Get.rawSnackbar(
            message: apiResponse.response.data['response_string'].toString());
        responseModel = ResponseModel(true, 'successful');
      }
      responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.errors[0].message;
      }
      print(errorMessage);
      _registrationErrorMessage = errorMessage;
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  ////////////////////set Verify Otp Api/////////////////////////

  Future<ResponseModel> setVerifyOtpApi(String key, String user) async {
    ApiResponse apiResponse = await authRepo.setVerifyOtpApi(key);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        // await SharedPrefManager.savePreferenceBoolean(true);
        Fluttertoast.showToast(
            msg: apiResponse.response.data['data'].toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM);
        Get.to(() => OtpScreen(user),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 400),
            arguments: apiResponse.response.data['data'].toString());
      } else {
        Get.rawSnackbar(
            message: apiResponse.response.data['response_string'].toString());
      }
      responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.errors[0].message;
      }
      print(errorMessage);
      _registrationErrorMessage = errorMessage;
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  ////////////////////set Verify Otp Api/////////////////////////

  Future<ResponseModel> verifyOtpApi(String otp, String user) async {
    ApiResponse apiResponse = await authRepo.verifyOtpApi(otp);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        // await SharedPrefManager.savePreferenceBoolean(true);
        Fluttertoast.showToast(
            msg: "Your verification had been completed successfully".toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM);
        Get.offAll(() => LoginScreen(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 400),
            arguments: apiResponse.response.data['data'].toString());
      } else {
        Get.rawSnackbar(
            message: apiResponse.response.data['response_string'].toString());
      }
      responseModel = ResponseModel(true, 'successful');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        errorMessage = errorResponse.errors[0].message;
      }
      print(errorMessage);
      _registrationErrorMessage = errorMessage;
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  ////////////////////login User Api/////////////////////////

  Future<ResponseModel> loginUserApi(String userName, String password) async {
    ApiResponse apiResponse = await authRepo.loginUserApi(userName, password);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        await SharedPrefManager.savePrefString(
            AppConstants.userId, apiResponse.response.data['data'].toString());
        await SharedPrefManager.savePreferenceBoolean(true);
        Get.offAll(() => Dashboard(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 400));
        responseModel = ResponseModel(true, 'successful');
      } else {
        Fluttertoast.showToast(
            msg: apiResponse.response.data['response_string']);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  ////////////////////calculator add Api/////////////////////////

  Future<ResponseModel> calculatorAdd(
      String id,
      String method,
      String productMixed,
      String productName,
      String quantity,
      String appliedOn,
      File image) async {
    ApiResponse apiResponse = await authRepo.calculatorAdd(
        id, method, productMixed, productName, quantity, appliedOn, image);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        Fluttertoast.showToast(
            msg: apiResponse.response.data['response_string']);
        responseModel = ResponseModel(true, 'successful');
      } else {
        Fluttertoast.showToast(
            msg: apiResponse.response.data['response_string']);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  ////////////////////disease alert add Api/////////////////////////

  Future<ResponseModel> diseaseAlertAdd(
      {String plotId,
      String isAffected,
      String areaDate,
      String newAdvice,
      String comment,
      File image = null}) async {
    ApiResponse apiResponse = await authRepo.diseaseAlertAdd(
        plotId, isAffected, areaDate, newAdvice, comment, image);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        Fluttertoast.showToast(
            msg: apiResponse.response.data['response_string']);
        responseModel = ResponseModel(true, 'successful');
      } else {
        Fluttertoast.showToast(
            msg: apiResponse.response.data['response_string']);
      }
      return responseModel;
    }
  }

  ///////////////////////// fetch Profile Api
  ResponseProfile responseProfile;
  Future<ResponseProfile> fetchProfileApi() async {
    ApiResponse apiResponse = await authRepo.fetchProfileApi();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      responseProfile = ResponseProfile.fromJson(apiResponse.response.data);
      await SharedPrefManager.savePrefString(
          AppConstants.newUserId, responseProfile.data.id);
      return responseProfile;
    }
  }

  ///////////////////////// fetch Disease Api
  Future fetchDiseaseAlert(String plotId) async {
    ApiResponse apiResponse = await authRepo.fetchDiseaseAlert(plotId);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  Future<ResponseModel> registerFarmerApi(
      String name,
      String fatherName,
      String mobileNumber,
      String villageName,
      String aadhaarNo,
      String panNo,
      String rashanNo,
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
      {farmerType type = farmerType.F}) async {
    ApiResponse apiResponse = await authRepo.registerFarmerApi(
        name,
        fatherName,
        mobileNumber,
        villageName,
        aadhaarNo,
        panNo,
        rashanNo,
        gramaPanchayath,
        hobble,
        taluka,
        districtName,
        state,
        gender,
        dob,
        age,
        handicapped,
        minority,
        caste,
        adhaar,
        rashan,
        panCard,
        image,
        type: type);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Farmer had been added successfully");
        // id:apiResponse.response.data['data']
        await SharedPrefManager.savePrefString(AppConstants.farmerId,
            apiResponse.response.data['data'].toString());
        print(
            "the response is : ${apiResponse.response.data['data'].toString()}");
        Get.to(() =>
            AddBankDetail(id: apiResponse.response.data['data'].toString()));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  ///////////////////////// fetch Farmer Api
  ResponseFarmer responseFarmer;
  Future<ResponseFarmer> fetchFarmerApi() async {
    ApiResponse apiResponse = await authRepo.fetchFarmerApi();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      responseFarmer = ResponseFarmer.fromJson(apiResponse.response.data);
      return responseFarmer;
    }
  }

  ///////////////////////// fetch Irrigation Api
  Future fetchIrrigation() async {
    ApiResponse apiResponse = await authRepo.fetchIrrigationApi();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  ///////////////////////// fetch count Api
  ResponseFarmercount responseFarmercount;
  Future<ResponseFarmercount> fetchFarmercountApi() async {
    ApiResponse apiResponse = await authRepo.fetchFarmercountApi();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      responseFarmercount =
          ResponseFarmercount.fromJson(apiResponse.response.data);

      return responseFarmercount;
    }
  }

  ///////////////////////// fetch Dashboard Api
  Future fetchDashboardApi() async {
    ApiResponse apiResponse = await authRepo.fetchDashBoardApi();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  ///////////////////////// fetch Result Api
  Future fetchResult() async {
    ApiResponse apiResponse = await authRepo.fetchResult();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  /////// addBankDetails Api /////////
  Future<ResponseModel> addBankDetailsApi(
      String bankName,
      String ifscCode,
      String accountNumber,
      String holderName,
      String branchName,
      String id) async {
    var cattle =
        await SharedPrefManager.getPrefrenceString(AppConstants.mainCattle);
    ApiResponse apiResponse = await authRepo.addBankDetailsApi(
        bankName, ifscCode, accountNumber, holderName, branchName, id);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Bank Details had been added successfully");
        if (cattle == "main") {
          Get.to(() => Cattie(id: apiResponse.response.data['data']),
              transition: Transition.rightToLeftWithFade,
              duration: const Duration(milliseconds: 600));
        } else {
          Get.to(() => AddFarmerSuccessfull(),
              transition: Transition.rightToLeftWithFade,
              duration: const Duration(milliseconds: 600));
        }
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  /////// addPlotsApi/////////
  Future<ResponseModel> addPlotsApi(
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
      {String latitude = null,
      String longitude = null}) async {
    ApiResponse apiResponse = await authRepo.addPlotsApi(
        farmerId,
        survey_no,
        area,
        category,
        soil_type,
        source_of_irrigation,
        source_of_water,
        district,
        taluka,
        gram_panchayath,
        village,
        pincode,
        farmer_plot,
        phani_plot,
        latitude,
        longitude);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Plots had been added successfully");
        Get.off(
            () => FarmerDetails(
                  plot: responseFarmer.data1[0].count,
                  area: responseFarmer.data2[0].area,
                ),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  /////// updateLocation/////////
  Future<ResponseModel> updateLocation(
      String lat, String long, dynamic data) async {
    data['latitude'] = lat;
    data['longitude'] = long;
    ApiResponse apiResponse = await authRepo.updateLocation(data);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Location added successfully");
        Get.to(() => ViewPlots(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      return responseModel;
    }
  }

  ///////////////////////// fetch Farmer Api

  Future fetchPlotsApi() async {
    ApiResponse apiResponse = await authRepo.fetchPlotsApi();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }
  ///////////////////////// fetch Calculator Api

  Future fetchCalculator(String plotId) async {
    ApiResponse apiResponse = await authRepo.fetchCalculator(plotId);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  /////// addExpenditureApi/////////
  Future<ResponseModel> addExpenditureApi(
      String date, String particular_select, String amount) async {
    ApiResponse apiResponse =
        await authRepo.plotExpenditureApi(date, particular_select, amount);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Expenditure had been added successfully");
        // Get.off(() => FarmerDetails(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  ////////////fetchExpenditureApi
  Future fetchExpenditureApi() async {
    ApiResponse apiResponse = await authRepo.fetchPlotExpenditure();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  /////// addFieldVisitApi/////////
  Future<ResponseModel> addFieldVisitApi(
      String cropType,
      String cropName,
      String crop_varities,
      String source_of_seeds,
      String specific_technology,
      String showingDate,
      String mixedCrop) async {
    ApiResponse apiResponse = await authRepo.plotFieldVisit(
        cropType,
        cropName,
        crop_varities,
        source_of_seeds,
        specific_technology,
        showingDate,
        mixedCrop);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(
            msg: "Crop and Fields had been added successfully");
        Get.off(() => ViewPlots(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  /////// addCceApi/////////
  Future<ResponseModel> addCceApi(
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
    ApiResponse apiResponse = await authRepo.addPlotCceApi(
        gpsAccuracy,
        department,
        observerName,
        observerDesignation,
        observerPhoto,
        areaInAcre,
        manuallyEnteredArea,
        areaAudit,
        tagSouthWest,
        southWest,
        fieldImage,
        length,
        breadth,
        chooseRandom,
        randomLength,
        randomNumberBreadth,
        shapeOfCcePlot,
        dimensionOfCcePlot,
        markedPlotPhoto,
        cutHarvestPhoto,
        bmwotca,
        bmwotcb,
        bmwotcc,
        bioMassWeightOfTheCrop,
        weightingPhoto,
        threshingPhoto,
        cleaningPhoto,
        weightOfCrops,
        yieldSumOfAllColumns,
        cutPlot,
        cpWeight,
        moisturePhoto,
        jointPhoto,
        obserberMobile);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Cce had been added successfully");
        // Get.off(() => FarmerDetails(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  /////// addPlantDoctorApi/////////
  Future<ResponseModel> addPlantDoctorApi(String id,
      {String comment, File image = null}) async {
    ApiResponse apiResponse =
        await authRepo.addPlantDoctorApi(comment, image, id);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(
          msg: "Submitted successfully",
        );
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  /////// addYieldApi/////////
  Future<ResponseModel> addYieldApi(
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
    ApiResponse apiResponse = await authRepo.addPlotYieldsApi(
        moisture,
        grade,
        pickupdate,
        pickupTime,
        weightType,
        weightController,
        noOfBags,
        totalWeights,
        pricePerKg,
        totalAmount);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Yields had been added successfully");
        // Get.off(() => FarmerDetails(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  ///////////////////////// fetch yields Api

  Future fetchYieldApi() async {
    ApiResponse apiResponse = await authRepo.fetchPlotYieldsApi();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  ///////////////////////// fetch yields Api

  Future fetchDiseasePopup() async {
    ApiResponse apiResponse = await authRepo.fetchDiseasePopup();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  ///////////////////////// fetch field Visit Api

  Future fetchFieldVisitApi() async {
    ApiResponse apiResponse = await authRepo.fetchFieldVisit();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  /////// addFieldCropStageApi /////////
  Future<ResponseModel> addFieldCropStageApi(String cropStage,
      String cropLossDueTo, String lossDate, File image) async {
    ApiResponse apiResponse = await authRepo.addPlotFieldVisitCropStageApi(
        cropStage, cropLossDueTo, lossDate, image);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Crop stage had been added successfully");
        // Get.off(() => FarmerDetails(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  ////////////fetchCropStageApi
  Future fetchCropStageApi() async {
    ApiResponse apiResponse = await authRepo.fetchCropStageApi();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  /////// addLabAnalysisApi /////////
  Future<ResponseModel> addLabAnalysisApi(
      String date, String quality, String sealNumber) async {
    ApiResponse apiResponse =
        await authRepo.addLabAnalysisApi(date, quality, sealNumber);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Lab Analysis had been added successfully");
        // Get.off(() => FarmerDetails(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  ////////////fetchLabAnalysisAPi
  Future fetchLabAnalysisAPi() async {
    ApiResponse apiResponse = await authRepo.fetchLabAnalysisAPi();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  /////// soilInformationApi /////////
  Future<ResponseModel> addSoilInformationApi(
      String date, String sampleCollectedBy, File photo) async {
    ApiResponse apiResponse = await authRepo.addPlotSoilInformationReg(
        date, sampleCollectedBy, photo);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(
            msg: "Soil information had been added successfully");
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  ////////////fetchSoilInformationApi
  Future fetchSoilInformationApi() async {
    ApiResponse apiResponse = await authRepo.fetchSoilInformationApi();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  /////// addSoilInformationReportApi /////////
  Future<ResponseModel> addSoilInformationReportApi(
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
    ApiResponse apiResponse = await authRepo.plotSoilInformationReport(
        sirId, ph, ec, oc, an, ap, ah, as, zn, ab, ai, mn, ca);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Report had been added successfully");
        Get.off(() => Soil(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  ////////////fetchSoilInformationReportApi
  Future fetchSoilInformationReportApi(String id) async {
    ApiResponse apiResponse = await authRepo.fetchSoilInformationReportApi(id);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  ////////////fetchProductApi
  Future fetchProductApi(String category, String subCategory) async {
    ApiResponse apiResponse =
        await authRepo.fetchProductsApi(category, subCategory);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  ////////////fetchTracktorApi
  Future fetchTracktorApi(String category) async {
    ApiResponse apiResponse = await authRepo.fetchProductsTracktorApi(category);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  /////// orderNowApi /////////
  Future<ResponseModel> orderNowApi(String product, String isRent,
      String rentFromDate, String rentToDate) async {
    if (rentFromDate == null) {
      rentFromDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    }
    if (rentToDate == null) {
      rentToDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    }
    ApiResponse apiResponse =
        await authRepo.orderNowApi(product, isRent, rentFromDate, rentToDate);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Order had been placed successfully");
        Get.off(() => Dashboard(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  /////// orderNowApi /////////
  Future<ResponseModel> orderNowRentApi(String product, String isRent,
      String rentFromDate, String rentToDate) async {
    ApiResponse apiResponse = await authRepo.orderNowRentApi(
        product, isRent, rentFromDate, rentToDate);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Order had been placed successfully");
        // Get.off(() => Soil(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

/////// newCattleApi /////////
  Future<ResponseModel> newCattleApi(
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
    ApiResponse apiResponse = await authRepo.newCattleApi(
        cattieOldNew,
        cattleName,
        cattleType,
        lifeStage,
        age,
        breed,
        bodyWeight,
        heatDate,
        remarks,
        photo);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Cattle had been added successfully");
        // Get.offAll(() => Dashboard(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  ////////////fetchCattleApi
  Future fetchCattleApi(String farmerId) async {
    ApiResponse apiResponse = await authRepo.fetchCattleApi(farmerId);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  ////////////fetchPlantDoctor
  Future fetchPlantDoctor(String plotId) async {
    ApiResponse apiResponse = await authRepo.fetchPlantDoctorHistory(plotId);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  /////// newCattleShedApi /////////
  Future<ResponseModel> newCattleShedApi(String cattleShedOldNew,
      String belowCattleName, String shedName, String shedGeoTag) async {
    ApiResponse apiResponse = await authRepo.newCattleShedApi(
        cattleShedOldNew, belowCattleName, shedName, shedGeoTag);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Cattle had been added successfully");
        // Get.off(() => Soil(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }

  ////////////fetchCattleApi
  Future fetchCattleShedApi(String farmerId) async {
    ApiResponse apiResponse = await authRepo.fetchCattleShedApi(farmerId);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  ////////////fetchOrderListApi
  Future fetchOrderListApi() async {
    ApiResponse apiResponse = await authRepo.orderListApi();
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      return apiResponse.response.data;
    }
  }

  /////// cropInsurance /////////
  Future<ResponseModel> cropInsurance(
      {String plotId,
      String insuranceName,
      String year,
      String season,
      String amount,
      String premium,
      String loaner,
      String policyNo,
      String startingDate,
      String expiryDate}) async {
    ApiResponse apiResponse = await authRepo.cropIns(
        plotId,
        insuranceName,
        year,
        season,
        amount,
        premium,
        loaner,
        policyNo,
        startingDate,
        expiryDate);

    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      if (apiResponse.response.data['error_code'] == 1) {
        responseModel = ResponseModel(true, 'successful');
        Fluttertoast.showToast(msg: "Crop Insurance Added successfully");
      } else {
        String errorMessage;
        if (apiResponse.error is String) {
          errorMessage = apiResponse.error.toString();
        } else {
          ErrorResponse errorResponse = apiResponse.error;
          errorMessage = errorResponse.errors[0].message;
        }
        print(errorMessage);
        _registrationErrorMessage = errorMessage;
        responseModel = ResponseModel(false, errorMessage);
      }
      _isLoading = false;
      notifyListeners();
      return responseModel;
    }
  }
}
