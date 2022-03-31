import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Irrigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Irrigation",
          style: robotoBold.copyWith(color: Colors.white, fontSize: 19),
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: FutureBuilder(
          future: Provider.of<AuthProvider>(context, listen: false)
              .fetchIrrigation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  itemCount: snapshot.data['data'].length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const Divider(height: 2);
                  },
                  itemBuilder: (context, index) {
                    var data = snapshot.data['data'];
                    return SizedBox(
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/image/farmer.png",
                                width: 136,
                                height: 180,
                                fit: BoxFit.fill,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index]['name'],
                                style: robotoBold.copyWith(
                                    color: Colors.black, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                data[index]['package_type'],
                                style: robotoBold.copyWith(
                                    color: Colors.black, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                data[index]['mrp'],
                                style: robotoBold.copyWith(
                                    color: Colors.black, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Description",
                                style: robotoBold.copyWith(
                                    color: Colors.black, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                data[index]['description'],
                                style:
                                    robotoLight.copyWith(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Buy Now",
                                        style: robotoBold.copyWith(),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Rent",
                                        style: robotoBold.copyWith(),
                                      )),
                                ],
                              )
                            ],
                          )),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          }),
    );
  }
}
