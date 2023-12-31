import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/Features/home/presentation/views/product_details_view.dart';
import 'package:e_commerce_app/Features/home/presentation/views/widgets/check_out_total_price.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/utils/widgets/custom_drawer.dart';
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
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: BlocProvider.of<CartCubit>(context)
                        .selectedProducts
                        .length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot product =
                          BlocProvider.of<CartCubit>(context)
                              .selectedProducts[index];
                      return Card(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsView(
                                  product: product,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              ListTile(
                                subtitle: Text(
                                    "${BlocProvider.of<CartCubit>(context).selectedProducts[index]['price'].toString()}\$"),
                                leading: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        BlocProvider.of<CartCubit>(context)
                                            .selectedProducts[index]['image']
                                            .toString())),
                                title: Text(
                                  BlocProvider.of<CartCubit>(context)
                                      .selectedProducts[index]['title']
                                      .toString(),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 10,
                                child: IconButton(
                                  onPressed: () {
                                    try {
                                      BlocProvider.of<CartCubit>(context)
                                          .removeProduct(product);
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    color: kSecondaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const CheckOutTotalPrice(),
              ],
            ),
          ),
        );
      },
    );
  }
}


