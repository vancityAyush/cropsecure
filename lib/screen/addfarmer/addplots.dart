// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, invalid_use_of_visible_for_testing_member

import 'dart:io';

import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/color_resources.dart';
import 'package:CropSecure/utill/drop_down.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../service/address_service_new.dart';

class AddPlots extends StatefulWidget {
  final String id;
  AddPlots({this.id});

  @override
  State<AddPlots> createState() => _AddPlotsState();
}

class _AddPlotsState extends State<AddPlots> {
  File _image;
  File _imagepan;
  String area = "", category = "", soiltype = "", irrigation = "", water = "";

  AddressServiceNew addressService = AddressServiceNew();
  bool isLoad = false;
  TextEditingController surveyController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  File filename;
  File newFile;
  PlatformFile file;
  File newFilePan, newFileRashan, newFileFarmer;

  Future getImagefromcamera() async {
    dynamic image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);

    setState(() {
      _image = newFile = File(image.path);
    });
  }

  Future getImagefromcamerapan() async {
    dynamic image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);

    setState(() {
      _imagepan = newFilePan = File(image.path);
    });
  }

  void showSnackBar(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Register Plot",
          style: robotoBold.copyWith(color: Colors.white, fontSize: 19),
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: surveyController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Survey No",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintStyle: TextStyle(
                            fontSize:
                                14 * MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Area (Select from unit)",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async {
                      return selectUnit;
                    },
                    onChanged: (String data) async {
                      area = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: areaController,
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Area",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintStyle: TextStyle(
                            fontSize:
                                14 * MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Category",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async {
                      return ["Small ", "Marginal", "Medium", "Big"];
                    },
                    onChanged: (String data) async {
                      category = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Soil type",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async {
                      return kSoilType;
                    },
                    onChanged: (String data) async {
                      soiltype = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Source of irrigation",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async {
                      return ["Irrigation", "Unirrigation"];
                    },
                    onChanged: (String data) async {
                      irrigation = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Source of water",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async {
                      return kWaterSource;
                    },
                    onChanged: (String data) async {
                      water = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch<dynamic>(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "State",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (dynamic filter) async {
                      return addressService.states;
                    },
                    onChanged: (dynamic data) async {
                      addressService.currentState = data;
                    },
                    itemAsString: (dynamic da) => da["state"],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch<dynamic>(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "District",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (dynamic filter) async {
                      return addressService.getDistricts();
                    },
                    onChanged: (dynamic data) async {
                      addressService.currentDistrict = data;
                    },
                    itemAsString: (dynamic da) => da["district"],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch<dynamic>(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Taluka",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (dynamic filter) async {
                      return addressService.getTalukas();
                    },
                    onChanged: (dynamic data) async {
                      addressService.currentTaluka = data;
                    },
                    itemAsString: (dynamic da) => da["taluka"],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch<dynamic>(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Hobali",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (dynamic filter) async {
                      return addressService.getHoblis();
                    },
                    onChanged: (dynamic data) async {
                      addressService.currentHobali = data;
                    },
                    itemAsString: (dynamic da) => da["hobali"],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch<dynamic>(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Gram Panchayath",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (dynamic filter) async {
                      return addressService.getGramPanchayat();
                    },
                    onChanged: (dynamic data) async {
                      addressService.currentGramPanchayat = data;
                    },
                    itemAsString: (dynamic da) => da["gram_panchayat"],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch<dynamic>(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Village",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (dynamic filter) async {
                      return addressService.getVillages();
                    },
                    onChanged: (dynamic data) async {
                      addressService.currentVillage = data;
                    },
                    itemAsString: (dynamic da) => da["village"],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: TextFormField(
                  maxLength: 6,
                  controller: pincodeController,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      hintText: "Pincode",
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(20),
                      // ),
                      hintStyle: TextStyle(
                          fontSize: 14 * MediaQuery.of(context).textScaleFactor,
                          color: const Color(0xffb7b7b7))),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 0, right: 0),
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Farmer Plot",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Phani Plot",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 0, right: 0),
                margin: const EdgeInsets.only(top: 8),
                height: 140,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: const Color(0xffe1ddde)),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: Text(
                                        "Farmer Plot",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => getImagefromcamera(),
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 4, bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.image_outlined,
                                          size: 25,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            _image == null
                                ? const Text("")
                                : Positioned(
                                    top: 0,
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: Container(
                                      height: 60,
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 45, 25, 30),
                                      child: Image.file(
                                        _image,
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: const Color(0xffe1ddde)),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: Text(
                                        "Phani Plot",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => getImagefromcamerapan(),
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          right: 4, bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.image_outlined,
                                          size: 25,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            _imagepan == null
                                ? const Text("")
                                : Positioned(
                                    top: 0,
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: Container(
                                      height: 60,
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 45, 25, 30),
                                      child: Image.file(
                                        _imagepan,
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoad)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator()),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: SizedBox(
                      height: 47.0,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF6cbd47),
                          ), //button color
                        ),
                        onPressed: () async {
                          if (surveyController.text.isEmpty) {
                            showSnackBar("Enter survey number");
                          } else if (area == "") {
                            showSnackBar("Select area");
                          } else if (areaController.text.isEmpty) {
                            showSnackBar("Enter area");
                          } else if (category == "") {
                            showSnackBar("Select category");
                          } else if (soiltype == "") {
                            showSnackBar("Select soiltype");
                          } else if (irrigation == "") {
                            showSnackBar("Select source of irrigation");
                          } else if (water == "") {
                            showSnackBar("Select source of water");
                          } else if (addressService.village == "" ||
                              addressService.village == null) {
                            showSnackBar("Select Adrress");
                          } else if (pincodeController.text.isEmpty) {
                            showSnackBar("Enter pincode");
                          } else if (newFile == null) {
                            showSnackBar("Upload farmer plot");
                          } else if (newFilePan == null) {
                            showSnackBar("Upload phani plot");
                          } else {
                            setState(() {
                              isLoad = true;
                            });
                            String hobali = addressService.hobli;
                            // Get.to(() => AddFarmerSuccessfull(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .addPlotsApi(
                              widget.id,
                              surveyController.text,
                              area,
                              areaController.text,
                              category,
                              soiltype,
                              irrigation,
                              water,
                              addressService.state,
                              hobali,
                              addressService.district,
                              addressService.taluka,
                              addressService.gramPanchayat,
                              addressService.village,
                              pincodeController.text,
                              newFile,
                              newFilePan,
                            );
                            setState(() {
                              isLoad = false;
                            });
                          }
                        },
                        child: Text('Submit',
                            style: robotoBold.copyWith(
                                fontSize: 19, color: Colors.white)),
                      )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
