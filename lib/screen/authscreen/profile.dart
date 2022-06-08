import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/color_resources.dart';
import 'package:CropSecure/utill/dimensions.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController mobileController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController subDistrictController = TextEditingController();
  TextEditingController hobaliController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String gramPanchayath;
  bool isLoad = false;

  void fetchProfile() async {
    var future = await Provider.of<AuthProvider>(context, listen: false)
        .fetchProfileApi();
    setState(() {
      nameController.text = future.data.name;
      mobileController.text = future.data.phone;
      districtController.text = future.data.districtName;
      districtController.text = future.data.districtName;
      subDistrictController.text = future.data.subDistrict;
      hobaliController.text = future.data.hobali;
      villageController.text = future.data.villageName;
      passwordController.text = future.data.password;
    });
  }

  List<String> state = ["Uttar Pradesh", "Uttrakhand", "Jharkhand"];

  @override
  void initState() {
    fetchProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Edit Profile",
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

              // const SizedBox(
              //   height: 15,
              // ),
              //
              // Text("Password",
              //   style: robotoBold.copyWith(
              //       color: const Color(0xff262626),
              //       fontSize: 17
              //   ),),
              //
              // Padding(
              //   padding: const EdgeInsets.only(top: 3),
              //   child: SizedBox(
              //     height: 48.0,
              //     child: TextFormField(
              //       controller: passwordController,
              //       maxLines: 1,
              //       keyboardType: TextInputType.text,
              //       autofocus: false,
              //       decoration: InputDecoration(
              //           hintText: "Password",
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
              //               fontSize: 14*MediaQuery.of(context).textScaleFactor,
              //               color: const Color(0xffb7b7b7)
              //           )
              //       ),
              //     ),
              //   ),
              // ),

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

              // if(isLo)

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
                          isLoad = true;
                        });

                        await Provider.of<AuthProvider>(context, listen: false)
                            .editProfileApi(
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
