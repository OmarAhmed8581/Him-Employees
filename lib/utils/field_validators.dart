

import 'package:face_detection_app/utils/app_strings.dart';
import 'package:face_detection_app/utils/regular_expressions.dart';

extension FieldValidator on String {
  get validateEmail {
    if (!RegularExpressions.EMAIL_VALID_REGIX.hasMatch(this) && isNotEmpty) {
      return AppStrings.EMAIL_INVALID_ERROR;
    } else if (isEmpty) {
      return AppStrings.EMAIL_EMPTY_ERROR;
    }
    return null;
  }


 


  //---------------- Empty Validator -----------------
  validateEmpty(String message) {
    if (isEmpty) {
      return '$message field can\'t be empty.';
    } else {
      return null;
    }
  }

  //---------------- Phone Number Validator ----------
  get validatePhoneNumber {
    // print("Number : " + this);
    if (isEmpty) {
      return AppStrings.PHONE_NO_EMPTY_ERROR;
    }
    // if (length < 10) {
    //   return AppStrings.PHONE_NO_INVALID_LENGTH;
    // }
    else {
      return null;
    }
  }


  



//---------------- OTP Validator ---------------
  String? validateOtp(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  String capitalize() {
    return "${this.toUpperCase()}";
  }

  static String getTimeDifferenceFromNow(DateTime? dateTime) {
    Duration difference = DateTime.now().difference(dateTime!);
    if (difference.inSeconds < 5) {
      return "Just now";
    } else if (difference.inMinutes < 1) {
      return "${difference.inSeconds}s ago";
    } else if (difference.inHours < 1) {
      return "${difference.inMinutes}m ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours}h ago";
    } else if (difference.inDays > 7) {
      return "more a week";
    } else {
      return "${difference.inDays}d ago";
    }
  }
//   String? validateEmpty(String value) {
//     if (value == '') {
//       return "Field can't be empty";
//     }
//     return null;
//   }

// get validateNewPassword {
//   if (isEmpty) {
//     return "New password field can't be empty";
//   } else if (!RegularExpressions.PASSWORD_VALID_REGIX.hasMatch(this) && isNotEmpty) {
//     return 'New ${AppStrings.PASSWORD_INVALID_ERROR_TEXT}';
//   }
//   return null;
// }

}
