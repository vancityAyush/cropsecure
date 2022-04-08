import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CropIns extends StatefulWidget {
  String plotId;
  CropIns({this.plotId});
  @override
  State<CropIns> createState() => _CropInsState();
}

class _CropInsState extends State<CropIns> {
  bool isLoad = false;
  String cropTypeSelect = "",
      cropNameSelect = "",
      cropVarieties = "",
      sourceFrom = "",
      showingDate = "",
      mixedCrop = "",
      startingDate = "",
      endingDate = "";
  List<String> gender = ["Male", "Female"];

  List<String> loaner = ["Yes", "No"];

  List<String> insP = ["1.5 %", "2.0 %", "5 %"];
  var formatDate;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String gradeSelect = "", weightSelect = "", selectedTimeSelect = "";

  TextEditingController yearController = TextEditingController();
  String specificTech = "";
  TextEditingController amountController = TextEditingController();

  TextEditingController policyController = TextEditingController();

  void showSnackBar(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<String> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1940),
      lastDate: DateTime(2035),
    );

    selectedDate = picked;
    formatDate = selectedDate.year.toString() +
        "/" +
        selectedDate.month.toString() +
        "/" +
        selectedDate.day.toString();
    return formatDate;
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        initialEntryMode: TimePickerEntryMode.dial);

    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        selectedTimeSelect =
            selectedTime.hour.toString() + ":" + selectedTime.minute.toString();
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
          "Crop Insurance",
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
              Text("Insurance Company Name",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                height: 48,
                child: DropdownSearch(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "Agriculture",
                    hintStyle: TextStyle(color: ColorResources.light_purple),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (String filter) async {
                    return gender;
                  },
                  onChanged: (String data) async {
                    cropTypeSelect = data;
                  },
                  itemAsString: (String da) => da,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Year",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              Padding(
                  padding: const EdgeInsets.only(top: 2),
                  // width: 170,
                  child: TextFormField(
                    maxLength: 4,
                    maxLines: 1,
                    controller: yearController,
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
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                        hintStyle: TextStyle(
                            fontSize:
                                14 * MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7))),
                  )),
              const SizedBox(
                height: 20,
              ),
              Text("Season",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                height: 48,
                child: DropdownSearch(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "Season",
                    hintStyle: TextStyle(color: ColorResources.light_purple),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (String filter) async {
                    return gender;
                  },
                  onChanged: (String data) async {
                    cropVarieties = data;
                  },
                  itemAsString: (String da) => da,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Insurance Amount",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                  height: 48,
                  // width: 170,
                  child: TextFormField(
                    maxLines: 1,
                    controller: amountController,
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
                  )),
              const SizedBox(
                height: 20,
              ),
              Text("Insurance Premium",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                height: 48,
                child: DropdownSearch(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "Select Insurance Premium",
                    hintStyle: TextStyle(color: ColorResources.light_purple),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (String filter) async {
                    return insP;
                  },
                  onChanged: (String data) async {
                    specificTech = data;
                  },
                  itemAsString: (String da) => da,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Loaner",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                height: 48,
                child: DropdownSearch(
                  popupShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  mode: Mode.MENU,
                  popupElevation: 5,
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(color: ColorResources.light_purple),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  // showSearchBox:true,
                  onFind: (String filter) async {
                    return loaner;
                  },
                  onChanged: (String data) async {
                    showingDate = data;
                  },
                  itemAsString: (String da) => da,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Policy No.",
                  style: robotoBold.copyWith(
                      color: const Color(0xff262626), fontSize: 17)),
              SizedBox(
                  height: 48,
                  // width: 170,
                  child: TextFormField(
                    maxLines: 1,
                    controller: policyController,
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
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () async {
                        startingDate = await _selectDate(context);
                      },
                      child: Container(
                        height: 45,
                        color: ColorResources.light_purple,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              formatDate ?? "Starting date",
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
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () async {
                        endingDate = await _selectDate(context);
                      },
                      child: Container(
                        height: 45,
                        color: ColorResources.light_purple,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              endingDate ?? "Expiry date",
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
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (isLoad)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator()),
                  ),
                )
              else
                SizedBox(
                    height: 47.0,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF6cbd47),
                        ), //button color
                      ),
                      onPressed: () async {
                        if (cropTypeSelect == "") {
                          showSnackBar("Select crop type");
                        }
                        // else if (cropNameSelect == "") {
                        //   showSnackBar("Select crop name");
                        // }
                        else if (cropVarieties == "") {
                          showSnackBar("Select crop varieties");
                        }
                        // else if (sourceFrom == "") {
                        //   showSnackBar(
                        //       "Select source from which the seeds was obtained");
                        // }
                        else if (specificTech == "") {
                          showSnackBar("Select specific technology");
                        } else if (showingDate == "") {
                          showSnackBar("Select sowing date");
                        }
                        // else if (mixedCrop == "") {
                        //   showSnackBar("Select mixed crop");
                        // }
                        else {
                          setState(() {
                            isLoad = true;
                          });

                          await Provider.of<AuthProvider>(context,
                                  listen: false)
                              .cropInsurance(
                            plotId: widget.plotId,
                            insuranceName: cropNameSelect,
                            year: yearController.text,
                            season: cropVarieties,
                            amount: amountController.text,
                            premium: specificTech,
                            loaner: showingDate,
                            policyNo: policyController.text,
                            startingDate: startingDate,
                            expiryDate: endingDate,
                          );

                          //
                          // Get.to(() => CropStage(),
                          //     transition: Transition.rightToLeftWithFade,
                          //     duration: const Duration(milliseconds: 600));

                          setState(() {
                            isLoad = false;
                            cropNameSelect = "";
                            yearController.clear();
                            cropVarieties = "";
                            amountController.clear();
                            specificTech = "";
                            showingDate = "";
                            policyController.clear();
                            startingDate = "";
                            endingDate = "";
                          });
                        }
                      },
                      child: Text('Save',
                          style: robotoBold.copyWith(
                              fontSize: 19, color: Colors.white)),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
