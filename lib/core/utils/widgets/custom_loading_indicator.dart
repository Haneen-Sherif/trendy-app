import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LoadingIndicator(
        indicatorType: Indicator.ballClipRotate,
        colors: [kPrimaryColor],
      ),
    );
  }
}
