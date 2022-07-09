import 'dart:developer';

import 'package:admin/view/home/screens/admin_home_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  FirebaseAuth _auth = FirebaseAuth.instance;

  signInUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => null)
      final user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        emit(state.copyWith(
          loginStatus: true,
          message: '',
        ));
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const AdminHomeScreen()),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(message: e.message.toString()),
      );
    } catch (e) {
      log(e.toString());
      emit(
        state.copyWith(message: 'Email and password does not match'),
      );
    }
  }
}
