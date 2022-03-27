import 'dart:io';

import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoilRegister extends StatefulWidget {
  @override
  State<SoilRegister> createState() => _SoilRegisterState();
}

class _SoilRegisterState extends State<SoilRegister> {
  List<String> particular = ["Uttar Pradesh", "Uttrakhand", "Jharkhand"];
  String smapleCollectedBy = "";
  var formatDate;
  DateTime selectedDate = DateTime.now();
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
      body: Padding(
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
                      "Sample Collected Date  :  ",
                      style: robotoMedium.copyWith(
                          color: const Color(0xff262626), fontSize: 16),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: Container(
                          height: 45,
                          width: 170,
                          color: ColorResources.light_purple,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                formatDate ?? "Select Data",
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
                      "Sample Collected By : ",
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
                          smapleCollectedBy = data;
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
                      "Photo  :  ",
                      style: robotoMedium.copyWith(
                          color: const Color(0xff262626), fontSize: 16),
                    ),
                    Center(
                      child: Container(
                        height: 120,
                        width: 140,
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
                                            color: const Color(0xff262626),
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => onFileObserberPhoto(),
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
                            newFileObserverPhoto == null
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
                                        newFileObserverPhoto,
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                //   child: SizedBox(
                //       height: 47.0,
                //       // width: MediaQuery.of(context).size.width,
                //       child: ElevatedButton(
                //         style: ButtonStyle(
                //           backgroundColor:
                //           MaterialStateProperty.all<Color>(const Color(0xFF6cbd47),), //button color
                //         ),
                //         onPressed: () async {
                //           // setState(() {
                //           //   // isLoad = true;
                //           // });
                //           // Get.to(SelectedUserType(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                //           // await Provider.of<AuthProvider>(context,listen: false).loginUserApi(userName.text, password.text, userType);
                //
                //           // setState(() {
                //           // isLoad = false;
                //           // });
                //         },
                //         child: Text('Save Report',
                //             style: robotoBold.copyWith(fontSize: 19,color: Colors.white)),
                //       )),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: isLoad == true
                  ? const Center(
                      child: SizedBox(
                          width: 23,
                          height: 23,
                          child: CircularProgressIndicator()))
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
                          if (formatDate == null) {
                            showSnackBar("Select date");
                          } else if (smapleCollectedBy == "") {
                            showSnackBar("Select collected by");
                          } else if (newFileObserverPhoto == null) {
                            showSnackBar("Select photo");
                          } else {
                            setState(() {
                              isLoad = true;
                            });

                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .addSoilInformationApi(formatDate,
                                    smapleCollectedBy, newFileObserverPhoto);

                            //TODO navigate to next tab
                            // Get.off(() => AddReport(apiResponse.response.data['data'].toString()),
                            //     transition: Transition.rightToLeftWithFade,
                            //     duration: const Duration(milliseconds: 600));

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
    );
  }
}
