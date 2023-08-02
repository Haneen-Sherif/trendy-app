import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key, required this.product}) : super(key: key);
  final DocumentSnapshot product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: buildCardBoxDecoration(),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 10,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        widget.product['title'].toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            r'$' '${widget.product['price'].toString()}',
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
                  widget.product['image'],
                  height: 100,
                  width: 100,
                )),
            Positioned(
              bottom: 10,
              child: IconButton(
                  onPressed: () {
                    try {
                      BlocProvider.of<CartCubit>(context)
                          .removeProduct(widget.product);
                    } catch (e) {
                      print(e);
                    }
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: kSecondaryColor,
                  )),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: IconButton(
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context)
                        .addProduct(widget.product);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: kSecondaryColor,
                  )),
            ),
          ],
        );
      },
    );
  }


}
