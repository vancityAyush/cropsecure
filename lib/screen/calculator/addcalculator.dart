import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AddCalculator extends StatelessWidget {
  List<String> particular = ["Uttar Pradesh", "Uttrakhand", "Jharkhand"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: const Color(0xfff1f1f1), width: 2)),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/image/location.png",
                            width: 100,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Plot Size",
                            style: robotoExtraBold.copyWith(
                                color: const Color(0xff262626), fontSize: 14),
                          )
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Crop Type: ",
                                  style: robotoMedium.copyWith(
                                      color: const Color(0xff262626),
                                      fontSize: 16),
                                ),
                                Container(
                                  height: 45,
                                  width: 160,
                                  color: ColorResources.light_purple,
                                  child: DropdownSearch(
                                    popupShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    mode: Mode.MENU,
                                    popupElevation: 5,
                                    dropdownSearchDecoration:
                                        const InputDecoration(
                                      hintText: "Crop Type",
                                      hintStyle: TextStyle(
                                          color: ColorResources.white),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(12, 12, 0, 0),
                                      border: OutlineInputBorder(),
                                    ),
                                    // showSearchBox:true,
                                    onFind: (String filter) async {
                                      return particular;
                                    },
                                    onChanged: (String data) async {},
                                    itemAsString: (String da) => da,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "0.068   Acre",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff262626), fontSize: 19),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorResources.light_purple,
                      borderRadius: BorderRadius.circular(15)),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Calculators",
                          style: robotoMedium.copyWith(
                              color: const Color(0xffffffff), fontSize: 18),
                        ),
                      ),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.only(right: 12),
                        width: 200,
                        color: ColorResources.white,
                        child: DropdownSearch(
                          popupShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          mode: Mode.MENU,
                          popupElevation: 5,
                          dropdownSearchDecoration: const InputDecoration(
                            hintText: "Crop Type",
                            hintStyle: TextStyle(color: ColorResources.white),
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                            border: OutlineInputBorder(),
                          ),
                          // showSearchBox:true,
                          onFind: (String filter) async {
                            return particular;
                          },
                          onChanged: (String data) async {},
                          itemAsString: (String da) => da,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                              color: ColorResources.light_purple,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(15))),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "UREA",
                                    style: robotoBold.copyWith(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 50,
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "SSP",
                                    style: robotoBold.copyWith(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 50,
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    "MOP",
                                    style: robotoBold.copyWith(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 50,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "7.15 kg",
                                          style: robotoBold.copyWith(
                                              color: const Color(0xffbfbfbf),
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 2,
                                      width: 80,
                                      color: const Color(0xffd4d4d4),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "7.15 Bags",
                                          style: robotoBold.copyWith(
                                              color: const Color(0xffbfbfbf),
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 80,
                                color: const Color(0xffc4c4c4),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "10.28 kg",
                                          style: robotoBold.copyWith(
                                              color: const Color(0xffbfbfbf),
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 2,
                                      width: 80,
                                      color: const Color(0xffd4d4d4),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "0.21 Bags",
                                          style: robotoBold.copyWith(
                                              color: const Color(0xffbfbfbf),
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 80,
                                color: const Color(0xffc4c4c4),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "2.84 kg",
                                          style: robotoBold.copyWith(
                                              color: const Color(0xffbfbfbf),
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 2,
                                      width: 80,
                                      color: const Color(0xffd4d4d4),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          "0.06 Bags",
                                          style: robotoBold.copyWith(
                                              color: const Color(0xffbfbfbf),
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Number of litre in Bottle",
                    style: robotoBold.copyWith(
                        color: const Color(0xffbfbfbf), fontSize: 15),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Note: Number of kg in per bag.",
                    style: robotoBold.copyWith(
                        color: ColorResources.light_purple, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Urea - 45 kg, SSP-50kg, Mop-50 kg",
                    style: robotoBold.copyWith(
                        color: ColorResources.light_purple, fontSize: 15),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
