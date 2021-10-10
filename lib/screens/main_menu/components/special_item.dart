import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

void openUrl(String url) async{
    if(await canLaunch(url)){
        await launch(url);
    }
    else{
        throw 'Can not open url: $url';
    }
}

class SpecialItem extends StatelessWidget {
  const SpecialItem({
    Key key,
    this.telegram,
    this.image,
  }) : super(key: key);
  final String telegram, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        GestureDetector(
            onTap: () => openUrl(telegram),
            child: Image.asset(
            image,
            height: getProportionateScreenHeight(265),
            width: getProportionateScreenWidth(235),
            ),
        )
      ],
    );
  }
}