import 'dart:io';
import 'dart:ui';

import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/screen/addfarmer/plant_doctor_history.dart';
import 'package:CropSecure/screen/addfarmer/simple_recorder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:record_mp3/record_mp3.dart';

import '../../utill/styles.dart';

enum flags { YES, NO }

class PlantDoctor extends StatefulWidget {
  String id;
  PlantDoctor({this.id});
  @override
  _State createState() => _State();
}

class _State extends State<PlantDoctor> {
  flags _flag = flags.YES;
  TextEditingController _commentController = TextEditingController();
  bool isLoad = false;
  File _image = null;
  File _recordedFile = null;
  String path;
  Future<File> selectImage() async {
    PickedFile image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // initRecorder();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // recorder.closeRecorder();
    super.dispose();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }
    await recorder.openRecorder();
    recorder.setSubscriptionDuration(Duration(milliseconds: 500));
    print(recorder);
  }

  FlutterSoundRecorder recorder = FlutterSoundRecorder();

  Future<void> record() async {
    _recordedFile = null;
    final k = await getTemporaryDirectory();
    path =
        '${(await getTemporaryDirectory()).path}/${DateTime.now().millisecondsSinceEpoch}.mp3';
    RecordMp3.instance.start(path, (type) {
      // record fail callback
    });
    // await recorder.startRecorder(
    //     toFile: '${DateTime.now().millisecondsSinceEpoch}');
    setState(() {});
  }

  Future<void> stop() async {
    // final path = await recorder.stopRecorder();
    RecordMp3.instance.stop();
    _recordedFile = File(path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PLANT DOCTOR",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
        toolbarHeight: 80,
        actions: [
          //Material Button with History and white background
          MaterialButton(
            onPressed: () {
              Get.to(() => PlantDoctorHistory(widget.id),
                  transition: Transition.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 600));
            },
            child: const Text(
              "HISTORY",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            height: 50,
            minWidth: 50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 9,
                child: const Text(
                    "Get Expert advice and suggestion on your mobile to resolve your farm releted queries and problem",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
              ),
              Container(
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 20,
                  color: Colors.black,
                  child: const Text(
                    "Do You Have Question?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Radio<flags>(
                      value: flags.YES,
                      groupValue: _flag,
                      onChanged: (val) {
                        setState(() {
                          _flag = val;
                        });
                      },
                    ),
                    const Text(
                      'YES',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 30),
                    Radio<flags>(
                      value: flags.NO,
                      groupValue: _flag,
                      onChanged: (val) {
                        setState(() {
                          _flag = val;
                        });
                      },
                    ),
                    const Text(
                      "NO",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: _flag == flags.YES,
                child: Card(
                  child: Column(
                    children: [
                      //TextField for comment
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: _commentController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Comment",
                              labelStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      SizedBox(height: 20),

                      Column(
                        children: [
                          Center(
                            child: Container(
                              height: 120,
                              width: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: const Color(0xffb7b7b7))),
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(2),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: const Color(0xffe1ddde)),
                                        height: 40,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                            child: Text(
                                              "Photo",
                                              style: robotoMedium.copyWith(
                                                  color:
                                                      const Color(0xff262626),
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => selectImage(),
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
                        ],
                      ),
                      SizedBox(height: 20),
                      SimpleRecorder(),
                      Column(
                        children: [
                          Center(
                            child: Container(
                              height: 120,
                              width: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: const Color(0xffb7b7b7))),
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(2),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: const Color(0xffe1ddde)),
                                        height: 40,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                            child: Text(
                                              "Audio",
                                              style: robotoMedium.copyWith(
                                                  color:
                                                      const Color(0xff262626),
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      _recordedFile == null
                                          ? Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                RecordMp3.instance.status ==
                                                        RecordStatus.IDEL
                                                    ? "Record"
                                                    : "Recording",
                                                style: robotoMedium.copyWith(
                                                    color:
                                                        const Color(0xff262626),
                                                    fontSize: 13),
                                              ),
                                              // child: StreamBuilder<
                                              //         RecordingDisposition>(
                                              //     stream: recorder.onProgress,
                                              //     builder:
                                              //         (context, snapsshot) {
                                              //       final Duration duration =
                                              //           snapsshot.hasData
                                              //               ? snapsshot
                                              //                   .data?.duration
                                              //               : Duration.zero;
                                              //
                                              //       return Text(
                                              //         duration
                                              //             .toString()
                                              //             .split('.')[0],
                                              //         style:
                                              //             robotoMedium.copyWith(
                                              //                 color: const Color(
                                              //                     0xff262626),
                                              //                 fontSize: 13),
                                              //       );
                                              //     }),
                                            )
                                          : Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "File recorded",
                                                style: robotoMedium.copyWith(
                                                    color:
                                                        const Color(0xff262626),
                                                    fontSize: 13),
                                              ),
                                            ),
                                      InkWell(
                                        onTap: () async {
                                          if (RecordMp3.instance.status ==
                                              RecordStatus.RECORDING) {
                                            await stop();
                                          } else {
                                            await record();
                                          }
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 4, bottom: 3),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13),
                                                color: const Color(0xffb7b7b7)),
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                RecordMp3.instance.status ==
                                                        RecordStatus.RECORDING
                                                    ? Icons.stop
                                                    : Icons.mic,
                                                size: 25,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Button for submit with rounded corners
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: RaisedButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 80),
                            child: isLoad
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                            onPressed: () async {
                              setState(() {
                                isLoad = true;
                              });
                              File sendFile = _recordedFile;
                              if (_image != null) sendFile = _image;
                              if (_commentController.text.isNotEmpty) {
                                var res = await Provider.of<AuthProvider>(
                                        context,
                                        listen: false)
                                    .addPlantDoctorApi(widget.id,
                                        comment: _commentController.text,
                                        image: sendFile,
                                        audio: _recordedFile);
                                setState(() {
                                  _commentController.clear();
                                  _image = null;
                                  isLoad = false;
                                  _recordedFile = null;
                                });
                              }
                              setState(() {
                                isLoad = false;
                              });
                            }),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
