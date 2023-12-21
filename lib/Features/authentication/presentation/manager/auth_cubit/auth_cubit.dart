import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    this.emailController,
    this.passwordController,
  }) : super(AuthInitial());
  TextEditingController? emailController;
  TextEditingController? passwordController;

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } on FirebaseException catch (e) {
      if (e.code == "weak-password") {
        emit(
          AuthFailure(errMessage: "Weak password"),
        );
      } else if (e.code == "email-already-in-use") {
        emit(
          AuthFailure(errMessage: "Email already in use"),
        );
      } else {
        emit(
          AuthFailure(errMessage: "Please Enter a valid email address"),
        );
      }
    } catch (e) {
      emit(
        AuthFailure(errMessage: "Something went wrong please try again"),
      );
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseException catch (e) {
      if (e.code == "user-not-found") {
        emit(
          AuthFailure(errMessage: "User not found"),
        );
      } else if (e.code == "wrong-password") {
        emit(
          AuthFailure(errMessage: "Wrong password"),
        );
      } else {
        emit(
          AuthFailure(errMessage: "Please Enter a valid email address"),
        );
      }
    } catch (e) {
      emit(
        AuthFailure(errMessage: "Something went wrong please try again"),
      );
    }
  }
}
