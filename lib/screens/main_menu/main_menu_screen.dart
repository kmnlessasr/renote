import 'package:flutter/material.dart';
import 'package:renote_app/screens/main_menu/components/body.dart';
import '../../constants.dart';
class MainMenuScreen extends StatelessWidget {
  static String routeName = "/main_menu";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "القائمة الرئيسية",
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: Body(),
    );
  }
}