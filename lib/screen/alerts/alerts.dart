import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/screen/alerts/raisealertdetail.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RaiseAlerts extends StatelessWidget {
  String plotId;
  RaiseAlerts(this.plotId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Alerts",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    var res =
                        await Provider.of<AuthProvider>(context, listen: false)
                            .fetchDiseasePopup();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Card(
                              elevation: 9,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Select Alert Type",
                                          style: robotoMedium.copyWith(
                                              color: const Color(0xff2a2a2a),
                                              fontSize: 23),
                                        ),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        const Icon(
                                          Icons.clear,
                                          size: 35,
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          itemCount: res['data'].length,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          separatorBuilder: (context, index) {
                                            return const Divider();
                                          },
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Get.to(
                                                    () => RaiseAlertDetail(
                                                          plotId: plotId,
                                                          disease: res['data']
                                                              [index],
                                                        ),
                                                    transition: Transition
                                                        .rightToLeftWithFade,
                                                    duration: const Duration(
                                                        milliseconds: 600));
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    res['data'][index]['name'],
                                                    style:
                                                        robotoMedium.copyWith(
                                                            color: const Color(
                                                                0xff262626),
                                                            fontSize: 17),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6.0),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                            width: 70,
                                                            height: 70,
                                                            color: ColorResources
                                                                .light_purple),
                                                        const SizedBox(
                                                          width: 15,
                                                        ),
                                                        Expanded(
                                                            child: Text(
                                                          res['data'][index]
                                                              ['description'],
                                                          style: robotoRegular
                                                              .copyWith(
                                                                  color: Color(
                                                                      0xff0a0a0a)),
                                                        ))
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: Text(
                    "RAISE ALERT",
                    style: robotoBold.copyWith(color: Colors.white),
                  )),
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                  future: Provider.of<AuthProvider>(context, listen: false)
                      .fetchDiseaseAlert(plotId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data['data'];
                      if (data == null) {
                        return Container(
                          child: Center(
                            child: Text("No Alerts"),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Card(
                          elevation: 9,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Open Alerts",
                                        style: robotoMedium.copyWith(
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 2,
                                            bottom: 2),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xffea7011)),
                                        child: Text(
                                          data.length.toString(),
                                          style: robotoMedium.copyWith(
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Aphids",
                                        style: robotoMedium.copyWith(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                      Row(
                                        children: const [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          CircleAvatar(
                                              radius: 14,
                                              backgroundColor: Colors.red,
                                              child: Icon(
                                                Icons.clear,
                                                color: Colors.white,
                                                size: 15,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        data[index]['area_date'],
                                        style: robotoMedium.copyWith(
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        data[index]['comment'],
                                        style: robotoMedium.copyWith(
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else
                      return Container(child: CircularProgressIndicator());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
