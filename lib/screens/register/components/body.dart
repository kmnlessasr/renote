import 'package:flutter/material.dart';
// import 'package:renote_app/components/no_account_text.dart';
// import 'package:renote_app/components/socal_card.dart';
import '../../../size_config.dart';
import 'register_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "أهلاً بك",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "قم بتعبئة البيانات رجاءً",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                RegisterForm(), // Called from register_form.dart
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),*/
                SizedBox(height: getProportionateScreenHeight(20)),
                //NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}