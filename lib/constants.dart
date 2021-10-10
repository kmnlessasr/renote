import 'package:flutter/material.dart';
import 'package:renote_app/size_config.dart';

const kPrimaryColor = Color(0xFF7A30A1);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kNotesNullError = "رجاء قم بإدخال ملاحظاتك";
const String kNameNullError = "رجاء قم بإدخال اسمك";
const String kCityNullError = "رجاء قم باختيار محافظتك";
const String kUniversityNullError = "رجاء قم بإدخال كليتك";
const String kUniversityNumberNullError = "رجاء قم بإدخال رقمك الجامعي";
const String kYearNullError = "رجاء قم باختيار سنتك الدراسية";
const String kBookNameNullError = "رجاء قم بإدخال اسم النوطة";
const String kDoctorNameNullError = "رجاء قم بإدخال اسم الدكتور";
const String kBookCaseNullError = "رجاء قم باختيار حالة الكتاب";
const String kRasoorNullError = "رجاء قم باختيار حالة تسليك الكتاب";
const String kPageNumberNullError = "رجاء قم بإدخال عدد صفحات النوطة";
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

bool isInteger(String s) {
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}
