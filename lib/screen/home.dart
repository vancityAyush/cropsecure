import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).fetchProfileApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: Provider.of<AuthProvider>(context, listen: false)
                    .fetchDashboardApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data['data'];
                    int audit = int.parse(data['plots_audit']['count']);
                    int noAudit =
                        int.parse(data['plots_without_audit']['count']);
                    return Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/image/farmer.png",
                                width: 30,
                                height: 40,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text("${data['farmers_count']['count']} Farmer",
                                  style:
                                      robotoBold.copyWith(color: Colors.grey)),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/image/cows.png",
                                width: 30,
                                height: 40,
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                  "${data['cattle_farmers_count']['count']} Cattle",
                                  style:
                                      robotoBold.copyWith(color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$noAudit Plots",
                            style: robotoMedium.copyWith(color: Colors.grey),
                          ),
                          LinearProgressIndicator(
                            value: audit / noAudit,
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation(Colors.green),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "$audit Plots Geo tagged",
                                  style: robotoRegular.copyWith(
                                      color: Colors.grey, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            "${data['plots_acre']['area']} Acre Declared",
                            style: robotoRegular.copyWith(
                                color: Colors.grey, fontSize: 16),
                          ),
                          // const SizedBox(height: 25),
                          // Text(
                          //   "${data['alert_count']['count']} Alerts",
                          //   style: robotoRegular.copyWith(
                          //       color: Colors.grey, fontSize: 16),
                          // ),
                          const SizedBox(height: 25),
                          Text(
                            "${data['orders_count']['count']} Orders",
                            style: robotoRegular.copyWith(
                                color: Colors.grey, fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            //
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   padding: const EdgeInsets.all(20),
            //   margin: const EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //       border: Border.all(color: Colors.black,
            //           width: 1)),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Text("Nearby Plots",
            //           style: robotoBold.copyWith(
            //               color: Colors.grey)),
            //
            //       const SizedBox(height: 1,),
            //
            //       Text("1 Plots within 2km rating",
            //         style: robotoRegular.copyWith(
            //             color: Colors.grey
            //         ),),
            //
            //       Image.asset("assets/image/location.png",width: 65,height: 65,),
            //
            //     ],
            //   ),
            // ),
            //
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   padding: const EdgeInsets.all(20),
            //   margin: const EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       border: Border.all(color: Colors.black,
            //           width: 1)),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Text("Harvest",
            //           style: robotoBold.copyWith(
            //               color: Colors.grey)),
            //
            //       const SizedBox(height: 1,),
            //
            //       Text("Top 5 varieties",
            //         style: robotoRegular.copyWith(
            //             color: Colors.green
            //         ),),
            //
            //       SizedBox(
            //         height: 100,
            //         width: MediaQuery.of(context).size.width,
            //         child: Row(
            //           children: [
            //
            //             Expanded(
            //               flex: 1,
            //               child: Column(
            //                 children: [
            //                   Expanded(
            //                     flex: 1,
            //                     child: Center(
            //                       child: Text("0 Tonne",
            //                         style: robotoBold.copyWith(
            //                             color: const Color(0xffbfbfbf),
            //                             fontSize: 17
            //                         ),),
            //                     ),
            //                   ),
            //
            //                   Container(
            //                     height: 2,
            //                     width: 80,
            //                     color: const Color(0xffd4d4d4),
            //                   ),
            //
            //                   Expanded(
            //                     flex: 1,
            //                     child: Center(
            //                       child: Text("98 Tonne",
            //                         style: robotoBold.copyWith(
            //                             color: const Color(0xffbfbfbf),
            //                             fontSize: 17
            //                         ),),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //
            //             Container(
            //               width: 2,
            //               height: 80,
            //               color: const Color(0xffc4c4c4),
            //             ),
            //
            //             Expanded(
            //               flex: 1,
            //               child: Column(
            //                 children: [
            //                   Expanded(
            //                     flex: 1,
            //                     child: Center(
            //                       child: Text("0 Tonne",
            //                         style: robotoBold.copyWith(
            //                             color: const Color(0xffbfbfbf),
            //                             fontSize: 17
            //                         ),),
            //                     ),
            //                   ),
            //
            //                   Container(
            //                     height: 2,
            //                     width: 80,
            //                     color: const Color(0xffd4d4d4),
            //                   ),
            //
            //                   Expanded(
            //                     flex: 1,
            //                     child: Center(
            //                       child: Text("98 Tonne",
            //                         style: robotoBold.copyWith(
            //                             color: const Color(0xffbfbfbf),
            //                             fontSize: 17
            //                         ),),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //
            //             Container(
            //               width: 2,
            //               height: 80,
            //               color: const Color(0xffc4c4c4),
            //             ),
            //
            //             Expanded(
            //               flex: 1,
            //               child: Column(
            //                 children: [
            //                   Expanded(
            //                     flex: 1,
            //                     child: Center(
            //                       child: Text("0 Tonne",
            //                         style: robotoBold.copyWith(
            //                             color: const Color(0xffbfbfbf),
            //                             fontSize: 17
            //                         ),),
            //                     ),
            //                   ),
            //
            //                   Container(
            //                     height: 2,
            //                     width: 80,
            //                     color: const Color(0xffd4d4d4),
            //                   ),
            //
            //                   Expanded(
            //                     flex: 1,
            //                     child: Center(
            //                       child: Text("98 Tonne",
            //                         style: robotoBold.copyWith(
            //                             color: const Color(0xffbfbfbf),
            //                             fontSize: 17
            //                         ),),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //
            //     ],
            //   ),
            // ),

            const SizedBox(
              height: 20,
            ),

            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Image.asset(
            //       "assets/image/farmer.png",
            //       width: 30,
            //       height: 40,
            //     ),
            //     const SizedBox(
            //       width: 7,
            //     ),
            //     Text("124 Tasks",
            //         style: robotoBold.copyWith(color: Colors.grey)),
            //     const SizedBox(
            //       width: 7,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
