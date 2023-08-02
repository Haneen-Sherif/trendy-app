import 'package:e_commerce_app/Features/home/presentation/views/checkout_view.dart';
import 'package:e_commerce_app/core/utils/widgets/nomber_of_purchases.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const CheckoutView();
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    FontAwesomeIcons.cartPlus,
                  )),
            ),
            const NumberOfPurchases(),
          ],
        )
      ],
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
