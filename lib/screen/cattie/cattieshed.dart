import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/dimensions.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
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
  TextEditingController shedGeoController = TextEditingController();

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message),
        backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(27),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                  userType = "New Cattle Shed";
                                });
                              },
                            ),
                          ),
                          const Text(
                              "New Cattle Shed",
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
                                    userType = "Old Cattle Shed";
                                  });
                                },
                              )),

                          const Text(
                            "Old Cattle Shed",
                            style: TextStyle(
                                color: ColorResources.black,
                                fontWeight: FontWeight.normal,
                                fontSize: Dimensions.text_13,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      )),
                ),

                const SizedBox(
                  height: 15,
                ),

                Text("Below Shed Name",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626),
                      fontSize: 17
                  ),),

                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: SizedBox(
                    height: 48.0,
                    child: TextFormField(
                      controller: belowShedNameController,
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

                const SizedBox(
                  height: 15,
                ),

                Text("Shed Name",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626),
                      fontSize: 17
                  ),),

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
                              fontSize: 14*MediaQuery.of(context).textScaleFactor,
                              color: const Color(0xffb7b7b7)
                          )
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Text("Shed Geo Tag",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626),
                      fontSize: 17
                  ),),

                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: SizedBox(
                    height: 48.0,
                    child: TextFormField(
                      controller: shedGeoController,
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

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: isLoad == true ?
              const Center(
                child: SizedBox(width: 22,height: 22,
                    child: CircularProgressIndicator()),)
                  :SizedBox(
                  height: 47.0,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF6cbd47),), //button color
                    ),
                    onPressed: () async {
                      if(belowShedNameController.text.isEmpty){
                        showSnackBar("Enter below shed name");
                      }else if(shedNameController.text.isEmpty){
                        showSnackBar("Enter shed name");
                      }else if(shedGeoController.text.isEmpty){
                        showSnackBar("Enter geo tag");
                      }else{
                        setState(() {
                          isLoad = true;
                        });

                        await Provider.of<AuthProvider>(context,listen: false).newCattleShedApi(userType, belowShedNameController.text, shedNameController.text, shedGeoController.text);

                        setState(() {
                          isLoad = false;
                        });
                      }
                    },
                    child: Text('Save',
                        style: robotoBold.copyWith(fontSize: 19,color: Colors.white)),
                  ))
            ),
          ],
        ),
      ),
    );
  }
}
