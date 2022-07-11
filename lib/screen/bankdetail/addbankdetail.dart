import 'dart:io';

import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/color_resources.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddBankDetail extends StatefulWidget {
  final String id;
  AddBankDetail({this.id});

  @override
  State<AddBankDetail> createState() => _AddBankDetailState();
}

class _AddBankDetailState extends State<AddBankDetail> {
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  bool isLoad = false;
  List<String> state = ["Savings", "Joint", "Current"];
  String accounttype = "";
  File newFile;
  File _image;

  void showSnackBar(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future getImagefromcamera() async {
    dynamic image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = newFile = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Bank Details",
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
          padding: const EdgeInsets.all(27),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account Type",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),

                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    showSearchBox: true,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Select Account Type",
                      hintStyle: TextStyle(color: ColorResources.light_purple),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async {
                      return state;
                    },
                    onChanged: (String data) async {
                      accounttype = data;
                    },
                    itemAsString: (String da) => da,
                  ),

                  //   TextFormField(
                  //     maxLines: 1,
                  //     keyboardType: TextInputType.text,
                  //     autofocus: false,
                  //     decoration: InputDecoration(
                  //         hintText: "",
                  //         enabledBorder: const OutlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.grey),
                  //         ),
                  //         focusedBorder: const OutlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.grey),
                  //         ),
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //         hintStyle: TextStyle(
                  //             fontSize: 14*MediaQuery.of(context).textScaleFactor,
                  //             color: const Color(0xffb7b7b7)
                  //         )
                  //     ),
                  //   ),
                  // ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Account Name",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: SizedBox(
                    height: 48.0,
                    child: TextFormField(
                      controller: accountNameController,
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
                Text(
                  "Account Number",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: SizedBox(
                    height: 48.0,
                    child: TextFormField(
                      controller: accountNumberController,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
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
                Text(
                  "IFSC CODE",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: SizedBox(
                    height: 48.0,
                    child: TextFormField(
                      controller: ifscCodeController,
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
                Text(
                  "Bank Name",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: SizedBox(
                    height: 48.0,
                    child: DropdownSearch(
                      popupShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      mode: Mode.MENU,
                      popupElevation: 5,
                      showSearchBox: true,
                      dropdownSearchDecoration: const InputDecoration(
                        hintText: "Select Account Type",
                        hintStyle:
                            TextStyle(color: ColorResources.light_purple),
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                        border: OutlineInputBorder(),
                      ),
                      // showSearchBox:true,
                      onFind: (String filter) async {
                        return [
                          "Bank of India",
                          "Bank of Maharashtra",
                          "Canara Bank",
                          "Central Bank of India",
                          "Indian Bank",
                          "Indian Overseas Bank",
                          "Punjab and Sind Bank",
                          "Punjab National Bank",
                          "State Bank of India",
                          "UCO Bank",
                          "Union Bank of India",
                          "Axis Bank",
                          "Bandhan Bank",
                          "CSB Bank",
                          "City Union Bank",
                          "DCB Bank",
                          "Dhanlaxmi Bank",
                          "Federal Bank",
                          "HDFC Bank",
                          "ICICI Bank",
                          "IDBI Bank",
                          "IDFC First Bank",
                          "IndusInd Bank",
                          "Jammu & Kashmir Bank",
                          "Karnataka Bank",
                          "Karur Vysya Bank",
                          "Kotak Mahindra Bank",
                          "Nainital Bank",
                          "RBL Bank",
                          "South Indian Bank",
                          "Tamilnad Mercantile Bank",
                          "Yes Bank",
                          "Andhra Pradesh Grameena Vikas Bank",
                          "Andhra Pragathi Grameena Bank",
                          "Chaitanya Godavari Gramin Bank",
                          "Saptagiri Gramin Bank",
                          "Arunachal Pradesh Rural Bank",
                          "Assam Gramin Vikash Bank",
                          "Dakshin Bihar Gramin Bank",
                          "Uttar Bihar Gramin Bank",
                          "Chhattisgarh Rajya Gramin Bank",
                          "Baroda Gujarat Gramin Bank",
                          "Saurashtra Gramin Bank",
                          "Sarva Haryana Gramin Bank",
                          "Himachal Pradesh Gramin Bank",
                          "Ellaquai Dehati Bank",
                          "Jammu And Kashmir Grameen Bank",
                          "Jharkhand Rajya Gramin Bank",
                          "Karnataka Gramin Bank",
                          "Karnataka Vikas Grameena Bank",
                          "Kerala Gramin Bank",
                          "Madhya Pradesh Gramin Bank",
                          "Madhyanchal Gramin Bank",
                          "Maharashtra Gramin Bank",
                          "Vidarbha Konkan Gramin Bank",
                          "Manipur Rural Bank",
                          "Meghalaya Rural Bank",
                          "Mizoram Rural Bank",
                          "Nagaland Rural Bank",
                          "Odisha Gramya Bank",
                          "Utkal Grameen Bank",
                          "Puduvai Bharathiar Grama Bank",
                          "Punjab Gramin Bank",
                          "Rajasthan Marudhara Gramin Bank",
                          "Baroda Rajasthan Kshetriya Gramin Bank",
                          "Tamil Nadu Grama Bank",
                          "Telangana Grameena Bank",
                          "Tripura Gramin Bank",
                          "Aryavart Bank",
                          "Baroda UP Bank",
                          "Prathama UP Gramin Bank",
                          "Uttarakhand Gramin Bank",
                          "Bangiya Gramin Vikash Bank",
                          "Paschim Banga Gramin Bank",
                          "Uttarbanga Kshetriya Gramin Bank"
                        ];
                      },
                      onChanged: (String data) async {
                        accounttype = data;
                      },
                      itemAsString: (String da) => da,
                    ),
                    //   TextFormField(
                    //     controller: bankNameController,
                    //     maxLines: 1,
                    //     keyboardType: TextInputType.text,
                    //     autofocus: false,
                    //     decoration: InputDecoration(
                    //         hintText: "",
                    //         enabledBorder: const OutlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.grey),
                    //         ),
                    //         focusedBorder: const OutlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.grey),
                    //         ),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(20),
                    //         ),
                    //         hintStyle: TextStyle(
                    //             fontSize:
                    //                 14 * MediaQuery.of(context).textScaleFactor,
                    //             color: const Color(0xffb7b7b7))),
                    //   ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Branch",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: SizedBox(
                    height: 48.0,
                    child: TextFormField(
                      controller: branchController,
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
                  height: 20,
                ),
                Text(
                  "Upload Passbook",
                  style: robotoMedium.copyWith(
                      color: const Color(0xff262626), fontSize: 17),
                ),
                const SizedBox(
                  height: 10,
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
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    "Passbook Upload",
                                    style: robotoMedium.copyWith(
                                        color: const Color(0xff262626),
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //     margin: const EdgeInsets.only(right: 4, bottom: 3),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(13),
                            //         color: const Color(0xffb7b7b7)),
                            //     child: const Padding(
                            //       padding: EdgeInsets.all(5.0),
                            //       child: Icon(
                            //         Icons.image_outlined,
                            //         size: 25,
                            //       ),
                            //     )),
                            InkWell(
                              onTap: () => getImagefromcamera(),
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 4, bottom: 3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 45, 25, 30),
                                  child: Image.file(
                                    _image,
                                    fit: BoxFit.contain,
                                  ),
                                ))
                      ],
                    ),
                  ),
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
                              if (accountNameController.text.isEmpty) {
                                showSnackBar("Enter account holder name");
                              } else if (accountNumberController.text.isEmpty) {
                                showSnackBar("Enter account number");
                              } else if (ifscCodeController.text.isEmpty) {
                                showSnackBar("Enter ifsc code");
                              }
                              // } else if (bankNameController.text.isEmpty) {
                              //   showSnackBar("Enter bank name");
                              // }
                              else if (branchController.text.isEmpty) {
                                showSnackBar("Enter branch name");
                              } else {
                                setState(() {
                                  isLoad = true;
                                });
                                // Get.to(() => AddFarmerSuccessfull(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                                await Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .addBankDetailsApi(
                                        accounttype,
                                        ifscCodeController.text,
                                        accountNumberController.text,
                                        accountNameController.text,
                                        branchController.text,
                                        widget.id,
                                        _image);

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
      ),
    );
  }
}
