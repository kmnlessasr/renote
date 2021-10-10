import 'package:flutter/widgets.dart';
import 'package:renote_app/screens/add_book/add_book_screen.dart';
import 'package:renote_app/screens/splash/splash_screen.dart';
import 'package:renote_app/screens/register/register_screen.dart';
import 'package:renote_app/screens/main_menu/main_menu_screen.dart';
import 'package:renote_app/screens/search_old_book/search_old_book_screen.dart';
import 'package:renote_app/screens/register/register_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  MainMenuScreen.routeName: (context) => MainMenuScreen(),
  SearchOldBookScreen.routeName: (context) => SearchOldBookScreen(),
  AddBookScreen.routeName: (context) => AddBookScreen(),
};