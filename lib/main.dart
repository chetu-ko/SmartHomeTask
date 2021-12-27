import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smarthomestack/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
        ),
        home: const MyHomePage(title: ''),
      ),
    );
  }
}

class AppColor {
  static const Color button = Color.fromRGBO(255, 155, 117, 1);
  static const Color text = Color.fromRGBO(16, 16, 30, 1);
  static const Color subtext = Color.fromRGBO(135, 135, 142, 1);
  static const Color appwhite = Color.fromRGBO(245, 245, 246, 1);
}
