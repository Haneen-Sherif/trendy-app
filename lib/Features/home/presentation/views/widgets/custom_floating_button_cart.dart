import 'package:e_commerce_app/Features/home/presentation/views/checkout_view.dart';
import 'package:e_commerce_app/core/utils/widgets/nomber_of_purchases.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFloatingButtonCart extends StatelessWidget {
  const CustomFloatingButtonCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            ),
          ),
        ),
        const NumberOfPurchases(),
      ],
    );
  }
}