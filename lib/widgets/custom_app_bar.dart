import 'package:e_commerce_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/views/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const CheckoutView();
                          },
                        ));
                      },
                      icon: const Icon(
                        FontAwesomeIcons.cartPlus,
                        color: Colors.black,
                      )),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 12,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xffD4F1F4),
                    radius: 10,
                    child: Center(
                      child: Text(
                          "${BlocProvider.of<CartCubit>(context).selectedProducts.length}",
                          style: const TextStyle(fontSize: 12)),
                    ),
                  ),
                ),
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
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
