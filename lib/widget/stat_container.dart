import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarthomestack/main.dart';
import 'package:smarthomestack/widget/blur_effect.dart';

class StatContainer extends StatefulWidget {
  const StatContainer({Key? key}) : super(key: key);

  @override
  State<StatContainer> createState() => _StatContainerState();
}

class _StatContainerState extends State<StatContainer> {
  Random randomNum = Random();
  late final List<int>? downPad;
  late final List<int>? topPad;
  late final List<int>? height;

  void randomgenerate() {
    height = List.generate(20, (index) => randomNum.nextInt(50));
    topPad = List.generate(20, (index) => randomNum.nextInt(50));
    print(topPad);
    downPad = List.generate(20, (index) => randomNum.nextInt(50));
  }

  @override
  void initState() {
    super.initState();
    randomgenerate();
  }

  @override
  Widget build(BuildContext context) {
    return FrostedDemo(
      child: SizedBox(
        width: 350.w,
        height: 200.h,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    "Electricty Usage",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColor.appwhite,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColor.appwhite,
                    size: 16.sp,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: topPad!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: 10,
                        bottom: downPad![index].toDouble(),
                        right: 0,
                        top: topPad![index].toDouble()),
                    child: Container(
                      width: 5,
                      height: height![index].toDouble(),
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? AppColor.appwhite
                            : AppColor.appwhite.withOpacity(0.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
