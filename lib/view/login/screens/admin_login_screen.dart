import 'dart:developer';
import 'package:admin/application/internet/internet_cubit.dart';
import 'package:admin/application/login/login_cubit.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/toast.dart';
import 'package:admin/view/login/screens/forget_password_screen.dart';
import 'package:admin/view/login/widgets/custom_button_widget.dart';
import 'package:admin/view/login/widgets/login_textform_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'Roadway',
                    style: GoogleFonts.lobsterTwo(
                      fontSize: 45,
                    ),
                  ),
                  Lottie.network(
                      "https://assets5.lottiefiles.com/packages/lf20_znsmxbjo.json",
                      animate: true,
                      width: MediaQuery.of(context).size.width * .8,
                      height: MediaQuery.of(context).size.width * .6,
                      errorBuilder:
                          (BuildContext context, Object a, StackTrace? b) {
                    return const SizedBox(
                      height: 180,
                      child: Center(child: Text("No network Availabe")),
                    );
                  }),
                  LoginTextFormFieldWidget(
                    icon: Icons.alternate_email_outlined,
                    hintText: 'email',
                    controller: _emailController,
                    validator: (value) {
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                        return 'Enter a valid email address';
                      } else {
                        return null;
                      }
                    },
                  ),
                  LoginTextFormFieldWidget(
                    obscureText: true,
                    icon: Icons.lock_outlined,
                    hintText: 'password',
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the password';
                      } else {
                        return null;
                      }
                    },
                    keyBoardType: TextInputType.text,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 25,
                        top: 8,
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: 'forget password?',
                          style: const TextStyle(color: kBlack, fontSize: 12),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      const ForgetPasswordScreen()),
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  BlocBuilder<InternetCubit, InternetState>(
                    builder: (context, state) {
                      return CustomButtonWidget(
                        width: MediaQuery.of(context).size.width - 50,
                        text: 'Log In',
                        onPressed: () {
                          if (state.networkOn) {
                            context.read<LoginCubit>().signInUser(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  context: context,
                                );
                          } else {
                            showToast(
                              msg: "No internet connection. Try later",
                              bgcolor: kBlack,
                            );
                          }
                        },
                      );
                    },
                  ),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return Text(state.message);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
