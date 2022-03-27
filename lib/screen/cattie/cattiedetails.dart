import 'package:cropsecure/screen/addfarmer/addplots.dart';
import 'package:cropsecure/screen/addfarmer/viewplots.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cattieshed.dart';

class CattieDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("Cattie Info",
          style: robotoBold.copyWith(color: Colors.white,
              fontSize: 19),),
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,))
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/image/cows.png",height: 280,),

            Text("Amaresh",
              style: robotoBold.copyWith(
                  color: const Color(0xff262626),
                  fontSize: 16
              ),),

            Text("A00022112",
              style: robotoRegular.copyWith(
                  color: const Color(0xffb8b8b8),
                  fontSize: 10
              ),),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Info",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 16
                ),),
            ),

            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xffb7b7b7))),
              child: Column(
                children: [
                  Row(
                    children: [

                      const Icon(Icons.add_location),

                      Text("Address",
                        style: robotoRegular.copyWith(
                            color: const Color(0xff262626)
                        ),),


                    ],
                  ),

                  Text("Amaresh, Pujar, Dhanapur , Hosapur Bareily Karnataka India Asia",
                    style: robotoRegular.copyWith(
                        color: const Color(0xff262626),
                        fontSize: 12
                    ),),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [

                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text("Gender",
                              style: robotoRegular.copyWith(
                                  color: const Color(0xff262626)
                              ),),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text("Date of Birth",
                              style: robotoRegular.copyWith(
                                  color: const Color(0xff262626)
                              ),),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text("Age",
                              style: robotoRegular.copyWith(
                                  color: const Color(0xff262626)
                              ),),
                          ),
                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [

                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text("Male",
                              style: robotoRegular.copyWith(
                                color: const Color(0xff262626),
                              ),),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text("16/11/1982",
                              style: robotoRegular.copyWith(
                                  color: const Color(0xff262626)
                              ),),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text("38",
                              style: robotoRegular.copyWith(
                                  color: const Color(0xff262626)
                              ),),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),

            Card(
              elevation: 7,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [

                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [

                                  Image.asset("assets/image/input.png",width: 40,height: 40,),

                                  Center(
                                    child: Text("Cattie \nDoctor",
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 17
                                      ),),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              height: 2,
                              width: 80,
                              color: const Color(0xffd4d4d4),
                            ),

                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Image.asset("assets/image/input.png",width: 40,height: 40,),

                                  Center(
                                    child: Text("Calf",
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 17
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 2,
                        height: 200,
                        color: const Color(0xffc4c4c4),
                      ),

                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [

                                  Image.asset("assets/image/input.png",width: 40,height: 40,),

                                  Center(
                                    child: Text("Cattie Advisory \n& Alert",
                                      textAlign: TextAlign.center,
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 17
                                      ),),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              height: 2,
                              width: 80,
                              color: const Color(0xffd4d4d4),
                            ),

                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: (){
                                  Get.to(() => CattieShed(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Image.asset("assets/image/input.png",width: 40,height: 40,),

                                    Center(
                                      child: Text("Experts",
                                        style: robotoBold.copyWith(
                                            color: const Color(0xff262626),
                                            fontSize: 17
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 2,
                        height: 200,
                        color: const Color(0xffc4c4c4),
                      ),

                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [

                                  Image.asset("assets/image/input.png",width: 40,height: 40,),

                                  Center(
                                    child: Text("Cattie Feed",
                                      style: robotoBold.copyWith(
                                          color: const Color(0xff262626),
                                          fontSize: 17
                                      ),),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              height: 2,
                              width: 80,
                              color: const Color(0xffd4d4d4),
                            ),

                            const Expanded(
                              flex: 1,
                              child: Text("")
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}