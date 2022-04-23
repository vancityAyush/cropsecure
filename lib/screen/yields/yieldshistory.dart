import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YieldsHistory extends StatelessWidget {
  final String plotId;
  YieldsHistory({this.plotId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Provider.of<AuthProvider>(context).fetchYieldApi(plotId),
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
                    "No yields available",
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
                          padding: const EdgeInsets.only(
                              left: 0, right: 10, top: 0, bottom: 0),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Moisture:",
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                    Text(
                                      snapshots.data['data'][index]['moisture']
                                          .toString(),
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Grade",
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                    Text(
                                      snapshots.data['data'][index]['grade']
                                          .toString(),
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Date",
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                    Text(
                                      snapshots.data['data'][index]
                                              ['pickupdate']
                                          .toString(),
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "No of Bags:-",
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                    Text(
                                      snapshots.data['data'][index]
                                              ['no_of_bags']
                                          .toString(),
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total weight:-",
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                    Text(
                                      snapshots.data['data'][index]
                                              ['total_weights']
                                          .toString(),
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Price/Kg:-",
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                    Text(
                                      snapshots.data['data'][index]
                                              ['price_per_kg']
                                          .toString(),
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Amount:-",
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                    Text(
                                      snapshots.data['data'][index]
                                              ['total_amount']
                                          .toString(),
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 11),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
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
