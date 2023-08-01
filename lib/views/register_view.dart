import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/widgets/register_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  static String id = 'RegisterView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: myColors(),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 24,
              ),
              RegisterBody()
            ],
          ),
        ),
      ),
    );
  }
}
