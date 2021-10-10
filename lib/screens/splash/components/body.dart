import 'package:flutter/material.dart';
import 'package:renote_app/constants.dart';
import 'package:renote_app/screens/main_menu/main_menu_screen.dart';
import 'package:renote_app/screens/register/register_screen.dart';
import 'package:renote_app/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

// This is the best practice
import '../../../main.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String nextRoute;
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "!دعنا نبدأ Renote أهلاً بك في",
      "image": "assets/images/renote.png"
    },
    {
      "text": "نساعد الطلاب على التواصل لتمكينهم من مشاركة الكتب والنوطات",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "بإمكانك البحث من خلال هذه المنصة عن نوطة محددة للتواصل مع صاحبها",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "استمرار",
                      press: () {
                        _read(context);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

_read(context) async {
  String nextRoute = RegisterScreen.routeName;
final prefs = await SharedPreferences.getInstance();
final key = 'universityNumber';
final value = prefs.getInt(key) ?? 0;
debugPrint(value.toString());
if (value > 0) {
  nextRoute = MainMenuScreen.routeName;
}
  Navigator.pushNamed(context, nextRoute);
  //Navigator.pushNamed(context, SignInScreen.routeName);
}
