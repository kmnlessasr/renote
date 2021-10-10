import 'package:flutter/material.dart';
import 'package:renote_app/constants.dart';
import 'package:renote_app/routes.dart';
import 'package:renote_app/screens/main_menu/main_menu_screen.dart';
import 'package:renote_app/screens/register/register_screen.dart';
import 'package:renote_app/screens/splash/splash_screen.dart';
import 'package:renote_app/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:renote_app/screens/register/components/register_form.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(), 
      // We use routeName so that we don't need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}