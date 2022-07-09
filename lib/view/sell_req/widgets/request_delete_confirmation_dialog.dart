import 'package:admin/application/internet/internet_cubit.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigurableDeleteConfirmationDialog extends StatelessWidget {
  const ConfigurableDeleteConfirmationDialog({
    Key? key,
    required this.onConfirmed,
  }) : super(key: key);

  final void Function() onConfirmed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(8),
      backgroundColor: alertColor,
      content: SizedBox(
        width: MediaQuery.of(context).size.width - 80,
        height: 120,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Text(
              'This item will be permenently deleted!',
              style: GoogleFonts.montserrat(
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Do you want to delete this item?',
              style: GoogleFonts.montserrat(
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'No',
                    style: GoogleFonts.hind(
                      color: Colors.blue,
                    ),
                  ),
                ),
                BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, netstate) {
                    return TextButton(
                      onPressed: () {
                        if (!netstate.networkOn) {
                          showToast(
                            msg: "No network connection.Please check your connection",
                            bgcolor: kBlack,
                          );

                          return;
                        }
                        onConfirmed();
                        showToast(msg: "Item deleted successfully");
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Yes',
                        style: GoogleFonts.hind(
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
