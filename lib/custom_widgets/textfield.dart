// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables
import 'package:face_detection_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatefulWidget {
  String? hintText;
  TextEditingController? controller;
  bool isPasswordField;
  bool isReadOnly;
  bool isCenterText;
  bool? isBorder;
  String? prefixIconPath;
  Widget? suffixIcon;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String?)? validator;
  String? Function(String?)? onSaved;
  String? initialVal;
  TextInputType? keyboardType;
  Function()? onTap;
  Color? bgColor;
  Color? borderColor;
  bool isPrefixIcon;
  bool? isSuffixIcon;
  Widget? prefix;
  int? maxLines;
  EdgeInsetsGeometry? padding;
  AutovalidateMode? autoValidateMode;
  void Function(String)? onChanged;

  CustomTextfield({
    this.hintText,
    this.prefixIconPath,
    this.autoValidateMode,
    this.isReadOnly = false,
    this.controller,
    this.bgColor,
    this.prefix,
    this.onTap,
    this.borderColor,
    this.padding,
    this.isBorder,
    this.isSuffixIcon,
    this.inputFormatters,
    this.initialVal,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.onSaved,
    this.maxLines,
    this.isPasswordField = false,
    this.isCenterText = false,
    this.isPrefixIcon = true,
    this.onChanged,
  });
  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool textVisible;
  @override
  void initState() {
    textVisible = widget.isPasswordField;
    super.initState();
  }

  bool isVisible = true;

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return textFormField();
  }

  TextFormField textFormField() {
    return TextFormField(
      onTap: widget.onTap,
      focusNode: _focusNode,
      readOnly: widget.isReadOnly,
      inputFormatters: widget.inputFormatters,
      autovalidateMode: widget.autoValidateMode ?? AutovalidateMode.disabled,
      initialValue: widget.initialVal,
      textAlign: widget.isCenterText ? TextAlign.center : TextAlign.left,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      obscureText: textVisible,
      maxLines: widget.maxLines ?? 1,
      controller: widget.controller,
      onSaved: widget.onSaved,
      style: _textFormFieldTextStyle(),
      
      decoration: InputDecoration(
        
          prefixIcon: widget.isPrefixIcon == true ? _prefixIconWidget() : null,
          errorMaxLines: 3,
          filled: true,
          prefix: widget.prefix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 0,
              color: widget.borderColor ?? Colors.black,
              style: widget.isBorder == true ? BorderStyle.solid : BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 1,
              color: widget.borderColor ?? Colors.black,
              style: widget.isBorder == true ? BorderStyle.solid : BorderStyle.none,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 1,
              color: widget.borderColor ?? Colors.black,
              style: widget.isBorder == true ? BorderStyle.solid : BorderStyle.none,
            ),
          ),
          fillColor: widget.bgColor ?? AppColors.greyColor,
          
          contentPadding: widget.padding ?? EdgeInsets.symmetric(vertical: 15,horizontal: 20),
          hintText: widget.hintText,
          isDense: true,
          errorStyle: _errorStyle(),
          labelStyle: TextStyle(color: _focusNode.hasFocus ? Colors.red : Colors.black)),
    );
  }

  TextStyle _textFormFieldTextStyle() {
    return TextStyle(
      fontSize: 17,
      color: AppColors.blackColor,
    );
  }

  Transform _prefixIconWidget() {
    return Transform.scale(
      scale: 0.45,
      child: ImageIcon(
        AssetImage(widget.prefixIconPath ?? ''),
        color: AppColors.blackColor,
      ),
    );
  }

  TextStyle _errorStyle() {
    return TextStyle(
      color: Colors.red,
    );
  }

  GestureDetector _suffixIconWidget() {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(right: 30.w),
        child: Transform.scale(
          scale: 0.6,
          child: widget.suffixIcon,
        ),
      ),
    );
  }

  
}
