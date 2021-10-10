import 'package:flutter/material.dart';
import 'package:renote_app/constants.dart';

import 'contents/body.dart';

class AddBookScreen extends StatelessWidget {
  static String routeName = "/add_book";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إضافة نوطة", textDirection: TextDirection.rtl, style:
          TextStyle(color: Colors.white)
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
    );
  }
}