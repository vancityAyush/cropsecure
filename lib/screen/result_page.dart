import 'package:cropsecure/provider/authprovider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../utill/color_resources.dart';
import '../utill/styles.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(
          'Result Page ',
          style: robotoBold.copyWith(color: Colors.white, fontSize: 19),
        ),
      ),
      body: FutureBuilder(
          future:
              Provider.of<AuthProvider>(context, listen: false).fetchResult(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data['data'];
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    DateTime date = new DateFormat("yyyy-MM-dd hh:mm:ss")
                        .parse(data[index]['plot']['created_at']);
                    double yield = double.parse(
                        data[index]['yield']['amount'] != null
                            ? data[index]['yield']['amount'].toString()
                            : "0");
                    double exp = double.parse(
                        data[index]['expenses']['amount'] != null
                            ? data[index]['expenses']['amount'].toString()
                            : "0");
                    double input = double.parse(
                        data[index]['expenditure']['amount'] != null
                            ? data[index]['expenditure']['amount'].toString()
                            : "0");
                    return Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 45,
                                    color: ColorResources.light_purple,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Survey Number : ${data[index]['plot']['survey_no']}",
                                          style: robotoMedium.copyWith(
                                              fontSize: 17,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 45,
                                    color: ColorResources.light_purple,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Date: ${date.toString().substring(0, 10)}",
                                          style: robotoMedium.copyWith(
                                              fontSize: 17,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: const Color(0xfff7f3f4),
                                        border: Border.all(
                                          color: const Color(0xffe9e9e9),
                                        )),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Yield Amount:",
                                          style: robotoMedium.copyWith(
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorResources.light_purple,
                                            width: 1)),
                                    height: 45,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          yield.toString(),
                                          style: robotoMedium.copyWith(
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: const Color(0xfff7f3f4),
                                        border: Border.all(
                                          color: const Color(0xffe9e9e9),
                                        )),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Expenses & Input:",
                                          style: robotoMedium.copyWith(
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorResources.light_purple,
                                            width: 1)),
                                    height: 45,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          (exp + input).toString(),
                                          style: robotoMedium.copyWith(
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: const Color(0xfff7f3f4),
                                        border: Border.all(
                                          color: const Color(0xffe9e9e9),
                                        )),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Final Amount:",
                                          style: robotoMedium.copyWith(
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "(Yield-Expenses & Input)",
                                          style: robotoMedium.copyWith(
                                              fontSize: 11, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorResources.light_purple,
                                            width: 1)),
                                    height: 45,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          (yield - (exp + input)).toString(),
                                          style: robotoMedium.copyWith(
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
