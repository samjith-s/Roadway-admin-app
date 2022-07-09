import 'package:admin/core/constants/colors.dart';
import 'package:admin/view/vehicles/screens/vehicles_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddScreenCustomDropDownWidget extends StatelessWidget {
  final String? dropDownValue;
  final String title;
  final List<void Function()>? onTapFunctions;
  final List<String> itemList;
  final void Function(String?)? onChanged;
  const AddScreenCustomDropDownWidget({
    Key? key,
    required this.title,
    required this.itemList,
    this.onTapFunctions,
    required this.onChanged,
    this.dropDownValue,
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
            title,
            style: GoogleFonts.abel(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          width: (MediaQuery.of(context).size.width - 40) / 2,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButton(
            value: dropDownValue,
            isExpanded: true,
            underline: const SizedBox(
              height: 0,
            ),
            hint: Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: kGray,
              ),
            ),
            items: List.generate(
              itemList.length,
              ((index) {
                return DropdownMenuItem(
                  value: itemList[index],
                  child: Text(itemList[index]),
                  onTap: (onTapFunctions != null && onTapFunctions!.isNotEmpty)
                      ? onTapFunctions![index]
                      : () {},
                );
              }),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
