import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LabHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Provider.of<AuthProvider>(context).fetchLabAnalysisAPi(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
            if(snapshots.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),);
            } else if (snapshots.hasError) {
              return Text("${snapshots.error}");
            }else{
              if(snapshots.data['error_code'].toString() == "0"){
                return Center(child: Text("No lab analysis available",
                  style: TextStyle(
                      fontFamily: "Proxima Nova",
                      fontWeight: FontWeight.w600,
                      fontSize: 20*MediaQuery.of(context).textScaleFactor
                  ),),);
            }else{
              if(snapshots.hasData){
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshots.data['data'].length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15.0,10,15,10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${snapshots.data['data'][index]['sample_quality']} (${snapshots.data['data'][index]['sample_date']})",
                                  style: robotoBold.copyWith(
                                      color: const Color(0xff9b9b9b),
                                      fontSize: 17
                                  ),),

                                const SizedBox(height: 7,),

                                Text("Result not received",
                                  style: robotoBold.copyWith(
                                      color: const Color(0xff9b9b9b),
                                      fontSize: 17
                                  ),),

                                const SizedBox(height: 5,),

                                const Divider(
                                  height: 2,
                                  thickness: 2,
                                )


                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }else{
                return Center(child: Text("",
                  style: TextStyle(
                      fontFamily: "Proxima Nova",
                      fontWeight: FontWeight.w600,
                      fontSize: 20*MediaQuery.of(context).textScaleFactor
                  ),),);
              }
            }
          }
        }
      ),
    );
  }
}
