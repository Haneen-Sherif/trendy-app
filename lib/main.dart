import 'package:e_commerce_app/Features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/Features/authentication/presentation/views/register_view.dart';
import 'package:e_commerce_app/Features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce_app/about_me_and_my_project.dart';
import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final showRegister = prefs.getBool("showRegister") ?? false;
  runApp(MyApp(
    showRegister: showRegister,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.showRegister,
  });

  final bool showRegister;

  // This widget is the root of your application.
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          primarySwatch: myColor,
        ),
        //home: const AboutMeAndMyProject(),
        home: showRegister ? const RegisterView() : const OnBoardingView(),
      ),
    );
  }
}
