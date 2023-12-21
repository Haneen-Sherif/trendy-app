import 'package:e_commerce_app/Features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberOfPurchases extends StatelessWidget {
  const NumberOfPurchases({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return CircleAvatar(
          backgroundColor: Colors.white,
          radius: 12,
          child: CircleAvatar(
            backgroundColor: const Color(0xffD4F1F4),
            radius: 10,
            child: Center(
              child: Text(
                "${BlocProvider.of<CartCubit>(context).selectedProducts.length}",
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        );
      },
    );
  }
}
