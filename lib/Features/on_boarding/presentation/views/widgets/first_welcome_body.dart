import 'package:e_commerce_app/Features/on_boarding/presentation/views/widgets/on_boarding_body.dart';
import 'package:flutter/cupertino.dart';

class FirstWelcomeBody extends StatelessWidget {
  const FirstWelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 80,
        ),
        Padding(
          padding: EdgeInsets.all(32),
          child: Center(
            child: OnBoardingBody(
              height: 400,
              imgPath: "assets/images/o1.jpg",
              title: "Discover",
              supTitle: "Explore world top brands and boutiques",
            ),
          ),
        ),
      ],
    );
  }
}
