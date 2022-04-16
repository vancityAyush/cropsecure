import 'dart:ui';

import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FeedbackForm extends StatefulWidget {
  String id;
  FeedbackForm({this.id});
  @override
  _State createState() => _State();
}

class _State extends State<FeedbackForm> {
  TextEditingController _commentController = TextEditingController();
  bool isLoad = false;
  RxInt plotDigitisation = 0.obs,
      cropManagement = 0.obs,
      specificCrop = 0.obs,
      harvestQuality = 0.obs,
      maskedLinkage = 0.obs,
      farmLevelMeetings = 0.obs,
      farmLevelAlert = 0.obs,
      weatherReports = 0.obs,
      welcome_sms = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feedback",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text(
                  "Cropsecure provides technology to service to farmer. Cropsecure interested in your feedback about technology service. Please take a moment to provide us with your feedback on this feedback form to help us.",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              RatingWidget(
                  text: "Farmer Plot Digitisation", value: plotDigitisation),
              const SizedBox(
                height: 10,
              ),
              RatingWidget(text: "Crop Management", value: cropManagement),
              const SizedBox(
                height: 10,
              ),
              RatingWidget(text: "Specific Crop Advisory", value: specificCrop),
              const SizedBox(
                height: 10,
              ),
              RatingWidget(
                  text: "Expected Harvest Quantity", value: harvestQuality),
              const SizedBox(
                height: 10,
              ),
              RatingWidget(text: "Masked Linkage", value: maskedLinkage),
              const SizedBox(
                height: 10,
              ),
              RatingWidget(
                  text: "Farm Level Meetings", value: farmLevelMeetings),
              const SizedBox(
                height: 10,
              ),
              RatingWidget(text: "Farm Level Alerts", value: farmLevelAlert),
              const SizedBox(
                height: 10,
              ),
              RatingWidget(text: "Weather Reports", value: weatherReports),
              const SizedBox(
                height: 10,
              ),
              RatingWidget(text: "Welcome SMS", value: welcome_sms),
              Card(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: _commentController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Any Comments",
                            labelStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //Button for submit with rounded corners
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                      child: RaisedButton(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          child: isLoad
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Submit",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                          onPressed: () async {
                            setState(() {
                              isLoad = true;
                            });
                            await Provider.of<AuthProvider>(context,
                                    listen: false)
                                .feedBackApi(
                                    widget.id,
                                    AppConstants
                                        .ratings[plotDigitisation.value],
                                    AppConstants.ratings[cropManagement.value],
                                    AppConstants.ratings[specificCrop.value],
                                    AppConstants.ratings[harvestQuality.value],
                                    AppConstants.ratings[maskedLinkage.value],
                                    AppConstants
                                        .ratings[farmLevelMeetings.value],
                                    AppConstants.ratings[farmLevelAlert.value],
                                    AppConstants.ratings[weatherReports.value],
                                    AppConstants.ratings[welcome_sms.value],
                                    _commentController.text);
                            setState(() {
                              isLoad = false;
                              _commentController.clear();
                              plotDigitisation.value = 0;
                              cropManagement.value = 0;
                              specificCrop.value = 0;
                              harvestQuality.value = 0;
                              maskedLinkage.value = 0;
                              farmLevelMeetings.value = 0;
                              farmLevelAlert.value = 0;
                              weatherReports.value = 0;
                              welcome_sms.value = 0;
                            });
                          }),
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  String text;
  RxInt value;

  RatingWidget({this.text, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "   " + text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBar.builder(
                initialRating: value.value.toDouble() + 1,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 4,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  value.value = rating.toInt() - 1;
                },
              ),
              Obx(
                () => Text(
                  AppConstants.ratings[value.value],
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
