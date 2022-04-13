// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpenditure extends StatefulWidget {
  @override
  State<AddExpenditure> createState() => _AddExpenditureState();
}

class _AddExpenditureState extends State<AddExpenditure> {
  TextEditingController amountController = TextEditingController();
  var formatDate;
  DateTime selectedDate = DateTime.now();
  String particularSelect = "Select";
  bool isLoad = false;
  List<String> particular = [
    "Tractor Rent",
    "Labour Wages",
    "Equipments Rent",
    "Input Amount",
    "Harvest Rent",
    "Soil test Amount",
    "Transporatation",
    "Hessian Cloth rent",
    "Bags Amount",
    "Field lease amount",
    "Others"
  ];

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

  void showSnackBar(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Date  :  ",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626), fontSize: 18),
                        ),
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: Container(
                            height: 45,
                            width: 170,
                            color: ColorResources.light_purple,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  formatDate ?? "Select",
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
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Particular Select  :  ",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626), fontSize: 18),
                        ),
                        Container(
                          height: 45,
                          width: 170,
                          color: ColorResources.light_purple,
                          child: DropdownSearch(
                            popupShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            mode: Mode.MENU,
                            popupElevation: 5,
                            dropdownSearchDecoration: const InputDecoration(
                              hintText: "Select",
                              hintStyle: TextStyle(color: ColorResources.white),
                              contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                              border: OutlineInputBorder(),
                            ),
                            // showSearchBox:true,
                            onFind: (String filter) async {
                              return particular;
                            },
                            onChanged: (String data) async {
                              particularSelect = data;
                            },
                            selectedItem: particularSelect,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Amount(INR)  :  ",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626), fontSize: 18),
                        ),
                        SizedBox(
                            height: 48,
                            width: 170,
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
                                      fontSize: 14 *
                                          MediaQuery.of(context)
                                              .textScaleFactor,
                                      color: const Color(0xffb7b7b7))),
                            ))
                      ],
                    ),
                  ],
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
                  ),
                )
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
                        if (formatDate == null) {
                          showSnackBar("Select date");
                        } else if (particularSelect == "Select") {
                          showSnackBar("Select particular select");
                        } else if (amountController.text.isEmpty) {
                          showSnackBar("Enter amount");
                        } else {
                          setState(() {
                            isLoad = true;
                          });

                          await Provider.of<AuthProvider>(context,
                                  listen: false)
                              .addExpenditureApi(formatDate, particularSelect,
                                  amountController.text);

                          setState(() {
                            isLoad = false;
                            particularSelect = "Select";
                            amountController.clear();
                            formatDate = null;
                            selectedDate = DateTime.now();
                          });
                        }
                      },
                      child: Text(
                        'Save',
                        style: robotoBold.copyWith(
                          fontSize: 19,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
