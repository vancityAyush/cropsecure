import 'package:CropSecure/screen/calculator/calculator.dart';
import 'package:CropSecure/screen/labanalysis/labanalysis.dart';
import 'package:CropSecure/screen/soil/soil.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Others extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Others",
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
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => LabAnalysis(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 600));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: SizedBox(
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/image/irrigation.png",
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Lab Analytics",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff444444), fontSize: 17),
                            )
                          ],
                        ),
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
                    onTap: () {
                      Get.to(() => Soil(),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 600));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: SizedBox(
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/image/irrigation.png",
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Soil Information",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff444444), fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => Calculator(""),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 600));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: SizedBox(
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/image/irrigation.png",
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Calculator",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff444444), fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: SizedBox(
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/image/irrigation.png",
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Govt Schemes",
                            style: robotoBold.copyWith(
                                color: const Color(0xff444444), fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
