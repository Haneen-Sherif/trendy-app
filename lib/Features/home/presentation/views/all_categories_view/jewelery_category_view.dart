import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/Features/home/presentation/views/product_details_view.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:e_commerce_app/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JeweleryCategory extends StatelessWidget {
  const JeweleryCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Jewelery"),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 90,
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("products")
              .where(
                'category',
                isEqualTo: 'jewelery',
              )
              .snapshots(),
          builder: (context, snapshot) {
            try {
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                clipBehavior: Clip.none,
                gridDelegate: gridViewStyle(),
                itemBuilder: (context, index) {
                  DocumentSnapshot product = snapshot.data!.docs[index];
                  return GestureDetector(
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
                    child: BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  blurRadius: 50,
                                  color: Colors.grey.withOpacity(.1),
                                  spreadRadius: 20,
                                  offset: const Offset(
                                    10,
                                    10,
                                  ),
                                ),
                              ]),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 16,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        product['title'].toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            r'$'
                                            '${product["price"].toString()}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                right: 10,
                                top: -75,
                                child: Image.asset(
                                  product["image"],
                                  height: 100,
                                  width: 100,
                                )),
                            Positioned(
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
                            Positioned(
                              bottom: 10,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  BlocProvider.of<CartCubit>(context)
                                      .addProduct(product);
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              );
            } catch (e) {
              print(e);
            }
            return const CustomLoadingIndicator();
          },
        ),
      ),
    );
  }
}
