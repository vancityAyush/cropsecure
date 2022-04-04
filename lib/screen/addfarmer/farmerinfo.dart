// ignore_for_file: avoid_print, unused_field

import 'package:cropsecure/data/model/response/responsefamer.dart';
import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/screen/addfarmer/farmerdetail.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/dimensions.dart';
import 'package:cropsecure/utill/sharedprefrence.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FarmerInfo extends StatefulWidget {
  const FarmerInfo({Key key}) : super(key: key);

  // void _launchURL(String url) async =>
  //     await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  @override
  State<FarmerInfo> createState() => _FarmerInfoState();
}

class _FarmerInfoState extends State<FarmerInfo> {
  Future<void> _launched;

  List<Data> responses = [];
  List filteredData = [];
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void filterData(String value) {
    setState(() {
      filteredData = responses
          .where((data) =>
              (data.name.toLowerCase().contains(value.toLowerCase())) &&
              data.type == farmerType.F)
          .toList();
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var future =
          Provider.of<AuthProvider>(context, listen: false).fetchFarmerApi();
      future.then((value) {
        setState(() {
          filteredData = responses = value.data;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ResponseFarmer>(
        future: Provider.of<AuthProvider>(context).fetchFarmerApi(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
          if (snapshots.connectionState == ConnectionState.none) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshots.hasError) {
            return Text("${snapshots.error}");
          } else if (snapshots.hasData) {
            ResponseFarmer responseFarmer = snapshots.data;
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                      color: ColorResources.white,
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 6),
                            color: Colors.black12),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          flex: 0,
                          child: Icon(
                            Icons.search,
                            size: 25,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          onChanged: (value) {
                            filterData(value);
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Farmer",
                            hintStyle: TextStyle(
                                color: ColorResources.grey_text_bold,
                                fontWeight: FontWeight.w500,
                                fontSize: Dimensions.text_15,
                                fontFamily: "Roboto"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/image/farmer.png",
                            width: 13,
                            height: 13,
                          ),
                          Text(
                            responseFarmer.data == null
                                ? ""
                                : responseFarmer.data.length.toString(),
                            style: robotoBold.copyWith(
                                color: ColorResources.light_purple),
                          ),
                          Text(
                            "  Farmer",
                            style: robotoBold.copyWith(
                                fontSize: 12, color: const Color(0xff767876)),
                          )
                        ],
                      ),

                      // const Icon(Icons.search)
                    ],
                  ),
                ),
                responseFarmer.data == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/image/emptyimage.png",
                            width: 70,
                            height: 70,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "No Farmer available yet now",
                            textAlign: TextAlign.center,
                            style: robotoMedium.copyWith(
                                color: ColorResources.black, fontSize: 17),
                          )
                        ],
                      )
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: filteredData.length,
                            itemBuilder: (context, index) {
                              return Visibility(
                                visible: responseFarmer.data[index].type ==
                                    farmerType.F,
                                child: InkWell(
                                  onTap: () async {
                                    await SharedPrefManager.savePrefString(
                                        AppConstants.farmerId,
                                        responseFarmer.data[index].id);
                                    await SharedPrefManager.savePrefString(
                                        AppConstants.farmerImage,
                                        responseFarmer.data[index].image);
                                    await SharedPrefManager.savePrefString(
                                        AppConstants.farmerName,
                                        responseFarmer.data[index].name);
                                    await SharedPrefManager.savePrefString(
                                        AppConstants.genderFarmer,
                                        responseFarmer.data[index].gender);
                                    await SharedPrefManager.savePrefString(
                                        AppConstants.dobFarmer,
                                        responseFarmer.data[index].dob);
                                    await SharedPrefManager.savePrefString(
                                        AppConstants.age,
                                        responseFarmer.data[index].age);
                                    await SharedPrefManager.savePrefString(
                                        AppConstants.plotcount,
                                        responseFarmer.data1[0].count);
                                    await SharedPrefManager.savePrefString(
                                            AppConstants.aadhaarNo,
                                            responseFarmer
                                                .data[index].aadhaarNo) ??
                                        "Not available";

                                    await SharedPrefManager.savePrefString(
                                        AppConstants.addressFarmer,
                                        responseFarmer.data[index].villageName +
                                            " " +
                                            responseFarmer.data[index].taluka +
                                            " " +
                                            responseFarmer
                                                .data[index].districtName +
                                            " " +
                                            responseFarmer.data[index].state);
                                    print(responseFarmer.data[index].aadhaarNo);
                                    Get.to(
                                        () => FarmerDetails(
                                              id: responseFarmer.data[index].id,
                                              plot:
                                                  responseFarmer.data1[0].count,
                                              area:
                                                  responseFarmer.data2[0].area,
                                            ),
                                        transition:
                                            Transition.rightToLeftWithFade,
                                        duration:
                                            const Duration(milliseconds: 600));
                                    // Fluttertoast.showToast(
                                    //     msg: AppConstants.
                                    //         far.toString(), // message
                                    //     toastLength: Toast.LENGTH_SHORT, // length
                                    //     gravity: ToastGravity.CENTER, // location
                                    //     timeInSecForIosWeb: 3 // duration
                                    //     );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(15),
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: const Color(0xff92C89C)),
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            radius: 40,
                                            backgroundImage: NetworkImage(
                                                AppConstants.Image +
                                                    responseFarmer
                                                        .data[index].image)),
                                        Expanded(
                                            child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 19.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${filteredData[index].name},${responseFarmer.data[index].age}",
                                                style: robotoBold.copyWith(
                                                    color:
                                                        const Color(0xff262626),
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                "${responseFarmer.data[index].districtName},${responseFarmer.data[index].state},"
                                                "${responseFarmer.data[index].pincode}",
                                                style: robotoRegular.copyWith(
                                                    color:
                                                        const Color(0xffb8b8b8),
                                                    fontSize: 10),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // Container(
                                                    //   width: 70,
                                                    //   height: 19,
                                                    //   decoration: BoxDecoration(
                                                    //       color: const Color(
                                                    //           0xffc8f6c8),
                                                    //       borderRadius:
                                                    //           BorderRadius
                                                    //               .circular(10)),
                                                    //   // child: Center(
                                                    //   //   child: Text(
                                                    //   //     "${responseFarmer.data1[0].count} Plots",
                                                    //   //     style: robotoRegular
                                                    //   //         .copyWith(
                                                    //   //             fontSize: 11,
                                                    //   //             color: const Color(
                                                    //   //                 0xff262626)),
                                                    //   //   ),
                                                    //   // ),
                                                    // ),
                                                    const SizedBox(
                                                      width: 30,
                                                    ),
                                                    Text(
                                                      "",
                                                      style: robotoRegular
                                                          .copyWith(
                                                              fontSize: 11,
                                                              color: const Color(
                                                                  0xff262626)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                        InkWell(
                                            onTap: () => _launchURL(
                                                'tel:${responseFarmer.data[index].mobileNumber}'),
                                            child: Image.asset(
                                              "assets/image/call.png",
                                              width: 28,
                                              height: 28,
                                              color:
                                                  ColorResources.light_purple,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
              ],
            );
          } else {
            return Center(
              child: Text(
                "",
                style: TextStyle(
                    fontFamily: "Proxima Nova",
                    fontWeight: FontWeight.w600,
                    fontSize: 20 * MediaQuery.of(context).textScaleFactor),
              ),
            );
          }
        },
      ),
    );
  }
}
