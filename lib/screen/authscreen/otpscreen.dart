import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/dimensions.dart';
import 'package:cropsecure/utill/fieldstyle.dart';
import 'package:cropsecure/utill/images.dart';
import 'package:cropsecure/utill/otp_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {

  final String user;
  OtpScreen(this.user);

  @override
  State<StatefulWidget> createState() => _OtpScreen();
}

class _OtpScreen extends State<OtpScreen> {
  String otp = Get.arguments;
  String stringPhone, stringEmailId, stringOtp="";
  bool isLoad = false;
  int otpNumber;
  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message),
        backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // action to be performed after OTP validation is success
  void moveToNextScreen(context) {
/*    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));*/
  }

  @override
  Widget build(BuildContext context) {
    ///Head Logo

    final headLogo = SizedBox(
      child: Image.asset(Images.logo,
          fit: BoxFit.contain, width: 99, height: 99));

    /// Title Head Logo
    final titleHeadLogo = Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(color: ColorResources.light_purple),
                    children: [
                      TextSpan(
                          text: 'C',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: Dimensions.text_36,
                              fontFamily: "Roboto")),
                    ]),
              ),
            ),
            SizedBox(
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(color: ColorResources.black),
                    children: [
                      TextSpan(
                          text: 'rop',
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: Dimensions.text_25,
                              fontFamily: "Roboto")),
                    ]),
              ),
            ),
            SizedBox(
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(color: ColorResources.light_purple),
                    children: [
                      TextSpan(
                          text: 'S',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: Dimensions.text_36,
                              fontFamily: "Roboto")),
                    ]),
              ),
            ),
            SizedBox(
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(color: ColorResources.black),
                    children: [
                      TextSpan(
                          text: 'ecure',
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: Dimensions.text_25,
                              fontFamily: "Roboto")),
                    ]),
              ),
            )
          ],
        ));

    /// Verify Head Title
    final verifyHeadTitle = Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: const TextSpan(
              style: TextStyle(color: ColorResources.grey_text),
              children: [
                TextSpan(
                    text: "Verify your account",
                    style: TextStyle(
                        color: ColorResources.grey_text,
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.text_22,
                        fontFamily: "Roboto")),
              ]),
        ),
      ),
    );

    /// Verify SubHead Title
    final verifySubHeadTitle = Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: const TextSpan(
              style: TextStyle(color: ColorResources.grey_text),
              children: [
                TextSpan(
                    text: "We have received 5 digit verification code on your registered Email & Mobile number to verify your account",
                    style: TextStyle(
                        color: ColorResources.grey_text,
                        fontWeight: FontWeight.w100,
                        fontSize: Dimensions.text_14,
                        fontFamily: "Roboto")),
              ]),
        ),
      ),
    );

    /// Verification Title
    final verificationTitle = Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: const TextSpan(
              style: TextStyle(color: ColorResources.light_purple),
              children: [
                TextSpan(
                    text: "Verification Code",
                    style: TextStyle(
                        color: ColorResources.light_purple,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.text_15,
                        fontFamily: "Roboto")),
              ]),
        ),
      ),
    );

    /// Otp Field Design
    final otpView = Container(
      height: 42.0,
      decoration: BoxDecoration(
          border: Border.all(
            color: ColorResources.light_purple,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(26))),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: 20,
              child: OTPTextField(
                length: 5,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 42,
                fieldStyle: FieldStyle.underline,
                style: const TextStyle(fontSize: Dimensions.text_14),
                onChanged: (pin){
                  stringOtp = pin;
                  print("Completed: " + pin);
                },
                onCompleted: (pin) {

                },
              ))),
    );

    /// Resend Title
    final resendTitle = InkWell(
      onTap: () async {

      },
      child: Container(
        margin: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 12),
        child: RichText(
          text: const TextSpan(
              style: TextStyle(color: ColorResources.light_purple),
              children: [
                TextSpan(
                    text: "Resend",
                    style: TextStyle(
                        color: ColorResources.light_purple,
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.text_16,
                        fontFamily: "Roboto")),
              ]),
        ),
      ),
    );

    void showSnackBar(String message) {
      final snackBar = SnackBar(content: Text(message),
          backgroundColor: Colors.red);

      // Find the Scaffold in the Widget tree and use it to show a SnackBar!
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    /// Verify Button
    final verifyButton = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26.0),
      ),
      onPressed: () async {
        if(stringOtp == "" && stringOtp.length<=5){
          showSnackBar("Please enter valid otp.");
        }else{
          showSnackBar("otp.");
        }

      },
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      color: ColorResources.light_purple,
      child: const Text('Verify',
          style: TextStyle(
              color: ColorResources.white,
              fontWeight: FontWeight.normal,
              fontSize: Dimensions.text_13,
              fontFamily: "Roboto")),
    );

    // TODO: implement build
    return Scaffold(
        backgroundColor: ColorResources.white,
        body: Padding(
            padding: const EdgeInsets.only(top: Dimensions.padding_18),
            child: SizedBox(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  children: <Widget>[
                    const SizedBox(height: Dimensions.margin_80),
                    headLogo,
                    const SizedBox(height: Dimensions.margin_18),
                    titleHeadLogo,
                    const SizedBox(height: Dimensions.margin_18),
                    verifyHeadTitle,
                    verifySubHeadTitle,
                    const SizedBox(height: Dimensions.margin_3),
                    verificationTitle,
                    const SizedBox(height: Dimensions.margin_8),
                    Container(
                      height: 42.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorResources.light_purple,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(26))),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: 20,
                              child: OTPTextField(
                                length: 5,
                                width: MediaQuery.of(context).size.width,
                                textFieldAlignment: MainAxisAlignment.spaceAround,
                                fieldWidth: 42,
                                fieldStyle: FieldStyle.underline,
                                style: const TextStyle(fontSize: Dimensions.text_14),
                                onChanged: (pin){
                                  stringOtp = pin;
                                  print("Completed: " + pin);},
                                onCompleted: (pin) {

                                },
                              ))),
                    ),
                    const SizedBox(height: Dimensions.margin_8),
                    resendTitle,
                    const SizedBox(height: Dimensions.margin_18),
                    if(isLoad)
                      const Center(child: SizedBox(
                          width:40,height: 40,child: CircularProgressIndicator()))
                    else
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26.0),
                      ),
                      onPressed: () async {
                        print(stringOtp);
                        if(otp.toString() == stringOtp){
                          setState(() {
                            isLoad = true;
                          });
                          await Provider.of<AuthProvider>(context,listen: false).verifyOtpApi(otp.toString(),widget.user);
                          setState(() {
                            isLoad = false;
                          });
                        }else{
                          showSnackBar("Please enter valid otp.");
                        }
                      },
                      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      color: ColorResources.light_purple,
                      child: const Text('Verify',
                          style: TextStyle(
                              color: ColorResources.white,
                              fontWeight: FontWeight.normal,
                              fontSize: Dimensions.text_13,
                              fontFamily: "Roboto")),
                    )
                    // verifyButton
                  ],
                ))));
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 5), child: const Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  Future<AlertDialog> showOtpDialog(
      BuildContext parentcontext, String otp, int otpNumber) {
    return showDialog<AlertDialog>(
      context: parentcontext,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text("OTP Dialog",
                      style: TextStyle(
                          color: ColorResources.light_purple,
                          fontWeight: FontWeight.w100,
                          fontSize: Dimensions.text_16,
                          fontFamily: "Roboto")),
                  const SizedBox(height: Dimensions.margin_8),
                  Text(otp,
                      style: const TextStyle(
                          color: ColorResources.black,
                          fontWeight: FontWeight.w100,
                          fontSize: Dimensions.text_16,
                          fontFamily: "Roboto")),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(parentcontext).pop();
                },
                child: const Text("Cancel",
                    style: TextStyle(
                        color: ColorResources.grey_text,
                        fontWeight: FontWeight.w100,
                        fontSize: Dimensions.text_14,
                        fontFamily: "Roboto"))),
            FlatButton(
                onPressed: () {
                },
                child: const Text("Continue",
                    style: TextStyle(
                        color: ColorResources.light_purple,
                        fontWeight: FontWeight.w100,
                        fontSize: Dimensions.text_14,
                        fontFamily: "Roboto")))
          ],
        );
      },
    );
  }
}