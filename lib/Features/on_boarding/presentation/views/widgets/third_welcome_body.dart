import 'package:e_commerce_app/Features/on_boarding/presentation/views/widgets/on_boarding_body.dart';
import 'package:flutter/cupertino.dart';

class ThirdWelcomeBody extends StatelessWidget {
  const ThirdWelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 75,
        ),
        Padding(
          padding: EdgeInsets.all(36),
          child: Center(
            child: OnBoardingBody(
              height: 400,
              imgPath: "assets/images/shopping_bags.jpg",
              title: "Welcome",
              supTitle: "Ready to start shopping. Sign up to get started",
            ),
          ),
        ),
      ],
    );
  }
}
