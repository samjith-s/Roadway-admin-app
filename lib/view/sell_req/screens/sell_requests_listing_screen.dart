import 'package:admin/application/sell_request/sell_request_cubit.dart';
import 'package:admin/core/app_functions.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/domain/sell_request/sell_request_model.dart';
import 'package:admin/view/pre_bookings/widgets/custom_listview_widget.dart';
import 'package:admin/view/pre_bookings/widgets/custom_search_field_widget.dart';
import 'package:admin/view/sell_req/widgets/request_delete_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SellRequestsListingScreen extends StatelessWidget {
  const SellRequestsListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<SellRequestCubit>(context).getAllSellRequests();
    });
    return BlocBuilder<SellRequestCubit, SellRequestState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sell Requests'),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              const SizedBox(height: 20),
              CustomSearchFieldWidget(
                autofocus: false,
                hintText: 'search request details',
                onChanged: (value) {
                  BlocProvider.of<SellRequestCubit>(context).searchSellRequestDetails(
                    searchKey: value,
                    allList: state.totalRequests,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  top: 15,
                  bottom: 10,
                ),
                child: Text(
                  'You have total ${state.totalRequests.length} sell requests',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kBlack,
                  ),
                ),
              ),
              state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state.isError
                      ? const Center(
                          child: Text('Something went wrong please try again'),
                        )
                      : state.showSearchResult
                          ? state.searchResult.isNotEmpty
                              ? CustomSellRequestListViewWidget(list: state.searchResult)
                              : const Center(
                                  child: Text('No matching result found:('),
                                )
                          : state.totalRequests.isNotEmpty
                              ? CustomSellRequestListViewWidget(
                                  list: state.totalRequests,
                                )
                              : const Center(
                                  child: Text('There is no request to show:('),
                                ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}

class CustomSellRequestListViewWidget extends StatelessWidget {
  const CustomSellRequestListViewWidget({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<SellRequest> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        final request = list[index];
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
                    value: request.make,
                  ),
                  customBookingDetailsItem(
                    label: 'Model : ',
                    value: request.model,
                  ),
                  customBookingDetailsItem(
                    label: 'MFG year : ',
                    value: request.year.toString(),
                  ),
                  customBookingDetailsItem(
                    label: 'Location : ',
                    value: request.location,
                  ),
                  customBookingDetailsItem(
                    label: 'Seller name : ',
                    value: request.name,
                  ),
                  customBookingDetailsItem(
                    label: 'Phone : ',
                    value: request.phone,
                  ),
                  customBookingDetailsItem(
                    label: 'Email : ',
                    value: request.email,
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: PopupMenuButton(
                  onSelected: (value) {
                    if (value == 1) {
                      lauchCall(request.phone);
                    } else if (value == 2) {
                      goToMail(request.email);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => ConfigurableDeleteConfirmationDialog(
                          onConfirmed: () {
                            BlocProvider.of<SellRequestCubit>(context).deleteRequest(id: request.id!);
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
      separatorBuilder: ((ctx, i) {
        return const SizedBox(
          height: 10,
        );
      }),
      itemCount: list.length,
    );
  }
}
