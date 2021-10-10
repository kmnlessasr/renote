import 'package:flutter/material.dart';
import 'package:renote_app/components/product_card.dart';
import 'package:renote_app/routes.dart';
import 'package:renote_app/screens/add_book/add_book_screen.dart';
import 'package:renote_app/screens/search_old_book/search_old_book_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../main_menu_screen.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "اختر ما تريد", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
            child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: [
                ProductCard(image: "assets/images/splash_1.png", title: "تبحث عن نوطة قديمة", route: SearchOldBookScreen.routeName),
                ProductCard(image: "assets/images/splash_2.png", title: "تريد أن توزع/تبيع كتاباً", route: AddBookScreen.routeName),
                ProductCard(image: "assets/images/splash_3.png", title: "تريد كتاباً جديداً", route: SearchOldBookScreen.routeName),
    Padding(
    padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
    child: SizedBox(
    width: getProportionateScreenWidth(130),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    AspectRatio(
    aspectRatio: 1.2,
    child: Container(
    //padding: EdgeInsets.all(getProportionateScreenWidth(20)),
    decoration: BoxDecoration(
    color: kSecondaryColor.withOpacity(0.1),
    borderRadius: BorderRadius.circular(15),
    ),
    child: GestureDetector(
    onTap: () => debugPrint("Nothing"),
    child: Image.asset(
    "assets/images/special.png",
    fit: BoxFit.fill,
    ),
    ),
    ),
    ),
    const SizedBox(height: 5),
    Text(
    "تريد منتجاً مميزاً",
    style: TextStyle(color: Colors.black),
    maxLines: 2,
    ),
    ],
    ),
    ),
    )
            ],
        ),
        ),


        /*Row(
            children: [
                ProductCard(image: "assets/images/Image Banner 3.png", title: "Do"),
                ProductCard(image: "assets/images/Image Banner 3.png", title: "Do"),
            ]
        ),
        ProductCard(image: "assets/images/Image Banner 3.png", title: "Do"),*/

        
        
        /*SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular)
                    return ProductCard(product: demoProducts[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )*/
      ],
    );
  }
}