import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarthomestack/main.dart';

class TempController extends StatefulWidget {
  const TempController({Key? key}) : super(key: key);

  @override
  _TempControllerState createState() => _TempControllerState();
}

class _TempControllerState extends State<TempController> {
  double finalAngle = 0.0;
  double angle = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanUpdate: (details) {
                  Offset centerOfGestureDetector = Offset(
                      constraints.maxWidth / 2, constraints.maxHeight / 2);
                  final touchPositionFromCenter =
                      details.localPosition - centerOfGestureDetector;
                  print(touchPositionFromCenter.direction * 180 / pi);
                  setState(
                    () {
                      angle = touchPositionFromCenter.direction * 180 / pi;
                      finalAngle = touchPositionFromCenter.direction;
                    },
                  );
                },
                child: Transform.rotate(
                  angle: finalAngle.isNegative ? 0 : finalAngle,
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(100.r),
                    child: Container(
                      height: 200.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_left,
                            size: 30.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 25.h,
            left: 25.w,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(80.r),
              child: Container(
                height: 150.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: AppColor.appwhite,
                  borderRadius: BorderRadius.circular(80.r),
                ),
                child: Center(
                  child: Text(
                    angle.isNegative
                        ? 0.toString()
                        : angle.ceilToDouble().toString(),
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: AppColor.text,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
