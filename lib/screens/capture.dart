

import 'dart:developer';
import 'dart:io';
import 'package:face_detection_app/custom_widgets/back_icon.dart';
import 'package:face_detection_app/custom_widgets/custom_button.dart';
import 'package:face_detection_app/screens/register.dart';
import 'package:face_detection_app/utils/app_colors.dart';
import 'package:face_detection_app/utils/app_size.dart';
import 'package:face_detection_app/utils/app_strings.dart';
import 'package:face_detection_app/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({super.key});

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  ImagePicker picker = ImagePicker();
  XFile? getFilePath;
  CroppedFile? croppedImageFile;
  File? imageFile;
  String? imagePath;
  bool? isFileUploaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCameraImage( onMediaChanged: (value) {
    setState(() {
      imagePath = value;
      isFileUploaded = true;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen(imagePath: imagePath,)));
  },);
  }
  @override
  Widget build(BuildContext context) {
    log("imagePath  $imagePath");
    return SafeArea(
  child: Scaffold(
    backgroundColor: AppColors.blueColor,
    body: Stack(
      children: [

        Visibility(
          visible: imagePath != null ? true : false,
          child: Container(
            height: AppSize.fullScreenHeight,
            width: MediaQuery.of(context).size.width,
            child: FadeInImage(
              height: AppSize.fullScreenHeight,
              width: MediaQuery.of(context).size.width,
              image: FileImage(File(imagePath ?? "")),
              fit: BoxFit.cover, // Image ko full screen par fit karne ke liye BoxFit.fill ka istemal karen
              placeholder: AssetImage(AssetPaths.userPlaceHolder),
            ),
          ),
        ),
       Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:const [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: BackIconWidget(),
                    ),
                    Spacer(),
                    Expanded(
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    Spacer(),

                    SizedBox()
                  ],
                ),
              ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(title: AppStrings.capture,onTap: (){
                  print(imagePath);
                  if(imagePath!=null){
                    print("images Path found");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen(imagePath: imagePath,)));
                  }
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => CaptureScreen())));
                  }
                },),
              ),

            ),
            SizedBox(height: 10.h),
          ],
        ),
      ],
    ),
  ),
);

  }

  void getCameraImage({required ValueChanged<String?> onMediaChanged, BuildContext? context}) async {
    try {
      getFilePath = await picker.pickImage(source: ImageSource.camera, imageQuality: 70);
      if (getFilePath != null) {
        cropImage(imageFilePath: getFilePath!.path, onMediaChanged: onMediaChanged, context: context);
      } else {
        Navigator.pop(context!);
      }
    } on PlatformException {
      // AppDialogs.showToast(
      //     message: e.message ?? AppStrings.sometingWentWrong_ERROR);
    }
  }

  void cropImage({String? imageFilePath, BuildContext? context, required ValueChanged<String?> onMediaChanged}) async {
    croppedImageFile = await ImageCropper().cropImage(
      sourcePath: imageFilePath!,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: "Edit Photo",
            toolbarColor: AppColors.blackColor,
            toolbarWidgetColor: AppColors.whiteColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      ],
    );
    //if image cropped then set object
    if (croppedImageFile != null) {
      onMediaChanged(File(croppedImageFile!.path).path);
    
    } else {
      onMediaChanged(null);
    }

    // if(imagePath!=null){
    //   print("images Path found");
    //   Navigator.push(context!, MaterialPageRoute(builder: (context)=>RegisterScreen(imagePath: imagePath,)));
    // }
    // else{
    //   Navigator.push(context!, MaterialPageRoute(builder: ((context) => CaptureScreen())));
    // }
    //   Navigator.pop(context!);



  }

}