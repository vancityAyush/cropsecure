import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SoilReportHistory extends StatelessWidget {
  String id;
  SoilReportHistory(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 28,
          color: ColorResources.white,
        ),
        titleSpacing: 1,
        title: Text(
          "Soil Details",
          style: robotoBold.copyWith(color: ColorResources.white, fontSize: 18),
        ),
      ),
      body: FutureBuilder(
          future: Provider.of<AuthProvider>(context)
              .fetchSoilInformationReportApi(id),
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
                    "No details available",
                    style: TextStyle(
                        fontFamily: "Proxima Nova",
                        fontWeight: FontWeight.w600,
                        fontSize: 20 * MediaQuery.of(context).textScaleFactor),
                  ),
                );
              } else {
                if (snapshots.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider(
                            thickness: 2,
                          );
                        },
                        itemCount: snapshots.data['data'].length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "PH",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        snapshots.data['data'][index]['ph']
                                            .toString(),
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Ec",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        snapshots.data['data'][index]['ec'] +
                                            " ds/m",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "OC",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        snapshots.data['data'][index]['oc'] +
                                            " %",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "AN",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        snapshots.data['data'][index]['an'] +
                                            " kg/ha",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "ap",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        snapshots.data['data'][index]['ap'] +
                                            " kg/ha",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "AH",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        snapshots.data['data'][index]['ah'] +
                                            " kg/ha",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "AS",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        snapshots.data['data'][index]['a_s'] +
                                            " kg/ha",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "ZN",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        snapshots.data['data'][index]['zn'] +
                                            " ppm",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "AB",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        snapshots.data['data'][index]['ab'] +
                                            " ppm",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "AI",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        snapshots.data['data'][index]['ai']
                                            .toString(),
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "MN",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        snapshots.data['data'][index]['mn']
                                            .toString(),
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "CA",
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        snapshots.data['data'][index]['ca']
                                            .toString(),
                                        style: robotoBold.copyWith(
                                            color: ColorResources.black,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return Center(
                    child: Text(
                      "",
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
