import 'dart:async';
import 'package:flutter/material.dart';
import 'package:renote_app/components/custom_surfix_icon.dart';
import 'package:renote_app/helper/keyboard.dart';
import 'package:renote_app/screens/main_menu/main_menu_screen.dart';
import 'package:renote_app/helper/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:renote_app/screens/forgot_password/forgot_password_screen.dart';
//import 'package:renote_app/screens/login_success/login_success_screen.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:url_launcher/url_launcher.dart';


class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}
class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String city;
  String university;
  String year;
  int universityNumber;
  bool remember = false;
  final List<String> years = [
    "الأولى",
    "الثانية",
    "الثالثة",
    "الرابعة",
    "الخامسة",
    "السادسة"
  ];
  final List<String> cities = [
    "إدلب",
    "الحسكة",
    "حلب",
    "حماة",
    "حمص",
    "دير الزور",
    "دمشق",
    "ريف دمشق",
    "درعا",
    "الرقة",
    "السويداء",
    "طرطوس",
    "القنيطرة",
    "اللاذقية"
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCityFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildUniversityFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildUniversityNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildYearFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          /*Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => {},//Navigator.pushNamed(
                    //context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),*/
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "استمرار",
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                //Save universityNumber locally
                _save(universityNumber);
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                //await launch('tel:+963932056221');
                Services.addStudent(name, city, university, year, universityNumber).then((result) {
                  if ('success' == result) {Navigator.pushNamed(context, MainMenuScreen.routeName);}
                });
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return kNameNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "الاسم",
        hintText: "أدخل الاسم هنا",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  DropdownButtonFormField buildCityFormField() {
    return DropdownButtonFormField(
      value: city,
      decoration: InputDecoration(
        labelText: "المحافظة",
        hintText: "اختر محافظة",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
      items: cities.map((city) {
        return DropdownMenuItem(
          value: city,
          child: Text('$city', textDirection: TextDirection.rtl,),
        );
      }).toList(),
      onSaved: (newValue) => city = newValue,
      onChanged: (value) {return null;},
      validator: (value) {
        if (!cities.contains(value)) {
          return kCityNullError;
        }
        return null;
      },
    );
  }

  TextFormField buildUniversityFormField() {
    return TextFormField(
      onSaved: (newValue) => university = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return kUniversityNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "الكلية",
        hintText: "أدخل الكلية هنا",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildUniversityNumberFormField() {
    return TextFormField(
      onSaved: (newValue) => universityNumber = int.parse(newValue),
      validator: (value) {
        if (!isInteger(value)) {
          return kUniversityNumberNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "الرقم الجامعي",
        hintText: "أدخل الرقم الجامعي هنا",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  DropdownButtonFormField buildYearFormField() {
    return DropdownButtonFormField(
      value: year,
      decoration: InputDecoration(
        labelText: "السنة الدراسية",
        hintText: "اختر سنة دراسية",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
      items: years.map((year) {
        return DropdownMenuItem(
          value: year,
          child: Text('$year', textDirection: TextDirection.rtl),
        );
      }).toList(),
      onSaved: (newValue) => year = newValue,
      onChanged: (value) {return null;},
      validator: (value) {
        if (!years.contains(value)) {
          return kYearNullError;
        }
        return null;
      },
    );
  }

}
_save(int universityNumber) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'universityNumber';
  final value = universityNumber;
  prefs.setInt(key, value);
}
