import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/color_resources.dart';
import 'package:CropSecure/utill/drop_down.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddYields extends StatefulWidget {
  String plotId;
  AddYields({this.plotId});
  @override
  State<AddYields> createState() => _AddYieldsState();
}

class _AddYieldsState extends State<AddYields> {
  List<String> particular = ["Uttar Pradesh", "Uttrakhand", "Jharkhand"];
  String gradeSelect = "", weightSelect = "", selectedTimeSelect = "";
  TextEditingController moistureController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController noOfBagsController = TextEditingController();
  TextEditingController totalWeightController = TextEditingController();
  TextEditingController pricePerKgController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  var formatDate;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isLoad = false;

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

  void showSnackBar(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 100),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: ColorResources.light_purple,
                              child: Text(
                                "1",
                                style: robotoExtraBold.copyWith(
                                    color: Colors.white),
                              ),
                            ),
/*
                            const SizedBox(
                              width: 110,
                              child: DottedLine(
                                direction: Axis.horizontal,
                                lineLength: double.infinity,
                                lineThickness: 1.0,
                                dashLength: 4.0,
                                dashRadius: 0.0,
                                dashGapLength: 4.0,
                                dashGapColor: Colors.transparent,
                                dashGapRadius: 0.0),
                            ),

                            CircleAvatar(
                              radius: 18,
                              backgroundColor: const Color(0xff908f8d),
                              child: Text("2",
                                style: robotoExtraBold.copyWith(
                                    color: Colors.white
                                ),),
                            ),*/
                          ],
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Moisture:",
                                    style: robotoMedium.copyWith(
                                        color: const Color(0xff262626),
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                      height: 48,
                                      child: TextFormField(
                                        controller: moistureController,
                                        maxLines: 1,
                                        keyboardType: TextInputType.number,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                            hintText: "",
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            hintStyle: TextStyle(
                                                fontSize: 14 *
                                                    MediaQuery.of(context)
                                                        .textScaleFactor,
                                                color:
                                                    const Color(0xffb7b7b7))),
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Grade:",
                                    style: robotoMedium.copyWith(
                                        color: const Color(0xff262626),
                                        fontSize: 18),
                                  ),
                                  Container(
                                    height: 45,
                                    color: ColorResources.light_purple,
                                    child: DropdownSearch(
                                      popupShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      mode: Mode.MENU,
                                      popupElevation: 5,
                                      dropdownSearchDecoration:
                                          const InputDecoration(
                                        hintText: "Select",
                                        hintStyle: TextStyle(
                                            color: ColorResources.white),
                                        contentPadding:
                                            EdgeInsets.fromLTRB(12, 12, 0, 0),
                                        border: OutlineInputBorder(),
                                      ),
                                      // showSearchBox:true,
                                      onFind: (String filter) async {
                                        return [
                                          "A - 100 to 90%",
                                          "B - 90 to 80%",
                                          "C - 80 to 70%",
                                          "D - 70 to 50 %"
                                        ];
                                      },
                                      onChanged: (String data) async {
                                        gradeSelect = data;
                                      },
                                      itemAsString: (String da) => da,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () => _selectDate(context),
                                child: Container(
                                  height: 45,
                                  color: ColorResources.light_purple,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        formatDate ?? "Pickup date",
                                        style: robotoMedium.copyWith(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
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
                                onTap: () => _selectTime(context),
                                child: Container(
                                  height: 45,
                                  color: ColorResources.light_purple,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        selectedTimeSelect == ""
                                            ? "Pickup Time"
                                            : selectedTimeSelect,
                                        style: robotoMedium.copyWith(
                                            fontSize: 17, color: Colors.white),
                                      ),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
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

                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 45,
                          color: ColorResources.light_purple,
                          child: DropdownSearch(
                            popupShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            mode: Mode.MENU,
                            popupElevation: 5,
                            dropdownSearchDecoration: const InputDecoration(
                              hintText: "Select weight",
                              hintStyle: TextStyle(color: ColorResources.white),
                              contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                              border: OutlineInputBorder(),
                            ),
                            // showSearchBox:true,
                            onFind: (String filter) async {
                              return kSelectWeight;
                            },
                            onChanged: (String data) async {
                              weightSelect = data;
                            },
                            itemAsString: (String da) => da,
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Enter Weight:",
                                    style: robotoMedium.copyWith(
                                        color: const Color(0xff262626),
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                      height: 48,
                                      child: TextFormField(
                                        controller: weightController,
                                        onChanged: (value) {
                                          int weight = value.isEmpty
                                              ? 0
                                              : int.parse(value);
                                          int noOfBage =
                                              noOfBagsController.text.isEmpty
                                                  ? 0
                                                  : int.parse(
                                                      noOfBagsController.text);
                                          totalWeightController.text =
                                              (weight * noOfBage).toString();
                                          int price = value.isEmpty
                                              ? 0
                                              : int.parse(value);
                                          int totalWeight =
                                              totalWeightController.text.isEmpty
                                                  ? 0
                                                  : int.parse(
                                                      totalWeightController
                                                          .text);
                                          totalAmountController.text =
                                              (price * totalWeight).toString();
                                          setState(() {});
                                        },
                                        maxLines: 1,
                                        keyboardType: TextInputType.number,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                            hintText: "",
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            hintStyle: TextStyle(
                                                fontSize: 14 *
                                                    MediaQuery.of(context)
                                                        .textScaleFactor,
                                                color:
                                                    const Color(0xffb7b7b7))),
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "No of Bags:",
                                    style: robotoMedium.copyWith(
                                        color: const Color(0xff262626),
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                      height: 48,
                                      child: TextFormField(
                                        controller: noOfBagsController,
                                        maxLines: 1,
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          int weight =
                                              weightController.text.isEmpty
                                                  ? 0
                                                  : int.parse(
                                                      weightController.text);
                                          int noOfBage = value.isEmpty
                                              ? 0
                                              : int.parse(value);
                                          totalWeightController.text =
                                              (weight * noOfBage).toString();
                                          int price = value.isEmpty
                                              ? 0
                                              : int.parse(value);
                                          int totalWeight =
                                              totalWeightController.text.isEmpty
                                                  ? 0
                                                  : int.parse(
                                                      totalWeightController
                                                          .text);
                                          totalAmountController.text =
                                              (price * totalWeight).toString();
                                          setState(() {});
                                        },
                                        autofocus: false,
                                        decoration: InputDecoration(
                                            hintText: "",
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            hintStyle: TextStyle(
                                                fontSize: 14 *
                                                    MediaQuery.of(context)
                                                        .textScaleFactor,
                                                color:
                                                    const Color(0xffb7b7b7))),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total weight:",
                                    style: robotoMedium.copyWith(
                                        color: const Color(0xff262626),
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                      height: 48,
                                      child: TextFormField(
                                        enabled: false,
                                        controller: totalWeightController,
                                        maxLines: 1,
                                        keyboardType: TextInputType.number,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                            hintText: "",
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            hintStyle: TextStyle(
                                                fontSize: 14 *
                                                    MediaQuery.of(context)
                                                        .textScaleFactor,
                                                color:
                                                    const Color(0xffb7b7b7))),
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Price/kg(INR)",
                                    style: robotoMedium.copyWith(
                                        color: const Color(0xff262626),
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                      height: 48,
                                      child: TextFormField(
                                        controller: pricePerKgController,
                                        maxLines: 1,
                                        onChanged: (value) {
                                          int price = value.isEmpty
                                              ? 0
                                              : int.parse(value);
                                          int weight = totalWeightController
                                                  .text.isEmpty
                                              ? 0
                                              : int.parse(
                                                  totalWeightController.text);
                                          totalAmountController.text =
                                              (price * weight).toString();
                                          setState(() {});
                                        },
                                        keyboardType: TextInputType.number,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                            hintText: "",
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            hintStyle: TextStyle(
                                                fontSize: 14 *
                                                    MediaQuery.of(context)
                                                        .textScaleFactor,
                                                color:
                                                    const Color(0xffb7b7b7))),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Amount:",
                                    style: robotoMedium.copyWith(
                                        color: const Color(0xff262626),
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                      height: 48,
                                      child: TextFormField(
                                        controller: totalAmountController,
                                        maxLines: 1,
                                        keyboardType: TextInputType.number,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                            hintText: "",
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            hintStyle: TextStyle(
                                                fontSize: 14 *
                                                    MediaQuery.of(context)
                                                        .textScaleFactor,
                                                color:
                                                    const Color(0xffb7b7b7))),
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Expanded(
                              flex: 1,
                              child: Text(""),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        //
                        // Text("+ Add More",
                        // style: robotoExtraBold.copyWith(
                        //   color: ColorResources.light_purple,
                        //   fontSize: 18,
                        //   fontWeight: FontWeight.w700
                        // ),)
                      ],
                    ),

                    /*const SizedBox(height: 30,),

                    Column(
                      children: [

                        Container(height: 45,
                        width: MediaQuery.of(context).size.width,
                        color: ColorResources.light_purple,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text("HARVEST BALANCE SHEET",
                              style: robotoExtraBold.copyWith(
                                  color: Colors.white,
                              fontSize: 18),),
                          ),
                        ),),

                        const SizedBox(height: 20,),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Moisture:",
                              style: robotoMedium.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 18
                              ),),

                            SizedBox(
                                height: 48,
                                child: TextFormField(
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
                                          fontSize: 14*MediaQuery.of(context).textScaleFactor,
                                          color: const Color(0xffb7b7b7)
                                      )
                                  ),
                                )
                            )
                          ],
                        ),

                        const SizedBox(height: 20,),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Final harvest for session completed:",
                              style: robotoMedium.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 18
                              ),),

                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 45,
                              color: ColorResources.light_purple,
                              child: DropdownSearch(
                                popupShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                mode: Mode.MENU,
                                popupElevation: 5,
                                dropdownSearchDecoration: const InputDecoration(
                                  hintText: "Select weight",
                                  hintStyle: TextStyle(
                                      color: ColorResources.white),
                                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                                  border: OutlineInputBorder(),
                                ),
                                // showSearchBox:true,
                                onFind: (String filter) async{
                                  return particular;},
                                onChanged: (String data) async{

                                },
                                itemAsString: (String da) => da,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: isLoad == true
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ))
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
                          if (moistureController.text.isEmpty) {
                            showSnackBar("Enter moisture");
                          } else if (gradeSelect == "") {
                            showSnackBar("Select grade");
                          } else if (formatDate == null) {
                            showSnackBar("Select date");
                          } else if (selectedTimeSelect == "null") {
                            showSnackBar("Select time");
                          } else if (weightSelect == "") {
                            showSnackBar("Select weight");
                          } else if (weightController.text.isEmpty) {
                            showSnackBar("Enter weight");
                          } else if (noOfBagsController.text.isEmpty) {
                            showSnackBar("Enter no of bags");
                          } else if (totalWeightController.text.isEmpty) {
                            showSnackBar("Enter total weight");
                          } else if (pricePerKgController.text.isEmpty) {
                            showSnackBar("Enter price/kg");
                          } else if (totalAmountController.text.isEmpty) {
                            showSnackBar("Enter total amount");
                          } else {
                            setState(() {
                              isLoad = true;
                            });
                            // Get.offAll(() => Dashboard(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .addYieldApi(
                                    widget.plotId,
                                    moistureController.text,
                                    gradeSelect,
                                    formatDate,
                                    selectedTimeSelect,
                                    weightSelect,
                                    weightController.text,
                                    noOfBagsController.text,
                                    totalWeightController.text,
                                    pricePerKgController.text,
                                    totalAmountController.text);

                            setState(() {
                              isLoad = false;

                              gradeSelect = "";
                              weightSelect = "";
                              selectedTimeSelect = "";
                              moistureController.clear();
                              weightController.clear();
                              noOfBagsController.clear();
                              totalWeightController.clear();
                              pricePerKgController.clear();
                              totalAmountController.clear();
                              formatDate = null;
                              selectedDate = DateTime.now();
                              selectedTime = TimeOfDay.now();
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
    );
  }
}
