import 'package:cropsecure/utill/app_constants.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryImages extends StatelessWidget {
  var item;
  GalleryImages(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Text(
            item['folder']['name'] ?? '',
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
        body: SingleChildScrollView(
          child: Wrap(
            children: [
              for (var i in item['items'])
                Container(
                  margin: EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      AppConstants.Image + i['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
