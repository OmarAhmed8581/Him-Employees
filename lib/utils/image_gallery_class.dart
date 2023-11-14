// import 'dart:io';

// import 'package:face_detection_app/utils/app_colors.dart';
// import 'package:face_detection_app/utils/app_size.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';


// class ImageGalleryClass {
//   ImagePicker picker = ImagePicker();
//   XFile? getFilePath;
//   CroppedFile? croppedImageFile;
//   File? imageFile;
  
//   Map<String, dynamic>? imageGalleryBottomSheet(
//       {required BuildContext context, required ValueChanged<String?> onMediaChanged}) {
//     showModalBottomSheet(
//       shape:  RoundedRectangleBorder( // <-- SEE HERE
//           borderRadius: BorderRadius.vertical( 
//             top: Radius.circular(AppSize.allRoundBorder),
//           ),
//         ),
//         context: context,
//         builder: (_) {
//           return Container(
//             decoration:  BoxDecoration(
//             color: AppColors.whiteColor,
              
//               borderRadius: BorderRadius.only(topRight: Radius.circular(AppSize.allRoundBorder),topLeft: Radius.circular(AppSize.allRoundBorder))),
//             child: SafeArea(
//               child: Wrap(
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: () {
//                       getCameraImage(onMediaChanged: onMediaChanged, context: context);
//                     },
//                     child: Container(
//                       color: Colors.transparent,
//                       padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
//                       child: Row(
//                         children: const [
//                           SizedBox(
//                             width: 15.0,
//                           ),
//                           Icon(
//                             Icons.camera_enhance,
//                             color: AppColors.blueColor,
//                           ),
//                           SizedBox(
//                             width: 15.0,
//                           ),
//                           CustomText(text: AppStrings.camera,fontColor: AppColors.blueColor,)
                          
//                         ],
//                       ),
//                     ),
//                   ),
//                 const  Divider(
//                     color: AppColors.whiteColor,
//                     height: 1.0,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       getGalleryImage(onMediaChanged: onMediaChanged, context: context);
//                       //AppNavigation.navigatorPop(context);
//                     },
//                     child: Container(
//                       color: Colors.transparent,
//                       padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
//                       child: Row(
//                         children: const [
//                           SizedBox(
//                             width: 15.0,
//                           ),
//                           Icon(
//                             Icons.image,
//                             color: AppColors.blueColor,
//                           ),
//                           SizedBox(
//                             width: 15.0,
//                           ),
//                           CustomText(text: AppStrings.gallery,fontColor: AppColors.blueColor,)

//                         ],
//                       ),
//                     ),
//                   ),
                 
//                 ],
//               ),
//             ),
//           );
//         });
//     return null;
//   }

//   void getCameraImage({required ValueChanged<String?> onMediaChanged, BuildContext? context}) async {
//     try {
//       getFilePath = await picker.pickImage(source: ImageSource.camera, imageQuality: 70);
//       if (getFilePath != null) {
//         cropImage(imageFilePath: getFilePath!.path, onMediaChanged: onMediaChanged, context: context);
//       } else {
//        Navigator.pop(context!);
//       }
//     } on PlatformException {
//       // AppDialogs.showToast(
//       //     message: e.message ?? AppStrings.sometingWentWrong_ERROR);
//     }
//   }

//   void getGalleryImage({required ValueChanged<String?> onMediaChanged, BuildContext? context}) async {
//     try {
//       getFilePath = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
//       if (getFilePath != null) {
//         cropImage(imageFilePath: getFilePath!.path, onMediaChanged: onMediaChanged, context: context);
//       } else {
//         Navigator.pop(context!);
//       }
//     } on PlatformException {
//       // AppDialogs.showToast(
//       //     message: e.message ?? AppStrings.sometingWentWrong_ERROR);
//     }
//   }

//   void cropImage({String? imageFilePath, BuildContext? context, required ValueChanged<String?> onMediaChanged}) async {
//     croppedImageFile = await ImageCropper().cropImage(
//       sourcePath: imageFilePath!,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       uiSettings: [
//         AndroidUiSettings(
//             toolbarTitle: "Edit Photo",
//             toolbarColor: AppColors.blackColor,
//             toolbarWidgetColor: AppColors.whiteColor,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//       ],
//     );
//     //if image cropped then set object
//     if (croppedImageFile != null) {
//       onMediaChanged(File(croppedImageFile!.path).path);
    
//     } else {
//       onMediaChanged(null);
//     }
//     Navigator.pop(context!);

//   }

// }
