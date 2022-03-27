import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/dimensions.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Get.back();
          }, child: const Icon(Icons.arrow_back_ios_sharp,size: 22,color: Color(0xffffffff),)),
        titleSpacing: 0,
        title: Text("Order Summary",
          style: robotoBold.copyWith(color: const Color(0xffffffff),
              fontSize: 21),),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/image/equipment.png",
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        width: 100,
                        height: 100,),),

                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text("fgfgg",
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

                            Text("20/10/21",
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                style: robotoRegular.copyWith(
                                    color: const Color(0xff929292),
                                    overflow: TextOverflow.fade,
                                    fontWeight: FontWeight.w500,
                                    fontSize: Dimensions.text_12)),

                            const SizedBox(height: Dimensions.margin_10),


                            const Text('₹ '+"25",
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: ColorResources.text_cart_green_price,
                                    fontWeight: FontWeight.w600,
                                    fontSize: Dimensions.text_16,
                                    fontFamily: "Roboto")),
                          ],
                        ),
                      ),),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("OrderId: "+"323",
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: robotoMedium.copyWith(
                                color: const Color(0xff929292),
                                overflow: TextOverflow.fade,
                                fontWeight: FontWeight.w700,
                                fontSize: Dimensions.text_18)),
                      ],),
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 68,
                color: const Color(0xfff7f3f4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text("Payment",
                            style: robotoBold.copyWith(
                              color: const Color(0xffb9adb2),
                              fontSize: 14
                            ),),
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: Text("Payment Mode",
                              style: robotoBold.copyWith(
                                  color: const Color(0xffb9adb2),
                                  fontSize: 14
                              ),),
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: Text("Order Status",
                              style: robotoBold.copyWith(
                                  color: const Color(0xffb9adb2),
                                  fontSize: 14
                              ),),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15,),

                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text('₹ 25',
                              style: robotoBold.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 14
                              ),),
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: Text("Cash On Delivery",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 14
                              ),),
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: Text("Dispatched",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 14
                              ),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10,),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Row(
                     children: [

                       Expanded(
                         child: Container(
                           height: 1,
                           color: const Color(0xffdddddd),
                         ),
                       ),

                       const CircleAvatar(
                         maxRadius: 30,
                         backgroundColor: ColorResources.light_purple,
                         child: Icon(Icons.verified_user,
                           color: ColorResources.white,size: 30,),),

                       Expanded(
                         child: Container(
                           height: 1,
                           color: const Color(0xffdddddd),
                         ),
                       ),

                       const CircleAvatar(
                         maxRadius: 30,
                         backgroundColor: ColorResources.light_purple,
                         child: Icon(Icons.verified_user,
                           color: ColorResources.white,size: 30,),),

                       Expanded(
                         child: Container(
                           height: 1,
                           color: const Color(0xffdddddd),
                         ),
                       ),

                       const CircleAvatar(
                         maxRadius: 30,
                         backgroundColor: ColorResources.light_purple,
                         child: Icon(Icons.verified_user,
                           color: ColorResources.white,size: 30,),),

                       Expanded(
                         child: Container(
                           height: 1,
                           color: const Color(0xffdddddd),
                         ),
                       ),

                       const CircleAvatar(
                         maxRadius: 30,
                         backgroundColor: ColorResources.light_purple,
                         child: Icon(Icons.verified_user,
                           color: ColorResources.white,size: 30,),),

                       Expanded(
                         child: Container(
                           height: 1,
                           color: const Color(0xffdddddd),
                         ),
                       ),

                       const CircleAvatar(
                         maxRadius: 30,
                         backgroundColor: ColorResources.light_purple,
                         child: Icon(Icons.verified_user,
                           color: ColorResources.white,size: 30,),),

                       Expanded(
                         child: Container(
                           height: 1,
                           color: const Color(0xffdddddd),
                         ),
                       ),

                     ],
                   ),

                ],
              ),

              Container(
                margin: const EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                height: 105,
                color: const Color(0xfff7f3f4),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("Order Item(s)",
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

                              Text("loteam",
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  style: robotoRegular.copyWith(
                                      color: const Color(0xff929292),
                                      overflow: TextOverflow.fade,
                                      fontWeight: FontWeight.w500,
                                      fontSize: Dimensions.text_12)),

                              const SizedBox(height: Dimensions.margin_10),


                              const Text('Qnt '+" 25",
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: ColorResources.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.text_16,
                                      fontFamily: "Roboto")),
                            ],
                          ),
                        ),),

                      const Text('₹ '"25",
                         softWrap: false,
                         overflow: TextOverflow.fade,
                         textAlign: TextAlign.start,
                         style: TextStyle(
                             color: ColorResources.text_cart_green_price,
                             fontWeight: FontWeight.w600,
                             fontSize: Dimensions.text_16,
                             fontFamily: "Roboto")),
                    ],
                  ),
                )
              ),

              const SizedBox(height: 5,),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Fee",
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: robotoMedium.copyWith(
                          overflow: TextOverflow.fade,
                          fontWeight: FontWeight.w700,
                          fontSize: Dimensions.text_18,
                        )),

                    const Text('₹ '+"25",
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: ColorResources.text_cart_green_price,
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.text_16,
                            fontFamily: "Roboto")),

                  ],
                ),
              ),

              const SizedBox(height: 5,),

              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Amount to Pay",
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: robotoMedium.copyWith(
                          overflow: TextOverflow.fade,
                          fontWeight: FontWeight.w700,
                          fontSize: Dimensions.text_18,
                        )),

                    const Text('₹ '+"25",
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: ColorResources.text_cart_green_price,
                            fontWeight: FontWeight.w600,
                            fontSize: Dimensions.text_16,
                            fontFamily: "Roboto")),

                  ],
                ),
              ),

              const SizedBox(height: 30,),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/image/equipment.png",
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        width: 100,
                        height: 100,),),

                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text("fgfgg",
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

                            Text("20/10/21",
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                style: robotoRegular.copyWith(
                                    color: const Color(0xff929292),
                                    overflow: TextOverflow.fade,
                                    fontWeight: FontWeight.w500,
                                    fontSize: Dimensions.text_12)),

                            const SizedBox(height: Dimensions.margin_10),


                            const Text('₹ '+"25",
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: ColorResources.text_cart_green_price,
                                    fontWeight: FontWeight.w600,
                                    fontSize: Dimensions.text_16,
                                    fontFamily: "Roboto")),
                          ],
                        ),
                      ),),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("OrderId: "+"323",
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: robotoMedium.copyWith(
                                color: const Color(0xff929292),
                                overflow: TextOverflow.fade,
                                fontWeight: FontWeight.w700,
                                fontSize: Dimensions.text_18)),
                      ],),
                  ],
                ),
              ),

              const SizedBox(height: 5,),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 68,
                color: const Color(0xfff7f3f4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text("Payment",
                              style: robotoBold.copyWith(
                                  color: const Color(0xffb9adb2),
                                  fontSize: 14
                              ),),
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: Text("Payment Mode",
                              style: robotoBold.copyWith(
                                  color: const Color(0xffb9adb2),
                                  fontSize: 14
                              ),),
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: Text("Order Status",
                              style: robotoBold.copyWith(
                                  color: const Color(0xffb9adb2),
                                  fontSize: 14
                              ),),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15,),

                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text('₹ 25',
                              style: robotoBold.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 14
                              ),),
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: Text("Cash On Delivery",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 14
                              ),),
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: Text("Completed",
                              style: robotoBold.copyWith(
                                  color: ColorResources.light_purple,
                                  fontSize: 14
                              ),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
