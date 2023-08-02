import 'package:e_commerce_app/Features/home/presentation/views/home_layout_view/categories_view.dart';
import 'package:e_commerce_app/Features/home/presentation/views/home_layout_view/home_view.dart';
import 'package:e_commerce_app/Features/home/presentation/views/home_layout_view/profile_view.dart';
import 'package:e_commerce_app/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/utils/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

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
  }
}
