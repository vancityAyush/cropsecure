import 'dart:ui';

import 'package:CropSecure/provider/authprovider.dart';
import 'package:CropSecure/utill/app_constants.dart';
import 'package:CropSecure/utill/color_resources.dart';
import 'package:CropSecure/utill/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:provider/provider.dart';

class PlantDoctorHistory extends StatefulWidget {
  PlantDoctorHistory(this.plotId);
  String plotId;

  @override
  State<PlantDoctorHistory> createState() => _PlantDoctorHistoryState();
}

class _PlantDoctorHistoryState extends State<PlantDoctorHistory> {
  bool isLoading = false;

  get data => null;

  FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  bool _mPlayerIsInited = false;
  int index = -1;

  @override
  void initState() {
    _mPlayer.openPlayer().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _mPlayer.closePlayer();
    _mPlayer = null;
    super.dispose();
  }

  void play(String path, int ind) {
    assert(_mPlayerIsInited && _mPlayer.isStopped);
    _mPlayer
        .startPlayer(
            fromURI: path,
            codec: path.endsWith(".mp4") ? Codec.aacMP4 : Codec.mp3,
            //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
            whenFinished: () {
              setState(() {
                ind = -1;
              });
            })
        .then((value) {
      setState(() {
        index = ind;
      });
    });
  }

  void stopPlayer(int index) {
    _mPlayer.stopPlayer().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Plant Doctor History",
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
                .fetchPlantDoctor(widget.plotId),
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
                      IconButton(
                          icon: Icon(
                            _mPlayer.isPlaying && index == this.index
                                ? Icons.stop
                                : Icons.play_arrow_rounded,
                          ),
                          onPressed: () {
                            _mPlayer.isStopped
                                ? play(AppConstants.Image + itemData['audio'],
                                    index)
                                : stopPlayer(index);
                          }),
                      Spacer(),
                      Column(
                        children: [
                          Text(itemData['comment'],
                              style: robotoBold.copyWith(
                                  color: ColorResources.light_purple,
                                  fontSize: 18)),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                              itemData['status'] != '0'
                                  ? 'Approved'
                                  : 'Pending',
                              style: robotoBold.copyWith(
                                color: itemData['status'] != '0'
                                    ? ColorResources.light_purple
                                    : ColorResources.grey_text,
                                fontSize: 14,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
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
