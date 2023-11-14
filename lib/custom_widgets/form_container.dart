
import 'package:face_detection_app/utils/app_colors.dart';
import 'package:face_detection_app/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormContainerWidget extends StatelessWidget {
  final Widget? child;
  const CustomFormContainerWidget({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.fullScreenWidth.w,
      height: 0.7.sh,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: child!,
    );
  }
}
