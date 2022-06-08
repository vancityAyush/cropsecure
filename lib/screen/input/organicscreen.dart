import 'package:CropSecure/screen/input/seeds.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Organic extends StatefulWidget {
  final String organic;
  Organic(this.organic);

  @override
  _OrganicState createState() => _OrganicState();
}

class _OrganicState extends State<Organic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          widget.organic,
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
                Get.to(() => Seeds(widget.organic, "Seeds"),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 600));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xff59bad2),
                ),
                child: Center(
                  child: Text(
                    "Seeds",
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
              onTap: () {
                Get.to(() => Seeds(widget.organic, "Pesticides"),
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
                    "Pesticides",
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
              onTap: () {
                Get.to(() => Seeds(widget.organic, "Fertilizer"),
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
                    "Fertilizer",
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
              onTap: () {
                Get.to(() => Seeds(widget.organic, "Manure"),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 600));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xffcd665f),
                ),
                child: Center(
                  child: Text(
                    "Manure",
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
