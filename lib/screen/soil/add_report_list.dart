import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/screen/soil/addreport.dart';
import 'package:CropSecure/utill/app_constants.dart';
import 'package:CropSecure/utill/color_resources.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReportPage extends StatefulWidget {
  @override
  State<AddReportPage> createState() => _AddReportPageState();
}

class _AddReportPageState extends State<AddReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Provider.of<AuthProvider>(context).fetchSoilInformationApi(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
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
                    "No information available",
                    style: TextStyle(
                        fontFamily: "Proxima Nova",
                        fontWeight: FontWeight.w600,
                        fontSize: 20 * MediaQuery.of(context).textScaleFactor),
                  ),
                );
              } else {
                if (snapshots.hasData) {
                  return ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 2,
                        );
                      },
                      itemCount: snapshots.data['data'].length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          onExpansionChanged: (value) {},
                          children: [
                            AddReport(snapshots.data['data'][index]['id']),
                          ],
                          // onTap: (){
                          //   Get.to(()=> SoilReportHistory(snapshots.data['data'][index]['id'].toString()));
                          // },
                          // contentPadding: const EdgeInsets.all(10),
                          title: Text(
                            "Collected By-  " +
                                snapshots.data['data'][index]
                                        ['sample_collected_by']
                                    .toString(),
                            style: robotoMedium.copyWith(
                                color: ColorResources.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            "Date-  " +
                                snapshots.data['data'][index]
                                        ['sample_collected_date']
                                    .toString(),
                            style: robotoMedium.copyWith(
                                color: ColorResources.black, fontSize: 12),
                          ),
                          leading: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(AppConstants.Image +
                                snapshots.data['data'][index]['photo']
                                    .toString()),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: Text(
                      "",
                      style: TextStyle(
                          fontFamily: "Proxima Nova",
                          fontWeight: FontWeight.w600,
                          fontSize:
                              20 * MediaQuery.of(context).textScaleFactor),
                    ),
                  );
                }
              }
            }
          }),
    );
  }
}
