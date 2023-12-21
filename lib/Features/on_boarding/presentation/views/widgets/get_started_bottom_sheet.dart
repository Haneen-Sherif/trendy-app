import 'package:e_commerce_app/Features/authentication/presentation/views/register_view.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/widgets/custom_auth_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedBottomSheet extends StatelessWidget {
  const GetStartedBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size.fromHeight(80),
        backgroundColor: const Color(0xff75E6DA),
      ),
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool("showRegister", true);
        Navigator.pushReplacement(
          context,
          CustomAuthRoute(
            page: RegisterView(),
            transitionDuration: const Duration(seconds: 1),
          ),
        );
      },
      child: const Text(
        "Get Started",
        style: TextStyle(
          fontSize: 24,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
