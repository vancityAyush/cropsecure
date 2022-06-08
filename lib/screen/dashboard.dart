import 'package:CropSecure/screen/cattie/cattieinfo.dart';
import 'package:CropSecure/screen/result.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/material.dart';

import 'addfarmer/farmerinfo.dart';
import 'drawer/drawer.dart';
import 'home.dart';
import 'orderhistory.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 10,
          title: Text(
            "CROP SECURE",
            style: robotoExtraBold.copyWith(
              color: Colors.white,
              fontSize: 19,
            ),
          ),
          bottom: const TabBar(
            unselectedLabelColor: Colors.white,
            isScrollable: true,
            labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: "Proxima Nova",
                fontWeight: FontWeight.w600),
            tabs: [
              Tab(text: "Overview"),
              Tab(text: "Cattle Info"),
              Tab(text: "Farmer Info"),
              Tab(text: "Order History"),
              // Tab(text: "Payment History"),
              Tab(text: "Result"),
            ],
          ),
        ),
        drawer: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Drawer(
              child: Container(
                color: const Color(0xff01692c),
                child: Drawers(),
              ),
            )),
        body: TabBarView(
          children: [
            Home(),
            CattieInfo(),
            FarmerInfo(),
            OrderHistory(),
            // const Text("ssa"),
            Result()
          ],
        ),
      ),
    );
  }
}
