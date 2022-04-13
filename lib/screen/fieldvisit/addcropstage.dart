import 'dart:io';

import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddCropStage extends StatefulWidget {
  @override
  State<AddCropStage> createState() => _AddCropStageState();
}

class _AddCropStageState extends State<AddCropStage> {
  List<String> cropLoss = ["Weather", "Diesesses", "Rain", "Fire", "Others"];
  List<String> cropStages = [
    "Vegetative",
    "Reproductive",
    "Ripening",
    "Sowing",
    "Transplanting or Replanting ",
    "Fertilizers",
    "Pesticide",
    "Milking stage ",
    "Grain filling",
    "Maturing stage ",
    "Harvesting stage"
  ];
  File filename, newFileObserverPhoto;
  PlatformFile file;
  var formatDate;
  DateTime selectedDate = DateTime.now();
  String cropStage = "", cropDueTo = "";
  bool isLoad = false;

  Future getImagefromcamera() async {
    dynamic image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);

    setState(() {
      newFileObserverPhoto = File(image.path);
    });
  }

  void onFileOpen() async {
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
        child: SingleChildScrollView(
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
                        "Crop Stage  :  ",
                        style: robotoMedium.copyWith(
                            color: const Color(0xff262626), fontSize: 18),
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
                            return cropStages;
                          },
                          onChanged: (String data) async {
                            cropStage = data;
                          },
                          itemAsString: (String da) => da,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Card(
                    elevation: 10,
                    child: InkWell(
                      onTap: () => getImagefromcamera(),
                      child: Container(
                        color: const Color(0xfff1f1f1),
                        width: MediaQuery.of(context).size.width,
                        // height: 80,
                        padding: newFileObserverPhoto == null
                            ? const EdgeInsets.all(10)
                            : const EdgeInsets.all(0),
                        child: Center(
                            child: newFileObserverPhoto == null
                                ? const Icon(
                                    Icons.add_a_photo,
                                    size: 40,
                                    color: Color(0xffe9e7e8),
                                  )
                                : Image.file(
                                    newFileObserverPhoto,
                                    fit: BoxFit.cover,
                                    // height: 300,
                                    width: double.infinity,
                                  )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Crop Loss Due to  :  ",
                        style: robotoMedium.copyWith(
                            color: const Color(0xff262626), fontSize: 18),
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
                            return cropLoss;
                          },
                          onChanged: (String data) async {
                            cropDueTo = data;
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
                        "Crop Loss Date  :  ",
                        style: robotoMedium.copyWith(
                            color: const Color(0xff262626), fontSize: 18),
                      ),
                      InkWell(
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
                                formatDate ?? "Select Date",
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: isLoad == true
                    ? const Center(
                        child: SizedBox(
                            width: 23,
                            height: 23,
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
                            if (cropStage == "") {
                              showSnackBar("Select crop stage");
                            } else if (newFileObserverPhoto == null) {
                              showSnackBar("Select image");
                            } else if (cropDueTo == "") {
                              showSnackBar("Select crop loss due to");
                            } else if (formatDate == null) {
                              showSnackBar("Select crop loss date");
                            } else {
                              setState(() {
                                isLoad = true;
                              });

                              await Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .addFieldCropStageApi(cropStage, cropDueTo,
                                      formatDate, newFileObserverPhoto);

                              setState(() {
                                isLoad = false;
                              });
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
