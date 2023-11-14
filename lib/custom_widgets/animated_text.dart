import 'package:entry/entry.dart';
import 'package:face_detection_app/utils/app_colors.dart';
import 'package:face_detection_app/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AninmatedText extends StatelessWidget {
  const AninmatedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Entry(
        xOffset: -1000,
        scale: 20,
        curve: Curves.ease,
        child: Entry(
          opacity: .5,
          angle: 3.1415,
          scale: .5,
          child: Text("HiM",style: TextStyle(color: AppColors.whiteColor,fontFamily: "Inter",fontSize: 56,fontWeight: FontWeight.w700),)
        ),
      ),
    );
  }
}