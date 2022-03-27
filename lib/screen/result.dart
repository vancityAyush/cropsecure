import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 8,
          itemBuilder: (context,index){
            return Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 45,
                            color: ColorResources.light_purple,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Result ID: 56536",
                                  style: robotoMedium.copyWith(
                                      fontSize: 17,
                                      color: Colors.white),),

                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 45,
                            color: ColorResources.light_purple,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Date: 01/02/2022",
                                  style: robotoMedium.copyWith(
                                      fontSize: 17,
                                      color: Colors.white),),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xfff7f3f4),
                              border: Border.all(color: const Color(0xffe9e9e9),
                            )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Yield Amount:",
                                  style: robotoMedium.copyWith(
                                      fontSize: 17,
                                      color: Colors.black),),

                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorResources.light_purple,
                                width: 1)),
                            height: 45,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("",
                                  style: robotoMedium.copyWith(
                                      fontSize: 17,
                                      color: Colors.black),),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                color: const Color(0xfff7f3f4),
                                border: Border.all(color: const Color(0xffe9e9e9),
                                )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Expenses & Input:",
                                  style: robotoMedium.copyWith(
                                      fontSize: 17,
                                      color: Colors.black),),

                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorResources.light_purple,
                                    width: 1)),
                            height: 45,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("",
                                  style: robotoMedium.copyWith(
                                      fontSize: 17,
                                      color: Colors.black),),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),

                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                color: const Color(0xfff7f3f4),
                                border: Border.all(color: const Color(0xffe9e9e9),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Final Amount:",
                                  style: robotoMedium.copyWith(
                                      fontSize: 17,
                                      color: Colors.black),),

                                Text("(Yield-Expenses & Input)",
                                  style: robotoMedium.copyWith(
                                      fontSize: 11,
                                      color: Colors.grey),),

                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 20,),

                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorResources.light_purple,
                                    width: 1)),
                            height: 45,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("",
                                  style: robotoMedium.copyWith(
                                      fontSize: 17,
                                      color: Colors.black),),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            );
          }),
    );
  }
}
