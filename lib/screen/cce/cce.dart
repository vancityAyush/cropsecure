import 'dart:io';

import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/dimensions.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Cce extends StatefulWidget {

  @override
  State<Cce> createState() => _CceState();
}

class _CceState extends State<Cce> {
  List<String> gender = ["Male","Female"];
  int tagRadio = 1,tagRadioNumber=1;
  bool isLoad = false;
  String userType = "Yes",chooseRandomNumber = "Yes";
  TextEditingController observerNameController = TextEditingController();
  TextEditingController observerMobileController = TextEditingController();
  TextEditingController observerDesignationController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController areaAuditController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController breadthController = TextEditingController();
  TextEditingController randomLengthController = TextEditingController();
  TextEditingController randomBreadthController = TextEditingController();
  TextEditingController dimensionOfCCeController = TextEditingController();
  TextEditingController bmwotcaController = TextEditingController();
  TextEditingController bmwotcbController = TextEditingController();
  TextEditingController bmwotccController = TextEditingController();
  TextEditingController weightOfCropsController = TextEditingController();
  TextEditingController sumOfAllController = TextEditingController();
  TextEditingController sumOfBioMassController = TextEditingController();

  String departMentSelect = "",areaAcreSelect="",
      insuranceSelect="",shapeOfCceSelect="";
  File filename;
  PlatformFile file;

  File newFileObserverPhoto,newFileSouthWestPhoto,newFileFieldImagePhoto,newFileMarkedImagePhoto,
  newFileCutHarvestPhoto,newFileWeightingPhoto,newFileThreshingPhoto,newFileCleaningPhoto,
  newFileCutPlotPhoto,newFileWeightPlotPhoto,newFileMoisturePhoto,newFileJointPhoto;

  void onFileObserberPhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileObserverPhoto = filename;
      });
    }
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message),
        backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void onFileSouthWestPhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileSouthWestPhoto = filename;
      });
    }
  }

  void onFileFieldImagePhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileFieldImagePhoto = filename;
      });
    }
  }

  void onFileMarkedImagePhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileMarkedImagePhoto = filename;
      });
    }
  }

  void onFileCutHarvestPhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileCutHarvestPhoto = filename;
      });
    }
  }

  void onFileWeightingPhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileWeightingPhoto = filename;
      });
    }
  }

  void onFileThreshingPhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileThreshingPhoto = filename;
      });
    }
  }

  void onFileCleaningPhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileCleaningPhoto = filename;
      });
    }
  }

  void onFileCutPlotPhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileCutPlotPhoto = filename;
      });
    }
  }

  void onFileWeightPhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileWeightPlotPhoto = filename;
      });
    }
  }

  void onFileMoisturePhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileMoisturePhoto = filename;
      });
    }
  }

  void onFileJointPhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileJointPhoto = filename;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("CCE",
          style: robotoBold.copyWith(color: Colors.white,
              fontSize: 19),),
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("GPS ACCURACY : 20",
              style: robotoBold.copyWith(
                color: ColorResources.light_purple,
                fontSize: 18
              ),),

              const SizedBox(
                height: 20,
              ),

              Text("Department",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626),
                      fontSize: 17)),

              SizedBox(
                height: 48,
                child: DropdownSearch(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "Insurance",
                    hintStyle: TextStyle(
                        color: ColorResources.light_purple
                    ),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (String filter) async{
                    return gender;},
                  onChanged: (String data) async{
                    departMentSelect = data;
                  },
                  itemAsString: (String da) => da,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: observerNameController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Observer Name",
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
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: observerMobileController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Observer Mobile",
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
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: observerDesignationController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Observer Designation",
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
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10,),

              Center(
                child: Container(
                  height: 120,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xffb7b7b7))
                  ),
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
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text("Observer Photo",
                                  style: robotoMedium.copyWith(
                                      color: const Color(0xff262626),
                                      fontSize: 13
                                  ),),
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: ()=>onFileObserberPhoto(),
                            child: Container(
                                margin: const EdgeInsets.only(right: 4,bottom: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                    color: const Color(0xffb7b7b7)
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(Icons.image_outlined,size: 25,),
                                )),
                          ),
                        ],
                      ),
                      newFileObserverPhoto == null ? const Text(""):Positioned(
                          top: 0, bottom: 0,right: 0,left: 0,
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.fromLTRB(20,45,25,30),
                            child: Image.file(newFileObserverPhoto,
                            ),
                          ))
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              Text("Total Area of CCE Fields(In Acre)",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626),
                      fontSize: 17)),

              SizedBox(
                height: 48,
                child: DropdownSearch(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "Insurance",
                    hintStyle: TextStyle(
                        color: ColorResources.light_purple
                    ),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (String filter) async{
                    return gender;},
                  onChanged: (String data) async{
                    areaAcreSelect = data;
                  },
                  itemAsString: (String da) => da,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: areaController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Manually Enter Area",
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
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              Text("Area Audit(Automatically calculate)",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626),
                      fontSize: 17)),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    maxLines: 1,
                    controller: areaAuditController,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Manually Enter Area",
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
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              Text("Is South-West Corner?",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626),
                      fontSize: 17)),

              SizedBox(
                child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Transform.scale(
                          scale: 1.0,
                          child: Radio(
                            activeColor: ColorResources.light_purple,
                            value: 1,
                            groupValue: tagRadio,
                            onChanged: (val) {
                              setState(() {
                                tagRadio = 1;
                                userType = "Yes";
                              });
                            },
                          ),
                        ),
                        const Text(
                            "Yes",
                            style: TextStyle(
                                color: ColorResources.black,
                                fontWeight: FontWeight.normal,
                                fontSize: Dimensions.text_13,
                                fontFamily: "Roboto")),

                        Transform.scale(
                            scale: 1.0,
                            child: Radio(
                              activeColor: ColorResources.light_purple,
                              value: 2,
                              groupValue: tagRadio,
                              onChanged: (val) {
                                setState(() {
                                  tagRadio = 2;
                                  userType = "No";
                                });
                              },
                            )),

                        const Text(
                          "No",
                          style: TextStyle(
                              color: ColorResources.black,
                              fontWeight: FontWeight.normal,
                              fontSize: Dimensions.text_13,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    )),
              ),

              Container(
                padding: const EdgeInsets.only(left: 0,right: 0),
                margin: const EdgeInsets.only(top: 8),
                height: 140,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))
                        ),
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
                                      color: const Color(0xffe1ddde)

                                  ),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("South West Corner",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=> onFileSouthWestPhoto(),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 4,bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.image_outlined,size: 25,),
                                      )),
                                ),
                              ],
                            ),
                            newFileSouthWestPhoto == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileSouthWestPhoto,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20,),

                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))
                        ),
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
                                      color: const Color(0xffe1ddde)

                                  ),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("Field Images",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=>onFileFieldImagePhoto(),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 4,bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.image_outlined,size: 25,),
                                      )),
                                ),
                              ],
                            ),

                            newFileFieldImagePhoto == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileFieldImagePhoto,
                                  ),
                                ))

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15,),

              Text("Note: Length X Breadth are calculated Based on Foot steps",
              style: robotoBold.copyWith(
                color: ColorResources.light_purple,
                fontSize: 14
              ),),

              const SizedBox(height: 10,),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Length",style: robotoBold.copyWith(
                      color: Colors.black,
                      fontSize: 16
                    ),),
                  ),

                  const SizedBox(width: 20,),

                  Expanded(
                    flex: 1,
                    child: Text("Breadth",style: robotoBold.copyWith(
                        color: Colors.black,
                        fontSize: 16
                    ),),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 48.0,
                        child: TextFormField(
                          controller: lengthController,
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
                                  fontSize: 14*MediaQuery.of(context).textScaleFactor,
                                  color: const Color(0xffb7b7b7)
                              )
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20,),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 48.0,
                        child: TextFormField(
                          controller: breadthController,
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
                                  fontSize: 14*MediaQuery.of(context).textScaleFactor,
                                  color: const Color(0xffb7b7b7)
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15,),

              Text("Has the plot Area been chosen using random number",
                style: robotoBold.copyWith(
                    color: ColorResources.black,
                    fontSize: 14
                ),),

              const SizedBox(height: 5,),

              SizedBox(
                child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Transform.scale(
                          scale: 1.0,
                          child: Radio(
                            activeColor: ColorResources.light_purple,
                            value: 1,
                            groupValue: tagRadioNumber,
                            onChanged: (val) {
                              setState(() {
                                tagRadioNumber = 1;
                                chooseRandomNumber = "Yes";
                              });
                            },
                          ),
                        ),
                        const Text(
                            "Yes",
                            style: TextStyle(
                                color: ColorResources.black,
                                fontWeight: FontWeight.normal,
                                fontSize: Dimensions.text_13,
                                fontFamily: "Roboto")),

                        Transform.scale(
                            scale: 1.0,
                            child: Radio(
                              activeColor: ColorResources.light_purple,
                              value: 2,
                              groupValue: tagRadioNumber,
                              onChanged: (val) {
                                setState(() {
                                  tagRadioNumber = 2;
                                  chooseRandomNumber = "No";
                                });
                              },
                            )),

                        const Text(
                          "No",
                          style: TextStyle(
                              color: ColorResources.black,
                              fontWeight: FontWeight.normal,
                              fontSize: Dimensions.text_13,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    )),
              ),

              const SizedBox(height: 10,),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("Random Number Length",style: robotoBold.copyWith(
                        color: Colors.black,
                        fontSize: 16
                    ),),
                  ),

                  const SizedBox(width: 20,),

                  Expanded(
                    flex: 1,
                    child: Text("Random Number Breadth",style: robotoBold.copyWith(
                        color: Colors.black,
                        fontSize: 16
                    ),),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 48.0,
                        child: TextFormField(
                          controller: randomLengthController,
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
                                  fontSize: 14*MediaQuery.of(context).textScaleFactor,
                                  color: const Color(0xffb7b7b7)
                              )
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20,),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 48.0,
                        child: TextFormField(
                          controller: randomBreadthController,
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
                                  fontSize: 14*MediaQuery.of(context).textScaleFactor,
                                  color: const Color(0xffb7b7b7)
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12,),

              Text("Shape of CCE plot",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626),
                      fontSize: 17)),

              SizedBox(
                height: 48,
                child: DropdownSearch(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "Insurance",
                    hintStyle: TextStyle(
                        color: ColorResources.light_purple
                    ),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (String filter) async{
                    return gender;},
                  onChanged: (String data) async{
                    shapeOfCceSelect = data;
                  },
                  itemAsString: (String da) => da,
                ),
              ),

              const SizedBox(height: 12,),

              Text("Dimension of CCE plot(Length*Breadth) with Units",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626),
                      fontSize: 17)),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: dimensionOfCCeController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "5mX5m",
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
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 0,right: 0),
                margin: const EdgeInsets.only(top: 8),
                height: 140,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))
                        ),
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
                                      color: const Color(0xffe1ddde)

                                  ),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("Marked Plot Photo",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=>onFileMarkedImagePhoto(),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 4,bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.image_outlined,size: 25,),
                                      )),
                                ),
                              ],
                            ),

                            newFileMarkedImagePhoto == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileMarkedImagePhoto,
                                  ),
                                ))

                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20,),

                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))
                        ),
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
                                      color: const Color(0xffe1ddde)

                                  ),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("Cut Harvest Photo",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=>onFileCutHarvestPhoto(),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 4,bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.image_outlined,size: 25,),
                                      )),
                                ),
                              ],
                            ),
                            newFileCutHarvestPhoto == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileCutHarvestPhoto,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15,),

              Text("Note: Please Select Unit before filling any weight",
                style: robotoBold.copyWith(
                    color: ColorResources.light_purple,
                    fontSize: 14
                ),),

              const SizedBox(height: 12,),

              Text("Bio Mass weight of the crop(Kg)",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626),
                      fontSize: 17)),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 48.0,
                        child: TextFormField(
                          controller: bmwotcaController,
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
                                  fontSize: 14*MediaQuery.of(context).textScaleFactor,
                                  color: const Color(0xffb7b7b7)
                              )
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20,),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 48.0,
                        child: TextFormField(
                          maxLines: 1,
                          controller: bmwotcbController,
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
                                  fontSize: 14*MediaQuery.of(context).textScaleFactor,
                                  color: const Color(0xffb7b7b7)
                              )
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20,),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 48.0,
                        child: TextFormField(
                          controller: bmwotccController,
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
                                  fontSize: 14*MediaQuery.of(context).textScaleFactor,
                                  color: const Color(0xffb7b7b7)
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: sumOfBioMassController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Sum of all columns(Kgs)",
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
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 0,right: 0),
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Weighting Photo",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)
                          ),),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Threshing Photo",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)
                          ),),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Cleaning Photo",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)
                          ),),
                      ),
                    )
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 0,right: 0),
                margin: const EdgeInsets.only(top: 8),
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))
                        ),
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
                                      color: const Color(0xffe1ddde)

                                  ),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("Weighing  Photo",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=>onFileWeightingPhoto(),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 4,bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.image_outlined,size: 25,),
                                      )),
                                ),
                              ],
                            ),
                            newFileWeightingPhoto == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileWeightingPhoto,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20,),

                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))
                        ),
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
                                      color: const Color(0xffe1ddde)

                                  ),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("Threshing Photo",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=>onFileThreshingPhoto(),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 4,bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.image_outlined,size: 25,),
                                      )),
                                ),
                              ],
                            ),
                            newFileThreshingPhoto == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileThreshingPhoto,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20,),

                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))
                        ),
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
                                      color: const Color(0xffe1ddde)
                                  ),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("Cleaning Photo",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=>onFileCleaningPhoto(),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 4,bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.image_outlined,size: 25,),
                                      )),
                                ),
                              ],
                            ),
                            newFileCleaningPhoto == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileCleaningPhoto,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 12,),

              Text("Yield weight of the crop (Kgs)",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626),
                      fontSize: 17)),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: weightOfCropsController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Weight of crops (Kgs)",
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
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: sumOfAllController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Sum of all columns(Kgs)",
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
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 0,right: 0),
                margin: const EdgeInsets.only(top: 30,),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Cut Plot",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)
                          ),),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Weight",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)
                          ),),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 0,right: 0),
                margin: const EdgeInsets.only(top: 8,left: 30,right: 30),
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))
                        ),
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
                                      color: const Color(0xffe1ddde)

                                  ),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("Cut Plot",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=>onFileCutPlotPhoto(),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 4,bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.image_outlined,size: 25,),
                                      )),
                                ),
                              ],
                            ),

                            newFileCutPlotPhoto == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileCutPlotPhoto,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20,),

                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))
                        ),
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
                                      color: const Color(0xffe1ddde)

                                  ),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("Weight",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=>onFileWeightPhoto(),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 4,bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.image_outlined,size: 25,),
                                      )),
                                ),
                              ],
                            ),

                            newFileWeightPlotPhoto == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileWeightPlotPhoto,
                                  ),
                                ))

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 0,right: 0),
                margin: const EdgeInsets.only(top: 30,),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Moisture",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)
                          ),),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Joint Photo",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)
                          ),),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 0,right: 0),
                margin: const EdgeInsets.only(top: 8,left: 30,right: 30),
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))
                        ),
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
                                      color: const Color(0xffe1ddde)

                                  ),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("Moisture Photo",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=>onFileMoisturePhoto(),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 4,bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.image_outlined,size: 25,),
                                      )),
                                ),
                              ],
                            ),
                            newFileMoisturePhoto == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileMoisturePhoto,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20,),

                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))
                        ),
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
                                      color: const Color(0xffe1ddde)

                                  ),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("Joint Photo",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=>onFileJointPhoto(),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 4,bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.image_outlined,size: 25,),
                                      )),
                                ),
                              ],
                            ),
                            newFileJointPhoto == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileJointPhoto,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              if(isLoad == true)
                const Center(
                  child: SizedBox(
                    width: 20,height: 20,
                      child: CircularProgressIndicator()),)
              else
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: SizedBox(
                    height: 47.0,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xFF6cbd47),), //button color
                      ),
                      onPressed: () async {

                        if(departMentSelect == ""){
                          showSnackBar("Select department");
                        }else if(observerNameController.text.isEmpty){
                          showSnackBar("Enter observer name");
                        }else if(observerMobileController.text.isEmpty){
                          showSnackBar("Enter observer mobile number");
                        }else if(observerDesignationController.text.isEmpty){
                          showSnackBar("Enter observer designation");
                        }else if(newFileObserverPhoto == null){
                          showSnackBar("Select observer photo");
                        }else if(areaAcreSelect == ""){
                          showSnackBar("Select total area of cce fields");
                        }else if(areaController.text.isEmpty){
                          showSnackBar("Enter area");
                        }else if(areaAuditController.text.isEmpty){
                          showSnackBar("Enter area audit");
                        }else if(areaAuditController.text.isEmpty){
                          showSnackBar("Enter area audit");
                        }else if(newFileSouthWestPhoto == null){
                          showSnackBar("Select south west corner");
                        }else if(newFileFieldImagePhoto == null){
                          showSnackBar("Select field image");
                        }else if(lengthController.text.isEmpty){
                          showSnackBar("Enter length");
                        }else if(breadthController.text.isEmpty){
                          showSnackBar("Enter breadth");
                        }else if(randomLengthController.text.isEmpty){
                          showSnackBar("Enter random length");
                        }else if(randomBreadthController.text.isEmpty){
                          showSnackBar("Enter random breadth");
                        }else if(shapeOfCceSelect == ""){
                          showSnackBar("Select cce plot");
                        }else if(dimensionOfCCeController.text.isEmpty){
                          showSnackBar("Enter dimension of cce plot");
                        }else if(newFileMarkedImagePhoto == null){
                          showSnackBar("Select marked plot photo");
                        }else if(newFileCutHarvestPhoto == null){
                          showSnackBar("Select cut harvest photo");
                        }else if(bmwotcaController.text.isEmpty){
                          showSnackBar("Enter bmwotca");
                        }else if(bmwotcbController.text.isEmpty){
                          showSnackBar("Enter bmwotcb");
                        }else if(bmwotccController.text.isEmpty){
                          showSnackBar("Enter bmwotcc");
                        }else if(sumOfBioMassController.text.isEmpty){
                          showSnackBar("Enter sum of biomass");
                        }else if(newFileWeightingPhoto == null){
                          showSnackBar("Select weighting photo");
                        }else if(newFileThreshingPhoto == null){
                          showSnackBar("Select threshing photo");
                        }else if(newFileCleaningPhoto == null){
                          showSnackBar("Select cleaning photo");
                        }else if(weightOfCropsController.text.isEmpty){
                          showSnackBar("Enter weight of crops");
                        }else if(sumOfAllController.text.isEmpty){
                          showSnackBar("Enter sum of yield");
                        }else if(newFileCutPlotPhoto == null){
                          showSnackBar("Select cut plot photo");
                        }else if(newFileWeightPlotPhoto == null){
                          showSnackBar("Select weight");
                        }else if(newFileMoisturePhoto == null){
                          showSnackBar("Select moisture photo");
                        }else if(newFileJointPhoto == null){
                          showSnackBar("Select joint photo");
                        }else{
                          setState(() {
                            isLoad = true;
                          });
                          // Get.to(() => AddBankDetail(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                          await Provider.of<AuthProvider>(context,listen: false).addCceApi("20", departMentSelect, observerNameController.text,
                              observerDesignationController.text, newFileObserverPhoto, areaAcreSelect, areaController.text,
                              areaAuditController.text, userType, newFileSouthWestPhoto,newFileFieldImagePhoto, lengthController.text,
                              breadthController.text,
                              chooseRandomNumber, randomLengthController.text,
                              randomBreadthController.text, shapeOfCceSelect, dimensionOfCCeController.text,
                              newFileMarkedImagePhoto, newFileCutHarvestPhoto, bmwotcaController.text,
                              bmwotcbController.text, bmwotccController.text, sumOfBioMassController.text,
                              newFileWeightPlotPhoto, newFileThreshingPhoto, newFileCleaningPhoto, weightOfCropsController.text,
                              sumOfAllController.text, newFileCutPlotPhoto, newFileWeightPlotPhoto, newFileMoisturePhoto, newFileJointPhoto,observerMobileController.text);

                          setState(() {
                            isLoad = false;
                          });
                        }
                      },
                      child: Text('Save',
                          style: robotoBold.copyWith(fontSize: 19,color: Colors.white)),
                    )),
              ),

            ],
          ),
        ),
      ),
    );
  }
}