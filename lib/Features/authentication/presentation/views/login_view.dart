import 'package:e_commerce_app/Features/authentication/presentation/views/widgets/login_body.dart';
import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: buildBoxDecorationColor(),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 154,
              ),
              LoginBody()
            ],
          ),
        ),
      ),
    );
  }
}
