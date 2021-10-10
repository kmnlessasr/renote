import 'package:flutter/material.dart';
import 'package:renote_app/size_config.dart';
import 'package:renote_app/constants.dart';
import 'search_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
                children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                ],
            ),
        ),
    );
  }
}