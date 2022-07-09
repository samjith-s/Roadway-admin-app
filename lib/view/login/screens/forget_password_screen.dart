import 'dart:developer';

import 'package:admin/core/constants/colors.dart';
import 'package:admin/view/login/widgets/custom_button_widget.dart';
import 'package:admin/view/login/widgets/login_textform_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

TextEditingController _controller = TextEditingController();

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                LottieBuilder.network(
                    'https://assets5.lottiefiles.com/packages/lf20_z6ujdxzo.json'),
                const Text(
                  'Forgot password',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Enter your email adress below, We will send the link \nto reset your password in this email address..',
                  style: TextStyle(fontSize: 12, color: kOrenge),
                ),
                const SizedBox(height: 15),
                LoginTextFormFieldWidget(
                  icon: Icons.alternate_email_outlined,
                  hintText: 'email',
                  controller: _controller,
                ),
                const SizedBox(height: 15),
                CustomButtonWidget(
                  width: MediaQuery.of(context).size.width - 50,
                  text: 'Submit',
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: _controller.text.trim());
                    } catch (e) {
                      log(e.toString());
                    }
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
