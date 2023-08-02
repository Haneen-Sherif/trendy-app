import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AboutMeAndMyProject extends StatelessWidget {
  const AboutMeAndMyProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: buildBoxDecorationColor(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 200,
                            child: Text("Name : Haneen Sherif Hassan."),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child:
                                Image.asset("assets/images/me.jpg", width: 70),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                          "study at : Faculty of Computers and Information - Kafr El-Sheikh University."),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                      '"Trendy" is a shopping app that allows users to browse, and purchase products or services directly from their smartphones. this app offer a wide range of items, clothing ,electronics and jewelries.'),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text("Key features :"),
                  const Text(
                      "1- Onboarding screens initially appear only when the app is used for the first time or when the user logs out and logs back in."),
                  const Text(
                      "2- Users can create personal accounts to sign in, navigate through products, sign out, or delete their account if they want"),
                  const Text(
                      "3- This app displays a catalog of products with detailed descriptions, images, and prices."),
                  const Text(
                      "4- Users can add products to their virtual shopping carts before proceeding to checkout."),
                  const Text("5- Users can  provide feedback on products."),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
