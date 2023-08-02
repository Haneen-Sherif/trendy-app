import 'package:e_commerce_app/Features/home/presentation/views/all_categories_view/electronics_category_view.dart';
import 'package:e_commerce_app/Features/home/presentation/views/all_categories_view/jewelery_category_view.dart';
import 'package:e_commerce_app/Features/home/presentation/views/all_categories_view/men_clothing_category_view.dart';
import 'package:e_commerce_app/Features/home/presentation/views/all_categories_view/women_clothing_category_view.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ElectronicsCategory(),
                ));
          },
          child: const ListTile(
            title: Text("Electronics"),
            trailing: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(FontAwesomeIcons.arrowRight, color: kPrimaryColor),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const JeweleryCategory(),
                ));
          },
          child: const ListTile(
            title: Text("Jewelery"),
            trailing: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(FontAwesomeIcons.arrowRight, color: kPrimaryColor),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MenClothingCategory(),
                ));
          },
          child: const ListTile(
            title: Text("Men's clothing"),
            trailing: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(FontAwesomeIcons.arrowRight, color: kPrimaryColor),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WomenClothingCategory(),
                ));
          },
          child: const ListTile(
            title: Text("Women's clothing"),
            trailing: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(FontAwesomeIcons.arrowRight, color: kPrimaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
