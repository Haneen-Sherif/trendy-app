import 'package:e_commerce_app/Features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/Features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:e_commerce_app/core/utils/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final user = FirebaseAuth.instance.currentUser;
  final auth = FirebaseAuth.instance;
  bool visible = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController? email =
        BlocProvider
            .of<AuthCubit>(context)
            .emailController;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("Email: ${email!.text}"),
              subtitle: CustomTextField(
                obscureText: false,
                onFieldSubmitted: (p0) async {
                  try {
                    await user?.updateEmail(emailController.text);
                    showSnackBar(context, "Email updated successfully");
                  } catch (e) {
                    print(e);
                  }
                },
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (p0) {
                  return null;
                },
                title: "Update your email",
              ),
              trailing: IconButton(
                onPressed: () async {
                  try {
                    await user?.updateEmail(emailController.text);
                    showSnackBar(context, "Email updated successfully");
                  } catch (e) {
                    print(e);
                  }
                },
                icon: const Icon(FontAwesomeIcons.penToSquare,
                    color: kPrimaryColor),
              ),
            ),
            ListTile(
              title: CustomTextField(
                icon: IconButton(
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    icon: !visible
                        ? const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.visibility_off)),
                obscureText: visible,
                onFieldSubmitted: (p0) async {
                  try {
                    await user?.updatePassword(passwordController.text);
                    showSnackBar(context, "Password updated successfully");
                  } catch (e) {
                    print(e);
                  }
                },
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                controller: passwordController,
                validator: (p0) {
                  return null;
                },
                title: "Update your password",
              ),
              trailing: IconButton(
                onPressed: () async {
                  try {
                    await user?.updatePassword(passwordController.text);
                    showSnackBar(context, "Password updated successfully");
                  } catch (e) {
                    print(e);
                  }
                },
                icon: const Icon(FontAwesomeIcons.penToSquare,
                    color: kPrimaryColor),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: () async {
                BlocProvider.of<CartCubit>(context).reset();
                auth.signOut();
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool("showRegister", false);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnBoardingView(),
                  ),
                );
                //Navigator.pushNamed(context, WelcomeView.id);
              },
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(FontAwesomeIcons.rightFromBracket),
                  ),
                  Text("Logout")
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            deleteUserEmail(context)
          ],
        ),
      ),
    );
  }

  Column deleteUserEmail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Delete account",
            style: TextStyle(color: kSecondaryColor, fontSize: 24)),
        const SizedBox(
          height: 32,
        ),
        const Text(
            "Once you delete your account, there is no going back. Please be certain."),
        const SizedBox(
          height: 24,
        ),
        GestureDetector(
          onTap: () async {
            try {
              BlocProvider.of<CartCubit>(context).reset();
              await user?.delete();
              await FirebaseAuth.instance.signOut();
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool("showRegister", false);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnBoardingView(),
                  ));
              //Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeView(),));
            } catch (e) {
              print(e);
            }
          },
          child: const Text("Click here to delete",
              style: TextStyle(color: kSecondaryColor)),
        ),
      ],
    );
  }

  ListTile updateUserEmail(TextEditingController? email, BuildContext context) {
    return ListTile(
      title: Text("Email: ${email!.text}"),
      subtitle: CustomTextField(
        obscureText: false,
        onFieldSubmitted: (p0) async {
          try {
            await user?.updateEmail(emailController.text);
            showSnackBar(context, "Updated successfully");
          } catch (e) {
            print(e);
          }
        },
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        validator: (p0) {
          return null;
        },
        title: "Update your email",
      ),
      trailing: IconButton(
        onPressed: () async {
          try {
            await user?.updateEmail(emailController.text);
            showSnackBar(context, "Updated successfully");
          } catch (e) {
            print(e);
          }
        },
        icon: const Icon(FontAwesomeIcons.penToSquare, color: kPrimaryColor),
      ),
    );
  }
}
