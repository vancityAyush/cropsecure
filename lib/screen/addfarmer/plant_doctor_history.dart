import 'dart:ui';

import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PlantDoctorHistory extends StatelessWidget {
  PlantDoctorHistory(this.plotId);
  bool isLoading = false;
  String plotId;

  get data => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Plant Doctory History",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: FutureBuilder(
            future: Provider.of<AuthProvider>(context, listen: false)
                .fetchPlantDoctor(plotId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var res = snapshot.data['data'];
                return ListView.builder(
                  itemCount: res.length,
                  itemBuilder: (context, index) {
                    var itemData = res[index];
                    return Row(children: [
                      Image.network(
                        AppConstants.Image + itemData['image'],
                        width: 100,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(itemData['comment'],
                          style: robotoBold.copyWith(
                              color: ColorResources.light_purple,
                              fontSize: 18)),
                    ]);
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
