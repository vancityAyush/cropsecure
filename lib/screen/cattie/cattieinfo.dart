import 'package:CropSecure/data/model/response/responsefamer.dart';
import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/screen/cattie/cattlelist.dart';
import 'package:CropSecure/utill/app_constants.dart';
import 'package:CropSecure/utill/color_resources.dart';
import 'package:CropSecure/utill/dimensions.dart';
import 'package:CropSecure/utill/sharedprefrence.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CattieInfo extends StatefulWidget {
  // void _launchURL(String url) async =>
  //     await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  @override
  State<CattieInfo> createState() => _CattieInfoState();
}

class _CattieInfoState extends State<CattieInfo> {
  Future<void> _launched;

  List<Data> responses = [];
  List filteredData = [];
  int count = 0;
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
              (data.name.toLowerCase().contains(value.toLowerCase()) &&
                  data.type == farmerType.C))
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
            count = 0;
            for (var item in filteredData) {
              if (item.type == farmerType.C) {
                count++;
              }
            }
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
                            hintText: "Search Cattles",
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
                            count.toString(),
                            style: robotoBold.copyWith(
                                color: ColorResources.light_purple),
                          ),
                          Text(
                            "  Cattles",
                            style: robotoBold.copyWith(
                                fontSize: 12, color: const Color(0xff767876)),
                          )
                        ],
                      ),

                      // const Icon(Icons.search)
                    ],
                  ),
                ),
                if (responseFarmer.data == null)
                  Column(
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
                else
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          return Visibility(
                            visible: filteredData[index].type == farmerType.C,
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
                                    AppConstants.addressFarmer,
                                    responseFarmer.data[index].districtName +
                                        " " +
                                        responseFarmer.data[index].taluka +
                                        " " +
                                        responseFarmer
                                            .data[index].gramaPanchayath +
                                        " " +
                                        responseFarmer.data[index].villageName);
                                Get.to(
                                    () => CattleList(
                                        farmerId:
                                            responseFarmer.data[index].id),
                                    transition: Transition.rightToLeftWithFade,
                                    duration:
                                        const Duration(milliseconds: 600));
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
                                                color: const Color(0xff262626),
                                                fontSize: 16),
                                          ),
                                          Text(
                                            "${responseFarmer.data[index].districtName}, ${responseFarmer.data[index].taluka},\n"
                                            "${responseFarmer.data[index].gramaPanchayath}, ${responseFarmer.data[index].villageName}",
                                            style: robotoRegular.copyWith(
                                                color: const Color(0xffb8b8b8),
                                                fontSize: 10),
                                          ),
                                          // Padding(
                                          //   padding: const EdgeInsets.only(
                                          //       top: 15.0),
                                          //   child: Row(
                                          //     crossAxisAlignment:
                                          //         CrossAxisAlignment.start,
                                          //     children: [
                                          //       Container(
                                          //         width: 70,
                                          //         height: 19,
                                          //         decoration: BoxDecoration(
                                          //             color: const Color(
                                          //                 0xffc8f6c8),
                                          //             borderRadius:
                                          //                 BorderRadius.circular(
                                          //                     10)),
                                          //         child: Center(
                                          //           child: Text(
                                          //             "0 plots",
                                          //             style: robotoRegular
                                          //                 .copyWith(
                                          //                     fontSize: 11,
                                          //                     color: const Color(
                                          //                         0xff262626)),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //       const SizedBox(
                                          //         width: 30,
                                          //       ),
                                          //       Text(
                                          //         "",
                                          //         style: robotoRegular.copyWith(
                                          //             fontSize: 11,
                                          //             color: const Color(
                                          //                 0xff262626)),
                                          //       )
                                          //     ],
                                          //   ),
                                          // ),
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
                                          color: ColorResources.light_purple,
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
