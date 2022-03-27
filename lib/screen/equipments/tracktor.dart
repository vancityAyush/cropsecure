import 'package:cropsecure/data/model/response/responsefamer.dart';
import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/dimensions.dart';
import 'package:cropsecure/utill/sharedprefrence.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class Tractor extends StatefulWidget {

  final String category;
  Tractor(this.category);

  @override
  State<Tractor> createState() => _TractorState();
}

class _TractorState extends State<Tractor> {

  bool isLoad = false;
  var formatDate,formatDates;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1940),
      lastDate: DateTime(2035),);

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formatDate = selectedDate.year.toString() + "/"+selectedDate.month.toString() + "/" +selectedDate.day.toString();
      });
    }
  }

  _selectDateTo(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1940),
      lastDate: DateTime(2035),);

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formatDates = selectedDate.year.toString() + "/"+selectedDate.month.toString() + "/" +selectedDate.day.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("Tractor",
          style: robotoBold.copyWith(color: Colors.white,
              fontSize: 19),),
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
            future: Provider.of<AuthProvider>(context).fetchTracktorApi(widget.category),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
              if(snapshots.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),);
              } else if (snapshots.hasError) {
                return Text("${snapshots.error}");}
              else{
                if(snapshots.data['error_code'].toString() == "0"){
                  return Center(child: Text("No details available",
                    style: TextStyle(
                        fontFamily: "Proxima Nova",
                        fontWeight: FontWeight.w600,
                        fontSize: 20*MediaQuery.of(context).textScaleFactor
                    ),),);
                }else{
                  if(snapshots.hasData){
                    return ListView.separated(
                      itemCount: snapshots.data['data'].length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context,index){
                        return const Divider(
                            height: 2);},
                      itemBuilder: (context,index){
                        return SizedBox(
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset("assets/image/farmer.png",
                                    width: 136,height: 180,
                                    fit: BoxFit.fill,)),

                              const SizedBox(width: 20,),

                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshots.data['data'][index]['name'],style: robotoBold.copyWith(
                                      color: Colors.black,
                                      fontSize: 17
                                  ),),

                                  const SizedBox(height: 2,),

                                  Text("Package type:- "+snapshots.data['data'][index]['package_type'],
                                    style: robotoBold.copyWith(
                                        color: Colors.black,
                                        fontSize: 17
                                    ),),

                                  const SizedBox(height: 2,),

                                  Text("Price:- "+snapshots.data['data'][index]['mrp'],style: robotoBold.copyWith(
                                      color: Colors.black,
                                      fontSize: 17
                                  ),),

                                  const SizedBox(height: 2,),

                                  Text("Description",style: robotoBold.copyWith(
                                      color: Colors.black,
                                      fontSize: 17
                                  ),),

                                  const SizedBox(height: 2,),

                                  Text(snapshots.data['data'][index]['description'],
                                    style: robotoLight.copyWith(
                                        color: Colors.black
                                    ),),

                                  const SizedBox(
                                    height: 7),

                                  ElevatedButton(
                                      onPressed: ()async{
                                        await SharedPrefManager.savePrefString(AppConstants.productName, snapshots.data['data'][index]['id'].toString());
                                        showModalBottomSheet(
                                          elevation: 20,
                                          context: context,
                                          builder: (context) => SizedBox(
                                            height: MediaQuery.of(context).size.height*0.23,
                                            child: FutureBuilder(
                                              future: Provider.of<AuthProvider>(context).fetchFarmerApi(),
                                              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
                                                ResponseFarmer response = snapshots.data;
                                                if(snapshots.connectionState == ConnectionState.none) {
                                                  return const Center(
                                                    child: CircularProgressIndicator(),);
                                                } else if (snapshots.hasError) {
                                                  return Text("${snapshots.error}");}
                                                else
                                                if(snapshots.hasData){
                                                  ResponseFarmer responseFarmer = snapshots.data;
                                                  return Stack(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(top:20.0),
                                                        child: Align(
                                                          alignment: Alignment.topCenter,
                                                          child: Text("Select Framer",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 19*MediaQuery.of(context).textScaleFactor,
                                                                letterSpacing: 1,
                                                                color: Colors.black87
                                                            ),),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: Row(
                                                          children: <Widget>[

                                                            Container(
                                                              margin: const EdgeInsets.only(top: 35,left: 13,right: 8.0),
                                                              width: 35,
                                                              height: 35,
                                                              child: FittedBox(
                                                                child: FloatingActionButton(
                                                                  child: const Icon(Icons.add, color: Colors.white, size: 32,),
                                                                  backgroundColor: Colors.blue,
                                                                  onPressed: (){
                                                                    // Get.to(() => AddPatientDetails(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                                                                  },
                                                                  elevation: 5,
                                                                  splashColor: Colors.grey,
                                                                ),
                                                              ),
                                                            ),

                                                            Flexible(
                                                              child: ListView.builder(
                                                                  scrollDirection: Axis.horizontal,
                                                                  itemCount: response.data.length,
                                                                  itemBuilder: (context, index) {
                                                                    return GestureDetector(
                                                                      onTap: () async{
                                                                        Navigator.of(context).pop();
                                                                        await SharedPrefManager.savePrefString(AppConstants.farmerId, response.data[index].id);
                                                                        showModalBottomSheet(
                                                                          elevation: 20,
                                                                          context: context,
                                                                          builder: (context) => SizedBox(
                                                                            height: MediaQuery.of(context).size.height*0.23,
                                                                            child: FutureBuilder(
                                                                              future: Provider.of<AuthProvider>(context).fetchPlotsApi(),
                                                                              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshots) {
                                                                                if(snapshots.connectionState == ConnectionState.none) {
                                                                                  return const Center(
                                                                                    child: CircularProgressIndicator(),);
                                                                                } else if (snapshots.hasError) {
                                                                                  return Text("${snapshots.error}");
                                                                                } else
                                                                                if(snapshots.hasData){
                                                                                  return Stack(
                                                                                    children: <Widget>[
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(top:20.0),
                                                                                        child: Align(
                                                                                          alignment: Alignment.topCenter,
                                                                                          child: Text("Select Plot",
                                                                                            style: TextStyle(
                                                                                                fontWeight: FontWeight.bold,
                                                                                                fontSize: 19*MediaQuery.of(context).textScaleFactor,
                                                                                                letterSpacing: 1,
                                                                                                color: Colors.black87
                                                                                            ),),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: Alignment.center,
                                                                                        child: Row(
                                                                                          children: <Widget>[
                                                                                            Container(
                                                                                              margin: const EdgeInsets.only(top: 35,left: 13,right: 8.0),
                                                                                              width: 35,
                                                                                              height: 35,
                                                                                              child: FittedBox(
                                                                                                child: FloatingActionButton(
                                                                                                  child: const Icon(Icons.add, color: Colors.white, size: 32,),
                                                                                                  backgroundColor: Colors.blue,
                                                                                                  onPressed: (){
                                                                                                    // Get.to(() => AddPatientDetails(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                                                                                                  },
                                                                                                  elevation: 5,
                                                                                                  splashColor: Colors.grey,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Flexible(
                                                                                              child: ListView.builder(
                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                  itemCount: snapshots.data['data'].length,
                                                                                                  itemBuilder: (context, index) {
                                                                                                    return GestureDetector(
                                                                                                      onTap: () async{
                                                                                                        await SharedPrefManager.savePrefString(AppConstants.plotId, snapshots.data['data'][index]['id'].toString());
                                                                                                        Navigator.of(context).pop();
                                                                                                        showDialog(
                                                                                                            context: context, builder: (builder) =>
                                                                                                            StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
                                                                                                              return Dialog(
                                                                                                                elevation: 5,
                                                                                                                insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                                                                                                                child: SizedBox(
                                                                                                                  height: 200,
                                                                                                                  width: MediaQuery.of(context).size.width,
                                                                                                                  child: Column(
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [

                                                                                                                      Text("Are You sure to ${widget.category} this product?",
                                                                                                                          softWrap: false,
                                                                                                                          overflow: TextOverflow.ellipsis,
                                                                                                                          textAlign: TextAlign.start,
                                                                                                                          maxLines: 1,
                                                                                                                          style: robotoMedium.copyWith(
                                                                                                                            overflow: TextOverflow.fade,
                                                                                                                            fontWeight: FontWeight.w700,
                                                                                                                            fontSize: Dimensions.text_18,
                                                                                                                          )),

                                                                                                                      const SizedBox(height: Dimensions.margin_10),

                                                                                                                      if(widget.category == "Rent")
                                                                                                                        Padding(
                                                                                                                          padding: const EdgeInsets.only(left: 12.0,right: 12),
                                                                                                                          child: Row(
                                                                                                                            children: [
                                                                                                                              Expanded(
                                                                                                                                flex: 1,
                                                                                                                                child: InkWell(
                                                                                                                                  onTap: ()async{
                                                                                                                                    final DateTime picked = await showDatePicker(
                                                                                                                                      context: context,
                                                                                                                                      initialDate: selectedDate, // Refer step 1
                                                                                                                                      firstDate: DateTime(1940),
                                                                                                                                      lastDate: DateTime(2035),);

                                                                                                                                    if (picked != null && picked != selectedDate) {
                                                                                                                                      setState(() {
                                                                                                                                        selectedDate = picked;
                                                                                                                                        formatDate = selectedDate.year.toString() + "/"+selectedDate.month.toString() + "/" +selectedDate.day.toString();
                                                                                                                                      });
                                                                                                                                    }
                                                                                                                                    },
                                                                                                                                  child: Container(
                                                                                                                                    height: 45,
                                                                                                                                    color: ColorResources.light_purple,
                                                                                                                                    child: Row(
                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                      children: [
                                                                                                                                        Text(formatDate ?? "From date",
                                                                                                                                          style: robotoMedium.copyWith(
                                                                                                                                              fontSize: 17,
                                                                                                                                              color: Colors.white),),
                                                                                                                                        Padding(
                                                                                                                                            padding: const EdgeInsets.only(left: 10.0),
                                                                                                                                            child: Image.asset("assets/image/calender.png",
                                                                                                                                              color: Colors.white,
                                                                                                                                              width: 25,height: 25,)),

                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),

                                                                                                                              const SizedBox(width: 20,),

                                                                                                                              Expanded(
                                                                                                                                flex: 1,
                                                                                                                                child: InkWell(
                                                                                                                                  onTap: ()async{
                                                                                                                                    final DateTime picked = await showDatePicker(
                                                                                                                                      context: context,
                                                                                                                                      initialDate: selectedDate, // Refer step 1
                                                                                                                                      firstDate: DateTime(1940),
                                                                                                                                      lastDate: DateTime(2035),);

                                                                                                                                    if (picked != null && picked != selectedDate) {
                                                                                                                                      setState(() {
                                                                                                                                        selectedDate = picked;
                                                                                                                                        formatDates = selectedDate.year.toString() + "/"+selectedDate.month.toString() + "/" +selectedDate.day.toString();
                                                                                                                                      });
                                                                                                                                    }
                                                                                                                                    },
                                                                                                                                  child: Container(
                                                                                                                                    height: 45,
                                                                                                                                    color: ColorResources.light_purple,
                                                                                                                                    child: Row(
                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                      children: [
                                                                                                                                        Text(formatDates ?? "To date",
                                                                        style: robotoMedium.copyWith(
                                                                            fontSize: 17,
                                                                            color: Colors.white),),

                                                                      Padding(
                                                                          padding: const EdgeInsets.only(left: 10.0),
                                                                          child: Image.asset("assets/image/calender.png",
                                                                            color: Colors.white,
                                                                            width: 25,height: 25,)),

                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                                                                                      Padding(
                                                                                                                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                                                                                                                        child: Row(
                                                                                                                          children: [

                                                                                                                            if(isLoad)
                                                                                                                              const Center(
                                                                                                                                child: SizedBox(
                                                                                                                                    width: 30,
                                                                                                                                    height: 30, child: CircularProgressIndicator()),
                                                                                                                              )
                                                                                                                            else
                                                                                                                              Expanded(
                                                                                                                                flex: 1,
                                                                                                                                child: InkWell(
                                                                                                                                  onTap: ()async{
                                                                                                                                    setState(() {
                                                                                                                                      isLoad = true;});

                                                                                                                                    await Provider.of<AuthProvider>(context,listen: false).orderNowApi(snapshots.data['data'][index]['name'], widget.category,formatDate,formatDates);

                                                                                                                                    setState(() {
                                                                                                                                      isLoad = false;});

                                                                                                                                    },
                                                                                                                                  child: Container(
                                                                                                                                    height: 40,
                                                                                                                                    margin: const EdgeInsets.fromLTRB(10, 12, 0, 0),
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      border: Border.all(color: ColorResources.light_purple),
                                                                                                                                      color: ColorResources.light_purple,
                                                                                                                                      borderRadius: BorderRadius.circular(20),),
                                                                                                                                    child: Center(
                                                                                                                                      child: Text("Yes",
                                                                                                                                        style: robotoExtraBold.copyWith(fontSize: 13,
                                                                                                                                            color: const Color(0xffffffff)),),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),

                                                                                                                            const SizedBox(width: 18,),


                                                                                                                            Expanded(
                                                                                                                              flex: 1,
                                                                                                                              child: InkWell(
                                                                                                                                onTap: (){
                                                                  // Get.offAll(DashboardScreen());
                                                                                                                                },
                                                                                                                                child: Container(
                                                                                                                                  height: 40,
                                                                                                                                  margin: const EdgeInsets.fromLTRB(0, 12, 10, 0),
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    border: Border.all(color: ColorResources.light_purple),
                                                                                                                                    borderRadius: BorderRadius.circular(20),),
                                                                                                                                  child: Center(
                                                                                                                                    child: Text("No",

                                                                                                                                      style: robotoExtraBold.copyWith(fontSize: 13,
                                                                                                                                          color: Colors.black),),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                shape: const RoundedRectangleBorder(
                                                                                                                    borderRadius: BorderRadius.all(
                                                                                                                        Radius.circular(12.0))),
                                                                                                              );
                                                                                                              },
                                                                                                            )
                                                                                                        );
                                                                                                      },

                                                                                                      child: SizedBox(
                                                                                                        width: MediaQuery.of(context).size.width*0.35,
                                                                                                        child: Card(
                                                                                                          shape: RoundedRectangleBorder(
                                                                                                              borderRadius: BorderRadius.circular(10)
                                                                                                          ),
                                                                                                          margin: const EdgeInsets.fromLTRB(10, 60, 10, 21),
                                                                                                          elevation: 20,
                                                                                                          child: Column(
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: <Widget>[
                                                                                                              CircleAvatar(
                                                                                                                  radius: 24,
                                                                                                                  backgroundColor: const Color(0xff00A858),
                                                                                                                backgroundImage: NetworkImage(AppConstants.Image+snapshots.data['data'][index]['farmer_plot']),
                                                                                                                  ),
                                                                                                              const SizedBox(height: 6,),
                                                                                                              Align(
                                                                                                                alignment: Alignment.center,
                                                                                                                child: Text(snapshots.data['data'][index]['soil_type'],
                                                                                                                    style: robotoBold.copyWith(
                                                                                                                        color: const Color(0xff262626),
                                                                                                                        fontSize: 14
                                                                                                                    )),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
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
                                                                          ),
                                                                        );
                                                                      },

                                                                      child: SizedBox(
                                                                        width: MediaQuery.of(context).size.width*0.35,
                                                                        child: Card(
                                                                          shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(10)
                                                                          ),
                                                                          margin: const EdgeInsets.fromLTRB(10, 60, 10, 21),
                                                                          elevation: 20,
                                                                          child: Column(
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: <Widget>[
                                                                              CircleAvatar(
                                                                                radius: 24,
                                                                                backgroundColor: const Color(0xff00A858),
                                                                                child: Text(responseFarmer.data[index].name.isEmpty?"":responseFarmer.data[index].name[0],
                                                                                  style: robotoBold.copyWith(
                                                                                      color: const Color(0xffffffff),
                                                                                      fontSize: 14
                                                                                  ))),
                                                                              const SizedBox(height: 6,),
                                                                              Align(
                                                                                alignment: Alignment.center,
                                                                                child: Text(responseFarmer.data[index].name,
                                                                                    style: robotoBold.copyWith(
                                                                                        color: const Color(0xff262626),
                                                                                        fontSize: 14
                                                                                    )),
                                                                              ),
                                                                              const SizedBox(height: 8,),
                                                                              Text(responseFarmer.data[index].gender,
                                                                                  style: robotoBold.copyWith(
                                                                                      color: Colors.grey,
                                                                                      fontSize: 11
                                                                                  )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
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
                                          ),
                                        );
                                      }, child: Text(widget.category,
                                    style: robotoBold.copyWith())),
                                ],
                              )),
                            ],
                          ),
                        );
                      },
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
      ),
    );
  }
}
