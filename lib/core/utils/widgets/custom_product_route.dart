import 'package:flutter/material.dart';

class CustomProductRoute extends PageRouteBuilder {
  final Widget page;
  final Duration transitionDuration;

  CustomProductRoute({
    required this.page,
    required this.transitionDuration,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: transitionDuration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOutCirc;
            var slideTween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );
            var offsetAnimation = animation.drive(slideTween);

            var fadeAnimation = Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(animation);
            var scaleAnimation = Tween<double>(
              begin: 0.5,
              end: 1.0,
            ).animate(animation);

            return FadeTransition(
              opacity: fadeAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: SlideTransition(
                  position: offsetAnimation,
                  child: child,
                ),
              ),
            );
          },
        );
}
