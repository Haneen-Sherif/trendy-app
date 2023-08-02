import 'package:e_commerce_app/Features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/Features/home/presentation/views/checkout_view.dart';
import 'package:e_commerce_app/Features/home/presentation/views/home_layout_view/home_layout.dart';
import 'package:e_commerce_app/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce_app/about_me_and_my_project.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final auth = FirebaseAuth.instance;
  late User signedInUser;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: const AssetImage('assets/images/user.png'),
              ),
              decoration: const BoxDecoration(color: kPrimaryColor),
              accountName: const Text("Welcome"),
              accountEmail: Text(signedInUser.email.toString())),
          ListTile(
            title: const Text("Home"),
            leading: const Icon(FontAwesomeIcons.house, color: kPrimaryColor),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeLayout(),
                  ));
            },
          ),
          ListTile(
            title: const Text("Purchases"),
            leading:
                const Icon(FontAwesomeIcons.cartPlus, color: kPrimaryColor),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CheckoutView(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(FontAwesomeIcons.rightFromBracket,
                color: kPrimaryColor),
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
            },
          ),
          ListTile(
            title: const Text("About"),
            leading:
            const Icon(FontAwesomeIcons.addressCard, color: kPrimaryColor),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutMeAndMyProject(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void getCurrentUser() {
    final user = auth.currentUser;
    if (user != null) {
      signedInUser = user;
    }
  }
}
