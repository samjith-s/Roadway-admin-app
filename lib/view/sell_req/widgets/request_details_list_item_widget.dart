import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestDetialsListItem extends StatelessWidget {
  const RequestDetialsListItem({
    Key? key,
    required this.prefixLabel,
    required this.fieldValue,
  }) : super(key: key);

  final String prefixLabel;
  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          prefixLabel,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: kWhite,
          ),
        ),
        Text(
          fieldValue,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: kWhite,
          ),
        ),
      ],
    );
  }
}
