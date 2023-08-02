import 'package:e_commerce_app/Features/on_boarding/presentation/views/widgets/first_welcome_body.dart';
import 'package:e_commerce_app/Features/on_boarding/presentation/views/widgets/get_started_bottom_sheet.dart';
import 'package:e_commerce_app/Features/on_boarding/presentation/views/widgets/second_welcome_body.dart';
import 'package:e_commerce_app/Features/on_boarding/presentation/views/widgets/skip_or_next_bottom_sheet.dart';
import 'package:e_commerce_app/Features/on_boarding/presentation/views/widgets/third_welcome_body.dart';
import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecorationColor(),
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          onPageChanged: (value) {
            setState(() {
              isLastPage = value == 2;
            });
          },
          controller: controller,
          children: const [
            FirstWelcomeBody(),
            SecondWelcomeBody(),
            ThirdWelcomeBody(),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? const GetStartedBottomSheet()
          : SkipOrNextBottomSheet(controller: controller),
    );
  }
}
