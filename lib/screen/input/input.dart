import 'package:cropsecure/screen/input/organicscreen.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:cropsecure/utill/sharedprefrence.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Inputs",
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
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                await SharedPrefManager.savePrefString(
                    AppConstants.categoryName, "Organic");
                Get.to(() => Organic("Organic"),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 600));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xff937ab3),
                ),
                child: Center(
                  child: Text(
                    "Organic",
                    style: robotoExtraBold.copyWith(
                        color: Colors.white, fontSize: 23),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                // await SharedPrefManager.savePrefString(AppConstants.categoryName, "Nonorganic");
                Get.to(() => Organic("Non-Organic"),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 600));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xffabc56c),
                ),
                child: Center(
                  child: Text(
                    "Non-Organic",
                    style: robotoExtraBold.copyWith(
                        color: Colors.white, fontSize: 23),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
