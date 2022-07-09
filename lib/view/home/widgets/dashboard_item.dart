import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardScreenItemWidget extends StatelessWidget {
  final IconData itemIcon;
  final String itemLabel;
  final void Function() onTap;

  const DashBoardScreenItemWidget({
    required this.itemIcon,
    required this.itemLabel,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        width: (MediaQuery.of(context).size.width - 120) / 2,
        height: MediaQuery.of(context).size.height * .17,
        decoration: BoxDecoration(
          color: kGreen.withOpacity(.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              itemIcon,
              size: 30,
              color: kBlack,
            ),
            const SizedBox(height: 5),
            Text(
              itemLabel,
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
