import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';


ValueNotifier<bool> showPassword = ValueNotifier(false);

class LoginTextFormFieldWidget extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyBoardType;
  final bool obscureText;
  const LoginTextFormFieldWidget({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyBoardType = TextInputType.emailAddress,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: kGray,
            size: 25,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: showPassword,
              builder: (BuildContext context, bool value, Widget? child) {
                return TextFormField(
                  obscureText: obscureText ? value : false,
                  keyboardType: keyBoardType,
                  validator: validator,
                  controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: obscureText
                        ? IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              showPassword.value = !showPassword.value;
                            },
                            icon: Icon(value
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )
                        : const SizedBox(),
                    border: const UnderlineInputBorder(),
                    hintText: hintText,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
