import 'package:e_commerce_app/Features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutTotalPrice extends StatelessWidget {
  const CheckOutTotalPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
  builder: (context, state) {
    return Text(
        "Total: ${BlocProvider.of<CartCubit>(context).price.round().toString()}\$",
        style: const TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
  },
);
  }
}