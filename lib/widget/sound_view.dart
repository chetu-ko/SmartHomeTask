import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarthomestack/main.dart';
import 'package:smarthomestack/widget/blur_effect.dart';

class SoundView extends StatefulWidget {
  SoundView({Key? key}) : super(key: key);

  @override
  _SoundViewState createState() => _SoundViewState();
}

class _SoundViewState extends State<SoundView> {
  bool isplaying = false;
  @override
  Widget build(BuildContext context) {
    return FrostedDemo(
      child: SizedBox(
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
                        image: AssetImage('assets/bg.jpg'), fit: BoxFit.fill),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Midnight Love",
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
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_previous,
                      color: AppColor.appwhite,
                      size: 20,
                    )),
                FrostedDemo(
                  height: 20.h,
                  width: 20.w,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isplaying ? isplaying = false : isplaying = true;
                      });
                    },
                    icon: Icon(
                      isplaying ? Icons.play_arrow : Icons.pause,
                      color: AppColor.appwhite,
                      size: 20,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.skip_previous,
                      color: AppColor.appwhite,
                      size: 20,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
