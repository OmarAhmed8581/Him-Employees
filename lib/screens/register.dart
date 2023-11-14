import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:face_detection_app/custom_widgets/back_icon.dart';
import 'package:face_detection_app/custom_widgets/custom_button.dart';
import 'package:face_detection_app/custom_widgets/form_container.dart';
import 'package:face_detection_app/custom_widgets/textfield.dart';
import 'package:face_detection_app/screens/detail.dart';
import 'package:face_detection_app/utils/app_colors.dart';
import 'package:face_detection_app/utils/app_fonts.dart';
import 'package:face_detection_app/utils/app_size.dart';
import 'package:face_detection_app/utils/app_strings.dart';
import 'package:face_detection_app/utils/asset_path.dart';
import 'package:face_detection_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:face_detection_app/utils/field_validators.dart';

class RegisterScreen extends StatefulWidget {
  final String? imagePath;
  const RegisterScreen({super.key, this.imagePath});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullNameCtrl = TextEditingController();
  final _dobController = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _nationalityCtrl = TextEditingController();
  final _positionCtrl = TextEditingController();

  final _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    log("image path is ${widget.imagePath}");
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.blueColor,
          body:
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(File(widget.imagePath!)),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), // Background color aur opacity set karein
                  BlendMode.srcOver,
                ),
              ),
            ),

            child: Column(children: [

              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
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
              SizedBox(
                height: 200.h,
              ),
              _formArea(context),
            ]),
          ),

        ));
  }

  Widget _formArea(BuildContext context) => Expanded(
    child: _formWidget(context),
  );

  Widget _formWidget(BuildContext context) {
      return CustomFormContainerWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.sp),
          child: Form(
            key: _signupFormKey,
            child: Padding(
              padding: EdgeInsets.only(top: 30.h, left: 18.sp, right: 18.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,


                children: [

                  _welcomeText(),

                  SizedBox(height: 15.h),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(
                        children: [
                          _fullNameTextField(),
                          SizedBox(height: 15.h),
                          _positionField(),
                          SizedBox(height: 15.h),
                          _dobTextField(),
                          SizedBox(height: 15.h),
                          _emailField(),
                          SizedBox(height: 15.h),
                          _phoneField(),
                          SizedBox(height: 15.h),
                          _nationalityField(),
                          SizedBox(height: 30.h),
                          CustomButton(
                            title: AppStrings.signup,
                            onTap: () async {
                              _onTapSignup();
                            },
                          ),
                          SizedBox(height: 15.h),
                      ],
                    ),
                  ),
                ),
                ],
              ),
            ),
          ),
        ),

    );
  }

  void _onTapSignup()async{
    if (_fullNameCtrl.text != "" &&
        _dobController.text != "" &&
        _phoneCtrl.text != "" &&
        _emailCtrl.text != "" &&
        _nationalityCtrl.text != "" &&
        _positionCtrl.text != "") {
      DateTime inputDate = DateFormat('MM-dd-yyyy')
          .parse(_dobController.text);
      String formattedDate =
      DateFormat('yyyy-MM-dd').format(inputDate);
      final url = Uri.parse(
          "https://showerless-wonders.000webhostapp.com/add_registeration.php?name=" +
              _fullNameCtrl.text +
              "&email=" +
              _emailCtrl.text +
              "&date_of_birth=" +
              formattedDate +
              "&phone=" +
              _phoneCtrl.text +
              "&nationality=" +
              _nationalityCtrl.text + "&position=" +
              _positionCtrl.text +
              "");

      try {
        final response = await http.get(url);

        if (response.statusCode == 200) {
          // Request was successful
          // print("Response Data: ${response.body}");

          Fluttertoast.showToast(
              msg: "Data Save Successful",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 13.0);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => DetailScreen(
                    imagePath: widget.imagePath,
                    name: _fullNameCtrl.text,
                    dob: _dobController.text,
                    phone: _phoneCtrl.text,
                    email: _emailCtrl.text,
                    nationality:
                    _nationalityCtrl.text,
                    position:
                    _positionCtrl.text,
                  ))));
          // You can parse and handle the response data here
        } else {
          // Request failed with a status code other than 200
          // print("Request failed with status: ${response
          //     .statusCode}");

          Fluttertoast.showToast(
              msg:
              "Request failed with status: ${response.statusCode}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Color(0xFFEE5E4D),
              textColor: Colors.white,
              fontSize: 13.0);

          // Handle the failure or status code here
        }
      } catch (e) {
        // Handle exceptions, such as network errors
        print("API request failed: $e");
        Fluttertoast.showToast(
            msg: "API request failed: $e",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xFFEE5E4D),
            textColor: Colors.white,
            fontSize: 13.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please Fill required field",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFFEE5E4D),
          textColor: Colors.white,
          fontSize: 13.0);
    }
  }

  Widget _welcomeText() {
    return const Center(
        child: Text(
          "Welcome to HiM Authentication",
          style: TextStyle(color: Colors.black, fontFamily: "Inter", fontSize: 18),
        ));
  }

  Widget _fullNameTextField() {
    return CustomTextfield(
      isPrefixIcon: false,
      hintText: AppStrings.name,
      controller: _fullNameCtrl,
      validator: (value) => value?.validateEmpty(AppStrings.name),
    );
  }

  Widget _dobTextField() {
    return CustomTextfield(
      onTap: () {
        _showDatePicker();
      },
      isPrefixIcon: false,
      hintText: AppStrings.dob,
      keyboardType: TextInputType.none,
      controller: _dobController,
      validator: (value) => value?.validateEmpty(AppStrings.dob),
    );
  }

  Widget _emailField() {
    return CustomTextfield(
      isPrefixIcon: false,
      hintText: AppStrings.email,
      keyboardType: TextInputType.emailAddress,
      controller: _emailCtrl,
      validator: (value) => value?.validateEmpty(AppStrings.email),
    );
  }

  Widget _phoneField() {
    return CustomTextfield(
      isPrefixIcon: false,
      hintText: AppStrings.phone,
      keyboardType: TextInputType.number,
      controller: _phoneCtrl,
      validator: (value) => value?.validateEmpty(AppStrings.phone),
    );
  }

  Widget _nationalityField() {
    return CustomTextfield(
      isPrefixIcon: false,
      hintText: AppStrings.nationality,
      keyboardType: TextInputType.text,
      controller: _nationalityCtrl,
      validator: (value) => value?.validateEmpty(AppStrings.nationality),
    );
  }


  Widget _positionField() {
    return CustomTextfield(
      isPrefixIcon: false,
      hintText: AppStrings.position,
      keyboardType: TextInputType.text,
      controller: _positionCtrl,
      validator: (value) => value?.validateEmpty(AppStrings.nationality),
    );
  }

  Future<void> _showDatePicker() {
    return Constants.showSelectDatePicker(
        context: context,
        getSelectedDate: (v) {
          _dobController.text = Constants.formatDateTime(
              parseFormat: AppStrings.dateFormatMMDDYYYY, inputDateTime: v!);
        });
  }
}
