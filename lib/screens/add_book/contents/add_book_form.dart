import 'package:flutter/material.dart';
import 'package:renote_app/components/custom_surfix_icon.dart';
import 'package:renote_app/helper/keyboard.dart';
import 'package:renote_app/helper/services.dart';
import 'package:renote_app/screens/main_menu/main_menu_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:renote_app/screens/forgot_password/forgot_password_screen.dart';
//import 'package:renote_app/screens/login_success/login_success_screen.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class AddBookForm extends StatefulWidget {
  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  final _formKey = GlobalKey<FormState>();
  String bookName, doctorName, bookCase, notes, rasoor;
  int pageNumber;
  bool remember = false;
  final List<String> bookCases = ["سيئ", "جيد", "ممتاز"];
  final List<String> rasoorCases = ["مسلك", "غير مسلك"];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildBookNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDoctorNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildBookCaseFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPageNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildRasoorFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildNotesFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "إضافة",
            press: () async {

              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                //await launch('tel:+963932056221');
                final prefs = await SharedPreferences.getInstance();
                final key = 'universityNumber';
                final universityNumber = prefs.getInt(key) ?? 0;
                Services.addBook(universityNumber, bookName, doctorName, bookCase, pageNumber, rasoor, notes).then((result) {
                  debugPrint(result);
                  if ('success' == result) {Navigator.pushNamed(context, MainMenuScreen.routeName);}
                });
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildBookNameFormField() {
    return TextFormField(
      onSaved: (newValue) => bookName = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return kBookNameNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "اسم النوطة",
        hintText: "أدخل اسم النوطة هنا",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildDoctorNameFormField() {
    return TextFormField(
      onSaved: (newValue) => doctorName = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return kDoctorNameNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "اسم الدكتور",
        hintText: "أدخل اسم الدكتور هنا",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  DropdownButtonFormField buildBookCaseFormField() {
    return DropdownButtonFormField(
      value: bookCase,
      decoration: InputDecoration(
        labelText: "حالة النوطة",
        hintText: "اختر حالة النوطة",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
      items: bookCases.map((status) {
        return DropdownMenuItem(
          value: status,
          child: Text('$status', textDirection: TextDirection.rtl,),
        );
      }).toList(),
      onSaved: (newValue) => bookCase = newValue,
      onChanged: (value) {return null;},
      validator: (value) {
        if (!bookCases.contains(value)) {
          return kBookCaseNullError;
        }
        return null;
      },
    );
  }

  TextFormField buildNotesFormField() {
    return TextFormField(
      onSaved: (newValue) => notes = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return kNotesNullError;
        }
        return null;
      },
      maxLines: null,
      decoration: InputDecoration(
        labelText: "الملاحظات",
        hintText: "أدخل الملاحظات هنا",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPageNumberFormField() {
    return TextFormField(
      onSaved: (newValue) => pageNumber = int.parse(newValue),
      validator: (value) {
        if (isInteger(value)==false) {
          return kPageNumberNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "عدد الصفحات",
        hintText: "أدخل عدد الصفحات هنا",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  DropdownButtonFormField buildRasoorFormField() {
    return DropdownButtonFormField(
      value: rasoor,
      decoration: InputDecoration(
        labelText: "حالة التسليك",
        hintText: "اختر حالة التسليك",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
      items: rasoorCases.map((rasoor) {
        return DropdownMenuItem(
          value: rasoor,
          child: Text('$rasoor', textDirection: TextDirection.rtl,),
        );
      }).toList(),
      onSaved: (newValue) => rasoor = newValue,
      onChanged: (value) {return null;},
      validator: (value) {
        if (!rasoorCases.contains(value)) {
          return kRasoorNullError;
        }
        return null;
      },
    );
  }

}
