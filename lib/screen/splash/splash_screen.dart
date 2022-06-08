import 'dart:async';

import 'package:CropSecure/screen/authscreen/login.dart';
import 'package:CropSecure/utill/images.dart';
import 'package:CropSecure/utill/sharedprefrence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _route();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _route() async {
    bool status = await SharedPrefManager.getBooleanPreferences() != null;
    Timer(const Duration(seconds: 3), () async {
      if (status) {
        Get.off(() => Dashboard(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 400));
      } else {
        Get.off(() => LoginScreen(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 400));
      }

      /*  if(status){
        // String loggedInUser = await SharedPrefManager.getPrefrenceString(AppConstants.LOGGEDINTYPE);
        // Get.off(() => AddNewAddress(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 400));
        if(loggedInUser == "USER"){
          Get.off(() => DashboardScreen(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 400));
          // Get.off(() => const NewHomePage(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 400));
        }else{
          Get.off(() => DashboardShopKeeper(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 400));
          // Get.off(() => WebViewExample(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 400));
        }
      }else{
        // Get.off(() => SelectSubscription(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 400));}
        Get.off(() => LoginScreen(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 400));}

      // Get.off(() => DashboardShopKeeper(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));}

      */ /*if(status){
      }else{
        Get.off(() => TypeOfUser(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
      }*/ /**/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Images.splashscreen), fit: BoxFit.cover)),
        ));
  }
}
