import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/images.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoad = false;

  void showSnackBar(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    Images.logo,
                    width: 130,
                    height: 130,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Proceed with Your",
                        style: robotoMedium.copyWith(
                            color: const Color(0xff515151), fontSize: 15)),
                    const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Proxima Nova"),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    SizedBox(
                      height: 52.0,
                      child: TextFormField(
                        controller: nameController,
                        maxLines: 1,
                        keyboardType: TextInputType.phone,
                        autofocus: false,
                        decoration: InputDecoration(
                            // border: InputBorder.none,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: "Mobile Number",
                            labelStyle: TextStyle(
                                fontSize:
                                    18 * MediaQuery.of(context).textScaleFactor,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff070707)),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Image.asset(Images.user),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: SizedBox(
                          height: 52.0,
                          child: TextFormField(
                              controller: passwordController,
                              // controller: password,
                              // style: robotoLight.copyWith(color: Colors.black,fontSize: 14),
                              autofocus: false,
                              obscureText: !passwordVisible,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                  color: Color(0xff070707),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                errorStyle: const TextStyle(height: 0),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    // color: ColorResources.light_purple,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                // filled: true,
                                fillColor: Colors.white,
                              ))),
                    ),
                  ],
                ),
                Column(
                  children: [
                    if (isLoad)
                      const Center(
                        child: SizedBox(
                            width: 40,
                            height: 40,
                            child: CircularProgressIndicator()),
                      )
                    else
                      SizedBox(
                          height: 47.0,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF6cbd47),
                              ), //button color
                            ),
                            onPressed: () async {
                              if (nameController.text.isEmpty) {
                                showSnackBar("Enter mobile number");
                              } else if (passwordController.text.isEmpty) {
                                showSnackBar("Enter password");
                              } else {
                                setState(() {
                                  isLoad = true;
                                });

                                await Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .loginUserApi(nameController.text,
                                        passwordController.text);

                                setState(() {
                                  isLoad = false;
                                });
                              }
                            },
                            child: Text('Log In',
                                style: robotoBold.copyWith(
                                    fontSize: 19, color: Colors.white)),
                          )),

                    // Padding(
                    //   padding: const EdgeInsets.only(top: 20.0),
                    //   child: SizedBox(
                    //       height: 47.0,
                    //       width: MediaQuery.of(context).size.width,
                    //       child: ElevatedButton(
                    //         style: ButtonStyle(
                    //           backgroundColor:
                    //           MaterialStateProperty.all<Color>(const Color(0xFF6cbd47),), //button color
                    //         ),
                    //         onPressed: () async {
                    //           Get.to(()=> RegisterScreen());
                    //           },
                    //         child: Text('Sign up',
                    //             style: robotoBold.copyWith(fontSize: 19,color: Colors.white)),
                    //       )),
                    // ),

                    // const SizedBox(
                    //   height: 5,
                    // ),
                    //
                    // Text(
                    //   "Forgot Password?",
                    //   style:
                    //       robotoBold.copyWith(color: const Color(0xff515151)),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
