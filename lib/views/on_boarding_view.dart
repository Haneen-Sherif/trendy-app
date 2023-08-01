import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/views/register_view.dart';
import 'package:e_commerce_app/widgets/first_welcome_body.dart';
import 'package:e_commerce_app/widgets/second_welcome_body.dart';
import 'package:e_commerce_app/widgets/third_welcome_body.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        decoration: myColors(),
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          onPageChanged: (value) {
            setState(() => isLastPage = value == 2);
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
          ? TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: const Color(0xff75E6DA),
                  minimumSize: const Size.fromHeight(80)),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool("showRegister", true);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterView(),
                  ),
                );
              },
              child: const Text(
                "Get started",
                style: TextStyle(fontSize: 24, color: kPrimaryColor),
              ))
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: const Color(0xff75E6DA),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: const Text(
                        "SKIP",
                        style: TextStyle(fontSize: 16),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: const WormEffect(
                            activeDotColor: kPrimaryColor,
                            dotColor: Colors.white)),
                  ),
                  TextButton(
                      onPressed: () => controller.nextPage(
                          duration: const Duration(microseconds: 5000),
                          curve: Curves.easeInOut),
                      child: const Text(
                        "NEXT",
                        style: TextStyle(fontSize: 16),
                      )),
                ],
              ),
            ),
    );
  }
}
