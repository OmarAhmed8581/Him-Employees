import 'package:face_detection_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BackIconWidget extends StatelessWidget {
  const BackIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.whiteColor,
        child: Icon(Icons.arrow_back_ios_new,color:Color(0xFF1D4FFF),size: 15,),),
    );
  }
}