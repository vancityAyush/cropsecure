import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/drop_down.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../utill/color_resources.dart';

class CattieShed extends StatefulWidget {
  @override
  State<CattieShed> createState() => _CattieShedState();
}

class _CattieShedState extends State<CattieShed> {
  bool isLoad = false;
  int tagRadio = 1;
  String userType = "New Cattle Shed";
  TextEditingController belowShedNameController = TextEditingController();
  TextEditingController shedNameController = TextEditingController();
  Position position;

  void showSnackBar(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<Position> getLocation() async {
    if (await Permission.location.request().isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    } else {
      showSnackBar("Location Permission is Required");
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
      ].request();
      if (statuses[Permission.location] == PermissionStatus.granted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        return position;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(27),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                  //                   userType = "New Cattle Shed";
                  //                 });
                  //               },
                  //             ),
                  //           ),
                  //           const Text("New Cattle Shed",
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
                  //                     userType = "Old Cattle Shed";
                  //                   });
                  //                 },
                  //               )),
                  //           const Text(
                  //             "Old Cattle Shed",
                  //             style: TextStyle(
                  //                 color: ColorResources.black,
                  //                 fontWeight: FontWeight.normal,
                  //                 fontSize: Dimensions.text_13,
                  //                 fontFamily: "Roboto"),
                  //           ),
                  //         ],
                  //       )),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  Text(
                    "Shed Type",
                    style: robotoBold.copyWith(
                        color: const Color(0xff262626), fontSize: 17),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      height: 48,
                      child: DropdownSearch(
                        popupShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        mode: Mode.MENU,
                        popupElevation: 5,
                        dropdownSearchDecoration: const InputDecoration(
                          hintText: "",
                          hintStyle:
                              TextStyle(color: ColorResources.light_purple),
                          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                          border: OutlineInputBorder(),
                        ),
                        // showSearchBox:true,
                        onFind: (String filter) async {
                          return kShedType;
                        },
                        onChanged: (String data) async {
                          belowShedNameController.text = data;
                        },
                        selectedItem: belowShedNameController.text,
                        // itemAsString: (String da) => da,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 3),
                  //   child: SizedBox(
                  //     height: 48.0,
                  //     child: TextFormField(
                  //       controller: belowShedNameController,
                  //       maxLines: 1,
                  //       keyboardType: TextInputType.text,
                  //       autofocus: false,
                  //       decoration: InputDecoration(
                  //           hintText: "",
                  //           enabledBorder: const OutlineInputBorder(
                  //             borderSide: BorderSide(color: Colors.grey),
                  //           ),
                  //           focusedBorder: const OutlineInputBorder(
                  //             borderSide: BorderSide(color: Colors.grey),
                  //           ),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(20),
                  //           ),
                  //           hintStyle: TextStyle(
                  //               fontSize:
                  //                   14 * MediaQuery.of(context).textScaleFactor,
                  //               color: const Color(0xffb7b7b7))),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Shed Name",
                    style: robotoBold.copyWith(
                        color: const Color(0xff262626), fontSize: 17),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: SizedBox(
                      height: 48.0,
                      child: TextFormField(
                        controller: shedNameController,
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
                  const SizedBox(
                    height: 15,
                  ),
                  Visibility(
                    visible: position != null,
                    child: Text(
                      position.toString(),
                      style: robotoBold.copyWith(
                          color: const Color(0xff262626), fontSize: 17),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                      position = await getLocation();
                      setState(() {
                        position = position;
                      });
                    },
                    color: const Color(0xFF6cbd47),
                    child: Text(
                      "Shed Geo Tag",
                      style: robotoBold.copyWith(
                          color: const Color(0xff262626), fontSize: 17),
                    ),
                  )
                ],
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
                              if (belowShedNameController.text.isEmpty) {
                                showSnackBar("Enter below shed name");
                              } else if (shedNameController.text.isEmpty) {
                                showSnackBar("Enter shed name");
                              } else if (position == null) {
                                showSnackBar("Enter geo tag");
                              } else {
                                setState(() {
                                  isLoad = true;
                                });

                                await Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .newCattleShedApi(
                                        userType,
                                        belowShedNameController.text,
                                        shedNameController.text,
                                        position.toString());

                                setState(() {
                                  isLoad = false;
                                  userType = "";
                                  belowShedNameController.clear();
                                  shedNameController.clear();
                                  position = null;
                                });
                              }
                            },
                            child: Text('Save',
                                style: robotoBold.copyWith(
                                    fontSize: 19, color: Colors.white)),
                          ))),
            ],
          ),
        ),
      ),
    );
  }
}
