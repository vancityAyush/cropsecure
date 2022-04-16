import 'dart:convert';

import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/dimensions.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder(
        future: Provider.of<AuthProvider>(context).fetchOrderListApi(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            if (snapshot.hasData) {
              return ListView.separated(
                reverse: true,
                itemCount: snapshot.data['data'].length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  // List<DataFetchProduct> data = homeData.viewProductCategories;
                  var json = jsonDecode(
                      snapshot.data['data'][index]['order']['product']);
                  // dynamic tags = List.from(json);
                  return InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/image/equipment.png",
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(json['name'].toString(),
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
                                  Text(
                                      snapshot.data['data'][index]['order']
                                              ['created_at']
                                          .toString(),
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: robotoRegular.copyWith(
                                          color: const Color(0xff929292),
                                          overflow: TextOverflow.fade,
                                          fontWeight: FontWeight.w500,
                                          fontSize: Dimensions.text_12)),
                                  const SizedBox(height: Dimensions.margin_10),
                                  Text('₹ ' + json['mrp'].toString(),
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: ColorResources
                                              .text_cart_green_price,
                                          fontWeight: FontWeight.w600,
                                          fontSize: Dimensions.text_16,
                                          fontFamily: "Roboto")),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  "Survey Number : " +
                                      snapshot.data['data'][index]['plot']
                                              ['survey_no']
                                          .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: robotoMedium.copyWith(
                                      color: const Color(0xff929292),
                                      overflow: TextOverflow.fade,
                                      fontWeight: FontWeight.w700,
                                      fontSize: Dimensions.text_14)),
                              SizedBox(height: Dimensions.margin_10),
                              Text(
                                  "OrderId: " +
                                      snapshot.data['data'][index]['order']
                                              ['id']
                                          .toString(),
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: robotoMedium.copyWith(
                                      color: const Color(0xff929292),
                                      overflow: TextOverflow.fade,
                                      fontWeight: FontWeight.w700,
                                      fontSize: Dimensions.text_14)),
                              SizedBox(height: Dimensions.margin_10),
                              Text(
                                  "Status : " +
                                      snapshot.data['data'][index]['order']
                                              ['status']
                                          .toString(),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: robotoMedium.copyWith(
                                      color: const Color(0xff929292),
                                      fontWeight: FontWeight.w700,
                                      fontSize: Dimensions.text_14)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  "No order available",
                  style: TextStyle(
                      fontFamily: "Proxima Nova",
                      fontWeight: FontWeight.w600,
                      fontSize: 20 * MediaQuery.of(context).textScaleFactor),
                ),
              );
            }
          }
        },
      ),
    ));
  }
}
