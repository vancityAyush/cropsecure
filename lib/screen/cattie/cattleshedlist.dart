import 'package:cropsecure/data/model/response/responsefamer.dart';
import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/screen/addfarmer/farmerdetail.dart';
import 'package:cropsecure/screen/cattie/cattlelist.dart';
import 'package:cropsecure/screen/dashboard.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/dimensions.dart';
import 'package:cropsecure/utill/sharedprefrence.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CattleShedList extends StatefulWidget {

  final String farmerId;
  CattleShedList(this.farmerId);

  // void _launchURL(String url) async =>
  //     await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  @override
  State<CattleShedList> createState() => _CattleShedListState();
}

class _CattleShedListState extends State<CattleShedList> {
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

  void filterData(String value){
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
    super.initState();}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<AuthProvider>(context).fetchCattleShedApi(widget.farmerId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
          if(snapshots.connectionState == ConnectionState.none) {
            return const Center(
              child: CircularProgressIndicator(),);
          } else if (snapshots.hasError) {
            return Text("${snapshots.error}");}
          else
          if(snapshots.hasData){
            return snapshots.data['data'] == null ?
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/image/emptyimage.png",
                    width: 70,
                    height: 70,),
                  const SizedBox(height: 10,),
                  Text("No cattle available yet now",
                    textAlign: TextAlign.center,
                    style: robotoMedium.copyWith(
                        color: ColorResources.black,
                        fontSize: 17
                    ),)
                ],
              ),
            ):ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshots.data['data'].length,
                itemBuilder: (context,index){
                  return Container(
                      margin: const EdgeInsets.all(14),
                      padding: const EdgeInsets.only(top: 15,bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xff92C89C))),
                      child: ListTile(

                        // title: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text("Shed Name:- "+snapshots.data['data'][index]['shed_name'],
                        //       style: robotoRegular.copyWith(
                        //           color: ColorResources.black,
                        //           fontSize: 13
                        //       ),),
                        //
                        //     Text("Shed Name:- "+snapshots.data['data'][index]['shed_name'],
                        //       style: robotoRegular.copyWith(
                        //           color: ColorResources.black,
                        //           fontSize: 13
                        //       ),),
                        //   ],
                        // ),

                        subtitle: Column(
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Shed Name:- ",
                                  style: robotoBold.copyWith(
                                      color: ColorResources.black,
                                      fontSize: 14
                                  ),),

                                Text(snapshots.data['data'][index]['shed_name'],
                                  style: robotoRegular.copyWith(
                                      color: ColorResources.black,
                                      fontSize: 15
                                  ),),
                              ],
                            ),

                            const SizedBox(height: 10,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text("Below Shed Name:- ",
                                  style: robotoBold.copyWith(
                                      color: ColorResources.black,
                                      fontSize: 14
                                  ),),

                                Text(snapshots.data['data'][index]['below_shed_name'],
                                  style: robotoRegular.copyWith(
                                      color: ColorResources.black,
                                      fontSize: 15
                                  ),),
                              ],
                            ),

                            const SizedBox(height: 10,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Shed Geo Tag:- ",
                                  style: robotoBold.copyWith(
                                      color: ColorResources.black,
                                      fontSize: 14
                                  ),),

                                Text(snapshots.data['data'][index]['shed_geo_tag'],
                                  style: robotoRegular.copyWith(
                                      color: ColorResources.black,
                                      fontSize: 15
                                  ),),
                              ],
                            ),
                          ],
                        ),
                      )
                  );
                }
            );
          }else{
            return Center(child: Text("",
              style: TextStyle(
                  fontFamily: "Proxima Nova",
                  fontWeight: FontWeight.w600,
                  fontSize: 20*MediaQuery.of(context).textScaleFactor
              ),),);
          }
        },
      ),
    );
  }
}