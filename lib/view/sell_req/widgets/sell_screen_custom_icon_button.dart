import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';

class SellScreenCustomIconButton extends StatelessWidget {
  const SellScreenCustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: darkGrey,
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
