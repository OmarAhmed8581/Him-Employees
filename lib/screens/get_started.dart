import 'package:face_detection_app/custom_widgets/custom_button.dart';
import 'package:face_detection_app/screens/capture.dart';
import 'package:face_detection_app/utils/app_colors.dart';
import 'package:face_detection_app/utils/app_fonts.dart';
import 'package:face_detection_app/utils/app_strings.dart';
import 'package:face_detection_app/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.21, -0.98),
              end: Alignment(0.21, 0.98),
              colors: [Color(0xFF1D4FFF), Color(0xFF067FD0)],
            ),
          ),
          child: Column(children: [
           SizedBox(height: 150.h,),
            Image.asset(AssetPaths.faceDetectionImg1,height: 185,width: 238,),
           SizedBox(height: 40.h,),

           const Text(AppStrings.HiMfaceID,style:  TextStyle(color: AppColors.whiteColor,fontFamily: AppFonts.robotoMedium,fontSize: 25),),
           SizedBox(height: 20.h,),

           Padding(
            padding: EdgeInsets.only(left: 25.sp,right: 25.sp),
             child: const Text(AppStrings.descroption,
             textAlign: TextAlign.center,
             style:  TextStyle(
              color: AppColors.whiteColor,fontFamily: 'Inter',fontSize: 14,fontWeight: FontWeight.w400),),
           ),
           SizedBox(height: 102,width: 309,),

            Padding(
             padding: EdgeInsets.only(left: 25.sp,right: 25.sp),
              child: CustomButton(title: AppStrings.getStarted,bgColor: AppColors.whiteColor,fgColor: Color(0xFF0C74DB),onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: ((context) => CaptureScreen())));
              },),
            )
          ]),
        )

    );
  }
}