import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SkipOrNextBottomSheet extends StatelessWidget {
  const SkipOrNextBottomSheet({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: const Color(0xff75E6DA),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            child: const Text(
              "SKIP",
              style: TextStyle(
                fontSize: 16,
                color: kPrimaryColor,
              ),
            ),
            onPressed: () {
              controller.animateToPage(
                2,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const WormEffect(
              dotColor: Colors.white,
              activeDotColor: kPrimaryColor,
              dotHeight: 12,
              dotWidth: 12,
            ),
          ),
          TextButton(
            child: const Text(
              "NEXT",
              style: TextStyle(
                fontSize: 16,
                color: kPrimaryColor,
              ),
            ),
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
