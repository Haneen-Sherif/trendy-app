import 'package:flutter/material.dart';

class AboutMeAndMyProject extends StatelessWidget {
  const AboutMeAndMyProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name : Haneen Sherif Hassan.",
                    style: TextStyle(fontSize: 16)),
                SizedBox(
                  height: 8,
                ),
                Text(
                    "study at : Faculty of Computers and Information - Kafr El-Sheikh University.",
                    style: TextStyle(fontSize: 16)),
                SizedBox(
                  height: 16,
                ),
                Text(
                    '"Trendy" is a shopping app that allows users to browse, search for, and purchase products or services directly from their smartphones. this app offer a wide range of items, clothing ,electronics and jewelries.'),
                SizedBox(
                  height: 8,
                ),
                Text("Key features :"),
                Text(
                    "1- Onboarding screens initially appear only when the app is used for the first time or when the user logs out and logs back in."),
                Text(
                    "2- Users can create personal accounts to sign in, navigate through products, sign out, or delete their account if they want"),
                Text(
                    "3- This app displays a catalog of products with detailed descriptions, images, and prices."),
                Text(
                    "4- Users can add products to their virtual shopping carts before proceeding to checkout."),
                Text("5- Users can  provide feedback on products."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
