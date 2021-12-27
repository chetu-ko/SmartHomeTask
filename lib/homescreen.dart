import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:smarthomestack/main.dart';
import 'package:smarthomestack/widget/blur_effect.dart';
import 'package:smarthomestack/widget/bottom_sheet.dart';
import 'package:smarthomestack/widget/sound_view.dart';
import 'package:smarthomestack/widget/stat_container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool isfirstSelect = false;
  bool issecondSelect = false;
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Stack(
              children: [
                Image.asset(
                  "assets/bg.jpg",
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Positioned(
                  top: 32.h,
                  left: 20.w,
                  right: 20.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.appwhite,
                            ),
                          ),
                          Text(
                            "Chris Cooper",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 30.sp,
                              color: AppColor.appwhite,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      FrostedDemo(
                        child: MaterialButton(
                          minWidth: 60.h,
                          height: 60.h,
                          onPressed: () {},
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: AppColor.appwhite,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 130.h,
                  left: 20.w,
                  right: 20.w,
                  child: Text(
                    "Living room",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColor.appwhite,
                    ),
                  ),
                ),
                Positioned(
                  top: 170.h,
                  left: 20.w,
                  right: 20.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          _showSheetWithoutList(context);
                          setState(() {
                            isfirstSelect
                                ? isfirstSelect = false
                                : isfirstSelect = true;
                            issecondSelect
                                ? issecondSelect = false
                                : issecondSelect = false;
                          });
                        },
                        child: containerfirst(),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            issecondSelect
                                ? issecondSelect = false
                                : issecondSelect = true;
                            isfirstSelect
                                ? isfirstSelect = false
                                : isfirstSelect = false;
                          });
                        },
                        child: containerSecond(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 390.h,
                  left: 20.w,
                  right: 20.w,
                  child: Row(
                    children: [
                      SoundView(),
                      const Spacer(),
                      tvConatiner(),
                    ],
                  ),
                ),
                Positioned(
                  top: 570.h,
                  left: 20.w,
                  right: 20.w,
                  child: Row(
                    children: [
                      Text(
                        "Statistics",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColor.appwhite,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Month",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColor.appwhite.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 600.h,
                    left: 20.w,
                    right: 20.w,
                    child: const StatContainer())
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget containerfirst() {
    return FrostedDemo(
      child: Container(
        width: 150.w,
        height: 200.h,
        decoration: BoxDecoration(
            color: isfirstSelect ? AppColor.appwhite : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "Home",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: isfirstSelect ? AppColor.text : AppColor.appwhite,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 20),
              child: Text(
                "Tempreture",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: isfirstSelect
                      ? AppColor.text
                      : AppColor.appwhite.withOpacity(0.8),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Wrap(
                  runAlignment: WrapAlignment.end,
                  alignment: WrapAlignment.end,
                  children: [
                    Text(
                      "23",
                      style: TextStyle(
                          fontSize: 40.sp,
                          color: isfirstSelect
                              ? AppColor.text
                              : AppColor.appwhite),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: Text(
                        "°C",
                        style: TextStyle(
                            fontSize: 24.sp,
                            color: isfirstSelect
                                ? AppColor.text
                                : AppColor.appwhite),
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: FlutterSwitch(
                    width: 60.w,
                    height: 28,
                    activeColor: AppColor.button,
                    value: status1,
                    onToggle: (val) {
                      setState(() {
                        status1 = val;
                      });
                    },
                  ),
                ),
                Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSheetWithoutList(BuildContext context) {
    showFlexibleBottomSheet<void>(
      minHeight: 0,
      initHeight: 0.8,
      maxHeight: 1,
      context: context,
      builder: (context, controller, offset) {
        return BottomSheetView(
          scrollController: controller,
          bottomSheetOffset: offset,
        );
      },
      anchors: [0, 0.5, 1],
    );
  }

  Widget containerSecond() {
    return FrostedDemo(
      child: Container(
        width: 150.w,
        height: 200.h,
        decoration: BoxDecoration(
            color: issecondSelect ? AppColor.appwhite : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Plug Wall",
                      style: TextStyle(
                        color:
                            issecondSelect ? AppColor.text : AppColor.appwhite,
                        fontSize: 18.sp,
                      )),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: issecondSelect ? AppColor.text : AppColor.appwhite,
                    size: 16,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text("• Macbook pro",
                  style: TextStyle(
                    color: issecondSelect ? AppColor.text : AppColor.appwhite,
                    fontSize: 15.sp,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 8),
              child: Text("• HomePod",
                  style: TextStyle(
                    color: issecondSelect ? AppColor.text : AppColor.appwhite,
                    fontSize: 15.sp,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 8),
              child: Text("• PlayStation 5",
                  style: TextStyle(
                    color: issecondSelect ? AppColor.text : AppColor.appwhite,
                    fontSize: 15.sp,
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: FlutterSwitch(
                    width: 60.w,
                    height: 28,
                    activeColor: AppColor.button,
                    value: status2,
                    onToggle: (val) {
                      setState(() {
                        status2 = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget tvConatiner() {
    return FrostedDemo(
      child: SizedBox(
        width: 150.w,
        height: 150.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Smart TV",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColor.appwhite,
                    ),
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColor.appwhite,
                    size: 16,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Samsung UA55 4AC",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColor.appwhite.withOpacity(0.8),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: FlutterSwitch(
                    width: 60.w,
                    height: 28,
                    activeColor: AppColor.button,
                    value: status3,
                    onToggle: (val) {
                      setState(() {
                        status3 = val;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
