import 'package:flutter/material.dart';
import 'package:renote_app/screens/search_old_book/components/body.dart';
import 'package:renote_app/screens/search_old_book/components/search_field.dart';
import '../../size_config.dart';

class SearchOldBookScreen extends StatelessWidget {
  static String routeName = "/search_old_book";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Padding(
                padding: EdgeInsets.only(top: getProportionateScreenWidth(5), ),
                child: SearchField(),
                ),
            leading: BackButton(),
            /*actions: <Widget>[
                //BackButton(),
                SearchField(),
            ],*/
        ),
        body: Body(),
    );
  }
}