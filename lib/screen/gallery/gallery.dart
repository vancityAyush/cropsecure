import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/screen/gallery/gallery_images.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class GovtSchemas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Govt Schemas",
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
          future:
              Provider.of<AuthProvider>(context, listen: false).fetchGallery(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> folders = snapshot.data['data'];
              return SingleChildScrollView(
                child: Column(
                  children: [
                    for (var item in folders)
                      ListTile(
                        title: Text(item['folder']['name'],
                            style: robotoBold.copyWith(fontSize: 20)),
                        leading:
                            Icon(Icons.folder, color: Colors.blue, size: 70),
                        onTap: () {
                          Get.to(
                            GalleryImages(item),
                          );
                        },
                      ),
                  ],
                ),
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
