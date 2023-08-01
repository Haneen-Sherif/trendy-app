import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key, this.product}) : super(key: key);
  static String id = "CheckoutView";
  final DocumentSnapshot? product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          drawer: const CustomDrawer(),
          appBar: const CustomAppBar(title: "Checkout"),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: BlocProvider.of<CartCubit>(context)
                        .selectedProducts
                        .length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          subtitle: Text(
                              "${BlocProvider.of<CartCubit>(context).selectedProducts[index]['price'].toString()}\$"),
                          leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                  BlocProvider.of<CartCubit>(context)
                                      .selectedProducts[index]['image']
                                      .toString())),
                          title: Text(BlocProvider.of<CartCubit>(context)
                              .selectedProducts[index]['title']
                              .toString()),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                    "Total: ${BlocProvider.of<CartCubit>(context).price.round().toString()}\$",
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );
  }
}
