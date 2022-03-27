import 'dart:io';

import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider/authprovider.dart';

class RaiseAlertDetail extends StatefulWidget {
  String plotId;
  dynamic disease;
  RaiseAlertDetail({this.plotId, this.disease});

  @override
  State<RaiseAlertDetail> createState() => _RaiseAlertDetailState();
}

class _RaiseAlertDetailState extends State<RaiseAlertDetail> {
  bool isLoading = false;
  bool isAreaAffected = false;
  TextEditingController adviceController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  File _image = null;
  Future<File> selectImage() async {
    PickedFile image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }

  DateTime selectedDate = DateTime.now();
  String formatDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Raise Alerts",
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                elevation: 9,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                "assets/image/farmer.png",
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.disease['name'],
                                    style: robotoBold.copyWith(
                                        color: ColorResources.light_purple,
                                        fontSize: 16),
                                  ),
                                  Text(
                                    widget.disease['description'],
                                    style: robotoRegular.copyWith(
                                        color: ColorResources.light_purple,
                                        fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: const Color(0xffebe9ea), width: 1),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xffebe9ea),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recommended advice",
                              style: robotoBold.copyWith(
                                  color: Colors.black, fontSize: 16),
                            ),
                            Text(
                              "Spraying of 1.7mi Dimethoate 30% EC. or 1mi methi parathion 50 Ec per litre if water",
                              style: robotoRegular.copyWith(
                                  color: Colors.black, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: isAreaAffected,
                        onChanged: (value) {
                          setState(() {
                            isAreaAffected = value;
                          });
                        },
                        title: Text(
                          "Area is affected",
                          style: robotoMedium.copyWith(fontSize: 19),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Area is affected on ",
                                  style: robotoMedium.copyWith(fontSize: 19),
                                ),
                                IconButton(
                                    onPressed: () => _selectDate(context),
                                    icon: Icon(Icons.calendar_today_rounded)),
                              ],
                            ),
                            Text(
                              formatDate,
                              style: robotoRegular.copyWith(fontSize: 14),
                            ),

                            const Divider(
                              thickness: 2,
                            ),

                            const SizedBox(
                              height: 15,
                            ),

                            TextField(
                              controller: adviceController,
                              decoration: const InputDecoration(
                                  hintText: "New Advice",
                                  isDense: true,
                                  filled: false),
                            )
                            // const Divider(thickness: 2,)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: selectImage,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                              top: 20, left: 10, right: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color(0xffebe9ea),
                          ),
                          child: _image != null
                              ? Image.file(_image)
                              : Icon(
                                  Icons.camera,
                                  size: 36,
                                ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xffebe9ea),
                        ),
                        child: const Icon(
                          Icons.mic,
                          size: 36,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15),
                        child: TextField(
                          controller: commentController,
                          decoration: const InputDecoration(
                              hintText: "Comments",
                              isDense: true,
                              filled: false),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: robotoBold.copyWith(
                              color: const Color(0xff262626), fontSize: 17),
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<AuthProvider>(context, listen: false)
                              .diseaseAlertAdd(
                            plotId: widget.plotId,
                            isAffected: isAreaAffected ? 'Yes' : 'No',
                            areaDate: formatDate,
                            newAdvice: adviceController.text,
                            comment: commentController.text,
                            image: _image,
                          );
                        },
                        child: Text(
                          "Submit",
                          style: robotoBold.copyWith(color: Colors.white),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
