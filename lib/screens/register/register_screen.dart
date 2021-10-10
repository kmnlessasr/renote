import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/body.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/register";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إنشاء حساب", textDirection: TextDirection.rtl, style:
        TextStyle(color: Colors.white)
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
    );
  }
}