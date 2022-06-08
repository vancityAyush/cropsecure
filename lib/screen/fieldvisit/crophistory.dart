import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CropHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                        height: 47.0,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF6cbd47),
                            ), //button color
                          ),
                          onPressed: () async {
                            // Get.to(() => RegisterScreen(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                          },
                          child: Text('Date',
                              style: robotoBold.copyWith(
                                  fontSize: 19, color: Colors.white)),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                        height: 47.0,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF6cbd47),
                            ), //button color
                          ),
                          onPressed: () async {
                            // Get.to(() => RegisterScreen(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                          },
                          child: Text('Crop Stage',
                              style: robotoBold.copyWith(
                                  fontSize: 19, color: Colors.white)),
                        )),
                  ),
                ],
              ),
            ),
            Flexible(
              child: FutureBuilder(
                  future:
                      Provider.of<AuthProvider>(context).fetchCropStageApi(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
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
                            "No crop stage available",
                            style: TextStyle(
                                fontFamily: "Proxima Nova",
                                fontWeight: FontWeight.w600,
                                fontSize: 20 *
                                    MediaQuery.of(context).textScaleFactor),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshots.data['data'].length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, top: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.grey, width: 1),
                                        ),
                                        child: Center(
                                          child: Text(
                                            snapshots.data['data'][index]
                                                    ['crop_loss_date']
                                                .toString(),
                                            style: robotoMedium.copyWith(
                                                color: const Color(0xff5e5e5e)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.grey, width: 1),
                                        ),
                                        child: Center(
                                          child: Text(
                                            snapshots.data['data'][index]
                                                ['crop_stage'],
                                            style: robotoMedium.copyWith(
                                                color: const Color(0xff5e5e5e)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
