import 'package:e_commerce_app/Features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/Features/authentication/presentation/views/register_view.dart';
import 'package:e_commerce_app/Features/home/presentation/views/home_layout_view/home_layout.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:e_commerce_app/core/utils/widgets/custom_button.dart';
import 'package:e_commerce_app/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool visible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 270,
      decoration: buildBoxDecorationBoxShadow(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeLayout(),
              ),
            );
          } else if (state is AuthFailure) {
            showSnackBar(context, state.errMessage);
          }
        },
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Login",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Please login to your account",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                width: 200,
                child: CustomTextField(
                  onFieldSubmitted: (p0) {},
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Email address must not be empty";
                    } else {
                      return null;
                    }
                  },
                  icon: const Icon(FontAwesomeIcons.envelope),
                  title: "Email address",
                ),
              ),
              SizedBox(
                width: 200,
                child: CustomTextField(
                  onFieldSubmitted: (p0) {},
                  icon: IconButton(
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                      icon: !visible
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.visibility_off)),
                  textInputAction: TextInputAction.done,
                  obscureText: visible,
                  keyboardType: TextInputType.text,
                  title: "Password",
                  controller: passwordController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Password must not be empty";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterView(),
                          ));
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              CustomButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(context).loginUser(
                        email: emailController.text,
                        password: passwordController.text);
                    BlocProvider.of<AuthCubit>(context).emailController =
                        emailController;
                  } else {}
                },
                text: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
