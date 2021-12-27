import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:smarthomestack/main.dart';
import 'package:smarthomestack/model/sound_model.dart';
import 'package:smarthomestack/widget/blur_effect.dart';

class SoundView extends StatefulWidget {
  SoundView({Key? key}) : super(key: key);

  @override
  _SoundViewState createState() => _SoundViewState();
}

class _SoundViewState extends State<SoundView> {
  bool isplaying = false;
  var soundlength = 0;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    var duration = player.setAsset("assets/sounds/Shortcover.mp3");
    print(duration);
  }

  Future<List<Sound>> fetchSounds() async {
    final response = await rootBundle.loadString("assets/sounds.json");
    return parsePaths(response);
  }

  List<Sound> parsePaths(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Sound>((json) => Sound.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FrostedDemo(
      child: FutureBuilder<List<Sound>>(
        future: fetchSounds(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: 150.w,
              height: 150.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: AssetImage("assets/bg.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data![soundlength].name.toString(),
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColor.appwhite,
                            ),
                          ),
                          Text(
                            "Girl in red",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColor.appwhite,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              soundlength == 0
                                  ? player
                                      .setAsset("assets/sounds/ShortSong.mp3")
                                  : player
                                      .setAsset("assets/sounds/Shortcover.mp3");
                              soundlength == 0
                                  ? soundlength = 1
                                  : soundlength = 0;
                            });
                          },
                          icon: const Icon(
                            Icons.skip_previous,
                            color: AppColor.appwhite,
                            size: 20,
                          )),
                      FrostedDemo(
                        height: 20.h,
                        width: 20.w,
                        child: IconButton(
                          onPressed: () async {
                            if (isplaying) {
                              setState(() {
                                isplaying = false;
                              });
                              await player.pause();
                            } else {
                              setState(() {
                                isplaying = true;
                              });
                              await player.play();
                            }
                          },
                          icon: Icon(
                            isplaying == false ? Icons.play_arrow : Icons.pause,
                            color: AppColor.appwhite,
                            size: 20,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              soundlength == 0
                                  ? player
                                      .setAsset("assets/sounds/ShortSong.mp3")
                                  : player
                                      .setAsset("assets/sounds/Shortcover.mp3");
                              soundlength == 1
                                  ? soundlength = 0
                                  : soundlength = 1;
                            });
                          },
                          icon: const Icon(
                            Icons.skip_next,
                            color: AppColor.appwhite,
                            size: 20,
                          ))
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
