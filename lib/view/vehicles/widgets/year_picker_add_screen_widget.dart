import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCarYearPicker extends StatelessWidget {
  final Function({DateTime newDate}) onChanged;
  final String hintText;
  final DateTime selectedDate;
  const AddCarYearPicker({
    required this.hintText,
    required this.onChanged,
    required this.selectedDate,
    Key? key,
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
            hintText,
            style: GoogleFonts.abel(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        GestureDetector(
          onTap: (() => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: alertColor,
                  content: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: YearPicker(
                      firstDate: DateTime(
                        DateTime.now().year - 50,
                      ),
                      lastDate: DateTime(DateTime.now().year),
                      initialDate: DateTime.now(),
                      selectedDate: DateTime(DateTime.now().year),
                      onChanged: (newdate) {
                        onChanged(newDate: newdate);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              )),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: (MediaQuery.of(context).size.width - 40) / 2,
            height: 48,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              selectedDate.year.toString(),
              style: const TextStyle(
                color: kBlack,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
