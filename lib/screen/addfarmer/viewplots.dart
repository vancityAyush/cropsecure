import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/screen/addfarmer/geo_tag.dart';
import 'package:cropsecure/screen/addfarmer/plandoctor.dart';
import 'package:cropsecure/screen/alerts/alerts.dart';
import 'package:cropsecure/screen/calculator/calculator.dart';
import 'package:cropsecure/screen/cce/cce.dart';
import 'package:cropsecure/screen/cropins.dart';
import 'package:cropsecure/screen/fieldvisit/addfieldvisit.dart';
import 'package:cropsecure/screen/fieldvisit/cropstage.dart';
import 'package:cropsecure/screen/labanalysis/labanalysis.dart';
import 'package:cropsecure/screen/soil/soil.dart';
import 'package:cropsecure/screen/yields/yieldscreen.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/sharedprefrence.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../expenditure/expenditure.dart';

class ViewPlots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "View Plots",
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
      body: FutureBuilder(
          future: Provider.of<AuthProvider>(context).fetchPlotsApi(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshots.hasError) {
              return Text("${snapshots.error}");
            } else {
              if (snapshots.data['error_code'].toString() == "0") {
                return Center(
                  child: Text(
                    "No plots available",
                    style: TextStyle(
                        fontFamily: "Proxima Nova",
                        fontWeight: FontWeight.w600,
                        fontSize: 20 * MediaQuery.of(context).textScaleFactor),
                  ),
                );
              } else {
                if (snapshots.hasData) {
                  return ListView.builder(
                      itemCount: snapshots.data['data'].length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xff92C89C)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 37,
                                    backgroundImage: NetworkImage(
                                      AppConstants.Image +
                                          "/" +
                                          snapshots.data['data'][index]
                                                  ['farmer_plot']
                                              .toString(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 19.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshots.data['data'][index]
                                                    ['survey_no']
                                                .toString(),
                                            style: robotoBold.copyWith(
                                                color: const Color(0xff262626),
                                                fontSize: 16),
                                          ),
                                          Text(
                                            snapshots.data['data'][index]
                                                    ['area']
                                                .toString(),
                                            style: robotoMedium.copyWith(
                                                color: const Color(0xffb8b8b8),
                                                fontSize: 15),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4.0),
                                            child: Text(
                                              snapshots.data['data'][index]
                                                      ['category']
                                                  .toString(),
                                              style: robotoMedium.copyWith(
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xff262626)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.add_location),
                                            Text(
                                              "Address",
                                              style: robotoMedium.copyWith(
                                                  color:
                                                      const Color(0xffa5a5a5),
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Latitude: " +
                                              snapshots.data['data'][index]
                                                      ['latitude']
                                                  .toString(),
                                          style: robotoMedium.copyWith(
                                              color: const Color(0xffa5a5a5),
                                              fontSize: 12),
                                        ),
                                        Text(
                                          "Longitude: " +
                                              snapshots.data['data'][index]
                                                      ['longitude']
                                                  .toString(),
                                          style: robotoMedium.copyWith(
                                              color: const Color(0xffa5a5a5),
                                              fontSize: 12),
                                        ),
                                        Text(
                                          snapshots.data['data'][index]
                                                  ['district'] +
                                              " " +
                                              snapshots.data['data'][index]
                                                      ['taluka']
                                                  .toString() +
                                              " " +
                                              snapshots.data['data'][index]
                                                      ['gram_panchayath']
                                                  .toString() +
                                              " " +
                                              snapshots.data['data'][index]
                                                      ['village']
                                                  .toString(),
                                          style: robotoRegular.copyWith(
                                              color: const Color(0xff262626),
                                              fontSize: 11),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 28.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () async {
                                          await SharedPrefManager
                                              .savePrefString(
                                                  AppConstants.plotId,
                                                  snapshots.data['data'][index]
                                                          ['id']
                                                      .toString());
                                          Get.to(() => Soil(),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: const Duration(
                                                  milliseconds: 600));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/image/irrigation.png",
                                                width: 28,
                                                height: 28),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Soil Info",
                                              style: robotoBold.copyWith(
                                                  color: ColorResources
                                                      .light_purple,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () async {
                                          await SharedPrefManager
                                              .savePrefString(
                                                  AppConstants.plotId,
                                                  snapshots.data['data'][index]
                                                          ['id']
                                                      .toString());
                                          Get.to(() => Expenditure(),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: const Duration(
                                                  milliseconds: 600));
                                          // Get.to(() => AddFieldVisit(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                                "assets/image/visitor.png",
                                                width: 28,
                                                height: 28),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Expenditure",
                                              style: robotoBold.copyWith(
                                                  color: ColorResources
                                                      .light_purple,
                                                  fontSize: 13),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () async {
                                          await SharedPrefManager
                                              .savePrefString(
                                                  AppConstants.plotId,
                                                  snapshots.data['data'][index]
                                                          ['id']
                                                      .toString());
                                          var future =
                                              await Provider.of<AuthProvider>(
                                                      context,
                                                      listen: false)
                                                  .fetchFieldVisitApi();
                                          if (future['error_code'].toString() ==
                                              "0") {
                                            // Get.to(() => CropStage(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                                            Get.to(() => AddFieldVisit(),
                                                transition: Transition
                                                    .rightToLeftWithFade,
                                                duration: const Duration(
                                                    milliseconds: 600));
                                          } else {
                                            for (int i = 0;
                                                i < future['data'].length;
                                                i++) {
                                              if (future['data'].length - 1 ==
                                                  i) {
                                                await SharedPrefManager
                                                    .savePrefString(
                                                        AppConstants.fvId,
                                                        snapshots.data['data']
                                                                [index]['id']
                                                            .toString());
                                                // print("iddd"+future['data'][i]['id'].toString());
                                              }
                                            }
                                            Get.to(() => CropStage(),
                                                transition: Transition
                                                    .rightToLeftWithFade,
                                                duration: const Duration(
                                                    milliseconds: 600));
                                          }
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/image/farmer.png",
                                                width: 28,
                                                height: 28),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Field Visit",
                                              style: robotoBold.copyWith(
                                                  color: ColorResources
                                                      .light_purple,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () async {
                                          // await SharedPrefManager.savePrefString(AppConstants.plotId, snapshots.data['data'][index]['id'].toString());
                                          Get.to(
                                              () => PlantDoctor(
                                                  id: snapshots.data['data']
                                                      [index]['id']),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: const Duration(
                                                  milliseconds: 600));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/image/plantdoctor.png",
                                                width: 28,
                                                height: 28),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Plant Doctor",
                                              style: robotoBold.copyWith(
                                                  color: ColorResources
                                                      .light_purple,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 28.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () async {
                                          // await SharedPrefManager.savePrefString(AppConstants.plotId, snapshots.data['data'][index]['id'].toString());
                                          Get.to(
                                              () => RaiseAlerts(snapshots
                                                  .data['data'][index]['id']),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: const Duration(
                                                  milliseconds: 600));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/image/alert.png",
                                                width: 28,
                                                height: 28),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Alert & Advisor",
                                              style: robotoBold.copyWith(
                                                  color: ColorResources
                                                      .light_purple,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(
                                              () => CropIns(
                                                  plotId: snapshots.data['data']
                                                          [index]['id']
                                                      .toString()),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: const Duration(
                                                  milliseconds: 600));
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                                "assets/image/sprout.png",
                                                width: 28,
                                                height: 28),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Crop Ins",
                                              style: robotoBold.copyWith(
                                                  color: ColorResources
                                                      .light_purple,
                                                  fontSize: 13),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(
                                              () => Geotag(snapshots
                                                  .data['data'][index]),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: const Duration(
                                                  milliseconds: 600));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/image/location.png",
                                                width: 28,
                                                height: 28),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Geo Tag",
                                              style: robotoBold.copyWith(
                                                  color: ColorResources
                                                      .light_purple,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(
                                              () => Calculator(snapshots
                                                  .data['data'][index]['id']),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: const Duration(
                                                  milliseconds: 600));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/image/calculator.png",
                                                width: 28,
                                                height: 28),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Calculator",
                                              style: robotoBold.copyWith(
                                                  color: ColorResources
                                                      .light_purple,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 28.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () async {
                                          // await SharedPrefManager.savePrefString(AppConstants.plotId, snapshots.data['data'][index]['id'].toString());
                                          Get.to(() => Cce(),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: const Duration(
                                                  milliseconds: 600));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/image/expense.png",
                                                width: 28,
                                                height: 28),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "CCE",
                                              style: robotoBold.copyWith(
                                                  color: ColorResources
                                                      .light_purple,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(() => YieldScreen(),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: const Duration(
                                                  milliseconds: 600));
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                                "assets/image/yields.png",
                                                width: 28,
                                                height: 28),

                                            const SizedBox(
                                              height: 7,
                                            ),

                                            // Text("Field Visit",
                                            Text(
                                              "Yield Register",
                                              style: robotoBold.copyWith(
                                                  color: ColorResources
                                                      .light_purple,
                                                  fontSize: 13),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(() => LabAnalysis(),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: const Duration(
                                                  milliseconds: 600));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/image/chemistry.png",
                                                width: 28,
                                                height: 28),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Lab Analysis",
                                              // Text("CCE",
                                              style: robotoBold.copyWith(
                                                  color: ColorResources
                                                      .light_purple,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(() => YieldScreen(),
                                              transition: Transition
                                                  .rightToLeftWithFade,
                                              duration: const Duration(
                                                  milliseconds: 600));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/image/feedback.png",
                                                width: 28,
                                                height: 28),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "Feed Talk Form",
                                              // Text("Yields Register",
                                              style: robotoBold.copyWith(
                                                  color: ColorResources
                                                      .light_purple,
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: Text(
                      "No plots available",
                      style: TextStyle(
                          fontFamily: "Proxima Nova",
                          fontWeight: FontWeight.w600,
                          fontSize:
                              20 * MediaQuery.of(context).textScaleFactor),
                    ),
                  );
                }
              }
            }
          }),
    );
  }
}
