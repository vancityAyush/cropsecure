import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddLabAnalysis extends StatefulWidget {
  @override
  State<AddLabAnalysis> createState() => _AddLabAnalysisState();
}

class _AddLabAnalysisState extends State<AddLabAnalysis> {
  List<String> particular = ["Uttar Pradesh", "Uttrakhand", "Jharkhand"];
  var formatDate;
  DateTime selectedDate = DateTime.now();
  TextEditingController sampleQuantityController = TextEditingController();
  TextEditingController sealController = TextEditingController();
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

  void showSnackBar(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Sample Date  :  ",
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
                              formatDate ?? "Select date",
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
                      "Sample Quality  :  ",
                      style: robotoMedium.copyWith(
                          color: const Color(0xff262626), fontSize: 18),
                    ),
                    SizedBox(
                        height: 48,
                        width: 170,
                        child: TextFormField(
                          controller: sampleQuantityController,
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
                                  fontSize: 14 *
                                      MediaQuery.of(context).textScaleFactor,
                                  color: const Color(0xffb7b7b7))),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Seal Number  :  ",
                      style: robotoMedium.copyWith(
                          color: const Color(0xff262626), fontSize: 18),
                    ),
                    SizedBox(
                        height: 48,
                        width: 170,
                        child: TextFormField(
                          controller: sealController,
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
                                  fontSize: 14 *
                                      MediaQuery.of(context).textScaleFactor,
                                  color: const Color(0xffb7b7b7))),
                        ))
                  ],
                ),

/*                const SizedBox(height: 28,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Sample Date  :  ",
                      style: robotoMedium.copyWith(
                          color: const Color(0xff262626),
                          fontSize: 18
                      ),),

                    Container(
                      height: 45,
                      width: 170,
                      color: ColorResources.light_purple,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("20/12/21",
                            style: robotoMedium.copyWith(
                                fontSize: 17,
                                color: Colors.white),),

                          Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Image.asset("assets/image/calender.png",
                                color: Colors.white,
                                width: 25,height: 25,)),

                        ],
                      ),
                    )

                  ],
                ),*/
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: isLoad == true
                  ? const Center(
                      child: SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator()))
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
                          if (formatDate == null) {
                            showSnackBar("Select date");
                          } else if (sampleQuantityController.text.isEmpty) {
                            showSnackBar("Enter quantity");
                          } else if (sealController.text.isEmpty) {
                            showSnackBar("Enter seal number");
                          } else {
                            setState(() {
                              isLoad = true;
                            });
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .addLabAnalysisApi(
                              formatDate,
                              sampleQuantityController.text,
                              sealController.text,
                            );

                            setState(() {
                              isLoad = false;
                              formatDate = null;
                              sampleQuantityController.clear();
                              sealController.clear();
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
    );
  }
}
