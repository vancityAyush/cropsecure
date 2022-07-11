import 'package:CropSecure/data/model/response/responsefamer.dart';
import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/app_constants.dart';
import 'package:CropSecure/utill/color_resources.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CattleAddList extends StatefulWidget {
  final String farmerId;
  CattleAddList(this.farmerId);

  // void _launchURL(String url) async =>
  //     await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  @override
  State<CattleAddList> createState() => _CattleAddListState();
}

class _CattleAddListState extends State<CattleAddList> {
  Future<void> _launched;

  List<Data> responses = [];
  List filteredData = [];
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void filterData(String value) {
    setState(() {
      // filteredData = responses.where((data) => data.name.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /*var future = Provider.of<AuthProvider>(context,listen: false).fetchCattleApi(widget.farmerId);
      future.then((value) {
        setState(() {
          filteredData = value.data;
        });
      });*/
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            Provider.of<AuthProvider>(context).fetchCattleApi(widget.farmerId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
          if (snapshots.connectionState == ConnectionState.none) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshots.hasError) {
            return Text("${snapshots.error}");
          } else if (snapshots.hasData) {
            return snapshots.data['data'] == null
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/image/emptyimage.png",
                          width: 70,
                          height: 70,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "No cattle available yet now",
                          textAlign: TextAlign.center,
                          style: robotoMedium.copyWith(
                              color: ColorResources.black, fontSize: 17),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshots.data['data'].length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.all(14),
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: const Color(0xff92C89C))),
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(AppConstants
                                        .Image +
                                    snapshots.data['data'][index]['photo'])),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  snapshots.data['data'][index]['cattle_name'],
                                  style: robotoMedium.copyWith(
                                      color: ColorResources.light_purple,
                                      fontSize: 20),
                                ),
                                Text(
                                  "Cattle Type:- " +
                                      snapshots.data['data'][index]
                                          ['cattle_type'],
                                  style: robotoRegular.copyWith(
                                      color: ColorResources.black,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Life Stage:- " +
                                      snapshots.data['data'][index]
                                          ['life_stage'],
                                  style: robotoRegular.copyWith(
                                      color: ColorResources.black,
                                      fontSize: 13),
                                ),
                                Text(
                                  "Age:- " +
                                      snapshots.data['data'][index]['age'],
                                  style: robotoRegular.copyWith(
                                      color: ColorResources.black,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ));
                    });
          } else {
            return Center(
              child: Text(
                "",
                style: TextStyle(
                    fontFamily: "Proxima Nova",
                    fontWeight: FontWeight.w600,
                    fontSize: 20 * MediaQuery.of(context).textScaleFactor),
              ),
            );
          }
        },
      ),
    );
  }
}
