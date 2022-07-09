import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchFieldWidget extends StatelessWidget {
  const CustomSearchFieldWidget({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.autofocus = true,
  }) : super(key: key);

  final String hintText;
  final void Function(String) onChanged;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: kWhite, //Color(0xFFd9e5f1),
          borderRadius: BorderRadius.circular(15),
        ),
        width: MediaQuery.of(context).size.width - 30,
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                // focusNode: FocusNode(),
                autofocus: autofocus,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 13,
                    color: kGray,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: kBlack,
                  ),
                ),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
