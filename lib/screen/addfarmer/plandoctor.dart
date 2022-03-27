import 'dart:io';
import 'dart:ui';

import 'package:cropsecure/provider/authprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

enum flags { YES, NO }

class PlantDoctor extends StatefulWidget {
  String id;
  PlantDoctor({this.id});
  @override
  _State createState() => _State();
}

class _State extends State<PlantDoctor> {
  flags _flag = flags.YES;
  String _comment = "";
  bool isLoad = false;
  File _image = null;
  Future<File> selectImage() async {
    PickedFile image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
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
            onPressed: () {},
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
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Comment",
                              labelStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          onChanged: (val) {
                            setState(() {
                              _comment = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20),

                      // Visibility for image
                      if (_image != null)
                        Container(
                          child: Image.file(_image),
                        ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.mic,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                onPressed: () => {},
                              ),
                              const Text("Mic",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.photo,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  onPressed: () => selectImage()),
                              const Text("Photo",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ],
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
                              if (_comment.isNotEmpty) {
                                var res = await Provider.of<AuthProvider>(
                                        context,
                                        listen: false)
                                    .addPlantDoctorApi(widget.id,
                                        comment: _comment, image: _image);
                                setState(() {
                                  isLoad = false;
                                });
                              }
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
