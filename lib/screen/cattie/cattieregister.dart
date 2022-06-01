import 'dart:io';

import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/drop_down.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CattieRegister extends StatefulWidget {
  @override
  State<CattieRegister> createState() => _CattieRegisterState();
}

class _CattieRegisterState extends State<CattieRegister> {
  int tagRadio = 1;
  String userType = "New Cattle";
  bool isLoad = false;
  String cattleType = "", liftStage = "", age = "", breed = "";
  List<String> gender = ["Male", "Female"];
  List<String> handicapped = ["Yes", "No"];
  List<String> minority = ["Yes", "No"];
  List<String> caste = ["Gen", "OBC", "SC", "ST"];
  List<String> state = ["Uttar Pradesh", "Uttrakhand", "Jharkhand"];
  TextEditingController cattleNameController = TextEditingController();
  TextEditingController bodyWeightController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  File filename;
  File newFile;
  PlatformFile file;
  DateTime selectedDate = DateTime.now(), selectedDate2 = DateTime.now();
  var formatDate, formatDate2;

  _selectDate2(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2, // Refer step 1
      firstDate: DateTime(1940),
      lastDate: DateTime(2035),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate2 = picked;
        formatDate2 = DateFormat('dd-MM-yyyy').format(selectedDate2);
      });
    }
  }

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
        // agecal = calculateAge(formatDate);
        ageController.text = calculateAge(picked).toString() + "years";
      });
    }
  }

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  void onFileOpenPhoto() async {
    dynamic result =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if (result != null) {
      filename = File(result.path);
      setState(() {
        newFile = filename;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   child: Padding(
              //       padding: const EdgeInsets.only(top: 0.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: <Widget>[
              //           Transform.scale(
              //             scale: 1.0,
              //             child: Radio(
              //               activeColor: ColorResources.light_purple,
              //               value: 1,
              //               groupValue: tagRadio,
              //               onChanged: (val) {
              //                 setState(() {
              //                   tagRadio = 1;
              //                   userType = "New Cattle";
              //                 });
              //               },
              //             ),
              //           ),
              //           const Text("New Cattle",
              //               style: TextStyle(
              //                   color: ColorResources.black,
              //                   fontWeight: FontWeight.normal,
              //                   fontSize: Dimensions.text_13,
              //                   fontFamily: "Roboto")),
              //           Transform.scale(
              //               scale: 1.0,
              //               child: Radio(
              //                 activeColor: ColorResources.light_purple,
              //                 value: 2,
              //                 groupValue: tagRadio,
              //                 onChanged: (val) {
              //                   setState(() {
              //                     tagRadio = 2;
              //                     userType = "Old Cattle";
              //                   });
              //                 },
              //               )),
              //           const Text(
              //             "Old Cattle",
              //             style: TextStyle(
              //                 color: ColorResources.black,
              //                 fontWeight: FontWeight.normal,
              //                 fontSize: Dimensions.text_13,
              //                 fontFamily: "Roboto"),
              //           ),
              //         ],
              //       )),
              // ),
              //
              // const SizedBox(
              //   height: 15,
              // ),

              Text(
                "Cattle Name",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: cattleNameController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Cattle Name",
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
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

              const SizedBox(
                height: 15,
              ),

              Text(
                "Cattle Type",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Select",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async {
                      return kCattleType;
                    },
                    onChanged: (String data) async {
                      cattleType = data;
                    },
                    selectedItem: cattleType,
                    // itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text(
                "Life Stage",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Select state",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async {
                      return kLifeStage;
                    },
                    onChanged: (String data) async {
                      liftStage = data;
                    },
                    selectedItem: liftStage,
                    // itemAsString: (String da) => da,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Date of Birth",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: InkWell(
                  onTap: () => _selectDate(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: const Color(0xffb7b7b7))),
                    height: 48,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          formatDate ?? "DOB",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              const SizedBox(
                height: 15,
              ),

              Text(
                "Age",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: TextFormField(
                  enabled: false,
                  controller: ageController,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
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
                          fontSize: 14 * MediaQuery.of(context).textScaleFactor,
                          color: const Color(0xffb7b7b7))),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text(
                "Breed",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Select state",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async {
                      return kCattleBreed;
                    },
                    onChanged: (String data) async {
                      breed = data;
                    },
                    selectedItem: breed,
                    // itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text(
                "Body Weight",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    maxLines: 1,
                    controller: bodyWeightController,
                    keyboardType: TextInputType.number,
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
                            fontSize:
                                14 * MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7))),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text(
                "Heat Date",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: InkWell(
                  onTap: () => _selectDate2(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: const Color(0xffb7b7b7))),
                    height: 48,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          formatDate2 ?? "Heat Date",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text(
                "Remarks",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: remarksController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
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
                            fontSize:
                                14 * MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7))),
                  ),
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
                          "Photo",
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
                          "",
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
                                        "Photo",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => onFileOpenPhoto(),
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
                            newFile == null
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
                                        newFile,
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(""),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: isLoad == true
                    ? const Center(
                        child: SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator()),
                      )
                    : SizedBox(
                        height: 47.0,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF6cbd47),
                            ), //button color
                          ),
                          onPressed: () async {
                            if (cattleNameController.text.isEmpty) {
                              showSnackBar("Enter cattle name");
                            } else if (cattleType == "") {
                              showSnackBar("Select cattle type");
                            } else if (liftStage == "") {
                              showSnackBar("Select lift stage");
                            } else if (ageController.text.isEmpty) {
                              showSnackBar("Select age");
                            } else if (breed == "") {
                              showSnackBar("Select breed");
                            } else if (bodyWeightController.text.isEmpty) {
                              showSnackBar("Enter body weight");
                            } else if (selectedDate == null) {
                              showSnackBar("Select heat date");
                            } else if (remarksController.text.isEmpty) {
                              showSnackBar("Enter remarks");
                            } else if (newFile == null) {
                              showSnackBar("Select photo");
                            } else {
                              setState(() {
                                isLoad = true;
                              });

                              await Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .newCattleApi(
                                      userType,
                                      cattleNameController.text,
                                      cattleType,
                                      liftStage,
                                      ageController.text,
                                      breed,
                                      bodyWeightController.text,
                                      formatDate2,
                                      remarksController.text,
                                      newFile);

                              setState(() {
                                isLoad = false;

                                filename = null;
                                file = null;
                                cattleType = "";
                                liftStage = "";
                                ageController.clear();
                                breed = "";
                                cattleNameController.clear();
                                bodyWeightController.clear();
                                formatDate = "";
                                formatDate2 = "";
                                selectedDate2 = DateTime.now();
                                selectedDate = DateTime.now();
                                remarksController.clear();
                                newFile = null;
                              });
                            }
                          },
                          child: Text('Save',
                              style: robotoBold.copyWith(
                                  fontSize: 19, color: Colors.white)),
                        )),
              ),

              // Row(children: const[
              //      Expanded(child: ElevatedButton(
              //       child: Text("Add"),
              //     )),
              //
              //     SizedBox(width: 15,),
              //
              //      Expanded(child: ElevatedButton(
              //       child: Text("Edit"),
              //     )),
              //
              //      SizedBox(width: 15,),
              //
              //      Expanded(child: ElevatedButton(
              //       child: Text("Details"),
              //     )),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
