import 'package:e_commerce_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/layout_view/categories_view.dart';
import 'package:e_commerce_app/layout_view/home_view.dart';
import 'package:e_commerce_app/layout_view/profile_view.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static String id = "HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> views = [
    const HomeView(),
    const ProfileView(),
    const CategoriesView()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Scaffold(
          drawer: const CustomDrawer(),
          appBar: const CustomAppBar(title: "Trendy"),
          body: views[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {});
              currentIndex = value;
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.house), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.user), label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "Categories"),
            ],
          ),
        );
      },
    );
  }
}
