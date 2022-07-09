import 'package:admin/application/pre_booking/pre_booking_cubit.dart';
import 'package:admin/view/pre_bookings/widgets/custom_listview_widget.dart';
import 'package:admin/view/pre_bookings/widgets/custom_search_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PreBookingsListingScreen extends StatelessWidget {
  const PreBookingsListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<PreBookingCubit>(context).getAllBookingDetails();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pre-Bookings'),
      ),
      body: BlocBuilder<PreBookingCubit, PreBookingState>(
        builder: (context, state) {
          return Column(
            children: [
              CustomSearchFieldWidget(
                hintText: 'search booking details',
                autofocus: false,
                onChanged: (value) {
                  BlocProvider.of<PreBookingCubit>(context).searchBookingDetails(
                    searchKey: value,
                    allList: state.totalBookings,
                  );
                },
              ),
              const SizedBox(height: 20),
              Expanded(
                child: state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state.isError
                        ? Center(
                            child: Text(state.errorText),
                          )
                        : state.showSearchResult
                            ? state.bookingSearchResult.isNotEmpty
                                ? CustomListviewWidget(list: state.bookingSearchResult)
                                : const Center(
                                    child: Text('No Matching item found :('),
                                  )
                            : state.totalBookings.isNotEmpty
                                ? CustomListviewWidget(list: state.totalBookings)
                                : Center(
                                    child: Text(
                                      'There is no prebookings to show!.',
                                      style: GoogleFonts.hind(),
                                    ),
                                  ),
              )
            ],
          );
        },
      ),
    );
  }
}
