import 'package:admin/application/Chat/chat_cubit.dart';
import 'package:admin/application/users/users_cubit.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/domain/chat/chat_overview_model.dart';
import 'package:admin/domain/user/user_model.dart';
import 'package:admin/view/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ConfigurableChatListViewWidget extends StatelessWidget {
  const ConfigurableChatListViewWidget({
    Key? key,
    required this.size,
    required this.totalChats,
  }) : super(key: key);

  final Size size;
  final List<ChatOverView> totalChats;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: ((context, index) {
        ChatOverView chat = totalChats[index];

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => AdminChatScreen(
                      userId: chat.userId,
                      userName: chat.userName,
                      userImage: chat.userImage,
                    )),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kWhite.withOpacity(.6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: size.width,
            height: size.height * .09,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: SizedBox(
                          width: 55,
                          height: 55,
                          child: chat.userImage != null
                              ? Image.network(
                                  chat.userImage!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.person),
                        ),
                      ),
                      const Positioned(
                        bottom: 5,
                        right: 1,
                        child: CircleAvatar(
                          backgroundColor: kWhite,
                          radius: 5,
                          child: Icon(
                            Icons.circle_rounded,
                            size: 10,
                            color: ksuccess,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              chat.userName,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: kBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                DateFormat('hh:mm a').format(chat.time.toDate()),
                                style: GoogleFonts.roboto(
                                  fontSize: 11,
                                  color: kBlack,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text(
                            chat.lastmessage,
                            style: GoogleFonts.nunito(
                              fontSize: 12,
                              color: darkGrey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
      separatorBuilder: ((cxt, indx) {
        return const SizedBox(
          height: 10,
        );
      }),
      itemCount: totalChats.length,
    );
  }
}
