// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors

import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/color_resources.dart';
import 'package:CropSecure/utill/drop_down.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../service/crop_service_new.dart';

class AddFieldVisit extends StatefulWidget {
  @override
  State<AddFieldVisit> createState() => _AddFieldVisitState();
}

class _AddFieldVisitState extends State<AddFieldVisit> {
  bool isLoad = false;
  String sourceFrom = "",
      specificTech = "",
      showingDate = "",
      mixedCrop = "",
      mixedCropName = "",
      mixedCropVarieties = "",
      mixedCropSpecificTech = "";
  List<String> option = ["Yes", "No"];
  DateTime selectedDate = DateTime.now();
  var formatDate = "";
  CropTypeServiceNew cropTypeService = CropTypeServiceNew();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1940),
      lastDate: DateTime(2035),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formatDate = selectedDate.year.toString() +
            "/" +
            selectedDate.month.toString() +
            "/" +
            selectedDate.day.toString();
      });
    }
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
          "Crop & Fields",
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
          padding: const EdgeInsets.all(27.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Crop Type",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                height: 48,
                child: DropdownSearch<dynamic>(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "Crop Type",
                    hintStyle: TextStyle(color: ColorResources.light_purple),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (dynamic filter) async {
                    return cropTypeService.getCropType();
                  },
                  onChanged: (dynamic data) async {
                    cropTypeService.cropType = data;
                  },
                  itemAsString: (dynamic da) => da["crop_type"],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Crop Season",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                height: 48,
                child: DropdownSearch<dynamic>(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "Crop Season",
                    hintStyle: TextStyle(color: ColorResources.light_purple),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (dynamic filter) async {
                    final lst = await cropTypeService.getCropSeason();
                    return lst;
                  },
                  onChanged: (dynamic data) async {
                    cropTypeService.cropSeason = data;
                  },
                  itemAsString: (dynamic da) => da["crop_season"],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Crop Name",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                height: 48,
                child: DropdownSearch<dynamic>(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "Crop name",
                    hintStyle: TextStyle(color: ColorResources.light_purple),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (dynamic filter) async {
                    return cropTypeService.getCropName();
                  },
                  onChanged: (dynamic data) async {
                    cropTypeService.cropName = data;
                  },
                  itemAsString: (dynamic da) => da['crop_name'],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Crop Varities",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                height: 48,
                child: DropdownSearch<dynamic>(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "Crop varities",
                    hintStyle: TextStyle(color: ColorResources.light_purple),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (dynamic filter) async {
                    return cropTypeService.getCropVariety();
                  },
                  onChanged: (dynamic data) async {
                    cropTypeService.cropVariety = data;
                  },
                  itemAsString: (dynamic da) => da['crop_varity'],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Source from which the seed was obtained?",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                height: 48,
                child: DropdownSearch(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: ColorResources.light_purple),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (String filter) async {
                    return kSeedSource;
                  },
                  onChanged: (String data) async {
                    sourceFrom = data;
                  },
                  itemAsString: (String da) => da,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Specific Technology",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                height: 48,
                child: DropdownSearch(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: ColorResources.light_purple),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (String filter) async {
                    return kSpecificTech;
                  },
                  onChanged: (String data) async {
                    specificTech = data;
                  },
                  itemAsString: (String da) => da,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Showing Date",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                height: 48,
                child: InkWell(
                  onTap: () => _selectDate(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                        )),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            formatDate ?? "Select",
                            style: robotoMedium.copyWith(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Image.asset(
                              "assets/image/calender.png",
                              color: Colors.black,
                              width: 25,
                              height: 25,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Mixed Crop",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),
              SizedBox(
                height: 48,
                child: DropdownSearch(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "Choose an option",
                    hintStyle: TextStyle(color: ColorResources.light_purple),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (String filter) async {
                    return option;
                  },
                  onChanged: (String data) async {
                    setState(() {
                      mixedCrop = data;
                    });
                  },
                  itemAsString: (String da) => da,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (mixedCrop == "Yes")
                (Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mixed Crop Name",
                      style: robotoMedium.copyWith(
                          color: const Color(0xff262626), fontSize: 18),
                    ),
                    SizedBox(
                        height: 48,
                        child: TextFormField(
                          onChanged: (value) {
                            mixedCropName = value;
                          },
                          maxLines: 1,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: "",
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
                                  fontSize: 14 *
                                      MediaQuery.of(context).textScaleFactor,
                                  color: const Color(0xffb7b7b7))),
                        )),
                    // SizedBox(
                    //   height: 48,
                    //   child: DropdownSearch(
                    //     popupShape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20)),
                    //     mode: Mode.MENU,
                    //     popupElevation: 5,
                    //     dropdownSearchDecoration: const InputDecoration(
                    //       hintText: "Crop name",
                    //       hintStyle:
                    //           TextStyle(color: ColorResources.light_purple),
                    //       contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    //       border: OutlineInputBorder(),
                    //     ),
                    //     // showSearchBox:true,
                    //     onFind: (String filter) async {
                    //       return option;
                    //     },
                    //     onChanged: (String data) async {
                    //       setState(() {
                    //         mixedCropName = data;
                    //       });
                    //     },
                    //     itemAsString: (String da) => da,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Mixed Crop Variety",
                      style: robotoMedium.copyWith(
                          color: const Color(0xff262626), fontSize: 18),
                    ),
                    SizedBox(
                        height: 48,
                        child: TextFormField(
                          onChanged: (value) {
                            mixedCropVarieties = value;
                          },
                          maxLines: 1,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: "",
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
                                  fontSize: 14 *
                                      MediaQuery.of(context).textScaleFactor,
                                  color: const Color(0xffb7b7b7))),
                        )),
                    // SizedBox(
                    //   height: 48,
                    //   child: DropdownSearch(
                    //     popupShape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20)),
                    //     mode: Mode.MENU,
                    //     popupElevation: 5,
                    //     dropdownSearchDecoration: const InputDecoration(
                    //       hintText: "Varities",
                    //       hintStyle:
                    //           TextStyle(color: ColorResources.light_purple),
                    //       contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    //       border: OutlineInputBorder(),
                    //     ),
                    //     // showSearchBox:true,
                    //     onFind: (String filter) async {
                    //       return option;
                    //     },
                    //     onChanged: (String data) async {
                    //       setState(() {
                    //         mixedCropVarieties = data;
                    //       });
                    //     },
                    //     itemAsString: (String da) => da,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Mixed Crop Specific Tech",
                      style: robotoMedium.copyWith(
                          color: const Color(0xff262626), fontSize: 18),
                    ),
                    SizedBox(
                        height: 48,
                        child: TextFormField(
                          onChanged: (value) {
                            mixedCropSpecificTech = value;
                          },
                          maxLines: 1,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: "",
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
                                  fontSize: 14 *
                                      MediaQuery.of(context).textScaleFactor,
                                  color: const Color(0xffb7b7b7))),
                        )),
                    // SizedBox(
                    //   height: 48,
                    //   child: DropdownSearch(
                    //     popupShape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20)),
                    //     mode: Mode.MENU,
                    //     popupElevation: 5,
                    //     dropdownSearchDecoration: const InputDecoration(
                    //       hintText: "Specific Technologies",
                    //       hintStyle:
                    //           TextStyle(color: ColorResources.light_purple),
                    //       contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    //       border: OutlineInputBorder(),
                    //     ),
                    //     // showSearchBox:true,
                    //     onFind: (String filter) async {
                    //       return option;
                    //     },
                    //     onChanged: (String data) async {
                    //       setState(() {
                    //         mixedCropSpecificTech = data;
                    //       });
                    //     },
                    //     itemAsString: (String da) => da,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
              if (isLoad)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator()),
                  ),
                )
              else
                SizedBox(
                  height: 47.0,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF6cbd47),
                      ), //button color
                    ),
                    onPressed: () async {
                      if (cropTypeService.cropType == null) {
                        showSnackBar("Select crop type");
                      } else if (cropTypeService.cropName == null) {
                        showSnackBar("Select crop name");
                      } else if (cropTypeService.cropVariety == null) {
                        showSnackBar("Select crop varieties");
                      } else if (sourceFrom == "") {
                        showSnackBar(
                            "Select source from which the seeds was obtained");
                      } else if (specificTech == "") {
                        showSnackBar("Select specific technology");
                      } else if (formatDate == "") {
                        showSnackBar("Select sowing date");
                      } else if (mixedCrop == "") {
                        showSnackBar("Select mixed crop");
                      } else {
                        setState(() {
                          isLoad = true;
                        });

                        // Get.to(() => CropStage(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                        await Provider.of<AuthProvider>(context, listen: false)
                            .addFieldVisitApi(
                                cropTypeService.cropTypeS,
                                cropTypeService.cropNameS,
                                cropTypeService.cropVarietyS,
                                sourceFrom,
                                specificTech,
                                formatDate,
                                mixedCrop);

                        setState(() {
                          isLoad = false;
                        });
                      }
                    },
                    child: Text('Save',
                        style: robotoBold.copyWith(
                            fontSize: 19, color: Colors.white)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
