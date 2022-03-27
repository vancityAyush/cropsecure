import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../provider/authprovider.dart';

class Geotag extends StatefulWidget {
  dynamic data;
  Geotag(this.data);

  @override
  State<Geotag> createState() => _GeotagState();
}

class _GeotagState extends State<Geotag> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Geo Tag",
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/map.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () async {
                //fetch location from device
                setState(() {
                  isLoading = true;
                });
                var res =
                    await Provider.of<AuthProvider>(context, listen: false)
                        .updateLocation("10", "20", widget.data);
                if (res.isSuccess)
                  setState(() {
                    isLoading = false;
                  });
                //show toast
                // Fluttertoast.showToast(msg: "Location Added Successfully");
              },
              child: isLoading
                  ? CircularProgressIndicator()
                  : Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 60,
                        ),
                        Text(
                          "Geo Tag",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
