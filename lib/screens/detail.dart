import 'dart:io';

import 'package:face_detection_app/custom_widgets/custom_button.dart';
import 'package:face_detection_app/screens/capture.dart';
import 'package:face_detection_app/utils/app_colors.dart';
import 'package:face_detection_app/utils/app_fonts.dart';
import 'package:face_detection_app/utils/app_size.dart';
import 'package:face_detection_app/utils/app_strings.dart';
import 'package:face_detection_app/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:face_detection_app/utils/field_validators.dart';

class DetailScreen extends StatefulWidget {
  final String? imagePath;
  final String? name;
  final String? dob;
  final String? email;
  final String? phone;
  final String? nationality;
  final String? position;

  const DetailScreen(
      {super.key,
      this.imagePath,
      this.name,
      this.dob,
      this.email,
      this.phone,
      this.nationality,
      this.position
      });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.21, -0.98),
              end: Alignment(0.21, 0.98),
              colors: [Color(0xFF1D4FFF), Color(0xFF067FD0)],
            ),
          ),
          child: Column(children: [
             SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: ((context) => CaptureScreen())));

              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.cancel,color: AppColors.whiteColor,)),
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            Container(
              height: 190,
              width: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.whiteColor, width: 4.0),
              ),
              child: Center(
                  child: widget.imagePath != null
                      ? ClipOval(
                          child: FadeInImage(
                            height: 190,
                            width: 190,
                            placeholder:
                                const AssetImage(AssetPaths.userPlaceHolder),
                            image: FileImage(File(widget.imagePath!)),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.asset(
                          AssetPaths.userPlaceHolder,
                          scale: 3,
                        )),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              widget.name!.capitalize() ?? "",
              style: const TextStyle(
                  fontFamily: AppFonts.robotoBold,
                  fontSize: 25,
                  color: AppColors.whiteColor),
            ),
            SizedBox(
              height: 35.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detailCol(title:'Nationality', value: widget.nationality),
                    SizedBox(
                      height: 10.h,
                    ),

                    detailCol(
                        title: 'Phone', value: widget.phone),
                    SizedBox(
                      height: 10.h,
                    ),

                    detailCol(title: AppStrings.email, value: widget.email),
                    SizedBox(
                      height: 10.h,
                    ),
                    detailCol(title:"DOB", value: widget.dob),
                    SizedBox(
                      height: 10.h,
                    ),
                    detailCol(title:"Position", value: widget.position),
                  ],
                ),

              ],
            ),
            SizedBox(height: 30.h,),
            Text(
              'You have Registered successfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: 30.h,),
    
            
          ]),
    
        ),
      ),
    );
  }

  Widget detailCol({String? title, String? value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontFamily: AppFonts.robotoBold,
              fontSize: 15),
        ),
        Text(
          value ?? "",
          style: const TextStyle(
              color: AppColors.whiteColor,
              fontFamily: AppFonts.robotoLight,
              fontSize: 17),
        ),
      ],
    );
  }
}
