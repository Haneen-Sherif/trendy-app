import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/views/all_categories_view/electronics.dart';
import 'package:e_commerce_app/views/all_categories_view/jewelery.dart';
import 'package:e_commerce_app/views/all_categories_view/menClothing.dart';
import 'package:e_commerce_app/views/all_categories_view/womenClothing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({
    super.key,
  });

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
