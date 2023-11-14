
import 'package:face_detection_app/utils/app_colors.dart';
import 'package:face_detection_app/utils/app_router.dart';
import 'package:face_detection_app/utils/app_size.dart';
import 'package:face_detection_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget({super.key});

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {

  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
            designSize:const Size(AppSize.fullScreenWidth, AppSize.fullScreenHeight),
            builder: (context, child) {
              return MaterialApp(
              // navigatorKey: StaticData.navigatorKey,
                title: AppStrings.appTitle,
                theme: ThemeData(
                  scaffoldBackgroundColor:
                      AppColors.whiteColor,
                  // fontFamily: AppFonts.montserratRegular,
                ),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRouter.onGenerateRoute,
                builder: (context, widget) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: widget!,
                  );
                },
              );
            }
    );
  }
}