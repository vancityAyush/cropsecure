import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/color_resources.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController subDistrictController = TextEditingController();
  TextEditingController hobaliController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String gramPanchayath = "";
  bool isLoad = false;

  List<String> state = ["Uttar Pradesh", "Uttrakhand", "Jharkhand"];

  void showSnackBar(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Sign Up",
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
          padding: const EdgeInsets.all(27.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: nameController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Name",
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
                "Mobile",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: mobileController,
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Mobile Number",
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
                "Password",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: passwordController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Password",
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
                "State Name",
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
                      return state;
                    },
                    onChanged: (String data) async {
                      gramPanchayath = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "District Name",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: districtController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "District name",
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
                "Sub District",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: subDistrictController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Other sub district",
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
                "Hobali",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: hobaliController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Hobali",
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
                "Grama Panchayath",
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
                    showSearchBox: true,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Select",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async {
                      return state;
                    },
                    onChanged: (String data) async {
                      gramPanchayath = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Village Name",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626), fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: villageController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "village name",
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
              if (isLoad)
                const Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator()),
                ))
              else
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
                          if (nameController.text.isEmpty) {
                            showSnackBar("Enter name");
                          } else if (mobileController.text.isEmpty) {
                            showSnackBar("Enter mobile number");
                          } else if (passwordController.text.isEmpty) {
                            showSnackBar("Enter password");
                          } else if (gramPanchayath == "") {
                            showSnackBar("Select state");
                          } else if (districtController.text.isEmpty) {
                            showSnackBar("Enter district");
                          } else if (subDistrictController.text.isEmpty) {
                            showSnackBar("Enter sub district");
                          } else if (hobaliController.text.isEmpty) {
                            showSnackBar("Enter hobali");
                          } else if (villageController.text.isEmpty) {
                            showSnackBar("Enter village");
                          } else {
                            setState(() {
                              isLoad = true;
                            });

                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .registration(
                                    nameController.text,
                                    mobileController.text,
                                    villageController.text,
                                    gramPanchayath,
                                    hobaliController.text,
                                    subDistrictController.text,
                                    districtController.text,
                                    gramPanchayath,
                                    passwordController.text);

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
      ),
    );
  }
}
