import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReport extends StatefulWidget {
  final String id;
  AddReport(this.id);

  @override
  State<AddReport> createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {
  List<String> particular = ["Uttar Pradesh", "Uttrakhand", "Jharkhand"];
  TextEditingController soilPhController = TextEditingController();
  TextEditingController soilNameController = TextEditingController();
  TextEditingController organicController = TextEditingController();
  TextEditingController nitrogenController = TextEditingController();
  TextEditingController phosphorousController = TextEditingController();
  TextEditingController potasiumController = TextEditingController();
  TextEditingController sulphurController = TextEditingController();
  TextEditingController zincController = TextEditingController();
  TextEditingController boronController = TextEditingController();
  TextEditingController ironController = TextEditingController();
  TextEditingController magneseController = TextEditingController();
  TextEditingController copperController = TextEditingController();
  bool isLoad = false;

  void showSnackBar(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Soil PH  :  ",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626), fontSize: 18),
              ),
              SizedBox(
                  height: 48,
                  width: 170,
                  child: TextFormField(
                    controller: soilPhController,
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
                "Ec  :  ",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626), fontSize: 18),
              ),
              SizedBox(
                  height: 48,
                  width: 170,
                  child: TextFormField(
                    maxLines: 1,
                    controller: soilNameController,
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
                "Organic Carbon :  ",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626), fontSize: 18),
              ),
              SizedBox(
                  height: 48,
                  width: 170,
                  child: TextFormField(
                    controller: organicController,
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
                "Nitrogen  :  ",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626), fontSize: 18),
              ),
              SizedBox(
                  height: 48,
                  width: 170,
                  child: TextFormField(
                    controller: nitrogenController,
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
                "Phosphorous  :  ",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626), fontSize: 18),
              ),
              SizedBox(
                  height: 48,
                  width: 170,
                  child: TextFormField(
                    controller: phosphorousController,
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
                "Potasium  :  ",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626), fontSize: 18),
              ),
              SizedBox(
                  height: 48,
                  width: 170,
                  child: TextFormField(
                    controller: potasiumController,
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
                "Sulphur  :  ",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626), fontSize: 18),
              ),
              SizedBox(
                  height: 48,
                  width: 170,
                  child: TextFormField(
                    controller: sulphurController,
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
                "Zinc  :  ",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626), fontSize: 18),
              ),
              SizedBox(
                  height: 48,
                  width: 170,
                  child: TextFormField(
                    controller: zincController,
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
                "Boron  :  ",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626), fontSize: 18),
              ),
              SizedBox(
                  height: 48,
                  width: 170,
                  child: TextFormField(
                    controller: boronController,
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
                "Iron  :  ",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626), fontSize: 18),
              ),
              SizedBox(
                  height: 48,
                  width: 170,
                  child: TextFormField(
                    controller: ironController,
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
                "Magnese  :  ",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626), fontSize: 18),
              ),
              SizedBox(
                  height: 48,
                  width: 170,
                  child: TextFormField(
                    controller: magneseController,
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
                "Copper  :  ",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626), fontSize: 18),
              ),
              SizedBox(
                  height: 48,
                  width: 170,
                  child: TextFormField(
                    controller: copperController,
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
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: isLoad == true
                ? const Center(
                    child: SizedBox(
                        width: 23,
                        height: 23,
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
                        if (soilPhController.text.isEmpty) {
                          showSnackBar("Enter soil ph");
                        } else if (soilNameController.text.isEmpty) {
                          showSnackBar("Enter soil name");
                        } else if (organicController.text.isEmpty) {
                          showSnackBar("Enter organic");
                        } else if (nitrogenController.text.isEmpty) {
                          showSnackBar("Enter nitrogen");
                        } else if (phosphorousController.text.isEmpty) {
                          showSnackBar("Enter phosphorous");
                        } else if (potasiumController.text.isEmpty) {
                          showSnackBar("Enter potasium");
                        } else if (sulphurController.text.isEmpty) {
                          showSnackBar("Enter sulphur");
                        } else if (zincController.text.isEmpty) {
                          showSnackBar("Enter zinc");
                        } else if (boronController.text.isEmpty) {
                          showSnackBar("Enter boron");
                        } else if (ironController.text.isEmpty) {
                          showSnackBar("Enter iron");
                        } else if (magneseController.text.isEmpty) {
                          showSnackBar("Enter magnese");
                        } else if (copperController.text.isEmpty) {
                          showSnackBar("Enter copper");
                        } else {
                          setState(() {
                            isLoad = true;
                          });

                          await Provider.of<AuthProvider>(context,
                                  listen: false)
                              .addSoilInformationReportApi(
                                  widget.id,
                                  soilPhController.text,
                                  soilNameController.text,
                                  organicController.text,
                                  nitrogenController.text,
                                  phosphorousController.text,
                                  potasiumController.text,
                                  sulphurController.text,
                                  zincController.text,
                                  boronController.text,
                                  ironController.text,
                                  magneseController.text,
                                  copperController.text);

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
    );
  }
}
