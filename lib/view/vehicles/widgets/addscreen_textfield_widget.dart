import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddVehicleTextfieldWidget extends StatelessWidget {
  final TextInputType? keyBoardType;
  final String? Function(String?)? validator;
  final String labelText;
  final TextEditingController controller;
  const AddVehicleTextfieldWidget({
    Key? key,
    required this.validator,
    required this.labelText,
    required this.controller,
    this.keyBoardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 4,
            bottom: 4,
          ),
          child: Text(
            labelText,
            style: GoogleFonts.abel(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          //height: 48,
          child: TextFormField(
            textCapitalization: TextCapitalization.words,
            keyboardType: keyBoardType,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 10,
              ),
              fillColor: kWhite,
              filled: true,
              hintText: labelText,
              hintStyle: const TextStyle(
                color: kGray,
                fontSize: 12,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusColor: kGreen,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kGreen),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
