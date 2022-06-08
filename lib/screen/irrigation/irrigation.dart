import 'package:CropSecure/data/model/response/responsefamer.dart';
import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/screen/addfarmer/addfarmer.dart';
import 'package:CropSecure/screen/addfarmer/addplots.dart';
import 'package:CropSecure/utill/app_constants.dart';
import 'package:CropSecure/utill/color_resources.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../utill/dimensions.dart';
import '../../utill/sharedprefrence.dart';

class Irrigation extends StatefulWidget {
  @override
  State<Irrigation> createState() => _IrrigationState();
}

class _IrrigationState extends State<Irrigation> {
  bool isLoad = false;
  var formatDate, formatDates;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Irrigation",
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
          future: Provider.of<AuthProvider>(context, listen: false)
              .fetchIrrigation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  itemCount: snapshot.data['data'].length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const Divider(height: 2);
                  },
                  itemBuilder: (context, index) {
                    var data = snapshot.data['data'];
                    return SizedBox(
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/image/farmer.png",
                                width: 136,
                                height: 180,
                                fit: BoxFit.fill,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index]['name'],
                                style: robotoBold.copyWith(
                                    color: Colors.black, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                data[index]['package_type'],
                                style: robotoBold.copyWith(
                                    color: Colors.black, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                data[index]['mrp'],
                                style: robotoBold.copyWith(
                                    color: Colors.black, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Description",
                                style: robotoBold.copyWith(
                                    color: Colors.black, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                data[index]['description'],
                                style:
                                    robotoLight.copyWith(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () async {
                                        await SharedPrefManager.savePrefString(
                                            AppConstants.productName,
                                            snapshot.data['data'][index]['id']
                                                .toString());
                                        showModalBottomSheet(
                                          elevation: 20,
                                          context: context,
                                          builder: (context) => SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.23,
                                            child: FutureBuilder(
                                              future: Provider.of<AuthProvider>(
                                                      context)
                                                  .fetchFarmerApi(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<dynamic>
                                                      snapshots) {
                                                ResponseFarmer response =
                                                    snapshots.data;
                                                if (snapshots.connectionState ==
                                                    ConnectionState.none) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                } else if (snapshots.hasError) {
                                                  return Text(
                                                      "${snapshots.error}");
                                                } else if (snapshots.hasData) {
                                                  ResponseFarmer
                                                      responseFarmer =
                                                      snapshots.data;
                                                  responseFarmer.data
                                                      .removeWhere((element) =>
                                                          element.type ==
                                                          farmerType.C);
                                                  return Stack(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 20.0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text(
                                                            "Select Framer",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 19 *
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor,
                                                                letterSpacing:
                                                                    1,
                                                                color: Colors
                                                                    .black87),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 35,
                                                                      left: 13,
                                                                      right:
                                                                          8.0),
                                                              width: 35,
                                                              height: 35,
                                                              child: FittedBox(
                                                                child:
                                                                    FloatingActionButton(
                                                                  child:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 32,
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .blue,
                                                                  onPressed:
                                                                      () {
                                                                    Get.to(() => AddFarmer(),
                                                                        transition:
                                                                            Transition
                                                                                .rightToLeftWithFade,
                                                                        duration:
                                                                            const Duration(milliseconds: 600));
                                                                  },
                                                                  elevation: 5,
                                                                  splashColor:
                                                                      Colors
                                                                          .grey,
                                                                ),
                                                              ),
                                                            ),
                                                            if (response.data !=
                                                                null)
                                                              Flexible(
                                                                child: ListView
                                                                    .builder(
                                                                        scrollDirection:
                                                                            Axis
                                                                                .horizontal,
                                                                        itemCount: response
                                                                            .data
                                                                            .length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () async {
                                                                              Navigator.of(context).pop();
                                                                              await SharedPrefManager.savePrefString(AppConstants.farmerId, response.data[index].id);
                                                                              showModalBottomSheet(
                                                                                elevation: 20,
                                                                                context: context,
                                                                                builder: (context) => SizedBox(
                                                                                  height: MediaQuery.of(context).size.height * 0.23,
                                                                                  child: FutureBuilder(
                                                                                    future: Provider.of<AuthProvider>(context).fetchPlotsApi(),
                                                                                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
                                                                                      if (snapshots.connectionState == ConnectionState.none) {
                                                                                        return const Center(
                                                                                          child: CircularProgressIndicator(),
                                                                                        );
                                                                                      } else if (snapshots.hasError) {
                                                                                        return Text("${snapshots.error}");
                                                                                      } else if (snapshots.hasData) {
                                                                                        return Stack(
                                                                                          children: <Widget>[
                                                                                            Padding(
                                                                                              padding: const EdgeInsets.only(top: 20.0),
                                                                                              child: Align(
                                                                                                alignment: Alignment.topCenter,
                                                                                                child: Text(
                                                                                                  "Select Plot",
                                                                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19 * MediaQuery.of(context).textScaleFactor, letterSpacing: 1, color: Colors.black87),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: Alignment.center,
                                                                                              child: Row(
                                                                                                children: <Widget>[
                                                                                                  Container(
                                                                                                    margin: const EdgeInsets.only(top: 35, left: 13, right: 8.0),
                                                                                                    width: 35,
                                                                                                    height: 35,
                                                                                                    child: FittedBox(
                                                                                                      child: FloatingActionButton(
                                                                                                        child: const Icon(
                                                                                                          Icons.add,
                                                                                                          color: Colors.white,
                                                                                                          size: 32,
                                                                                                        ),
                                                                                                        backgroundColor: Colors.blue,
                                                                                                        onPressed: () async {
                                                                                                          var farmerId = await SharedPrefManager.getPrefrenceString(AppConstants.farmerId);
                                                                                                          Get.to(() => AddPlots(id: farmerId), transition: Transition.rightToLeftWithFade, duration: const Duration(milliseconds: 600));
                                                                                                        },
                                                                                                        elevation: 5,
                                                                                                        splashColor: Colors.grey,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  if (snapshots.data['data'] != null)
                                                                                                    Flexible(
                                                                                                      child: ListView.builder(
                                                                                                          scrollDirection: Axis.horizontal,
                                                                                                          itemCount: snapshots.data['data'].length,
                                                                                                          itemBuilder: (context, index) {
                                                                                                            return GestureDetector(
                                                                                                              onTap: () async {
                                                                                                                await SharedPrefManager.savePrefString(AppConstants.plotId, snapshots.data['data'][index]['id'].toString());
                                                                                                                Navigator.of(context).pop();
                                                                                                                showDialog(
                                                                                                                    context: context,
                                                                                                                    builder: (builder) => StatefulBuilder(
                                                                                                                          builder: (BuildContext context, void Function(void Function()) setState) {
                                                                                                                            return Dialog(
                                                                                                                              elevation: 5,
                                                                                                                              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                                                                                                                              child: SizedBox(
                                                                                                                                height: 200,
                                                                                                                                width: MediaQuery.of(context).size.width,
                                                                                                                                child: Column(
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                  children: [
                                                                                                                                    Text("Are You sure to Buy this product?",
                                                                                                                                        softWrap: false,
                                                                                                                                        overflow: TextOverflow.ellipsis,
                                                                                                                                        textAlign: TextAlign.start,
                                                                                                                                        maxLines: 1,
                                                                                                                                        style: robotoMedium.copyWith(
                                                                                                                                          overflow: TextOverflow.fade,
                                                                                                                                          fontWeight: FontWeight.w700,
                                                                                                                                          fontSize: Dimensions.text_18,
                                                                                                                                        )),
                                                                                                                                    const SizedBox(height: Dimensions.margin_10),
                                                                                                                                    Padding(
                                                                                                                                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                                                                                                                                      child: Row(
                                                                                                                                        children: [
                                                                                                                                          if (isLoad)
                                                                                                                                            const Center(
                                                                                                                                              child: SizedBox(width: 30, height: 30, child: CircularProgressIndicator()),
                                                                                                                                            )
                                                                                                                                          else
                                                                                                                                            Expanded(
                                                                                                                                              flex: 1,
                                                                                                                                              child: InkWell(
                                                                                                                                                onTap: () async {
                                                                                                                                                  setState(() {
                                                                                                                                                    isLoad = true;
                                                                                                                                                  });

                                                                                                                                                  await Provider.of<AuthProvider>(context, listen: false).orderNowApi(snapshots.data['data'][index]['name'], "Purchase", formatDate, formatDates);

                                                                                                                                                  setState(() {
                                                                                                                                                    isLoad = false;
                                                                                                                                                  });
                                                                                                                                                },
                                                                                                                                                child: Container(
                                                                                                                                                  height: 40,
                                                                                                                                                  margin: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                                    border: Border.all(color: ColorResources.light_purple),
                                                                                                                                                    color: ColorResources.light_purple,
                                                                                                                                                    borderRadius: BorderRadius.circular(20),
                                                                                                                                                  ),
                                                                                                                                                  child: Center(
                                                                                                                                                    child: Text(
                                                                                                                                                      "Yes",
                                                                                                                                                      style: robotoExtraBold.copyWith(fontSize: 13, color: const Color(0xffffffff)),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          const SizedBox(
                                                                                                                                            width: 18,
                                                                                                                                          ),
                                                                                                                                          Expanded(
                                                                                                                                            flex: 1,
                                                                                                                                            child: InkWell(
                                                                                                                                              onTap: () {
                                                                                                                                                // Get.offAll(DashboardScreen());
                                                                                                                                              },
                                                                                                                                              child: Container(
                                                                                                                                                height: 40,
                                                                                                                                                margin: const EdgeInsets.fromLTRB(0, 12, 10, 0),
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  border: Border.all(color: ColorResources.light_purple),
                                                                                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                                                                                ),
                                                                                                                                                child: Center(
                                                                                                                                                  child: Text(
                                                                                                                                                    "No",
                                                                                                                                                    style: robotoExtraBold.copyWith(fontSize: 13, color: Colors.black),
                                                                                                                                                  ),
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
                                                                                                                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        ));
                                                                                                              },
                                                                                                              child: SizedBox(
                                                                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                                                                child: Card(
                                                                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                                                  margin: const EdgeInsets.fromLTRB(10, 60, 10, 21),
                                                                                                                  elevation: 20,
                                                                                                                  child: Column(
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: <Widget>[
                                                                                                                      CircleAvatar(
                                                                                                                        radius: 24,
                                                                                                                        backgroundColor: const Color(0xff00A858),
                                                                                                                        backgroundImage: NetworkImage(AppConstants.Image + snapshots.data['data'][index]['farmer_plot']),
                                                                                                                      ),
                                                                                                                      const SizedBox(
                                                                                                                        height: 6,
                                                                                                                      ),
                                                                                                                      Align(
                                                                                                                        alignment: Alignment.center,
                                                                                                                        child: Text(snapshots.data['data'][index]['soil_type'], style: robotoBold.copyWith(color: const Color(0xff262626), fontSize: 14)),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          }),
                                                                                                    )
                                                                                                  else
                                                                                                    Expanded(child: Center(child: Text("No plot available yet now", style: robotoMedium.copyWith(color: ColorResources.black, fontSize: 17)))),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      } else {
                                                                                        return Center(
                                                                                          child: Text(
                                                                                            "",
                                                                                            style: TextStyle(fontFamily: "Proxima Nova", fontWeight: FontWeight.w600, fontSize: 20 * MediaQuery.of(context).textScaleFactor),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child:
                                                                                Visibility(
                                                                              visible: responseFarmer.data[index].type == farmerType.F,
                                                                              child: SizedBox(
                                                                                width: MediaQuery.of(context).size.width * 0.35,
                                                                                child: Card(
                                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                  margin: const EdgeInsets.fromLTRB(10, 60, 10, 21),
                                                                                  elevation: 20,
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: <Widget>[
                                                                                      CircleAvatar(radius: 24, backgroundColor: const Color(0xff00A858), child: Text(responseFarmer.data[index].name.isEmpty ? "" : responseFarmer.data[index].name[0], style: robotoBold.copyWith(color: const Color(0xffffffff), fontSize: 14))),
                                                                                      const SizedBox(
                                                                                        height: 6,
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: Alignment.center,
                                                                                        child: Text(responseFarmer.data[index].name, style: robotoBold.copyWith(color: const Color(0xff262626), fontSize: 14)),
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        height: 8,
                                                                                      ),
                                                                                      Text(responseFarmer.data[index].gender, style: robotoBold.copyWith(color: Colors.grey, fontSize: 11)),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }),
                                                              )
                                                            else
                                                              Expanded(
                                                                  child: Center(
                                                                      child: Text(
                                                                          "No Farmer available yet now",
                                                                          style: robotoMedium.copyWith(
                                                                              color: ColorResources.black,
                                                                              fontSize: 17)))),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return Center(
                                                    child: Text(
                                                      "",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Proxima Nova",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaleFactor),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Buy Now",
                                        style: robotoBold.copyWith(),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () async {
                                        await SharedPrefManager.savePrefString(
                                            AppConstants.productName,
                                            snapshot.data['data'][index]['id']
                                                .toString());
                                        showModalBottomSheet(
                                          elevation: 20,
                                          context: context,
                                          builder: (context) => SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.23,
                                            child: FutureBuilder(
                                              future: Provider.of<AuthProvider>(
                                                      context)
                                                  .fetchFarmerApi(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<dynamic>
                                                      snapshots) {
                                                ResponseFarmer response =
                                                    snapshots.data;

                                                response.data.removeWhere(
                                                    (element) =>
                                                        element.type ==
                                                        farmerType.C);
                                                if (snapshots.connectionState ==
                                                    ConnectionState.none) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                } else if (snapshots.hasError) {
                                                  return Text(
                                                      "${snapshots.error}");
                                                } else if (snapshots.hasData) {
                                                  ResponseFarmer
                                                      responseFarmer =
                                                      snapshots.data;

                                                  responseFarmer.data
                                                      .removeWhere((element) =>
                                                          element.type ==
                                                          farmerType.C);
                                                  return Stack(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 20.0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text(
                                                            "Select Framer",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 19 *
                                                                    MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor,
                                                                letterSpacing:
                                                                    1,
                                                                color: Colors
                                                                    .black87),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 35,
                                                                      left: 13,
                                                                      right:
                                                                          8.0),
                                                              width: 35,
                                                              height: 35,
                                                              child: FittedBox(
                                                                child:
                                                                    FloatingActionButton(
                                                                  child:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 32,
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .blue,
                                                                  onPressed:
                                                                      () {
                                                                    // Get.to(() => AddPatientDetails(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                                                                  },
                                                                  elevation: 5,
                                                                  splashColor:
                                                                      Colors
                                                                          .grey,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ListView
                                                                  .builder(
                                                                      scrollDirection:
                                                                          Axis
                                                                              .horizontal,
                                                                      itemCount: response
                                                                          .data
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return GestureDetector(
                                                                          onTap:
                                                                              () async {
                                                                            Navigator.of(context).pop();
                                                                            await SharedPrefManager.savePrefString(AppConstants.farmerId,
                                                                                response.data[index].id);
                                                                            showModalBottomSheet(
                                                                              elevation: 20,
                                                                              context: context,
                                                                              builder: (context) => SizedBox(
                                                                                height: MediaQuery.of(context).size.height * 0.23,
                                                                                child: FutureBuilder(
                                                                                  future: Provider.of<AuthProvider>(context).fetchPlotsApi(),
                                                                                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
                                                                                    if (snapshots.connectionState == ConnectionState.none) {
                                                                                      return const Center(
                                                                                        child: CircularProgressIndicator(),
                                                                                      );
                                                                                    } else if (snapshots.hasError) {
                                                                                      return Text("${snapshots.error}");
                                                                                    } else if (snapshots.hasData) {
                                                                                      if (snapshots.data['error_code'].toString() == "0") {
                                                                                        return Row(
                                                                                          children: [
                                                                                            IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios)),
                                                                                            Center(
                                                                                              child: Text(
                                                                                                "No plots available",
                                                                                                style: TextStyle(fontFamily: "Proxima Nova", fontWeight: FontWeight.w600, fontSize: 20 * MediaQuery.of(context).textScaleFactor),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      } else {
                                                                                        return Stack(
                                                                                          children: <Widget>[
                                                                                            Padding(
                                                                                              padding: const EdgeInsets.only(top: 20.0),
                                                                                              child: Align(
                                                                                                alignment: Alignment.topCenter,
                                                                                                child: Text(
                                                                                                  "Select Plot",
                                                                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19 * MediaQuery.of(context).textScaleFactor, letterSpacing: 1, color: Colors.black87),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: Alignment.center,
                                                                                              child: Row(
                                                                                                children: <Widget>[
                                                                                                  Container(
                                                                                                    margin: const EdgeInsets.only(top: 35, left: 13, right: 8.0),
                                                                                                    width: 35,
                                                                                                    height: 35,
                                                                                                    child: FittedBox(
                                                                                                      child: FloatingActionButton(
                                                                                                        child: const Icon(
                                                                                                          Icons.add,
                                                                                                          color: Colors.white,
                                                                                                          size: 32,
                                                                                                        ),
                                                                                                        backgroundColor: Colors.blue,
                                                                                                        onPressed: () {
                                                                                                          // Get.to(() => AddPatientDetails(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                                                                                                        },
                                                                                                        elevation: 5,
                                                                                                        splashColor: Colors.grey,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    child: ListView.builder(
                                                                                                        scrollDirection: Axis.horizontal,
                                                                                                        itemCount: snapshots.data['data'].length,
                                                                                                        itemBuilder: (context, index) {
                                                                                                          return GestureDetector(
                                                                                                            onTap: () async {
                                                                                                              await SharedPrefManager.savePrefString(AppConstants.plotId, snapshots.data['data'][index]['id'].toString());
                                                                                                              Navigator.of(context).pop();
                                                                                                              showDialog(
                                                                                                                  context: context,
                                                                                                                  builder: (builder) => StatefulBuilder(
                                                                                                                        builder: (BuildContext context, void Function(void Function()) setState) {
                                                                                                                          return Dialog(
                                                                                                                            elevation: 5,
                                                                                                                            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                                                                                                                            child: SizedBox(
                                                                                                                              height: 200,
                                                                                                                              width: MediaQuery.of(context).size.width,
                                                                                                                              child: Column(
                                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                children: [
                                                                                                                                  Text("Are You sure to Rent this product?",
                                                                                                                                      softWrap: false,
                                                                                                                                      overflow: TextOverflow.ellipsis,
                                                                                                                                      textAlign: TextAlign.start,
                                                                                                                                      maxLines: 1,
                                                                                                                                      style: robotoMedium.copyWith(
                                                                                                                                        overflow: TextOverflow.fade,
                                                                                                                                        fontWeight: FontWeight.w700,
                                                                                                                                        fontSize: Dimensions.text_18,
                                                                                                                                      )),
                                                                                                                                  const SizedBox(height: Dimensions.margin_10),
                                                                                                                                  Padding(
                                                                                                                                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                                                                                                                                    child: Row(
                                                                                                                                      children: [
                                                                                                                                        Expanded(
                                                                                                                                          flex: 1,
                                                                                                                                          child: InkWell(
                                                                                                                                            onTap: () async {
                                                                                                                                              final DateTime picked = await showDatePicker(
                                                                                                                                                context: context,
                                                                                                                                                initialDate: selectedDate, // Refer step 1
                                                                                                                                                firstDate: DateTime(1940),
                                                                                                                                                lastDate: DateTime(2035),
                                                                                                                                              );

                                                                                                                                              if (picked != null && picked != selectedDate) {
                                                                                                                                                setState(() {
                                                                                                                                                  selectedDate = picked;
                                                                                                                                                  formatDate = selectedDate.year.toString() + "/" + selectedDate.month.toString() + "/" + selectedDate.day.toString();
                                                                                                                                                });
                                                                                                                                              }
                                                                                                                                            },
                                                                                                                                            child: Container(
                                                                                                                                              height: 45,
                                                                                                                                              color: ColorResources.light_purple,
                                                                                                                                              child: Row(
                                                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                children: [
                                                                                                                                                  Text(
                                                                                                                                                    formatDate ?? "From date",
                                                                                                                                                    style: robotoMedium.copyWith(fontSize: 17, color: Colors.white),
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
                                                                                                                                              final DateTime picked = await showDatePicker(
                                                                                                                                                context: context,
                                                                                                                                                initialDate: selectedDate, // Refer step 1
                                                                                                                                                firstDate: DateTime(1940),
                                                                                                                                                lastDate: DateTime(2035),
                                                                                                                                              );

                                                                                                                                              if (picked != null && picked != selectedDate) {
                                                                                                                                                setState(() {
                                                                                                                                                  selectedDate = picked;
                                                                                                                                                  formatDates = selectedDate.year.toString() + "/" + selectedDate.month.toString() + "/" + selectedDate.day.toString();
                                                                                                                                                });
                                                                                                                                              }
                                                                                                                                            },
                                                                                                                                            child: Container(
                                                                                                                                              height: 45,
                                                                                                                                              color: ColorResources.light_purple,
                                                                                                                                              child: Row(
                                                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                children: [
                                                                                                                                                  Text(
                                                                                                                                                    formatDates ?? "To date",
                                                                                                                                                    style: robotoMedium.copyWith(fontSize: 17, color: Colors.white),
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
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                                                                                                                                    child: Row(
                                                                                                                                      children: [
                                                                                                                                        if (isLoad)
                                                                                                                                          const Center(
                                                                                                                                            child: SizedBox(width: 30, height: 30, child: CircularProgressIndicator()),
                                                                                                                                          )
                                                                                                                                        else
                                                                                                                                          Expanded(
                                                                                                                                            flex: 1,
                                                                                                                                            child: InkWell(
                                                                                                                                              onTap: () async {
                                                                                                                                                setState(() {
                                                                                                                                                  isLoad = true;
                                                                                                                                                });

                                                                                                                                                await Provider.of<AuthProvider>(context, listen: false).orderNowApi(snapshots.data['data'][index]['name'], "Rent", formatDate, formatDates);

                                                                                                                                                setState(() {
                                                                                                                                                  isLoad = false;
                                                                                                                                                });
                                                                                                                                              },
                                                                                                                                              child: Container(
                                                                                                                                                height: 40,
                                                                                                                                                margin: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  border: Border.all(color: ColorResources.light_purple),
                                                                                                                                                  color: ColorResources.light_purple,
                                                                                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                                                                                ),
                                                                                                                                                child: Center(
                                                                                                                                                  child: Text(
                                                                                                                                                    "Yes",
                                                                                                                                                    style: robotoExtraBold.copyWith(fontSize: 13, color: const Color(0xffffffff)),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        const SizedBox(
                                                                                                                                          width: 18,
                                                                                                                                        ),
                                                                                                                                        Expanded(
                                                                                                                                          flex: 1,
                                                                                                                                          child: InkWell(
                                                                                                                                            onTap: () {
                                                                                                                                              // Get.offAll(DashboardScreen());
                                                                                                                                            },
                                                                                                                                            child: Container(
                                                                                                                                              height: 40,
                                                                                                                                              margin: const EdgeInsets.fromLTRB(0, 12, 10, 0),
                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                border: Border.all(color: ColorResources.light_purple),
                                                                                                                                                borderRadius: BorderRadius.circular(20),
                                                                                                                                              ),
                                                                                                                                              child: Center(
                                                                                                                                                child: Text(
                                                                                                                                                  "No",
                                                                                                                                                  style: robotoExtraBold.copyWith(fontSize: 13, color: Colors.black),
                                                                                                                                                ),
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
                                                                                                                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ));
                                                                                                            },
                                                                                                            child: SizedBox(
                                                                                                              width: MediaQuery.of(context).size.width * 0.35,
                                                                                                              child: Card(
                                                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                                                margin: const EdgeInsets.fromLTRB(10, 60, 10, 21),
                                                                                                                elevation: 20,
                                                                                                                child: Column(
                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                  children: <Widget>[
                                                                                                                    CircleAvatar(
                                                                                                                      radius: 24,
                                                                                                                      backgroundColor: const Color(0xff00A858),
                                                                                                                      backgroundImage: NetworkImage(AppConstants.Image + snapshots.data['data'][index]['farmer_plot']),
                                                                                                                    ),
                                                                                                                    const SizedBox(
                                                                                                                      height: 6,
                                                                                                                    ),
                                                                                                                    Align(
                                                                                                                      alignment: Alignment.center,
                                                                                                                      child: Text(snapshots.data['data'][index]['soil_type'], style: robotoBold.copyWith(color: const Color(0xff262626), fontSize: 14)),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        }),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      }
                                                                                    } else {
                                                                                      return Center(
                                                                                        child: Text(
                                                                                          "",
                                                                                          style: TextStyle(fontFamily: "Proxima Nova", fontWeight: FontWeight.w600, fontSize: 20 * MediaQuery.of(context).textScaleFactor),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                          child:
                                                                              Visibility(
                                                                            visible:
                                                                                responseFarmer.data[index].type == farmerType.F,
                                                                            child:
                                                                                SizedBox(
                                                                              width: MediaQuery.of(context).size.width * 0.35,
                                                                              child: Card(
                                                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                margin: const EdgeInsets.fromLTRB(10, 60, 10, 21),
                                                                                elevation: 20,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    CircleAvatar(radius: 24, backgroundColor: const Color(0xff00A858), child: Text(responseFarmer.data[index].name.isEmpty ? "" : responseFarmer.data[index].name[0], style: robotoBold.copyWith(color: const Color(0xffffffff), fontSize: 14))),
                                                                                    const SizedBox(
                                                                                      height: 6,
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: Alignment.center,
                                                                                      child: Text(responseFarmer.data[index].name, style: robotoBold.copyWith(color: const Color(0xff262626), fontSize: 14)),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      height: 8,
                                                                                    ),
                                                                                    Text(responseFarmer.data[index].gender, style: robotoBold.copyWith(color: Colors.grey, fontSize: 11)),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return Center(
                                                    child: Text(
                                                      "",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Proxima Nova",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20 *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaleFactor),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text("Rent",
                                          style: robotoBold.copyWith())),
                                ],
                              )
                            ],
                          )),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          }),
    );
  }
}
