import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:smarthomestack/main.dart';
import 'package:smarthomestack/widget/blur_effect.dart';
import 'package:smarthomestack/widget/rotate_widget.dart';

class BottomSheetView extends StatefulWidget {
  final ScrollController scrollController;
  final double bottomSheetOffset;

  const BottomSheetView({
    required this.scrollController,
    required this.bottomSheetOffset,
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  var status = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(20),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColor.appwhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.subtext.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(40)),
                      width: 50,
                      height: 10,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Living Room",
                      style: TextStyle(
                          color: AppColor.text,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: FlutterSwitch(
                            width: 60.w,
                            height: 28,
                            activeColor: AppColor.button,
                            value: status,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ],
                ),
                Text(
                  "Home tempreture",
                  style: TextStyle(
                      color: AppColor.subtext,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                ),
                FrostedDemo(
                  child: Container(
                    height: 300.h,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Wrap(
                            children: [
                              Text("14",
                                  style: TextStyle(
                                      fontSize: 18.sp, color: AppColor.text)),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Text("°C",
                                    style: TextStyle(
                                        fontSize: 18.sp, color: AppColor.text)),
                              )
                            ],
                          ),
                          TempController(),
                          Wrap(
                            children: [
                              Text("28",
                                  style: TextStyle(
                                      fontSize: 18.sp, color: AppColor.text)),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Text("°C",
                                    style: TextStyle(
                                        fontSize: 18.sp, color: AppColor.text)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                tempShow(),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    commonConatiner(95.0.w, "Heating", "24", AppColor.button),
                    commonConatiner(95.0.w, "Cooling", "18", Colors.blue),
                    commonConatiner(95.0.w, "Airwave", "20",
                        AppColor.subtext.withOpacity(0.2))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.h, bottom: 20.h),
                      child: Container(
                        width: 150.w,
                        height: 75.h,
                        decoration: BoxDecoration(
                            color: AppColor.subtext.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Fan",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: AppColor.text)),
                                  Text("Off",
                                      style: TextStyle(
                                          fontSize: 28.sp,
                                          color: AppColor.text)),
                                ],
                              ),
                              const Spacer(),
                              FaIcon(
                                FontAwesomeIcons.fan,
                                size: 20.sp,
                                color: AppColor.subtext.withOpacity(0.4),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 10.h, bottom: 20.h),
                      child: Container(
                        width: 150.w,
                        height: 75.h,
                        decoration: BoxDecoration(
                            color: AppColor.subtext.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Cooler",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: AppColor.text)),
                                  Text("Off",
                                      style: TextStyle(
                                          fontSize: 28.sp,
                                          color: AppColor.text)),
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                Icons.ac_unit,
                                size: 20.sp,
                                color: AppColor.subtext.withOpacity(0.4),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget commonConatiner(double width, String title, String value, Color color) {
  return Container(
    width: width,
    height: 95,
    decoration: BoxDecoration(
        color: AppColor.subtext.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.r)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(title,
                style: TextStyle(color: AppColor.text, fontSize: 16.sp)),
            Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Text(value,
                  style: TextStyle(
                      color: AppColor.text,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.normal)),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Text(
                  "°C",
                  style: TextStyle(fontSize: 20.sp, color: AppColor.text),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget tempShow() {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Current tempreture",
              style: TextStyle(
                  color: AppColor.subtext,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Icon(
                  Icons.arrow_drop_up,
                  color: AppColor.subtext,
                ),
              ),
              Text("24",
                  style: TextStyle(
                      color: AppColor.text,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.normal)),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Text(
                  "°C",
                  style: TextStyle(fontSize: 20.sp, color: AppColor.text),
                ),
              )
            ],
          )
        ],
      ),
      Spacer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Current humidity",
            style: TextStyle(
                color: AppColor.subtext,
                fontSize: 18.sp,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 10.h,
          ),
          Wrap(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 4, left: 40),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: AppColor.subtext,
                ),
              ),
              Text("54",
                  style: TextStyle(
                      color: AppColor.text,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.normal)),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Text(
                  "%",
                  style: TextStyle(fontSize: 20.sp, color: AppColor.text),
                ),
              )
            ],
          )
        ],
      )
    ],
  );
}
