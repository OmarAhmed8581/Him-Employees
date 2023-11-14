import 'package:face_detection_app/utils/app_colors.dart';
import 'package:face_detection_app/utils/app_fonts.dart';
import 'package:face_detection_app/utils/app_size.dart';
import 'package:face_detection_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? bgColor;
  final Color? fgColor;
  final Function()? onTap;
  const CustomButton({super.key,this.title,this.onTap, this.bgColor,  this.fgColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: AppSize.fullScreenWidth,
          decoration: BoxDecoration(color: bgColor??Color(0xFF1D4FFF),borderRadius: BorderRadius.circular(30)),
          child: Padding(
           padding: const EdgeInsets.symmetric(vertical:15),
            child:
            title==AppStrings.capture?
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.photo_camera,color: AppColors.whiteColor,),
                SizedBox(width: 10.w,),
                Center(child: Text(title??"",style: TextStyle(color: AppColors.whiteColor,fontFamily: "Inter",fontSize: 16,fontWeight: FontWeight.w700),)),
              ],
            ):
            Center(child: Text(title??"",style: TextStyle(color: fgColor??AppColors.whiteColor,fontFamily: "Inter",fontSize: 16,fontWeight: FontWeight.w700),)),
    
          ),),
      ),
    );
  }
}