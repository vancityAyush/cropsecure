import 'package:cropsecure/screen/addfarmer/addfarmer.dart';
import 'package:cropsecure/screen/alerts/alerts.dart';
import 'package:cropsecure/screen/cattie/maincattie.dart';
import 'package:cropsecure/screen/equipments/equipments.dart';
import 'package:cropsecure/screen/input/input.dart';
import 'package:cropsecure/screen/irrigation/irrigation.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:cropsecure/utill/sharedprefrence.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Drawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "CROP SECURE",
                    style: robotoExtraBold.copyWith(
                        color: Colors.white, fontSize: 18),
                  )
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              Text(
                "virat@gmail.com",
                style: robotoExtraBold.copyWith(
                    color: const Color(0xffddf0e0), fontSize: 15),
              ),

              Container(
                padding: const EdgeInsets.only(left: 0, right: 0),
                margin: const EdgeInsets.only(top: 20),
                height: 95,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          await SharedPrefManager.savePrefString(
                              AppConstants.mainCattle, "no");
                          Get.to(() => AddFarmer(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 600));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: const Color(0xff92C89C))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Add Farmer",
                                style: robotoExtraBold.copyWith(
                                    color: const Color(0xffddf0e0),
                                    fontSize: 15),
                              ),
                              Image.asset(
                                "assets/image/farmer.png",
                                width: 35,
                                height: 35,
                                color: Colors.white,
                              )
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
                        onTap: () {
                          Get.to(() => Input(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 600));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: const Color(0xff92C89C))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Inputs",
                                style: robotoExtraBold.copyWith(
                                    color: const Color(0xffddf0e0),
                                    fontSize: 15),
                              ),
                              Image.asset(
                                "assets/image/input.png",
                                width: 35,
                                height: 35,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    /*Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xff92C89C))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Weather \nForecast",
                              style: robotoExtraBold.copyWith(
                                  color: const Color(0xffddf0e0),
                                  fontSize: 15
                              ),),

                            Image.asset("assets/image/weather.png",
                              width: 35,height: 35,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),

              // SizedBox(height: 15,),

              Container(
                padding: const EdgeInsets.only(left: 0, right: 0),
                margin: const EdgeInsets.only(top: 20),
                height: 95,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          await SharedPrefManager.savePrefString(
                              AppConstants.mainCattle, "main");
                          Get.to(() => MainCattie(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 600));
                          // Get.to(() => Cattie(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: const Color(0xff92C89C))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Add Cattle",
                                style: robotoExtraBold.copyWith(
                                    color: const Color(0xffddf0e0),
                                    fontSize: 15),
                              ),
                              Image.asset(
                                "assets/image/cows.png",
                                width: 35,
                                height: 35,
                                color: Colors.white,
                              )
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
                        onTap: () {
                          Get.to(() => Equipments(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 600));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: const Color(0xff92C89C))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Equipments",
                                style: robotoExtraBold.copyWith(
                                    color: const Color(0xffddf0e0),
                                    fontSize: 15),
                              ),
                              Image.asset(
                                "assets/image/equipment.png",
                                width: 35,
                                height: 35,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 0, right: 0),
                margin: const EdgeInsets.only(top: 20),
                height: 95,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: const Color(0xff92C89C))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Govt Schemes",
                                style: robotoExtraBold.copyWith(
                                    color: const Color(0xffddf0e0),
                                    fontSize: 15),
                              ),
                              Image.asset(
                                "assets/image/locations.png",
                                width: 35,
                                height: 35,
                                color: Colors.white,
                              )
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
                        onTap: () {
                          Get.to(() => Irrigation(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 600));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: const Color(0xff92C89C))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Irrigation",
                                style: robotoExtraBold.copyWith(
                                    color: const Color(0xffddf0e0),
                                    fontSize: 15),
                              ),
                              Image.asset(
                                "assets/image/irrigation.png",
                                width: 35,
                                height: 35,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Container(
              //   padding: const EdgeInsets.only(left: 0, right: 0),
              //   margin: const EdgeInsets.only(top: 20),
              //   height: 95,
              //   child: Row(
              //     children: [
              //       Expanded(
              //         flex: 1,
              //         child: Container(
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(6),
              //               border: Border.all(color: const Color(0xff92C89C))),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               Text(
              //                 "Govt Schemes",
              //                 style: robotoExtraBold.copyWith(
              //                     color: const Color(0xffddf0e0), fontSize: 15),
              //               ),
              //               Image.asset(
              //                 "assets/image/locations.png",
              //                 width: 35,
              //                 height: 35,
              //                 color: Colors.white,
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 20,
              //       ),
              //       Expanded(
              //         flex: 1,
              //         child: InkWell(
              //           onTap: () {
              //             Get.to(() => Irrigation(),
              //                 transition: Transition.rightToLeftWithFade,
              //                 duration: const Duration(milliseconds: 600));
              //           },
              //           child: Container(
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(6),
              //                 border:
              //                     Border.all(color: const Color(0xff92C89C))),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               children: [
              //                 Text(
              //                   "Success story video",
              //                   textAlign: TextAlign.center,
              //                   style: robotoExtraBold.copyWith(
              //                       color: const Color(0xffddf0e0),
              //                       fontSize: 15),
              //                 ),
              //                 Image.asset(
              //                   "assets/image/irrigation.png",
              //                   width: 35,
              //                   height: 35,
              //                   color: Colors.white,
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // Container(
              //   padding: const EdgeInsets.only(left: 0, right: 0),
              //   margin: const EdgeInsets.only(top: 20),
              //   height: 95,
              //   child: Row(
              //     children: [
              //       Expanded(
              //         flex: 1,
              //         child: Container(
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(6),
              //               border: Border.all(color: const Color(0xff92C89C))),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               Text(
              //                 "Sync Status",
              //                 style: robotoExtraBold.copyWith(
              //                     color: const Color(0xffddf0e0), fontSize: 15),
              //               ),
              //               Image.asset(
              //                 "assets/image/syncstatus.png",
              //                 width: 35,
              //                 height: 35,
              //                 color: Colors.white,
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 20,
              //       ),
              //       Expanded(
              //         flex: 1,
              //         child: InkWell(
              //           onTap: () {
              //             // Get.to(() => RaiseAlertDetail(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
              //             Get.to(() => RaiseAlerts(""),
              //                 transition: Transition.rightToLeftWithFade,
              //                 duration: const Duration(milliseconds: 600));
              //             // Get.to(() => CattieShed(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
              //             // Get.to(() => CattieInfo(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
              //             // Get.to(() => CattieRegister(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
              //           },
              //           child: Container(
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(6),
              //                 border:
              //                     Border.all(color: const Color(0xff92C89C))),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               children: [
              //                 Text(
              //                   "QR Code",
              //                   style: robotoExtraBold.copyWith(
              //                       color: const Color(0xffddf0e0),
              //                       fontSize: 15),
              //                 ),
              //                 Image.asset(
              //                   "assets/image/cows.png",
              //                   width: 35,
              //                   height: 35,
              //                   color: Colors.white,
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              Container(
                padding: const EdgeInsets.only(left: 0, right: 0),
                margin: const EdgeInsets.only(top: 20),
                height: 95,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          // Get.to(() => RaiseAlertDetail(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                          Get.to(() => RaiseAlerts(""),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 600));
                          // Get.to(() => CattieShed(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                          // Get.to(() => CattieInfo(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                          // Get.to(() => CattieRegister(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: const Color(0xff92C89C))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "QR Code",
                                style: robotoExtraBold.copyWith(
                                    color: const Color(0xffddf0e0),
                                    fontSize: 15),
                              ),
                              Image.asset(
                                "assets/image/cows.png",
                                width: 35,
                                height: 35,
                                color: Colors.white,
                              )
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
                          await SharedPrefManager.clearPrefs();
                          // Get.to(() => Others(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: const Color(0xff92C89C))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Logout",
                                  style: robotoExtraBold.copyWith(
                                      color: const Color(0xffddf0e0),
                                      fontSize: 15)),
                              Image.asset("assets/image/logoutl.png",
                                  width: 35, height: 35, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
