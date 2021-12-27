import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarthomestack/main.dart';
import 'package:smarthomestack/widget/border_paint.dart';

class FrostedDemo extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const FrostedDemo({
    Key? key,
    required this.child,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                color: Colors.grey.shade200.withOpacity(0.1)),
            child: child,
          ),
        ),
      ),
    );
  }
}
