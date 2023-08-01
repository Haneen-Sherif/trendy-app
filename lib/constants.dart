import 'package:flutter/material.dart';

BoxDecoration myColors() {
  return const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
        Color(0xff05445E),
        Color(0xff189AB4),
        Color(0xff75E6DA),
        Color(0xffD4F1F4),
      ]));
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    ),
  ], color: Colors.white, borderRadius: BorderRadius.circular(8));
}

ButtonStyle iconStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.grey.shade400.withOpacity(0.5),
    shape: const CircleBorder(),
    elevation: 0,
    padding: const EdgeInsets.all(10),
  );
}

SliverGridDelegateWithFixedCrossAxisCount gridViewStyle() {
  return const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 1.5,
    crossAxisSpacing: 10,
    mainAxisSpacing: 100,
  );
}

const kSecondarColor = Color(0xffF51720);
const kPrimaryColor = Color(0xff05445E);

MaterialColor mycolor = MaterialColor(
  kPrimaryColor.value,
  <int, Color>{
    50: kPrimaryColor.withOpacity(0.1),
    100: kPrimaryColor.withOpacity(0.2),
    200: kPrimaryColor.withOpacity(0.3),
    300: kPrimaryColor.withOpacity(0.4),
    400: kPrimaryColor.withOpacity(0.5),
    500: kPrimaryColor.withOpacity(0.6),
    600: kPrimaryColor.withOpacity(0.7),
    700: kPrimaryColor.withOpacity(0.8),
    800: kPrimaryColor.withOpacity(0.9),
    900: kPrimaryColor.withOpacity(1),
  },
);
