import 'dart:developer';

import 'package:admin/application/Chat/chat_cubit.dart';
import 'package:admin/application/sell_request/sell_request_cubit.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/local_notifications_services.dart';
import 'package:admin/view/home/widgets/configurable_chat_listview_widget.dart';
import 'package:admin/view/home/widgets/home_screen_drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<SellRequestCubit>(context).getAllSellRequests();
      BlocProvider.of<ChatCubit>(context).getAllChats();
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const AdminDrowerWidget(),
      body: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 50,
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: kWhite.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Builder(builder: (context) {
                      return IconButton(
                        onPressed: () async {
                          var i = await FirebaseMessaging.instance.getToken();

                          log(i.toString());
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: kBlack,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: kWhite.withOpacity(.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: BlocBuilder<ChatCubit, ChatState>(
                        builder: (context, state) {
                          return TextFormField(
                            onChanged: (value) {
                              BlocProvider.of<ChatCubit>(context).searchChats(
                                searchKey: value,
                                totalChats: state.totalChats,
                              );
                            },
                            decoration: InputDecoration(
                              hintText: 'search chat',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 13,
                                color: kGray,
                              ),
                              border: InputBorder.none,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.only(
                                  left: 8,
                                  right: 4,
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: kBlack,
                                ),
                              ),
                              prefixIconConstraints: const BoxConstraints(),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: state.showSearchResult
                      ? state.searchResult.isNotEmpty
                          ? ConfigurableChatListViewWidget(
                              size: size,
                              totalChats: state.searchResult,
                            )
                          : const Center(
                              child: Text('No matching item to show :('),
                            )
                      : state.totalChats.isNotEmpty
                          ? ConfigurableChatListViewWidget(
                              size: size,
                              totalChats: state.totalChats,
                            )
                          : const Center(
                              child: Text('No Enquiries available yet :('),
                            ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
