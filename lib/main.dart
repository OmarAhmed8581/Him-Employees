import 'package:face_detection_app/base_widget/base_widget.dart';
import 'package:face_detection_app/screens/splash.dart';
import 'package:face_detection_app/utils/app_colors.dart';
import 'package:face_detection_app/utils/app_size.dart';
import 'package:face_detection_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
            designSize:const Size(AppSize.fullScreenWidth, AppSize.fullScreenHeight),
            builder: (context, child) {
              return MaterialApp(
 
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: const SplashScreen(),
      );
  });
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

