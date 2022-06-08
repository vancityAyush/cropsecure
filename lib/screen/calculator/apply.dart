import 'dart:io';

import 'package:CropSecure/utill/color_resources.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider/authprovider.dart';
import 'calculator.dart';

class Apply extends StatefulWidget {
  String plotId;

  Apply(this.plotId);

  @override
  State<Apply> createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  List<String> particular = ["Uttar Pradesh", "Uttrakhand", "Jharkhand"];

  DateTime selectedDate = DateTime.now();
  String formatDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String method;
  String productMixed;
  TextEditingController productName = TextEditingController();
  TextEditingController quantity = TextEditingController();
  File filename;
  PlatformFile file;
  bool isLoad = false;

  File newFileObserverPhoto;

  void onFileObserberPhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileObserverPhoto = filename;
      });
    }
  }

  _selectDate() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Method of Apply : ",
                        style: robotoMedium.copyWith(
                            color: const Color(0xff262626), fontSize: 16),
                      ),
                      Container(
                        height: 45,
                        width: 170,
                        color: ColorResources.light_purple,
                        child: DropdownSearch(
                          popupShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          mode: Mode.MENU,
                          popupElevation: 5,
                          dropdownSearchDecoration: const InputDecoration(
                            hintText: "Select",
                            hintStyle: TextStyle(color: ColorResources.white),
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                            border: OutlineInputBorder(),
                          ),
                          // showSearchBox:true,
                          onFind: (String filter) async {
                            return particular;
                          },
                          onChanged: (String data) async {
                            method = data;
                          },
                          itemAsString: (String da) => da,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Product mixed : ",
                        style: robotoMedium.copyWith(
                            color: const Color(0xff262626), fontSize: 16),
                      ),
                      Container(
                        height: 45,
                        width: 170,
                        color: ColorResources.light_purple,
                        child: DropdownSearch(
                          popupShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          mode: Mode.MENU,
                          popupElevation: 5,
                          dropdownSearchDecoration: const InputDecoration(
                            hintText: "Select",
                            hintStyle: TextStyle(color: ColorResources.white),
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                            border: OutlineInputBorder(),
                          ),
                          // showSearchBox:true,
                          onFind: (String filter) async {
                            return particular;
                          },
                          onChanged: (String data) async {
                            productMixed = data;
                          },
                          itemAsString: (String da) => da,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product Name:",
                              style: robotoMedium.copyWith(
                                  color: const Color(0xff262626), fontSize: 16),
                            ),
                            SizedBox(
                                height: 48,
                                child: TextFormField(
                                  maxLines: 1,
                                  autofocus: false,
                                  controller: productName,
                                  decoration: InputDecoration(
                                      hintText: "",
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: 14 *
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          color: const Color(0xffb7b7b7))),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Quantity:",
                              style: robotoMedium.copyWith(
                                  color: const Color(0xff262626), fontSize: 16),
                            ),
                            SizedBox(
                                height: 48,
                                child: TextFormField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  autofocus: false,
                                  controller: quantity,
                                  decoration: InputDecoration(
                                      hintText: "",
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      hintStyle: TextStyle(
                                          fontSize: 14 *
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          color: const Color(0xffb7b7b7))),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Applied on  :  ",
                        style: robotoMedium.copyWith(
                            color: const Color(0xff262626), fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: _selectDate,
                        child: Container(
                          height: 45,
                          width: 170,
                          color: ColorResources.light_purple,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                formatDate,
                                style: robotoMedium.copyWith(
                                    fontSize: 17, color: Colors.white),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Image.asset(
                                    "assets/image/calender.png",
                                    color: Colors.white,
                                    width: 25,
                                    height: 25,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Photo  :  ",
                        style: robotoMedium.copyWith(
                            color: const Color(0xff262626), fontSize: 16),
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            onFileObserberPhoto();
                          },
                          child: Container(
                            height: 120,
                            width: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border:
                                    Border.all(color: const Color(0xffb7b7b7))),
                            child: Column(
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
                                        "Observer Photo",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626),
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(
                                        right: 4, bottom: 3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: const Color(0xffb7b7b7)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.image_outlined,
                                        size: 25,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  newFileObserverPhoto != null
                      ? Image.file(
                          newFileObserverPhoto,
                          fit: BoxFit.contain,
                        )
                      : Container(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
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
                        setState(() {
                          // isLoad = true;
                        });
                        // Get.to(SelectedUserType(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                        var res = await Provider.of<AuthProvider>(context,
                                listen: false)
                            .calculatorAdd(
                                widget.plotId,
                                method,
                                productMixed,
                                productName.text,
                                quantity.text,
                                formatDate,
                                newFileObserverPhoto);
                        if (res.isSuccess) {
                          setState(() {
                            isLoad = false;
                            selectedDate = DateTime.now();
                            formatDate =
                                DateFormat('yyyy-MM-dd').format(DateTime.now());
                            method = null;
                            productMixed = null;
                            productName.clear();
                            quantity.clear();
                            filename = null;
                            file = null;
                          });
                          Get.to(Calculator(widget.plotId),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 600));
                        }
                      },
                      child: Text('Save',
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
