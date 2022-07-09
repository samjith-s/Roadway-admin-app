import 'package:admin/application/pre_booking/pre_booking_cubit.dart';
import 'package:admin/core/app_functions.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/domain/pre_booking/pre_booking_model.dart';
import 'package:admin/view/sell_req/widgets/request_delete_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListviewWidget extends StatelessWidget {
  const CustomListviewWidget({Key? key, required this.list}) : super(key: key);
  final List<PreBooking> list;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: ((context, index) {
        final booking = list[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width - 30,
          height: 200,
          decoration: BoxDecoration(
            color: kLightColor.withOpacity(.7),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customBookingDetailsItem(
                    label: 'Brand : ',
                    value: booking.make,
                  ),
                  customBookingDetailsItem(
                    label: 'Model : ',
                    value: booking.model,
                  ),
                  customBookingDetailsItem(
                    label: 'Year : ',
                    value: booking.year != null ? _chooseYearText(booking.year!) : 'All Vehicles',
                  ),
                  customBookingDetailsItem(
                    label: 'Brand : ',
                    value: booking.budget != null ? _chooseBudgetText(booking.budget!.end) : 'All Vehicles',
                  ),
                  customBookingDetailsItem(
                    label: 'Name : ',
                    value: booking.name,
                  ),
                  customBookingDetailsItem(
                    label: 'Phone : ',
                    value: booking.phone,
                  ),
                  customBookingDetailsItem(
                    label: 'Email : ',
                    value: booking.email,
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: PopupMenuButton(
                  onSelected: (value) {
                    if (value == 1) {
                      lauchCall(booking.phone);
                    } else if (value == 2) {
                      goToMail(booking.email);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => ConfigurableDeleteConfirmationDialog(
                          onConfirmed: () {
                            BlocProvider.of<PreBookingCubit>(context).deleteBooking(id: booking.id!);
                          },
                        ),
                      );
                    }
                  },
                  elevation: 0,
                  color: kWhite,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.zero,
                  itemBuilder: (ctx) {
                    return [
                      PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.call,
                              color: ksuccess,
                            ),
                            const SizedBox(width: 10),
                            Text('Call', style: GoogleFonts.nunito(fontSize: 13)),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 10),
                            Text('Mail', style: GoogleFonts.nunito(fontSize: 13)),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 10),
                            Text('Delete', style: GoogleFonts.nunito(fontSize: 13)),
                          ],
                        ),
                      ),
                    ];
                  },
                  child: const Icon(
                    Icons.more_vert,
                    size: 20,
                    color: Color.fromARGB(255, 102, 101, 101),
                  ),
                ),
              )
            ],
          ),
        );
      }),
      separatorBuilder: ((__, _) {
        return const SizedBox(
          height: 8,
        );
      }),
      itemCount: list.length,
    );
  }
}

Row customBookingDetailsItem({required String label, required String value}) {
  return Row(
    children: [
      Text(
        label,
        style: GoogleFonts.poppins(),
      ),
      Text(
        value,
        style: GoogleFonts.poppins(),
      ),
    ],
  );
}

_chooseBudgetText(int value) {
  switch (value) {
    case 10:
      return 'Below 10 Lac';

    case 25:
      return "10 Lac - 25 Lac";

    case 50:
      return '25 Lac - 50 Lac';

    case 75:
      return '50 Lac - 75 Lac';

    case 100:
      return '75 Lac - 1 Cr';

    case 500:
      return '1 Cr and Above';
  }
}

_chooseYearText(int value) {
  switch (value) {
    case 3:
      return 'Under 3 Years';

    case 5:
      return "Under 5 Years";

    case 7:
      return 'Under 7 Years';

    case 9:
      return 'Under 7 Years';

    case 50:
      return 'Under 7 Years';
  }
}
