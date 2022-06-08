import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenditureHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Provider.of<AuthProvider>(context).fetchExpenditureApi(),
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
                    "No expenditure available",
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
                              left: 0, right: 10, top: 20, bottom: 20),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "S.No",
                                          style: robotoBold.copyWith(
                                              color: const Color(0xff262626),
                                              fontSize: 11),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "Date",
                                          style: robotoBold.copyWith(
                                              color: const Color(0xff262626),
                                              fontSize: 11),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "Name",
                                          style: robotoBold.copyWith(
                                              color: const Color(0xff262626),
                                              fontSize: 11),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "Amount",
                                          style: robotoBold.copyWith(
                                              color: const Color(0xff262626),
                                              fontSize: 11),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "Sum Amount",
                                          style: robotoBold.copyWith(
                                              color: const Color(0xff262626),
                                              fontSize: 11),
                                        ),
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 17.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            "${index + 1}",
                                            style: robotoBold.copyWith(
                                                color: const Color(0xff262626),
                                                fontSize: 11),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            snapshots.data['data'][index]
                                                ['date'],
                                            style: robotoBold.copyWith(
                                                color: const Color(0xff262626),
                                                fontSize: 11),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            snapshots.data['data'][index]
                                                ['particular_select'],
                                            style: robotoBold.copyWith(
                                                color: const Color(0xff262626),
                                                fontSize: 11),
                                          ),
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            snapshots.data['data'][index]
                                                        ['amount']
                                                    .toString() +
                                                "/-",
                                            style: robotoBold.copyWith(
                                                color: const Color(0xff262626),
                                                fontSize: 11),
                                          ),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          snapshots.data['data'][index]['sum']
                                                  .toString() +
                                              "/-",
                                          style: robotoBold.copyWith(
                                              color: const Color(0xff262626),
                                              fontSize: 11),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
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
