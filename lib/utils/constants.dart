

import 'dart:developer';

import 'package:face_detection_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants{
  static const emailMaxLength = 35;
  static const nameMaxLendht = 30;
  static const descriptionMaxLenght = 275;
  static Future<void> showSelectDatePicker(
      {BuildContext? context,
      final ValueChanged<DateTime?>? getSelectedDate}) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: DateTime.now(),
       firstDate: DateTime(1800),
       lastDate: DateTime.now(),
        helpText: "Select Date",
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.blueColor, 
              
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.blueColor, // button text color
                ),
              ),
            ),
            child: Hero(tag: "selectDate", child: child!),
          );
        });
    if (picked != null) {
      getSelectedDate!(picked);
      /*    setState(() {
        SelectedDate = picked.toString().split(" ")[0];
        _date.text=SelectedDate;

      });*/
    }
  }

  static DateTime parseDateTime(
      {required String parseFormat,
      required String inputDateTime,
      bool utc = false}) {
    return DateFormat(parseFormat).parse(
      inputDateTime,
    );
  }

  static String formatDateTime(
      {required String parseFormat, required DateTime inputDateTime}) {
    // log("inputDateTime   $inputDateTime");
    return DateFormat(parseFormat).format(inputDateTime);
  }

 

   static String? formatDateTimeMethod(
      {String? createdDate,
      required String parseType,
      required String formatType}) {
    if (createdDate != null && createdDate.isNotEmpty) {
      return Constants.formatDateTime(
          parseFormat: formatType,
          inputDateTime: Constants.parseDateTime(
                  parseFormat: parseType, inputDateTime: createdDate, utc: true)
              .toLocal());
    }
    return null;
  }

  static String truncateText(String text, int maxLength) {
  if (text.length > maxLength) {
    return "${text.substring(0, maxLength)}...";
  }
  return text;
  }

  static void unFocusKeyboardMethod({required BuildContext context}) {
    FocusScope.of(context).unfocus();
  }

  static Future<void> showSelectTimePicker(
      {BuildContext? context,
      final ValueChanged<TimeOfDay?>? getSelectedTime}) async {
    unFocusKeyboardMethod(context: context!);
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
             data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: Theme(
              
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  
                  primary: AppColors.blackColor, // header background color
                  //onPrimary: Colors.black, // header text color
                  //onSurface: Colors.green, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: AppColors.blackColor, // button text color
                  ),
                ),
              ),
              child: child!,
            ),
          );
        });
    log("pickedTime hour ${pickedTime?.period}");
    
    if (pickedTime != null) {
      getSelectedTime!(pickedTime);
    }

    log("pickedTime  ${pickedTime}");
  }
}