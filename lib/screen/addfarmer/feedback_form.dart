import 'dart:ui';

import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/app_constants.dart';
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
  RxInt plotDigitisation = 3.obs,
      cropManagement = 3.obs,
      specificCrop = 3.obs,
      harvestQuality = 3.obs,
      maskedLinkage = 3.obs,
      farmLevelMeetings = 3.obs,
      farmLevelAlert = 3.obs,
      weatherReports = 3.obs,
      welcome_sms = 3.obs;

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
        toolbarHeight: 83,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 13),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15.3),
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
                height: 13,
              ),
              RatingWidget(text: "Crop Management", value: cropManagement),
              const SizedBox(
                height: 13,
              ),
              RatingWidget(text: "Specific Crop Advisory", value: specificCrop),
              const SizedBox(
                height: 13,
              ),
              RatingWidget(
                  text: "Expected Harvest Quantity", value: harvestQuality),
              const SizedBox(
                height: 13,
              ),
              RatingWidget(text: "Masked Linkage", value: maskedLinkage),
              const SizedBox(
                height: 13,
              ),
              RatingWidget(
                  text: "Farm Level Meetings", value: farmLevelMeetings),
              const SizedBox(
                height: 13,
              ),
              RatingWidget(text: "Farm Level Alerts", value: farmLevelAlert),
              const SizedBox(
                height: 13,
              ),
              RatingWidget(text: "Weather Reports", value: weatherReports),
              const SizedBox(
                height: 13,
              ),
              RatingWidget(text: "Welcome SMS", value: welcome_sms),
              Card(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(13),
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
                    const SizedBox(height: 23),
                    //Button for submit with rounded corners
                    Container(
                      margin: const EdgeInsets.only(top: 23, bottom: 13),
                      child: RaisedButton(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 83),
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
                              plotDigitisation.value = 3;
                              cropManagement.value = 3;
                              specificCrop.value = 3;
                              harvestQuality.value = 3;
                              maskedLinkage.value = 3;
                              farmLevelMeetings.value = 3;
                              farmLevelAlert.value = 3;
                              weatherReports.value = 3;
                              welcome_sms.value = 3;
                            });
                          }),
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(23),
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
      padding: const EdgeInsets.all(13),
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
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.3),
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
