import 'package:e_commerce_app/constants.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.height,
    required this.imgPath,
    required this.title,
    required this.supTitle,
  });

  final double height;
  final String imgPath;
  final String title;
  final String supTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myBoxDecoration(),
      height: height,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgPath, width: 200, height: 150),
          const SizedBox(
            height: 36,
          ),
          Text(title,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(supTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.grey)),
          )
        ],
      ),
    );
  }
}
