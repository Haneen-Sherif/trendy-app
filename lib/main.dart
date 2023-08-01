import 'package:e_commerce_app/about_me_and_my_project.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/views/on_boarding_view.dart';
import 'package:e_commerce_app/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final showRegister = prefs.getBool("showRegister") ?? false;
  runApp(MyApp(showRegister: showRegister));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.showRegister}) : super(key: key);

  final bool showRegister;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Poppins", primarySwatch: mycolor),
        debugShowCheckedModeBanner: false,
        //home: AboutMeAndMyProject()
        home: showRegister ? const RegisterView() : const OnBoardingView(),
      ),
    );
  }
}
